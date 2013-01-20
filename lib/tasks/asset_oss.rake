namespace :assets do
  namespace :oss do

    desc "uploads the current assets to aliyun oss with stamped ids"
    task :upload do
      AssetOSS::Asset.asset_paths += ['assets'] # Configure additional asset paths
      AssetOSS::OSS.upload
    end

  end
end
