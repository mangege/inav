# -*- encoding : utf-8 -*-
class SettingsController < ApplicationController
  layout 'management'
  before_filter :find_user_extned

  MOCK_BREAD_CRUMB_LINKS = [
    Link.new("简简单数码配件店", "http://ijianjiandan.taobao.com"),
    Link.new("苹果", "http://ijianjiandan.taobao.com/search.htm?scid=628179484"),
    Link.new("iPhone5", "http://ijianjiandan.taobao.com/search.htm?scid=628179485")
  ]
  MOCK_RELATED_CAT_LINKS = [
    Link.new("iPhone4", "http://ijianjiandan.taobao.com/search.htm?scid=628179487"),
    Link.new("iPhone4s", "http://ijianjiandan.taobao.com/search.htm?scid=628179486")
  ]

  def show
    @settings = OpenStruct.new( @user_extend.settings )
  end

  def update
    @user_extend.settings = settings_params
    @user_extend.save!
    flash.notice = "设置保存成功"
    redirect_to action: :show
  end

  def edit_template
    if bread_crumb?
      @template = @user_extend.get_bread_crumb_template
    else
      @template = @user_extend.get_related_cat_template
    end
  end

  def update_template
    if params[:template].blank?
      flash.now.alert = "模板不能为空"
      render action: :edit_template
      return
    end

    begin
      if bread_crumb?
        Liquid::Template.parse(params[:template]).render('links' => MOCK_BREAD_CRUMB_LINKS)
        @user_extend.bread_crumb_template = params[:template]
      else
        Liquid::Template.parse(params[:template]).render('links' => MOCK_RELATED_CAT_LINKS)
        @user_extend.related_cat_template = params[:template]
      end
    rescue Liquid::Error
      @template = params[:template]
      flash.now.alert = "Liquid模板错误,请检查. #{$!.inspect}"
      render action: :edit_template
      return
    end

    @user_extend.save!
    flash.notice = "模板保存成功"
    redirect_to edit_template_setting_path(t: params[:t])
  end

  def preview_template
    begin
      if bread_crumb?
        html_result = Liquid::Template.parse(params[:template]).render('links' => MOCK_BREAD_CRUMB_LINKS)
      else
        html_result = Liquid::Template.parse(params[:template]).render('links' => MOCK_RELATED_CAT_LINKS)
      end
    rescue Liquid::Error
      render json: {ok: false, msg: "Liquid模板错误,请检查. #{$!.inspect}"}
      return
    end

    json_result = {}
    json_result[:ok] = true
    json_result[:escapeResult] = ERB::Util.html_escape(html_result)
    json_result[:sanitizeResult] = ActionController::Base.helpers.sanitize(html_result)
    render json: json_result
  end

  private
  def find_user_extned
    @user_extend = current_user.user_extend
  end

  def settings_params
    settings = params[:settings]
    settings = {} unless settings.is_a?(Hash)
    settings
  end

  def bread_crumb?
    params[:t] == 'related_cat' ? false : true
  end
end
