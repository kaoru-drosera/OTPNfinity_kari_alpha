class StaticPageController < ApplicationController

  # 投稿を一覧形式にする(予定)
  # def seindex
  #   @user = current_user.id
  #   @samplers = current_user.sampler.all.includes(seboards: :sefile)
  # end


  def index
    if user_signed_in?
      @samplers = current_user.sampler.includes(seboards: :sefile).order("created_at DESC").algolia_search(params[:query])
    end
  end

  # before_action :authenticate_user!
  #
  # def index
  #   @user = User.
  #   @samplers = Sampler.all.includes(seboards: :sefile)
  # end

  # private
  #
  # def current_user
  #   current_user
  # end

end
