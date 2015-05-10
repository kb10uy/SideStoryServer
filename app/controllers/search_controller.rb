class SearchController < ApplicationController
  def all
    @keyword = params[:keyword]
    @page = params.fetch(:page, 1)
    @query = Post.search(:title_cont => @keyword).result
    @ret = @query.page(@page)
    @count = @ret.total_count
    @pmin = @ret.offset_value
    @pmax = @ret.offset_value + @ret.length
  end

  def posts
  end

  def users
  end

  def requests
  end
end
