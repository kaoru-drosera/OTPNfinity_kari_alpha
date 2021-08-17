class SamplerController < ApplicationController

  before_action :authenticate_user!

  # 投稿を一覧形式にする(予定)
  def index
    @user = current_user.id
    @samplers = current_user.sampler.all.includes(seboards: :sefile)
  end

  def save
    @sampler = current_user.samplers.build
    @sampler.seboards.build
    @sampler.sefile.find_or_initialize_by(sename: params[:sename], sedata: params[:sedata])
    # @sampler.sefile.find_or_initialize_by(sename: params[:sename], sedata: params[:sedata])
  end

  def submit
    @sampler = current_user.sampler.find_or_initialize_by(sampler_name: params[:sampler_name])
    # @sampler.seboards.build
    # @sampler.seboards.sefiles.build_seboard
    # sampler_sefile = Sampler.seboard.sefile.find_or_initialize_by(sename: params[:sename], sedata: params[:sedata])
    unless @sampler.persisted?
      @sampler = current_user.sampler.build(sampler_params)
      # @sampler = current_user.sampler.map(&:seboard).sefile.new(sampler_params)
      # @sampler.user_id = current_user.id

      unless @sampler.save!
        flash[:danger] = "保存に失敗しました"
      else
        flash[:success] = "保存しました"
      end

    else
      @sampler = current_user.sampler.update(update_sampler_params)
      # @sampler.save

      unless @sampler.save!
        flash[:danger] = "更新に失敗しました"
      else
        flash[:success] = "更新しました"
      end

    end

    redirect_to root_path

  end


  def show
    @user = current_user.id
    @samplers = Sampler.all
  end

  private

  def sampler_params
    params.require(:sampler).permit(:sampler_name, seboards_attributes: [:position, :btncolor, :volume, :loopable, sefile_attributes: [:sename, :sedata]],)#.deep_merge!(seboards_attributes:[sefile_attributes:[user_id: current_user.id]])
  end

  def update_sampler_params
    params.require(:sampler).permit(:sampler_name, seboards_attributes: [:position, :btncolor, :volume, :loopable, sefile_attributes: [:sename, :sedata]],)#.deep_merge!(seboards_attributes:[sefile_attribute:[user_id: current_user.id]])
  end


end
