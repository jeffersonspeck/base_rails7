class HomeController < ApplicationController
  def index
    readme_path = Rails.root.join('README.md')
    @readme_content = File.read(readme_path) if File.exist?(readme_path)
  end

  private

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer, extensions = {})
    markdown.render(text).html_safe
  end
end
