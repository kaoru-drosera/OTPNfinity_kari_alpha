class SamplerController < ApplicationController

  before_action :authenticate_user!
  before_action :sampler_name_picker, only:[:show, :submit]

  # 投稿を一覧形式にする(予定)
  def index
    @user = current_user.id
    @samplers = current_user.sampler.includes(seboards: :sefile).order("created_at DESC").algolia_search(params[:query])
  end

  def save
    @sampler = sampler_name_picker
    @seboards = Seboard.new
    @sefile = Sefile.new
  end

  def submit

    p sampler_name_picker.new_record?
    if sampler_name_picker.new_record?

      @sampler = current_user.sampler.new(sampler_params)
      @seboards = Seboard.new(seboards_params[:seboards_attributes])
      @sefile = Sefile.new({seboards_attributes:[ :sefile_attributes ]})

      puts '保存乙'

    else

      @sampler.seboards.each do |seboard|
        puts seboard.sefile.sedata
        seboard.sefile.sedata.cache! unless seboard.sefile.sedata.blank?
      end
      @sefile = sampler_name_picker.seboards.sefile.update( sefile_params[ {seboards:[:sefile] } ] )

      puts '更新乙'

      puts sedata_param
      puts sedata_param.nil?

      unless @sampler.update(update_sampler_params)
        flash[:danger] = "更新に失敗しました"
      else
        flash[:success] = "更新しました"
      end

    end

    redirect_to root_path

  end

  private

  def sampler_params
    params.require(:sampler).permit(:sampler_name)#.deep_merge!(seboards_attributes:[sefile_attributes:[user_id: current_user.id]])
    # params.require(:sampler).permit(:sampler_name, seboards_attributes: [:position, :btncolor, :volume, :loopable, sefile_attributes: [sefile_params]])#.deep_merge!(seboards_attributes:[sefile_attributes:[user_id: current_user.id]])
  end
  def seboards_params
    params.require(:sampler).permit({seboards_attributes: [][:position, :btncolor, :volume, :loopable]})#.deep_merge!(seboards_attributes:[sefile_attributes:[user_id: current_user.id]])
    # params.require(:sampler).permit(:sampler_name, seboards_attributes: [:position, :btncolor, :volume, :loopable, sefile_attributes: [sefile_params]])#.deep_merge!(seboards_attributes:[sefile_attributes:[user_id: current_user.id]])
  end
  def sefile_params
    params.require(:sampler).permit( {seboards_attributes:[ {sefile_attributes: [:sename, :sedata, :sedata_cache]} ]} )#.deep_merge!(seboards_attributes:[sefile_attributes:[user_id: current_user.id]])
    # params.require(:sampler).permit(:sampler_name, seboards_attributes: [:position, :btncolor, :volume, :loopable, sefile_attributes: [sefile_params]])#.deep_merge!(seboards_attributes:[sefile_attributes:[user_id: current_user.id]])
  end

  # def sefile_params
  #   params.require(:sampler).permit(seboards_attributes:[sefile_attributes:[:sename, :sedata, :sedata_cache]])#.deep_merge!(seboards_attributes:[sefile_attributes:[user_id: current_user.id]])
  # end

  # def update_sampler_params
  #   # params.require(:sampler).permit(:sampler_name, seboards_attributes: [:position, :btncolor, :volume, :loopable, :id, sefile_attributes: [:sename, :sedata, :id, :sedata_cache]])#.deep_merge!(seboards_attributes:[sefile_attribute:[user_id: current_user.id]])
  #   params.require(:sampler).permit(:sampler_name, {seboards: [:position, :btncolor, :volume, :loopable, :id, {sefile: [:sename, :sedata, :id, :sedata_cache]}]})#.deep_merge!(seboards_attributes:[sefile_attribute:[user_id: current_user.id]])
  # end

  def sampler_name_param
    sampler_params[:sampler_name]
  end

  def sampler_name_picker
    current_user.sampler.find_or_initialize_by(sampler_name: sampler_name_param)
  end

  def sedata_param
    update_sampler_params[:seboards_attributes]
  end

    # sampler_name_picker[seboards_attributes: [sefile_attributes:[:sedata]]]
    # sampler_params.include?(sampler_name_param)
  end



end
