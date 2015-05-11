class SearchController < ApplicationController
  def all
    # @keyword = params[:keyword]
    # @page = params.fetch(:page, 1)
    # @query = Post.search(:title_cont => @keyword).result
    # @ret = @query.page(@page)
    # @count = @ret.total_count
    # @pmin = @ret.offset_value
    # @pmax = @ret.offset_value + @ret.length
  end
  
  def posts
    @keyword = params[:keyword]
    @page = params.fetch(:page, 1)
    case params[:type]
    when 'content'
      @query = posts_content @keyword
      @type = "本文"
    when 'tag'
      @query = posts_tag @keyword
      @type = "タグ"
    when 'title'
      @query = posts_title @keyword
      @type = "タイトル"
    else
      @query = posts_title @keyword
      @type = "このタイプの検索が未実装なので埋め合わせのタイトル"
    end
    @query = @query.includes(:tags)
    @ret = @query.page
    @count = @ret.total_count
    @pmin = @ret.offset_value
    @pmax = @ret.offset_value + @ret.length
  end
  
  def posts_title(kw)
    Post.search(:title_cont => kw).result
  end
  
  def posts_content(kw)
    Post.search(:content_cont => kw).result
  end
  
  def posts_tag(kw)
    @tt = ActsAsTaggableOn::Tag.where("tags.name LIKE ?", "%#{kw}%")
    kw.present? ? Post.tagged_with(@tt, :any => true) : Article.all
  end
  
  
  
  def users
  end

  def requests
  end
end
