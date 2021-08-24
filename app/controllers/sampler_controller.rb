class SamplerController < ApplicationController

  before_action :authenticate_user!
  before_action :sampler_name_picker, only:[:show, :submit]

  # 投稿を一覧形式にする(予定)
  def index
    @user = current_user.id
    @samplers = current_user.sampler.includes(seboards: :sefile).order("created_at DESC").algolia_search(params[:query], hitsPerPage: 3, page: params[:page])
  end

  def save
    puts sampler_name_picker.nil?

    puts sampler_name_picker.new_record?

    sampler_name_picker.seboards.sefile.sedata.cache! unless sampler_name_picker.seboards.sefile.sedata.blank?


  end

  def submit

    if sampler_name_picker.new_record?
      puts sampler_name_picker.new_record?

      puts '保存乙'

      @sampler = current_user.sampler.build(sampler_params)

      # @sampler = current_user.sampler.map(&:seboard).sefile.new(sampler_params)
      # @sampler.user_id = current_user.id

      unless @sampler.save!
        flash[:danger] = "保存に失敗しました"
      else
        flash[:success] = "保存しました"
      end

    else
      puts sampler_name_picker.new_record?

      @sampler = sampler_name_picker

      puts '更新乙'


      unless @sampler.update(sampler_params)
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
    params.require(:sampler).permit(:sampler_name, seboards_attributes: [:position, :btncolor, :volume, :loopable, :id, sefile_attributes: [:sename, :sedata, :id, :sedata_cache]],)#.deep_merge!(seboards_attributes:[sefile_attribute:[user_id: current_user.id]])
  end

  def sampler_name_param
    sampler_params[:sampler_name]
  end

  def sampler_name_picker
    current_user.sampler.find_or_initialize_by(sampler_name: sampler_name_param)
  end

  def find_or_initialize

  end


end
