class ApplicationController < ActionController::Base

  # before_action :authenticate_user!
  # このコメントをONにするとログインなしではホーム画面に行けなくなる

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  # def hello
  #   render html: "<p>hello.</p>"
  # end

end
