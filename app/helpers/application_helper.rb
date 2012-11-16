module ApplicationHelper

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,:autolink =>true, :gh_blockcode=>true, :hard_wrap=>true, :no_intraemphasis=>true,:fenced_code=>true, :filter_html=>true)

    #optionの設定
    options = [ :autolink, :gh_blockcode, :hard_wrap, :no_intraemphasis,:fenced_code, :filter_html]
    #マークダウン
    raw markdown.render(text)
  end
end
