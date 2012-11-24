# -*- encoding : utf-8 -*-
=begin
API代码生成器,生成的方法主要功能
 * request param验证,验证必填参数和特殊参数.
 * response param为Object Array时,把Array移到外层
=end
class ApiMetadat
  def read_file
    @file = read_relative_path('/tmp/ApiMetadat.xml')
  end

  def parse_file
    @hash = Hash.from_xml(@file)
  end

  def metadata
    @hash['metadata']
  end

  def version_no
    metadata['versionNo']
  end

  def apis
    metadata['apis']['api']
  end

  def structs
    metadata['structs']['struct']
  end

  # ["Object", "Object Array", "Basic", "Basic Array"]
  def level_values
    values = []
    apis.each do |api|
      response_param = api['response']['param']
      if response_param.is_a?(Array)
        response_param.each{ |rp| values << rp['level']}
      else
        values << response_param['level']
      end
    end
    values.uniq
  end

  # ["required", "optional", "special"]
  def required_values
    values = []
    apis.each do |api|
      next if api['request'].nil?
      request_param = api['request']['param']
      if request_param.is_a?(Array)
        request_param.each{ |rp| values << rp['required']}
      else
        values << request_param['required'] 
      end
    end
    values.uniq
  end

  def run
    read_file
    parse_file
    generator
  end

  def generator
    erb_file = read_relative_path('/script/templates/api.rb.erb')
    template = ERB.new(erb_file)
    result =  template.result(binding)
    File.write('/tmp/api.rb', result)
  end

  private
  def method_codes
    codes = ""
    erb_file = read_relative_path('/script/templates/api_method.erb')
    template = ERB.new(erb_file)
    apis.each do |api|
      codes << template.result(binding)
    end
    codes
  end

  def request_param_codes(api)
    codes = ""
    @required_params = []
    @special_params = []
    return '' if api['request'].nil?
    request_param = api['request']['param']
    case request_param
    when Array
      request_param.each{|rp| request_param_code(rp)}
    when Hash
      request_param_code(request_param)
    end
    unless @required_params.empty?
      codes << "        required_check_result = #{@required_params.inspect} - params.keys.map(&:to_s)\n"
      codes << '        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?' << "\n"
    end
    unless @special_params.empty?
      codes << "        special_params = #{@special_params.inspect}\n"
      codes << "        special_check_result = special_params - params.keys.map(&:to_s)\n"
      codes << '        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size' << "\n"
    end
    codes
  end

  def request_param_code(request_param)
    case request_param['required']
    when 'required'
      @required_params << request_param['name']
    when 'special'
      @special_params << request_param['name']
    end
  end

  def response_param_codes(api)
    codes = ""
    response_param = api['response']['param']
    case response_param
    when Array
      response_param.each do |rp|
        code = response_param_code(rp)
        codes << "#{code}\n" if code
      end
    when Hash
      code = response_param_code(response_param)
      codes << "#{code}\n" if code
    else
      raise "未知错误"
    end
    codes
  end

  def response_param_code(response_param)
    #Basic, Object不处理
    case response_param['level']
    when 'Basic Array'
      name = response_param['name']
      "        result_hash['#{name}'] = result_hash['#{name}'].values.flatten(1)"
    when 'Object Array'
      name = response_param['name']
      type = response_param['type'].underscore
      "        result_hash['#{name}'] = result_hash['#{name}']['#{type}']"
    end
  end

  def read_relative_path(filename)
    filename = File.join(Rails.root, filename)
    File.read( filename )
  end
end

ApiMetadat.new.run
