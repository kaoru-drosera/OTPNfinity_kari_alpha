class SamplerController < ApplicationController

  before_action :authenticate_user!

  # 投稿を一覧形式にする(予定)
  def seindex
    @samplers = current_user.samplers.all
  end

  def save
    @sampler = current_user.samplers.find_or_initialize_by(sampler_name: params[:sampler_name])
    @sampler.seboards.build
    @sampler.sefile.build
    # @sampler.sefile.find_or_initialize_by(sename: params[:sename], sedata: params[:sedata])
    # seboards.sefile.build.find_or_initialize_by(sename: params[:sename], sedata: params[:sedata])
    # seboards = @sampler.build_seboards
    # seboards.sefile.build.find_or_initialize_by(sename: params[:sename], sedata: params[:sedata])
  end

  def submit
    @sampler = current_user.sampler.find_or_initialize_by(sampler_name: params[:sampler_name])

    # @sampler.seboards.build
    # @sampler.seboards.sefiles.build_seboard
    # sampler_sefile = Sampler.seboard.sefile.find_or_initialize_by(sename: params[:sename], sedata: params[:sedata])
    unless @sampler.persisted?
      @sampler = current_user.sampler.new(sampler_params)
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
    @sampler = Sampler.find(params[:id])
  end

  private

  def sampler_params
    params.require(:sampler).permit(:sampler_name, seboards_attributes: [:position, :btncolor, :volume, :loopable, sefile_attributes: [:sename, :sedata]])
  end

  def update_sampler_params
    params.require(:sampler).permit(:sampler_name, seboards_attributes: [:position, :btncolor, :volume, :loopable, sefile_attribute: [:sename, :sedata]])
  end


end
