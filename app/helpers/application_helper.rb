module ApplicationHelper
  def alert_class_for(flash_type)
    case flash_type.to_sym
    when :notice
      'alert-success'    # Procedimento correto
    when :alert, :error
      'alert-danger'     # Erro
    when :warning
      'alert-warning'    # Aviso
    else
      'alert-info'       # Informação geral
    end
  end
  
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer, extensions = {})
    markdown.render(text).html_safe
  end  
end
