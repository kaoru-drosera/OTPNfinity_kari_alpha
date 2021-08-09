class SamplerController < ApplicationController

  before_action :authenticate_user!

  # 投稿を一覧形式にする(予定)
  def seindex
    @samplers = Sampler.all
  end

  def save
    @sampler = Sampler.find_or_initialize_by(sampler_name: params[:sampler_name])
  end

  def submit
    @sampler = Sampler.find_or_initialize_by(sampler_name: params[:sampler_name])
    # sampler_sefile = Sampler.seboard.sefile.find_or_initialize_by(sename: params[:sename], sedata: params[:sedata])
    unless @sampler.persisted?
      @sampler = Sampler.new(sampler_params)
      @sampler.user_id = current_user.id

      unless @sampler.save
        flash[:danger] = "保存に失敗しました"
      else
        flash[:success] = "保存しました"
      end

    else
      @sampler = Sampler.update_attrbutes!(update_sampler_params)
      # @sampler.save

      unless @sampler.save
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
    params.require(:sampler).permit(:sampler_name, seboards_attributes: [:position, :btncolor, :volume, :loopable, sefile_attributes: [:sename, :sedata, :id]])
  end


end
