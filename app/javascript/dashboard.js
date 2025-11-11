// app/javascript/dashboard.js
import "chart.js/auto";

const dashSel = '[data-controller="dashboard"]';
const chartRegistry = {};

function readJSON(el, name) {
  const v = el.dataset[name];
  try { return v ? JSON.parse(v) : null; } catch { return null; }
}

function makeLegend(labels, colors) {
  return labels.map((l, i) =>
    `<span class="mr-2"><i class="fas fa-circle" style="color:${colors[i % colors.length]};"></i> ${l}</span>`
  ).join("");
}

function mountChart(canvas, config) {
  if (!canvas) return null;
  const id = canvas.id || Math.random().toString(36).slice(2);
  canvas.id ||= id;
  if (chartRegistry[id]) chartRegistry[id].destroy();
  const instance = new Chart(canvas, config);
  chartRegistry[id] = instance;
  return instance;
}

function initDashboard() {
  const root = document.querySelector(dashSel);
  if (!root) return;

  const sb = {
    primary: "#4e73df",
    success: "#1cc88a",
    info:    "#36b9cc",
    warning: "#f6c23e",
    danger:  "#e74a3b",
    gray:    "#858796",
    light:   "#f8f9fc",
    dark:    "#5a5c69",
  };

  // Faturamento (linha)
  mountChart(document.getElementById("chartRevenue"), {
    type: "line",
    data: {
      labels: readJSON(root, "revenueLabels") || [],
      datasets: [{
        label: "Faturamento",
        data: readJSON(root, "revenueValues") || [],
        backgroundColor: "rgba(78, 115, 223, 0.05)",
        borderColor: sb.primary,
        pointRadius: 3,
        pointBackgroundColor: sb.primary,
        pointBorderColor: sb.primary,
        tension: 0.35
      }]
    },
    options: {
      maintainAspectRatio: false,
      plugins: { legend: { display: false } },
      scales: {
        x: { grid: { display: false } },
        y: {
          grid: { color: "rgba(234, 236, 244, 1)" },
          ticks: { callback: (v) => `R$ ${Number(v).toLocaleString("pt-BR")}` }
        }
      }
    }
  });

  // DFEs (rosca)
  const dfeLabels = readJSON(root, "dfesLabels") || [];
  const dfeValues = readJSON(root, "dfesValues") || [];
  const dfeColors = [sb.primary, sb.success, sb.info, sb.warning, sb.danger, sb.gray];
  mountChart(document.getElementById("chartDFE"), {
    type: "doughnut",
    data: { labels: dfeLabels, datasets: [{ data: dfeValues, backgroundColor: dfeColors.slice(0, dfeLabels.length), hoverOffset: 4 }] },
    options: { maintainAspectRatio: false, plugins: { legend: { display: false } } }
  });
  const legend = document.getElementById("chartDFELegend");
  if (legend) legend.innerHTML = makeLegend(dfeLabels, dfeColors);

  // Pedidos por status (barras)
  mountChart(document.getElementById("chartOrdersStatus"), {
    type: "bar",
    data: {
      labels: readJSON(root, "ordersStatusLabels") || [],
      datasets: [{ label: "Pedidos", data: readJSON(root, "ordersStatusValues") || [], backgroundColor: sb.info }]
    },
    options: {
      maintainAspectRatio: false,
      plugins: { legend: { display: false } },
      scales: {
        x: { grid: { display: false } },
        y: { grid: { color: "rgba(234, 236, 244, 1)" }, beginAtZero: true }
      }
    }
  });

  // Mix Produtos x Serviços (empilhado)
  mountChart(document.getElementById("chartMix"), {
    type: "bar",
    data: {
      labels: readJSON(root, "mixLabels") || [],
      datasets: [
        { label: "Produtos", data: readJSON(root, "mixProdutos") || [], backgroundColor: sb.primary, stack: "mix" },
        { label: "Serviços", data: readJSON(root, "mixServicos") || [], backgroundColor: sb.success, stack: "mix" }
      ]
    },
    options: {
      maintainAspectRatio: false,
      plugins: { legend: { position: "top" } },
      scales: {
        x: { stacked: true, grid: { display: false } },
        y: { stacked: true, grid: { color: "rgba(234, 236, 244, 1)" }, beginAtZero: true }
      }
    }
  });
}

document.addEventListener("turbo:load", initDashboard);
document.addEventListener("DOMContentLoaded", initDashboard);
