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
end
