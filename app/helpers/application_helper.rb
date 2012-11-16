module ApplicationHelper


  def markdown(text)
    #optionの設定
    options = [ :autolink, :gh_blockcode, :hard_wrap, :no_intraemphasis,
      :fenced_code, :filter_html]
    #マークダウン
    Redcarpet.new(text, *options).to_html.html_safe
  end
end
