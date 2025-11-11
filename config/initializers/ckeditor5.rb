# config/initializers/ckeditor5.rb

CKEditor5::Rails.configure do
  # Trava a versão do bundle do CKEditor5 usado pela gem
  version "47.0.0"

  # Preset herdando do default (precisa de DO...END)
  presets.define :inherited_custom do
    menubar visible: false
  end

  # Preset "do zero"
  presets.define :blank_preset, inherit: false do
    version "47.0.0"

    # Segurança: aplicar hotfixes/patches sempre que disponíveis
    automatic_upgrades

    gpl
    type :classic

    # Menubar padrão (visível)
    menubar

    # Toolbar — mantenho teus itens (nota: nomes devem bater com plugins)
    toolbar :undo, :redo, :|, :heading, :|, :bold, :italic, :underline, :|,
            :link, :imageInsert, :mediaEmbed, :insertTable, :blockQuote, :|,
            :bulletedList, :numberedList, :todoList, :outdent, :indent

    # Plugins necessários para cada item da toolbar
    plugins :AccessibilityHelp, :Autoformat, :AutoImage, :Autosave,
            :BlockQuote, :Bold, :CloudServices,
            :Essentials, :Heading, :ImageBlock, :ImageCaption, :ImageInline,
            :ImageInsert, :ImageInsertViaUrl, :ImageResize, :ImageStyle,
            :ImageTextAlternative, :ImageToolbar, :ImageUpload, :Indent,
            :IndentBlock, :Italic, :Link, :LinkImage, :List, :ListProperties,
            :MediaEmbed, :Paragraph, :PasteFromOffice, :PictureEditing,
            :SelectAll, :Table, :TableCaption, :TableCellProperties,
            :TableColumnResize, :TableProperties, :TableToolbar,
            :TextTransformation, :TodoList, :Underline, :Undo, :Base64UploadAdapter

    # Configuração específica de image
    configure :image, {
      toolbar: ["imageTextAlternative", "imageStyle:inline", "imageStyle:block", "imageStyle:side"]
    }
  end
end
