class SamplerController < ApplicationController

  before_action :authenticate_user!
  before_action :sampler_name_picker, only:[:show, :submit]

  # 投稿を一覧形式にする(予定)
  def index
    @user = current_user.id
    @samplers = current_user.sampler.includes(seboards: :sefile).order("created_at DESC").algolia_search(params[:query])
  end

  def save
    puts sampler_name_picker.nil?

    puts sampler_name_picker.new_record?


  end

  def submit

    if sampler_name_picker.new_record?
      puts sampler_name_picker.new_record?

      puts '保存乙'


      @sampler = sampler_name_picker
      # @seboards = @sampler.seboards.build
      # @sefiles = sampler_name_picker.sefile.build
      #
      # puts @sampler
      # puts @seboards
      # puts @sefiles

      # sampler_name_picker.seboards.sefile.sedata.retrieve_from_cache! unless sampler_name_picker.seboards.sefile.sedata.blank?

      # if !has_sedata_ornot.nil?
      #   puts "sedataあり"
      #   puts has_sedata_ornot
      # else
      #   puts "sedataなし"
      # end

      # @sampler = current_user.sampler.map(&:seboard).sefile.new(sampler_params)
      # @sampler.user_id = current_user.id

      unless @sampler.save!
        flash[:danger] = "保存に失敗しました"
      else
        flash[:success] = "保存しました"
      end

    else
      # puts sampler_name_picker.new_record?
      # puts sedata_param.new_record?
      # puts sedata_param
      puts sedata_param.nil?
      puts sampler_name_param
      puts sampler_name_param.nil?

      @sampler = sampler_name_picker

      # @sampler = sampler_name_picker
      # @seboards = @sampler.seboards.build
      # @sefiles = sampler_name_picker.seboards.each do |seboard|
      #   seboard.sefile
      # end
      # @sefiles.each do |sefile|
      #   sefile.sefile.sedata
      # end


      puts '更新乙'

      unless @sampler.update(sampler_params)
        flash[:danger] = "更新に失敗しました"
      else
        flash[:success] = "更新しました"
      end

    end

    redirect_to root_path

  end


  # def show
  #   @user = current_user.id
  #   @samplers = Sampler.all
  # end

  private

  def sampler_params
    params.require(:sampler).permit(:sampler_name, seboards_attributes: [:position, :btncolor, :volume, :loopable, sefile_attributes: [:sename, :sedata, :sedata_cache]])#.deep_merge!(seboards_attributes:[sefile_attributes:[user_id: current_user.id]])
    # params.require(:sampler).permit(:sampler_name, seboards_attributes: [:position, :btncolor, :volume, :loopable, sefile_attributes: [sefile_params]])#.deep_merge!(seboards_attributes:[sefile_attributes:[user_id: current_user.id]])
  end

  # def sefile_params
  #   params.require(:sampler).permit(seboards_attributes:[sefile_attributes:[:sename, :sedata, :sedata_cache]])#.deep_merge!(seboards_attributes:[sefile_attributes:[user_id: current_user.id]])
  # end

  def update_sampler_params
    params.require(:sampler).permit(:sampler_name, seboards_attributes: [:position, :btncolor, :volume, :loopable, :id, sefile_attributes: [:sename, :sedata, :id, :sedata_cache]])#.deep_merge!(seboards_attributes:[sefile_attribute:[user_id: current_user.id]])
  end

  def sampler_name_param
    sampler_params[:sampler_name]
  end

  def sampler_name_picker
    current_user.sampler.find_or_initialize_by(sampler_name: sampler_name_param)
  end

  def sedata_param
    # sampler_name_picker[seboards_attributes: [sefile_attributes:[:sedata]]]
    sampler_params[:sedata]
    # sampler_params.include?(sampler_name_param)
  end



end
