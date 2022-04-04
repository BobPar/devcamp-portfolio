class TopicsController < ApplicationController
  before_action :set_sidebar_topics

  layout "blog"

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @blogs = @topic.blogs.page(params[:page]).per(5)
  end

  private

  def set_sidebar_topics
    @sidebar_topics = Topic.with_blogs
  end
end
