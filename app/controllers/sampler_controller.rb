class SamplerController < ApplicationController

  def save

    # DB上に「条件を満たす投稿のidが存在する場合/しない場合で
    # find/newに変化させられる」関数を見つけた。
    # データがない場合new扱いになるので
    # 保存までに一段階踏ませられるようになる。

    # 「上記の特性があるから」という浅い考えの基準で
    # 「既存のデータがあるかどうかで新規作成か更新かが決まるシステム」
    # らしきものとして形だけは作った。
    # これにて、ひと段落。viewとspecを作るのだ！
    @sampler = Sampler.find_or_initialize_by(sampler_name: params[:sampler_name])
    @sampler_sefile = Sampler.seboards.sefile.find_or_initialize_by(sename: params[:sename], sedata: params[:sedata])
    if @sampler.new_record?
      @sampler.seboards.build

      # サンプラー自体の設定のうち、12のseboardの中のsefileが既存の場合は…？
      if @sampler_sefile.new_record?
        @sampler_sefile.build
      end
    end

    # @sampler = Sampler.find_by(sampler_name: params[:sampler_name])
    # if @sampler
    # else
    #   @sampler.new
    #   @sampler.seboards.build
    #   # 「既存のデータがある場合に保存を取りやめ、代わりに見つかったidを割り当てる」方法がわからない。
    #   @sampler.seboards.sefiles.find_by(sename: params[:sename], sedata: params[:sedata])
    #   if @sampler
    #     # …???
    #   else
    #     @sampler.seboards.sefiles.build
    #   end
    # end
  end



  def submit
    @sampler = Sampler.find_or_initialize_by(sampler_name: params[:sampler_name])
    @sampler_sefile = Sampler.seboards.sefile.find_or_initialize_by(sename: params[:sename], sedata: params[:sedata])

    if @sanpler.update(update_sampler_params)
      redirect_to root_path
    elsif @sampler.save
      redirect_to root_path
    end
  end

  def show

  end

  private

  def sampler_params
    params.require(:sampler).permit(:sampler_name, seboards_attributes: [:position, :btncoler, :volume, :loopable, sefiles_attributes: [:sename, :sedata]])
  end

  def update_sampler_params
    params.require(:sampler).permit(:sampler_name, seboards_attributes: [:position, :btncoler, :volume, :loopable, sefiles_attributes: [:sename, :sedata, :id]])
  end


end
