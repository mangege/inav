# -*- encoding : utf-8 -*-
#请勿修改,此文件代码通过 script/api_metadat.rb 生成
#version_no: 20121123
module Taobao
  class Api
    class << self
      def taobao_user_buyer_get(params)
        params['method'] = 'taobao.user.buyer.get'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_user_get(params)
        params['method'] = 'taobao.user.get'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_user_seller_get(params)
        params['method'] = 'taobao.user.seller.get'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_users_get(params)
        params['method'] = 'taobao.users.get'
        required_check_result = ["fields", "nicks"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['users'] = ( result_hash['users'].nil? ? [] : result_hash['users']['user'] )

        result_hash
      end

      def taobao_itemcats_authorize_get(params)
        params['method'] = 'taobao.itemcats.authorize.get'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_itemcats_get(params)
        params['method'] = 'taobao.itemcats.get'
        special_params = ["cids", "parent_cid"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)
        result_hash['item_cats'] = ( result_hash['item_cats'].nil? ? [] : result_hash['item_cats']['item_cat'] )

        result_hash
      end

      def taobao_itemcats_increment_get(params)
        params['method'] = 'taobao.itemcats.increment.get'
        required_check_result = ["cids"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['item_cats'] = ( result_hash['item_cats'].nil? ? [] : result_hash['item_cats']['item_cat'] )
        result_hash['item_props'] = ( result_hash['item_props'].nil? ? [] : result_hash['item_props']['item_prop'] )
        result_hash['prop_values'] = ( result_hash['prop_values'].nil? ? [] : result_hash['prop_values']['prop_value'] )

        result_hash
      end

      def taobao_itemprops_get(params)
        params['method'] = 'taobao.itemprops.get'
        required_check_result = ["cid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['item_props'] = ( result_hash['item_props'].nil? ? [] : result_hash['item_props']['item_prop'] )

        result_hash
      end

      def taobao_itempropvalues_get(params)
        params['method'] = 'taobao.itempropvalues.get'
        required_check_result = ["cid", "fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?
        special_params = ["pvs"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)
        result_hash['prop_values'] = ( result_hash['prop_values'].nil? ? [] : result_hash['prop_values']['prop_value'] )

        result_hash
      end

      def taobao_topats_itemcats_get(params)
        params['method'] = 'taobao.topats.itemcats.get'

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_aftersale_get(params)
        params['method'] = 'taobao.aftersale.get'

        result_hash = Client.execute(params)
        result_hash['after_sales'] = ( result_hash['after_sales'].nil? ? [] : result_hash['after_sales']['after_sale'] )

        result_hash
      end

      def taobao_item_add(params)
        params['method'] = 'taobao.item.add'
        required_check_result = ["cid", "desc", "location.city", "location.state", "num", "price", "stuff_status", "title", "type"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_item_anchor_get(params)
        params['method'] = 'taobao.item.anchor.get'
        required_check_result = ["cat_id", "type"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['anchor_modules'] = ( result_hash['anchor_modules'].nil? ? [] : result_hash['anchor_modules']['ids_module'] )

        result_hash
      end

      def taobao_item_delete(params)
        params['method'] = 'taobao.item.delete'
        required_check_result = ["num_iid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_item_get(params)
        params['method'] = 'taobao.item.get'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?
        special_params = ["num_iid", "track_iid"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_item_img_delete(params)
        params['method'] = 'taobao.item.img.delete'
        required_check_result = ["id", "num_iid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_item_img_upload(params)
        params['method'] = 'taobao.item.img.upload'
        required_check_result = ["num_iid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_item_joint_img(params)
        params['method'] = 'taobao.item.joint.img'
        required_check_result = ["num_iid", "pic_path"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_item_joint_propimg(params)
        params['method'] = 'taobao.item.joint.propimg'
        required_check_result = ["num_iid", "pic_path", "properties"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_item_price_update(params)
        params['method'] = 'taobao.item.price.update'
        required_check_result = ["num_iid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_item_propimg_delete(params)
        params['method'] = 'taobao.item.propimg.delete'
        required_check_result = ["id", "num_iid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_item_propimg_upload(params)
        params['method'] = 'taobao.item.propimg.upload'
        required_check_result = ["num_iid", "properties"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_item_quantity_update(params)
        params['method'] = 'taobao.item.quantity.update'
        required_check_result = ["num_iid", "quantity"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_item_recommend_add(params)
        params['method'] = 'taobao.item.recommend.add'
        required_check_result = ["num_iid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_item_recommend_delete(params)
        params['method'] = 'taobao.item.recommend.delete'
        required_check_result = ["num_iid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_item_sku_add(params)
        params['method'] = 'taobao.item.sku.add'
        required_check_result = ["num_iid", "price", "properties", "quantity"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_item_sku_delete(params)
        params['method'] = 'taobao.item.sku.delete'
        required_check_result = ["num_iid", "properties"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_item_sku_get(params)
        params['method'] = 'taobao.item.sku.get'
        required_check_result = ["fields", "sku_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?
        special_params = ["nick", "num_iid"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_item_sku_price_update(params)
        params['method'] = 'taobao.item.sku.price.update'
        required_check_result = ["num_iid", "properties"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_item_sku_update(params)
        params['method'] = 'taobao.item.sku.update'
        required_check_result = ["num_iid", "properties"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_item_skus_get(params)
        params['method'] = 'taobao.item.skus.get'
        required_check_result = ["fields", "num_iids"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['skus'] = ( result_hash['skus'].nil? ? [] : result_hash['skus']['sku'] )

        result_hash
      end

      def taobao_item_templates_get(params)
        params['method'] = 'taobao.item.templates.get'

        result_hash = Client.execute(params)
        result_hash['item_template_list'] = ( result_hash['item_template_list'].nil? ? [] : result_hash['item_template_list']['item_template'] )

        result_hash
      end

      def taobao_item_update(params)
        params['method'] = 'taobao.item.update'
        required_check_result = ["num_iid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_item_update_delisting(params)
        params['method'] = 'taobao.item.update.delisting'
        required_check_result = ["num_iid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_item_update_listing(params)
        params['method'] = 'taobao.item.update.listing'
        required_check_result = ["num", "num_iid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_items_custom_get(params)
        params['method'] = 'taobao.items.custom.get'
        required_check_result = ["fields", "outer_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['items'] = ( result_hash['items'].nil? ? [] : result_hash['items']['item'] )

        result_hash
      end

      def taobao_items_inventory_get(params)
        params['method'] = 'taobao.items.inventory.get'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['items'] = ( result_hash['items'].nil? ? [] : result_hash['items']['item'] )

        result_hash
      end

      def taobao_items_list_get(params)
        params['method'] = 'taobao.items.list.get'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?
        special_params = ["num_iids", "track_iids"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)
        result_hash['items'] = ( result_hash['items'].nil? ? [] : result_hash['items']['item'] )

        result_hash
      end

      def taobao_items_onsale_get(params)
        params['method'] = 'taobao.items.onsale.get'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['items'] = ( result_hash['items'].nil? ? [] : result_hash['items']['item'] )

        result_hash
      end

      def taobao_product_add(params)
        params['method'] = 'taobao.product.add'
        required_check_result = ["cid", "image", "name", "price"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?
        special_params = ["customer_props", "props"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_product_get(params)
        params['method'] = 'taobao.product.get'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?
        special_params = ["cid", "product_id", "props"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_product_img_delete(params)
        params['method'] = 'taobao.product.img.delete'
        required_check_result = ["id", "product_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_product_img_upload(params)
        params['method'] = 'taobao.product.img.upload'
        required_check_result = ["image", "product_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_product_propimg_delete(params)
        params['method'] = 'taobao.product.propimg.delete'
        required_check_result = ["id", "product_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_product_propimg_upload(params)
        params['method'] = 'taobao.product.propimg.upload'
        required_check_result = ["image", "product_id", "props"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_product_update(params)
        params['method'] = 'taobao.product.update'
        required_check_result = ["product_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_products_get(params)
        params['method'] = 'taobao.products.get'
        required_check_result = ["fields", "nick"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['products'] = ( result_hash['products'].nil? ? [] : result_hash['products']['product'] )

        result_hash
      end

      def taobao_products_search(params)
        params['method'] = 'taobao.products.search'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?
        special_params = ["cid", "props", "q"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)
        result_hash['products'] = ( result_hash['products'].nil? ? [] : result_hash['products']['product'] )

        result_hash
      end

      def taobao_skus_custom_get(params)
        params['method'] = 'taobao.skus.custom.get'
        required_check_result = ["fields", "outer_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['skus'] = ( result_hash['skus'].nil? ? [] : result_hash['skus']['sku'] )

        result_hash
      end

      def taobao_skus_quantity_update(params)
        params['method'] = 'taobao.skus.quantity.update'
        required_check_result = ["num_iid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?
        special_params = ["outerid_quantities", "skuid_quantities"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_ump_promotion_get(params)
        params['method'] = 'taobao.ump.promotion.get'
        required_check_result = ["item_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def tmall_brandcat_control_get(params)
        params['method'] = 'tmall.brandcat.control.get'

        result_hash = Client.execute(params)

        result_hash
      end

      def tmall_brandcat_salespro_get(params)
        params['method'] = 'tmall.brandcat.salespro.get'
        required_check_result = ["brand_id", "cat_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['cat_brand_sale_props'] = ( result_hash['cat_brand_sale_props'].nil? ? [] : result_hash['cat_brand_sale_props']['cat_brand_sale_prop'] )

        result_hash
      end

      def taobao_topats_trades_fullinfo_get(params)
        params['method'] = 'taobao.topats.trades.fullinfo.get'
        required_check_result = ["fields", "tids"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_topats_trades_sold_get(params)
        params['method'] = 'taobao.topats.trades.sold.get'
        required_check_result = ["end_time", "fields", "start_time"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_trade_amount_get(params)
        params['method'] = 'taobao.trade.amount.get'
        required_check_result = ["fields", "tid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_trade_close(params)
        params['method'] = 'taobao.trade.close'
        required_check_result = ["close_reason", "tid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_trade_confirmfee_get(params)
        params['method'] = 'taobao.trade.confirmfee.get'
        required_check_result = ["is_detail", "tid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_trade_fullinfo_get(params)
        params['method'] = 'taobao.trade.fullinfo.get'
        required_check_result = ["fields", "tid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_trade_get(params)
        params['method'] = 'taobao.trade.get'
        required_check_result = ["fields", "tid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_trade_memo_add(params)
        params['method'] = 'taobao.trade.memo.add'
        required_check_result = ["memo", "tid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_trade_memo_update(params)
        params['method'] = 'taobao.trade.memo.update'
        required_check_result = ["tid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_trade_ordersku_update(params)
        params['method'] = 'taobao.trade.ordersku.update'
        required_check_result = ["oid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?
        special_params = ["sku_id", "sku_props"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_trade_postage_update(params)
        params['method'] = 'taobao.trade.postage.update'
        required_check_result = ["post_fee", "tid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_trade_receivetime_delay(params)
        params['method'] = 'taobao.trade.receivetime.delay'
        required_check_result = ["days", "tid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_trade_shippingaddress_update(params)
        params['method'] = 'taobao.trade.shippingaddress.update'
        required_check_result = ["tid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_trade_snapshot_get(params)
        params['method'] = 'taobao.trade.snapshot.get'
        required_check_result = ["fields", "tid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_trades_sold_get(params)
        params['method'] = 'taobao.trades.sold.get'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['trades'] = ( result_hash['trades'].nil? ? [] : result_hash['trades']['trade'] )

        result_hash
      end

      def taobao_trades_sold_increment_get(params)
        params['method'] = 'taobao.trades.sold.increment.get'
        required_check_result = ["end_modified", "fields", "start_modified"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['trades'] = ( result_hash['trades'].nil? ? [] : result_hash['trades']['trade'] )

        result_hash
      end

      def taobao_trades_sold_incrementv_get(params)
        params['method'] = 'taobao.trades.sold.incrementv.get'
        required_check_result = ["end_create", "fields", "start_create"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['trades'] = ( result_hash['trades'].nil? ? [] : result_hash['trades']['trade'] )

        result_hash
      end

      def taobao_traderate_add(params)
        params['method'] = 'taobao.traderate.add'
        required_check_result = ["result", "role", "tid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_traderate_explain_add(params)
        params['method'] = 'taobao.traderate.explain.add'
        required_check_result = ["oid", "reply"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_traderate_list_add(params)
        params['method'] = 'taobao.traderate.list.add'
        required_check_result = ["result", "role", "tid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_traderates_get(params)
        params['method'] = 'taobao.traderates.get'
        required_check_result = ["fields", "rate_type", "role"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['trade_rates'] = ( result_hash['trade_rates'].nil? ? [] : result_hash['trade_rates']['trade_rate'] )

        result_hash
      end

      def alibaba_logistics_order_cancel(params)
        params['method'] = 'alibaba.logistics.order.cancel'
        required_check_result = ["order_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def alibaba_logistics_order_charge(params)
        params['method'] = 'alibaba.logistics.order.charge'
        required_check_result = ["cargo_name", "pay_type", "route_code", "total_number"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def alibaba_logistics_order_consign(params)
        params['method'] = 'alibaba.logistics.order.consign'
        required_check_result = ["cargo_name", "order_id", "pay_type", "route_code", "source", "total_number"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def alibaba_logistics_route_query(params)
        params['method'] = 'alibaba.logistics.route.query'
        required_check_result = ["end_area_id", "page_index", "page_size", "source", "start_area_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_areas_get(params)
        params['method'] = 'taobao.areas.get'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['areas'] = ( result_hash['areas'].nil? ? [] : result_hash['areas']['area'] )

        result_hash
      end

      def taobao_delivery_template_add(params)
        params['method'] = 'taobao.delivery.template.add'
        required_check_result = ["assumer", "name", "template_add_fees", "template_add_standards", "template_dests", "template_start_fees", "template_start_standards", "template_types", "valuation"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_delivery_template_delete(params)
        params['method'] = 'taobao.delivery.template.delete'
        required_check_result = ["template_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_delivery_template_get(params)
        params['method'] = 'taobao.delivery.template.get'
        required_check_result = ["fields", "template_ids"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['delivery_templates'] = ( result_hash['delivery_templates'].nil? ? [] : result_hash['delivery_templates']['delivery_template'] )

        result_hash
      end

      def taobao_delivery_template_update(params)
        params['method'] = 'taobao.delivery.template.update'
        required_check_result = ["template_add_fees", "template_add_standards", "template_dests", "template_id", "template_start_fees", "template_start_standards", "template_types"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_delivery_templates_get(params)
        params['method'] = 'taobao.delivery.templates.get'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['delivery_templates'] = ( result_hash['delivery_templates'].nil? ? [] : result_hash['delivery_templates']['delivery_template'] )

        result_hash
      end

      def taobao_logistics_address_add(params)
        params['method'] = 'taobao.logistics.address.add'
        required_check_result = ["addr", "city", "contact_name", "province"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?
        special_params = ["mobile_phone", "phone"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_logistics_address_modify(params)
        params['method'] = 'taobao.logistics.address.modify'
        required_check_result = ["addr", "city", "contact_id", "contact_name", "province"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?
        special_params = ["mobile_phone", "phone"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_logistics_address_remove(params)
        params['method'] = 'taobao.logistics.address.remove'
        required_check_result = ["contact_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_logistics_address_search(params)
        params['method'] = 'taobao.logistics.address.search'

        result_hash = Client.execute(params)
        result_hash['addresses'] = ( result_hash['addresses'].nil? ? [] : result_hash['addresses']['address_result'] )

        result_hash
      end

      def taobao_logistics_companies_get(params)
        params['method'] = 'taobao.logistics.companies.get'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['logistics_companies'] = ( result_hash['logistics_companies'].nil? ? [] : result_hash['logistics_companies']['logistics_company'] )

        result_hash
      end

      def taobao_logistics_consign_resend(params)
        params['method'] = 'taobao.logistics.consign.resend'
        required_check_result = ["company_code", "out_sid", "tid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_logistics_dummy_send(params)
        params['method'] = 'taobao.logistics.dummy.send'
        required_check_result = ["tid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_logistics_offline_send(params)
        params['method'] = 'taobao.logistics.offline.send'
        required_check_result = ["company_code", "out_sid", "tid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_logistics_online_cancel(params)
        params['method'] = 'taobao.logistics.online.cancel'
        required_check_result = ["tid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_logistics_online_confirm(params)
        params['method'] = 'taobao.logistics.online.confirm'
        required_check_result = ["out_sid", "tid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_logistics_online_send(params)
        params['method'] = 'taobao.logistics.online.send'
        required_check_result = ["company_code", "tid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_logistics_orders_detail_get(params)
        params['method'] = 'taobao.logistics.orders.detail.get'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['shippings'] = ( result_hash['shippings'].nil? ? [] : result_hash['shippings']['shipping'] )

        result_hash
      end

      def taobao_logistics_orders_get(params)
        params['method'] = 'taobao.logistics.orders.get'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['shippings'] = ( result_hash['shippings'].nil? ? [] : result_hash['shippings']['shipping'] )

        result_hash
      end

      def taobao_logistics_orderstore_push(params)
        params['method'] = 'taobao.logistics.orderstore.push'
        required_check_result = ["occure_time", "operate_detail", "trade_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_logistics_ordertrace_push(params)
        params['method'] = 'taobao.logistics.ordertrace.push'
        required_check_result = ["company_name", "mail_no", "occure_time", "operate_detail"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_logistics_partners_get(params)
        params['method'] = 'taobao.logistics.partners.get'
        required_check_result = ["service_type"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['logistics_partners'] = ( result_hash['logistics_partners'].nil? ? [] : result_hash['logistics_partners']['logistics_partner'] )

        result_hash
      end

      def taobao_logistics_trace_search(params)
        params['method'] = 'taobao.logistics.trace.search'
        required_check_result = ["seller_nick", "tid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['trace_list'] = ( result_hash['trace_list'].nil? ? [] : result_hash['trace_list']['transit_step_info'] )

        result_hash
      end

      def taobao_topats_delivery_send(params)
        params['method'] = 'taobao.topats.delivery.send'
        required_check_result = ["tids"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_sellercats_list_add(params)
        params['method'] = 'taobao.sellercats.list.add'
        required_check_result = ["name"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_sellercats_list_get(params)
        params['method'] = 'taobao.sellercats.list.get'
        required_check_result = ["nick"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['seller_cats'] = ( result_hash['seller_cats'].nil? ? [] : result_hash['seller_cats']['seller_cat'] )

        result_hash
      end

      def taobao_sellercats_list_update(params)
        params['method'] = 'taobao.sellercats.list.update'
        required_check_result = ["cid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_shop_get(params)
        params['method'] = 'taobao.shop.get'
        required_check_result = ["fields", "nick"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_shop_remainshowcase_get(params)
        params['method'] = 'taobao.shop.remainshowcase.get'

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_shop_update(params)
        params['method'] = 'taobao.shop.update'
        special_params = ["bulletin", "desc", "title"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_shopcats_list_get(params)
        params['method'] = 'taobao.shopcats.list.get'

        result_hash = Client.execute(params)
        result_hash['shop_cats'] = ( result_hash['shop_cats'].nil? ? [] : result_hash['shop_cats']['shop_cat'] )

        result_hash
      end

      def taobao_fenxiao_cooperation_get(params)
        params['method'] = 'taobao.fenxiao.cooperation.get'

        result_hash = Client.execute(params)
        result_hash['cooperations'] = ( result_hash['cooperations'].nil? ? [] : result_hash['cooperations']['cooperation'] )

        result_hash
      end

      def taobao_fenxiao_cooperation_update(params)
        params['method'] = 'taobao.fenxiao.cooperation.update'
        required_check_result = ["distributor_id", "grade_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_fenxiao_discount_add(params)
        params['method'] = 'taobao.fenxiao.discount.add'
        required_check_result = ["discount_name", "discount_types", "discount_values", "target_ids", "target_types"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_fenxiao_discount_update(params)
        params['method'] = 'taobao.fenxiao.discount.update'

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_fenxiao_discounts_get(params)
        params['method'] = 'taobao.fenxiao.discounts.get'

        result_hash = Client.execute(params)
        result_hash['discounts'] = ( result_hash['discounts'].nil? ? [] : result_hash['discounts']['discount'] )

        result_hash
      end

      def taobao_fenxiao_distributor_items_get(params)
        params['method'] = 'taobao.fenxiao.distributor.items.get'
        special_params = ["distributor_id", "product_id"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)
        result_hash['records'] = ( result_hash['records'].nil? ? [] : result_hash['records']['fenxiao_item_record'] )

        result_hash
      end

      def taobao_fenxiao_distributors_get(params)
        params['method'] = 'taobao.fenxiao.distributors.get'
        required_check_result = ["nicks"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['distributors'] = ( result_hash['distributors'].nil? ? [] : result_hash['distributors']['distributor'] )

        result_hash
      end

      def taobao_fenxiao_grades_get(params)
        params['method'] = 'taobao.fenxiao.grades.get'

        result_hash = Client.execute(params)
        result_hash['fenxiao_grades'] = ( result_hash['fenxiao_grades'].nil? ? [] : result_hash['fenxiao_grades']['fenxiao_grade'] )

        result_hash
      end

      def taobao_fenxiao_login_user_get(params)
        params['method'] = 'taobao.fenxiao.login.user.get'

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_fenxiao_order_customfield_update(params)
        params['method'] = 'taobao.fenxiao.order.customfield.update'
        required_check_result = ["isv_custom_key", "purchase_order_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_fenxiao_order_message_add(params)
        params['method'] = 'taobao.fenxiao.order.message.add'
        required_check_result = ["message", "purchase_order_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_fenxiao_order_remark_update(params)
        params['method'] = 'taobao.fenxiao.order.remark.update'
        required_check_result = ["purchase_order_id", "supplier_memo"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_fenxiao_orders_get(params)
        params['method'] = 'taobao.fenxiao.orders.get'

        result_hash = Client.execute(params)
        result_hash['purchase_orders'] = ( result_hash['purchase_orders'].nil? ? [] : result_hash['purchase_orders']['purchase_order'] )

        result_hash
      end

      def taobao_fenxiao_product_add(params)
        params['method'] = 'taobao.fenxiao.product.add'
        required_check_result = ["alarm_number", "category_id", "city", "desc", "have_guarantee", "have_invoice", "name", "postage_type", "productcat_id", "prov", "quantity", "retail_price_high", "retail_price_low", "standard_price"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_fenxiao_product_gradeprice_update(params)
        params['method'] = 'taobao.fenxiao.product.gradeprice.update'
        required_check_result = ["ids", "prices", "product_id", "target_type"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_fenxiao_product_image_delete(params)
        params['method'] = 'taobao.fenxiao.product.image.delete'
        required_check_result = ["position", "product_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_fenxiao_product_image_upload(params)
        params['method'] = 'taobao.fenxiao.product.image.upload'
        required_check_result = ["position", "product_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?
        special_params = ["image", "pic_path"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_fenxiao_product_pdu_update(params)
        params['method'] = 'taobao.fenxiao.product.pdu.update'
        required_check_result = ["distributor_id", "product_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_fenxiao_product_sku_add(params)
        params['method'] = 'taobao.fenxiao.product.sku.add'
        required_check_result = ["product_id", "properties", "standard_price"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?
        special_params = ["agent_cost_price", "dealer_cost_price"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_fenxiao_product_sku_delete(params)
        params['method'] = 'taobao.fenxiao.product.sku.delete'
        required_check_result = ["product_id", "properties"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_fenxiao_product_sku_update(params)
        params['method'] = 'taobao.fenxiao.product.sku.update'
        required_check_result = ["product_id", "properties"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_fenxiao_product_skus_get(params)
        params['method'] = 'taobao.fenxiao.product.skus.get'
        required_check_result = ["product_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['skus'] = ( result_hash['skus'].nil? ? [] : result_hash['skus']['fenxiao_sku'] )

        result_hash
      end

      def taobao_fenxiao_product_update(params)
        params['method'] = 'taobao.fenxiao.product.update'
        required_check_result = ["pid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_fenxiao_productcats_get(params)
        params['method'] = 'taobao.fenxiao.productcats.get'

        result_hash = Client.execute(params)
        result_hash['productcats'] = ( result_hash['productcats'].nil? ? [] : result_hash['productcats']['product_cat'] )

        result_hash
      end

      def taobao_fenxiao_products_get(params)
        params['method'] = 'taobao.fenxiao.products.get'

        result_hash = Client.execute(params)
        result_hash['products'] = ( result_hash['products'].nil? ? [] : result_hash['products']['fenxiao_product'] )

        result_hash
      end

      def taobao_fenxiao_trademonitor_get(params)
        params['method'] = 'taobao.fenxiao.trademonitor.get'

        result_hash = Client.execute(params)
        result_hash['trade_monitors'] = ( result_hash['trade_monitors'].nil? ? [] : result_hash['trade_monitors']['trade_monitor'] )

        result_hash
      end

      def taobao_wangwang_eservice_avgwaittime_get(params)
        params['method'] = 'taobao.wangwang.eservice.avgwaittime.get'
        required_check_result = ["end_date", "service_staff_id", "start_date"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['waiting_time_list_on_days'] = ( result_hash['waiting_time_list_on_days'].nil? ? [] : result_hash['waiting_time_list_on_days']['waiting_times_on_day'] )

        result_hash
      end

      def taobao_wangwang_eservice_chatlog_get(params)
        params['method'] = 'taobao.wangwang.eservice.chatlog.get'
        required_check_result = ["end_date", "from_id", "start_date", "to_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['msgs'] = ( result_hash['msgs'].nil? ? [] : result_hash['msgs']['msg'] )

        result_hash
      end

      def taobao_wangwang_eservice_chatpeers_get(params)
        params['method'] = 'taobao.wangwang.eservice.chatpeers.get'
        required_check_result = ["chat_id", "end_date", "start_date"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['chatpeers'] = ( result_hash['chatpeers'].nil? ? [] : result_hash['chatpeers']['chatpeer'] )

        result_hash
      end

      def taobao_wangwang_eservice_evals_get(params)
        params['method'] = 'taobao.wangwang.eservice.evals.get'
        required_check_result = ["end_date", "service_staff_id", "start_date"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['staff_eval_details'] = ( result_hash['staff_eval_details'].nil? ? [] : result_hash['staff_eval_details']['eval_detail'] )

        result_hash
      end

      def taobao_wangwang_eservice_evaluation_get(params)
        params['method'] = 'taobao.wangwang.eservice.evaluation.get'
        required_check_result = ["end_date", "service_staff_id", "start_date"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['staff_eval_stat_on_days'] = ( result_hash['staff_eval_stat_on_days'].nil? ? [] : result_hash['staff_eval_stat_on_days']['staff_eval_stat_on_day'] )

        result_hash
      end

      def taobao_wangwang_eservice_groupmember_get(params)
        params['method'] = 'taobao.wangwang.eservice.groupmember.get'
        required_check_result = ["manager_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['group_member_list'] = ( result_hash['group_member_list'].nil? ? [] : result_hash['group_member_list']['group_member'] )

        result_hash
      end

      def taobao_wangwang_eservice_loginlogs_get(params)
        params['method'] = 'taobao.wangwang.eservice.loginlogs.get'
        required_check_result = ["end_date", "service_staff_id", "start_date"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['loginlogs'] = ( result_hash['loginlogs'].nil? ? [] : result_hash['loginlogs']['login_log'] )

        result_hash
      end

      def taobao_wangwang_eservice_noreplynum_get(params)
        params['method'] = 'taobao.wangwang.eservice.noreplynum.get'
        required_check_result = ["end_date", "service_staff_id", "start_date"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['non_reply_stat_on_days'] = ( result_hash['non_reply_stat_on_days'].nil? ? [] : result_hash['non_reply_stat_on_days']['non_reply_stat_on_day'] )

        result_hash
      end

      def taobao_wangwang_eservice_onlinetime_get(params)
        params['method'] = 'taobao.wangwang.eservice.onlinetime.get'
        required_check_result = ["end_date", "service_staff_id", "start_date"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['online_times_list_on_days'] = ( result_hash['online_times_list_on_days'].nil? ? [] : result_hash['online_times_list_on_days']['online_times_on_day'] )

        result_hash
      end

      def taobao_wangwang_eservice_receivenum_get(params)
        params['method'] = 'taobao.wangwang.eservice.receivenum.get'
        required_check_result = ["end_date", "service_staff_id", "start_date"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['reply_stat_list_on_days'] = ( result_hash['reply_stat_list_on_days'].nil? ? [] : result_hash['reply_stat_list_on_days']['reply_stat_on_day'] )

        result_hash
      end

      def taobao_wangwang_eservice_streamweigths_get(params)
        params['method'] = 'taobao.wangwang.eservice.streamweigths.get'

        result_hash = Client.execute(params)
        result_hash['staff_stream_weights'] = ( result_hash['staff_stream_weights'].nil? ? [] : result_hash['staff_stream_weights']['stream_weight'] )

        result_hash
      end

      def taobao_taobaoke_caturl_get(params)
        params['method'] = 'taobao.taobaoke.caturl.get'
        required_check_result = ["cid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_taobaoke_items_convert(params)
        params['method'] = 'taobao.taobaoke.items.convert'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?
        special_params = ["num_iids", "track_iids"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)
        result_hash['taobaoke_items'] = ( result_hash['taobaoke_items'].nil? ? [] : result_hash['taobaoke_items']['taobaoke_item'] )

        result_hash
      end

      def taobao_taobaoke_items_coupon_get(params)
        params['method'] = 'taobao.taobaoke.items.coupon.get'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?
        special_params = ["cid", "keyword"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)
        result_hash['taobaoke_items'] = ( result_hash['taobaoke_items'].nil? ? [] : result_hash['taobaoke_items']['taobaoke_item'] )

        result_hash
      end

      def taobao_taobaoke_items_detail_get(params)
        params['method'] = 'taobao.taobaoke.items.detail.get'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?
        special_params = ["num_iids", "track_iids"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)
        result_hash['taobaoke_item_details'] = ( result_hash['taobaoke_item_details'].nil? ? [] : result_hash['taobaoke_item_details']['taobaoke_item_detail'] )

        result_hash
      end

      def taobao_taobaoke_items_get(params)
        params['method'] = 'taobao.taobaoke.items.get'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?
        special_params = ["cid", "keyword"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)
        result_hash['taobaoke_items'] = ( result_hash['taobaoke_items'].nil? ? [] : result_hash['taobaoke_items']['taobaoke_item'] )

        result_hash
      end

      def taobao_taobaoke_items_relate_get(params)
        params['method'] = 'taobao.taobaoke.items.relate.get'
        required_check_result = ["fields", "relate_type"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['taobaoke_items'] = ( result_hash['taobaoke_items'].nil? ? [] : result_hash['taobaoke_items']['taobaoke_item'] )

        result_hash
      end

      def taobao_taobaoke_listurl_get(params)
        params['method'] = 'taobao.taobaoke.listurl.get'
        required_check_result = ["q"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_taobaoke_report_get(params)
        params['method'] = 'taobao.taobaoke.report.get'
        required_check_result = ["date", "fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_taobaoke_shops_convert(params)
        params['method'] = 'taobao.taobaoke.shops.convert'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?
        special_params = ["seller_nicks", "sids"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)
        result_hash['taobaoke_shops'] = ( result_hash['taobaoke_shops'].nil? ? [] : result_hash['taobaoke_shops']['taobaoke_shop'] )

        result_hash
      end

      def taobao_taobaoke_shops_get(params)
        params['method'] = 'taobao.taobaoke.shops.get'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?
        special_params = ["cid", "keyword"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)
        result_hash['taobaoke_shops'] = ( result_hash['taobaoke_shops'].nil? ? [] : result_hash['taobaoke_shops']['taobaoke_shop'] )

        result_hash
      end

      def taobao_taobaoke_shops_relate_get(params)
        params['method'] = 'taobao.taobaoke.shops.relate.get'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?
        special_params = ["seller_id", "seller_nick"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)
        result_hash['taobaoke_shops'] = ( result_hash['taobaoke_shops'].nil? ? [] : result_hash['taobaoke_shops']['taobaoke_shop'] )

        result_hash
      end

      def taobao_taobaoke_widget_items_convert(params)
        params['method'] = 'taobao.taobaoke.widget.items.convert'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?
        special_params = ["num_iids", "track_iids"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)
        result_hash['taobaoke_items'] = ( result_hash['taobaoke_items'].nil? ? [] : result_hash['taobaoke_items']['taobaoke_item'] )

        result_hash
      end

      def taobao_taobaoke_widget_shops_convert(params)
        params['method'] = 'taobao.taobaoke.widget.shops.convert'
        required_check_result = ["fields", "seller_nicks"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['taobaoke_shops'] = ( result_hash['taobaoke_shops'].nil? ? [] : result_hash['taobaoke_shops']['taobaoke_shop'] )

        result_hash
      end

      def taobao_taobaoke_widget_url_convert(params)
        params['method'] = 'taobao.taobaoke.widget.url.convert'
        required_check_result = ["url"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_comet_discardinfo_get(params)
        params['method'] = 'taobao.comet.discardinfo.get'
        required_check_result = ["start"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['discard_info_list'] = ( result_hash['discard_info_list'].nil? ? [] : result_hash['discard_info_list']['discard_info'] )

        result_hash
      end

      def taobao_increment_authorize_message_get(params)
        params['method'] = 'taobao.increment.authorize.message.get'
        required_check_result = ["topic"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['messages'] = ( result_hash['messages'].nil? ? [] : result_hash['messages'].values.flatten(1)  )

        result_hash
      end

      def taobao_increment_customer_permit(params)
        params['method'] = 'taobao.increment.customer.permit'

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_increment_customer_stop(params)
        params['method'] = 'taobao.increment.customer.stop'
        required_check_result = ["nick"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_increment_customers_get(params)
        params['method'] = 'taobao.increment.customers.get'

        result_hash = Client.execute(params)
        result_hash['app_customers'] = ( result_hash['app_customers'].nil? ? [] : result_hash['app_customers']['app_customer'] )

        result_hash
      end

      def taobao_increment_items_get(params)
        params['method'] = 'taobao.increment.items.get'

        result_hash = Client.execute(params)
        result_hash['notify_items'] = ( result_hash['notify_items'].nil? ? [] : result_hash['notify_items']['notify_item'] )

        result_hash
      end

      def taobao_increment_refunds_get(params)
        params['method'] = 'taobao.increment.refunds.get'

        result_hash = Client.execute(params)
        result_hash['notify_refunds'] = ( result_hash['notify_refunds'].nil? ? [] : result_hash['notify_refunds']['notify_refund'] )

        result_hash
      end

      def taobao_increment_trades_get(params)
        params['method'] = 'taobao.increment.trades.get'

        result_hash = Client.execute(params)
        result_hash['notify_trades'] = ( result_hash['notify_trades'].nil? ? [] : result_hash['notify_trades']['notify_trade'] )

        result_hash
      end

      def taobao_topats_increment_messages_get(params)
        params['method'] = 'taobao.topats.increment.messages.get'
        required_check_result = ["end", "start", "topics"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_feedback_add(params)
        params['method'] = 'taobao.feedback.add'
        required_check_result = ["info", "type"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_kfc_keyword_search(params)
        params['method'] = 'taobao.kfc.keyword.search'
        required_check_result = ["content"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_time_get(params)
        params['method'] = 'taobao.time.get'

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_topats_result_get(params)
        params['method'] = 'taobao.topats.result.get'
        required_check_result = ["task_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_topats_task_delete(params)
        params['method'] = 'taobao.topats.task.delete'
        required_check_result = ["task_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_topats_tasks_get(params)
        params['method'] = 'taobao.topats.tasks.get'
        required_check_result = ["end_time", "start_time"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['tasks'] = ( result_hash['tasks'].nil? ? [] : result_hash['tasks']['task'] )

        result_hash
      end

      def taobao_wlb_inventory_detail_get(params)
        params['method'] = 'taobao.wlb.inventory.detail.get'
        required_check_result = ["item_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['inventory_list'] = ( result_hash['inventory_list'].nil? ? [] : result_hash['inventory_list']['wlb_inventory'] )

        result_hash
      end

      def taobao_wlb_inventory_sync(params)
        params['method'] = 'taobao.wlb.inventory.sync'
        required_check_result = ["item_id", "item_type", "quantity"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_wlb_inventorylog_query(params)
        params['method'] = 'taobao.wlb.inventorylog.query'

        result_hash = Client.execute(params)
        result_hash['inventory_log_list'] = ( result_hash['inventory_log_list'].nil? ? [] : result_hash['inventory_log_list']['wlb_item_inventory_log'] )

        result_hash
      end

      def taobao_wlb_item_add(params)
        params['method'] = 'taobao.wlb.item.add'
        required_check_result = ["is_sku", "item_code", "name"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_wlb_item_authorization_add(params)
        params['method'] = 'taobao.wlb.item.authorization.add'
        required_check_result = ["auth_type", "authorize_end_time", "authorize_start_time", "consign_user_nick", "item_id_list", "name", "rule_code"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['rule_id_list'] = ( result_hash['rule_id_list'].nil? ? [] : result_hash['rule_id_list'].values.flatten(1)  )

        result_hash
      end

      def taobao_wlb_item_authorization_delete(params)
        params['method'] = 'taobao.wlb.item.authorization.delete'
        required_check_result = ["authorize_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_wlb_item_authorization_query(params)
        params['method'] = 'taobao.wlb.item.authorization.query'

        result_hash = Client.execute(params)
        result_hash['authorization_list'] = ( result_hash['authorization_list'].nil? ? [] : result_hash['authorization_list']['wlb_authorization'] )

        result_hash
      end

      def taobao_wlb_item_batch_query(params)
        params['method'] = 'taobao.wlb.item.batch.query'
        required_check_result = ["item_ids"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['item_inventory_batch_list'] = ( result_hash['item_inventory_batch_list'].nil? ? [] : result_hash['item_inventory_batch_list']['wlb_item_batch_inventory'] )

        result_hash
      end

      def taobao_wlb_item_combination_create(params)
        params['method'] = 'taobao.wlb.item.combination.create'
        required_check_result = ["dest_item_list", "item_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_wlb_item_combination_delete(params)
        params['method'] = 'taobao.wlb.item.combination.delete'
        required_check_result = ["dest_item_list", "item_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_wlb_item_combination_get(params)
        params['method'] = 'taobao.wlb.item.combination.get'
        required_check_result = ["item_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['item_id_list'] = ( result_hash['item_id_list'].nil? ? [] : result_hash['item_id_list'].values.flatten(1)  )

        result_hash
      end

      def taobao_wlb_item_consignment_create(params)
        params['method'] = 'taobao.wlb.item.consignment.create'
        required_check_result = ["item_id", "number", "owner_item_id", "owner_user_id", "rule_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_wlb_item_consignment_delete(params)
        params['method'] = 'taobao.wlb.item.consignment.delete'
        required_check_result = ["ic_item_id", "owner_item_id", "rule_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_wlb_item_consignment_page_get(params)
        params['method'] = 'taobao.wlb.item.consignment.page.get'

        result_hash = Client.execute(params)
        result_hash['wlb_consign_ments'] = ( result_hash['wlb_consign_ments'].nil? ? [] : result_hash['wlb_consign_ments']['wlb_consign_ment'] )

        result_hash
      end

      def taobao_wlb_item_delete(params)
        params['method'] = 'taobao.wlb.item.delete'
        required_check_result = ["item_id", "user_nick"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_wlb_item_get(params)
        params['method'] = 'taobao.wlb.item.get'
        required_check_result = ["item_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_wlb_item_map_get(params)
        params['method'] = 'taobao.wlb.item.map.get'
        required_check_result = ["item_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['out_entity_item_list'] = ( result_hash['out_entity_item_list'].nil? ? [] : result_hash['out_entity_item_list']['out_entity_item'] )

        result_hash
      end

      def taobao_wlb_item_map_get_by_extentity(params)
        params['method'] = 'taobao.wlb.item.map.get.by.extentity'
        required_check_result = ["ext_entity_id", "ext_entity_type"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_wlb_item_query(params)
        params['method'] = 'taobao.wlb.item.query'

        result_hash = Client.execute(params)
        result_hash['item_list'] = ( result_hash['item_list'].nil? ? [] : result_hash['item_list']['wlb_item'] )

        result_hash
      end

      def taobao_wlb_item_synchronize(params)
        params['method'] = 'taobao.wlb.item.synchronize'
        required_check_result = ["ext_entity_id", "ext_entity_type", "item_id", "user_nick"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_wlb_item_synchronize_delete(params)
        params['method'] = 'taobao.wlb.item.synchronize.delete'
        required_check_result = ["ext_entity_id", "ext_entity_type", "item_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_wlb_item_update(params)
        params['method'] = 'taobao.wlb.item.update'
        required_check_result = ["id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_wlb_notify_message_confirm(params)
        params['method'] = 'taobao.wlb.notify.message.confirm'
        required_check_result = ["message_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_wlb_notify_message_page_get(params)
        params['method'] = 'taobao.wlb.notify.message.page.get'

        result_hash = Client.execute(params)
        result_hash['wlb_messages'] = ( result_hash['wlb_messages'].nil? ? [] : result_hash['wlb_messages']['wlb_message'] )

        result_hash
      end

      def taobao_wlb_order_cancel(params)
        params['method'] = 'taobao.wlb.order.cancel'
        required_check_result = ["wlb_order_code"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_wlb_order_consign(params)
        params['method'] = 'taobao.wlb.order.consign'
        required_check_result = ["wlb_order_code"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_wlb_order_create(params)
        params['method'] = 'taobao.wlb.order.create'
        required_check_result = ["is_finished", "order_item_list", "order_sub_type", "order_type", "out_biz_code", "store_code"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_wlb_order_page_get(params)
        params['method'] = 'taobao.wlb.order.page.get'

        result_hash = Client.execute(params)
        result_hash['order_list'] = ( result_hash['order_list'].nil? ? [] : result_hash['order_list']['wlb_order'] )

        result_hash
      end

      def taobao_wlb_order_schedule_rule_add(params)
        params['method'] = 'taobao.wlb.order.schedule.rule.add'
        required_check_result = ["default_store_id", "prov_area_ids"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_wlb_order_schedule_rule_update(params)
        params['method'] = 'taobao.wlb.order.schedule.rule.update'
        required_check_result = ["schedule_rule_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_wlb_orderitem_page_get(params)
        params['method'] = 'taobao.wlb.orderitem.page.get'
        required_check_result = ["order_code"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['order_item_list'] = ( result_hash['order_item_list'].nil? ? [] : result_hash['order_item_list']['wlb_order_item'] )

        result_hash
      end

      def taobao_wlb_orderschedulerule_delete(params)
        params['method'] = 'taobao.wlb.orderschedulerule.delete'
        required_check_result = ["id", "user_nick"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_wlb_orderschedulerule_query(params)
        params['method'] = 'taobao.wlb.orderschedulerule.query'

        result_hash = Client.execute(params)
        result_hash['order_schedule_rule_list'] = ( result_hash['order_schedule_rule_list'].nil? ? [] : result_hash['order_schedule_rule_list']['wlb_order_schedule_rule'] )

        result_hash
      end

      def taobao_wlb_orderstatus_get(params)
        params['method'] = 'taobao.wlb.orderstatus.get'
        required_check_result = ["order_code"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['wlb_order_status'] = ( result_hash['wlb_order_status'].nil? ? [] : result_hash['wlb_order_status']['wlb_process_status'] )

        result_hash
      end

      def taobao_wlb_out_inventory_change_notify(params)
        params['method'] = 'taobao.wlb.out.inventory.change.notify'
        required_check_result = ["change_count", "item_id", "op_type", "out_biz_code", "result_count", "source", "type"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_wlb_replenish_statistics(params)
        params['method'] = 'taobao.wlb.replenish.statistics'

        result_hash = Client.execute(params)
        result_hash['replenish_list'] = ( result_hash['replenish_list'].nil? ? [] : result_hash['replenish_list']['wlb_replenish'] )

        result_hash
      end

      def taobao_wlb_subscription_query(params)
        params['method'] = 'taobao.wlb.subscription.query'

        result_hash = Client.execute(params)
        result_hash['seller_subscription_list'] = ( result_hash['seller_subscription_list'].nil? ? [] : result_hash['seller_subscription_list']['wlb_seller_subscription'] )

        result_hash
      end

      def taobao_wlb_tmsorder_query(params)
        params['method'] = 'taobao.wlb.tmsorder.query'
        required_check_result = ["order_code"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['tms_order_list'] = ( result_hash['tms_order_list'].nil? ? [] : result_hash['tms_order_list']['wlb_tms_order'] )

        result_hash
      end

      def taobao_wlb_tradeorder_get(params)
        params['method'] = 'taobao.wlb.tradeorder.get'
        required_check_result = ["trade_id", "trade_type"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['wlb_order_list'] = ( result_hash['wlb_order_list'].nil? ? [] : result_hash['wlb_order_list']['wlb_order'] )

        result_hash
      end

      def taobao_wlb_wlborder_get(params)
        params['method'] = 'taobao.wlb.wlborder.get'
        required_check_result = ["wlb_order_code"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_account_balance_get(params)
        params['method'] = 'taobao.simba.account.balance.get'

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_adgroup_add(params)
        params['method'] = 'taobao.simba.adgroup.add'
        required_check_result = ["campaign_id", "default_price", "img_url", "item_id", "title"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_adgroup_adgroupcatmatchs_get(params)
        params['method'] = 'taobao.simba.adgroup.adgroupcatmatchs.get'
        required_check_result = ["adgroup_ids"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['adgroup_catmatch_list'] = ( result_hash['adgroup_catmatch_list'].nil? ? [] : result_hash['adgroup_catmatch_list']['ad_group_catmatch'] )

        result_hash
      end

      def taobao_simba_adgroup_campcatmatchs_get(params)
        params['method'] = 'taobao.simba.adgroup.campcatmatchs.get'
        required_check_result = ["campaign_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_adgroup_catmatch_get(params)
        params['method'] = 'taobao.simba.adgroup.catmatch.get'
        required_check_result = ["adgroup_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_adgroup_catmatch_update(params)
        params['method'] = 'taobao.simba.adgroup.catmatch.update'
        required_check_result = ["adgroup_id", "catmatch_id", "max_price", "online_status", "use_default_price"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_adgroup_catmatchforecast_get(params)
        params['method'] = 'taobao.simba.adgroup.catmatchforecast.get'
        required_check_result = ["adgroup_id", "catmatch_price"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_adgroup_changedcatmatchs_get(params)
        params['method'] = 'taobao.simba.adgroup.changedcatmatchs.get'
        required_check_result = ["start_time"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_adgroup_delete(params)
        params['method'] = 'taobao.simba.adgroup.delete'
        required_check_result = ["adgroup_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_adgroup_deletedcatmatchs_get(params)
        params['method'] = 'taobao.simba.adgroup.deletedcatmatchs.get'
        required_check_result = ["start_time"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_adgroup_nonsearchprices_update(params)
        params['method'] = 'taobao.simba.adgroup.nonsearchprices.update'
        required_check_result = ["adgroupid_price_json", "campaign_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['adgroup_list'] = ( result_hash['adgroup_list'].nil? ? [] : result_hash['adgroup_list']['ad_group'] )

        result_hash
      end

      def taobao_simba_adgroup_nonsearchstates_update(params)
        params['method'] = 'taobao.simba.adgroup.nonsearchstates.update'
        required_check_result = ["adgroupid_nonsearchstate_json", "campaign_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['adgroup_list'] = ( result_hash['adgroup_list'].nil? ? [] : result_hash['adgroup_list']['ad_group'] )

        result_hash
      end

      def taobao_simba_adgroup_onlineitems_get(params)
        params['method'] = 'taobao.simba.adgroup.onlineitems.get'

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_adgroup_update(params)
        params['method'] = 'taobao.simba.adgroup.update'
        required_check_result = ["adgroup_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?
        special_params = ["default_price", "nonsearch_max_price", "online_status", "use_nonsearch_default_price"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_adgroupids_changed_get(params)
        params['method'] = 'taobao.simba.adgroupids.changed.get'
        required_check_result = ["start_time"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['changed_adgroupids'] = ( result_hash['changed_adgroupids'].nil? ? [] : result_hash['changed_adgroupids'].values.flatten(1)  )

        result_hash
      end

      def taobao_simba_adgroupids_deleted_get(params)
        params['method'] = 'taobao.simba.adgroupids.deleted.get'
        required_check_result = ["start_time"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['deleted_adgroup_ids'] = ( result_hash['deleted_adgroup_ids'].nil? ? [] : result_hash['deleted_adgroup_ids'].values.flatten(1)  )

        result_hash
      end

      def taobao_simba_adgroups_changed_get(params)
        params['method'] = 'taobao.simba.adgroups.changed.get'
        required_check_result = ["start_time"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_adgroups_get(params)
        params['method'] = 'taobao.simba.adgroups.get'
        required_check_result = ["page_no", "page_size"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?
        special_params = ["adgroup_ids", "campaign_id"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_adgroups_item_exist(params)
        params['method'] = 'taobao.simba.adgroups.item.exist'
        required_check_result = ["campaign_id", "item_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_campaign_add(params)
        params['method'] = 'taobao.simba.campaign.add'
        required_check_result = ["title"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_campaign_area_get(params)
        params['method'] = 'taobao.simba.campaign.area.get'
        required_check_result = ["campaign_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_campaign_area_update(params)
        params['method'] = 'taobao.simba.campaign.area.update'
        required_check_result = ["area", "campaign_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_campaign_areaoptions_get(params)
        params['method'] = 'taobao.simba.campaign.areaoptions.get'

        result_hash = Client.execute(params)
        result_hash['area_options'] = ( result_hash['area_options'].nil? ? [] : result_hash['area_options']['area_option'] )

        result_hash
      end

      def taobao_simba_campaign_budget_get(params)
        params['method'] = 'taobao.simba.campaign.budget.get'
        required_check_result = ["campaign_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_campaign_budget_update(params)
        params['method'] = 'taobao.simba.campaign.budget.update'
        required_check_result = ["campaign_id", "use_smooth"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_campaign_channeloptions_get(params)
        params['method'] = 'taobao.simba.campaign.channeloptions.get'

        result_hash = Client.execute(params)
        result_hash['channel_options'] = ( result_hash['channel_options'].nil? ? [] : result_hash['channel_options']['channel_option'] )

        result_hash
      end

      def taobao_simba_campaign_platform_get(params)
        params['method'] = 'taobao.simba.campaign.platform.get'
        required_check_result = ["campaign_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_campaign_platform_update(params)
        params['method'] = 'taobao.simba.campaign.platform.update'
        required_check_result = ["campaign_id", "outside_discount", "search_channels"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_campaign_schedule_get(params)
        params['method'] = 'taobao.simba.campaign.schedule.get'
        required_check_result = ["campaign_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_campaign_schedule_update(params)
        params['method'] = 'taobao.simba.campaign.schedule.update'
        required_check_result = ["campaign_id", "schedule"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_campaign_update(params)
        params['method'] = 'taobao.simba.campaign.update'
        required_check_result = ["campaign_id", "online_status", "title"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_campaigns_get(params)
        params['method'] = 'taobao.simba.campaigns.get'

        result_hash = Client.execute(params)
        result_hash['campaigns'] = ( result_hash['campaigns'].nil? ? [] : result_hash['campaigns']['campaign'] )

        result_hash
      end

      def taobao_simba_catmatchids_changed_get(params)
        params['method'] = 'taobao.simba.catmatchids.changed.get'
        required_check_result = ["start_time"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['changed_catmatch_ids'] = ( result_hash['changed_catmatch_ids'].nil? ? [] : result_hash['changed_catmatch_ids'].values.flatten(1)  )

        result_hash
      end

      def taobao_simba_catmatchids_deleted_get(params)
        params['method'] = 'taobao.simba.catmatchids.deleted.get'
        required_check_result = ["start_time"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['deleted_catmatch_ids'] = ( result_hash['deleted_catmatch_ids'].nil? ? [] : result_hash['deleted_catmatch_ids'].values.flatten(1)  )

        result_hash
      end

      def taobao_simba_creative_add(params)
        params['method'] = 'taobao.simba.creative.add'
        required_check_result = ["adgroup_id", "img_url", "title"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_creative_delete(params)
        params['method'] = 'taobao.simba.creative.delete'
        required_check_result = ["creative_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_creative_update(params)
        params['method'] = 'taobao.simba.creative.update'
        required_check_result = ["adgroup_id", "creative_id", "img_url", "title"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_creativeids_changed_get(params)
        params['method'] = 'taobao.simba.creativeids.changed.get'
        required_check_result = ["start_time"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['changed_creative_ids'] = ( result_hash['changed_creative_ids'].nil? ? [] : result_hash['changed_creative_ids'].values.flatten(1)  )

        result_hash
      end

      def taobao_simba_creativeids_deleted_get(params)
        params['method'] = 'taobao.simba.creativeids.deleted.get'
        required_check_result = ["start_time"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['deleted_creative_ids'] = ( result_hash['deleted_creative_ids'].nil? ? [] : result_hash['deleted_creative_ids'].values.flatten(1)  )

        result_hash
      end

      def taobao_simba_creatives_changed_get(params)
        params['method'] = 'taobao.simba.creatives.changed.get'
        required_check_result = ["start_time"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_creatives_get(params)
        params['method'] = 'taobao.simba.creatives.get'
        special_params = ["adgroup_id", "creative_ids"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)
        result_hash['creatives'] = ( result_hash['creatives'].nil? ? [] : result_hash['creatives']['creative'] )

        result_hash
      end

      def taobao_simba_creatives_record_get(params)
        params['method'] = 'taobao.simba.creatives.record.get'
        required_check_result = ["creative_ids"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['creativerecords'] = ( result_hash['creativerecords'].nil? ? [] : result_hash['creativerecords']['creative_record'] )

        result_hash
      end

      def taobao_simba_customers_authorized_get(params)
        params['method'] = 'taobao.simba.customers.authorized.get'

        result_hash = Client.execute(params)
        result_hash['nicks'] = ( result_hash['nicks'].nil? ? [] : result_hash['nicks'].values.flatten(1)  )

        result_hash
      end

      def taobao_simba_insight_cats_get(params)
        params['method'] = 'taobao.simba.insight.cats.get'
        required_check_result = ["category_ids"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['in_category_tops'] = ( result_hash['in_category_tops'].nil? ? [] : result_hash['in_category_tops']['in_category_top'] )

        result_hash
      end

      def taobao_simba_insight_catsanalysis_get(params)
        params['method'] = 'taobao.simba.insight.catsanalysis.get'
        required_check_result = ["category_ids", "stu"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['in_category_analyses'] = ( result_hash['in_category_analyses'].nil? ? [] : result_hash['in_category_analyses']['in_category_analysis'] )

        result_hash
      end

      def taobao_simba_insight_catsbase_get(params)
        params['method'] = 'taobao.simba.insight.catsbase.get'
        required_check_result = ["category_ids", "filter", "time"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['in_category_bases'] = ( result_hash['in_category_bases'].nil? ? [] : result_hash['in_category_bases']['in_category_base'] )

        result_hash
      end

      def taobao_simba_insight_catsforecast_get(params)
        params['method'] = 'taobao.simba.insight.catsforecast.get'
        required_check_result = ["words"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['in_category_tops'] = ( result_hash['in_category_tops'].nil? ? [] : result_hash['in_category_tops']['in_category_top'] )

        result_hash
      end

      def taobao_simba_insight_catsrelatedword_get(params)
        params['method'] = 'taobao.simba.insight.catsrelatedword.get'
        required_check_result = ["result_num", "words"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['related_words'] = ( result_hash['related_words'].nil? ? [] : result_hash['related_words'].values.flatten(1)  )

        result_hash
      end

      def taobao_simba_insight_catstopword_get(params)
        params['method'] = 'taobao.simba.insight.catstopword.get'
        required_check_result = ["category_ids", "result_num"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['top_words'] = ( result_hash['top_words'].nil? ? [] : result_hash['top_words'].values.flatten(1)  )

        result_hash
      end

      def taobao_simba_insight_toplevelcats_get(params)
        params['method'] = 'taobao.simba.insight.toplevelcats.get'

        result_hash = Client.execute(params)
        result_hash['in_category_tops'] = ( result_hash['in_category_tops'].nil? ? [] : result_hash['in_category_tops']['in_category_top'] )

        result_hash
      end

      def taobao_simba_insight_wordsanalysis_get(params)
        params['method'] = 'taobao.simba.insight.wordsanalysis.get'
        required_check_result = ["stu", "words"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['in_word_analyses'] = ( result_hash['in_word_analyses'].nil? ? [] : result_hash['in_word_analyses']['in_word_analysis'] )

        result_hash
      end

      def taobao_simba_insight_wordsbase_get(params)
        params['method'] = 'taobao.simba.insight.wordsbase.get'
        required_check_result = ["filter", "time", "words"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['in_word_bases'] = ( result_hash['in_word_bases'].nil? ? [] : result_hash['in_word_bases']['in_word_base'] )

        result_hash
      end

      def taobao_simba_insight_wordscats_get(params)
        params['method'] = 'taobao.simba.insight.wordscats.get'
        required_check_result = ["filter", "word_categories"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['in_word_categories'] = ( result_hash['in_word_categories'].nil? ? [] : result_hash['in_word_categories']['in_word_category'] )

        result_hash
      end

      def taobao_simba_keyword_keywordforecast_get(params)
        params['method'] = 'taobao.simba.keyword.keywordforecast.get'
        required_check_result = ["bidword_price", "keyword_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_keywordids_changed_get(params)
        params['method'] = 'taobao.simba.keywordids.changed.get'
        required_check_result = ["start_time"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['changed_keyword_ids'] = ( result_hash['changed_keyword_ids'].nil? ? [] : result_hash['changed_keyword_ids'].values.flatten(1)  )

        result_hash
      end

      def taobao_simba_keywordids_deleted_get(params)
        params['method'] = 'taobao.simba.keywordids.deleted.get'
        required_check_result = ["start_time"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['deleted_keyword_ids'] = ( result_hash['deleted_keyword_ids'].nil? ? [] : result_hash['deleted_keyword_ids'].values.flatten(1)  )

        result_hash
      end

      def taobao_simba_keywords_add(params)
        params['method'] = 'taobao.simba.keywords.add'
        required_check_result = ["adgroup_id", "keyword_prices"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['keywords'] = ( result_hash['keywords'].nil? ? [] : result_hash['keywords']['keyword'] )

        result_hash
      end

      def taobao_simba_keywords_changed_get(params)
        params['method'] = 'taobao.simba.keywords.changed.get'
        required_check_result = ["start_time"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_keywords_delete(params)
        params['method'] = 'taobao.simba.keywords.delete'
        required_check_result = ["campaign_id", "keyword_ids"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['keywords'] = ( result_hash['keywords'].nil? ? [] : result_hash['keywords']['keyword'] )

        result_hash
      end

      def taobao_simba_keywords_get(params)
        params['method'] = 'taobao.simba.keywords.get'
        special_params = ["adgroup_id", "keyword_ids"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)
        result_hash['keywords'] = ( result_hash['keywords'].nil? ? [] : result_hash['keywords']['keyword'] )

        result_hash
      end

      def taobao_simba_keywords_price_set(params)
        params['method'] = 'taobao.simba.keywords.price.set'
        required_check_result = ["keywordid_prices"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['keywords'] = ( result_hash['keywords'].nil? ? [] : result_hash['keywords']['keyword'] )

        result_hash
      end

      def taobao_simba_keywords_qscore_get(params)
        params['method'] = 'taobao.simba.keywords.qscore.get'
        required_check_result = ["adgroup_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['keyword_qscore_list'] = ( result_hash['keyword_qscore_list'].nil? ? [] : result_hash['keyword_qscore_list']['keyword_qscore'] )

        result_hash
      end

      def taobao_simba_keywords_recommend_get(params)
        params['method'] = 'taobao.simba.keywords.recommend.get'
        required_check_result = ["adgroup_id", "page_no", "page_size"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_login_authsign_get(params)
        params['method'] = 'taobao.simba.login.authsign.get'

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_nonsearch_adgroupplaces_add(params)
        params['method'] = 'taobao.simba.nonsearch.adgroupplaces.add'
        required_check_result = ["adgroup_places_json", "campaign_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['adgroup_place_list'] = ( result_hash['adgroup_place_list'].nil? ? [] : result_hash['adgroup_place_list']['ad_group_place'] )

        result_hash
      end

      def taobao_simba_nonsearch_adgroupplaces_delete(params)
        params['method'] = 'taobao.simba.nonsearch.adgroupplaces.delete'
        required_check_result = ["adgroup_places_json", "campaign_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['adgroup_place_list'] = ( result_hash['adgroup_place_list'].nil? ? [] : result_hash['adgroup_place_list']['ad_group_place'] )

        result_hash
      end

      def taobao_simba_nonsearch_adgroupplaces_get(params)
        params['method'] = 'taobao.simba.nonsearch.adgroupplaces.get'
        required_check_result = ["adgroup_ids", "campaign_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['adgroup_place_list'] = ( result_hash['adgroup_place_list'].nil? ? [] : result_hash['adgroup_place_list']['ad_group_place'] )

        result_hash
      end

      def taobao_simba_nonsearch_adgroupplaces_update(params)
        params['method'] = 'taobao.simba.nonsearch.adgroupplaces.update'
        required_check_result = ["adgroup_places_json", "campaign_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['adgroup_place_list'] = ( result_hash['adgroup_place_list'].nil? ? [] : result_hash['adgroup_place_list']['ad_group_place'] )

        result_hash
      end

      def taobao_simba_nonsearch_alldemographics_get(params)
        params['method'] = 'taobao.simba.nonsearch.alldemographics.get'

        result_hash = Client.execute(params)
        result_hash['demographic_list'] = ( result_hash['demographic_list'].nil? ? [] : result_hash['demographic_list']['demographic'] )

        result_hash
      end

      def taobao_simba_nonsearch_allplaces_get(params)
        params['method'] = 'taobao.simba.nonsearch.allplaces.get'

        result_hash = Client.execute(params)
        result_hash['place_list'] = ( result_hash['place_list'].nil? ? [] : result_hash['place_list']['place'] )

        result_hash
      end

      def taobao_simba_nonsearch_demographics_get(params)
        params['method'] = 'taobao.simba.nonsearch.demographics.get'
        required_check_result = ["campaign_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['demographic_setting_list'] = ( result_hash['demographic_setting_list'].nil? ? [] : result_hash['demographic_setting_list']['demographic_setting'] )

        result_hash
      end

      def taobao_simba_nonsearch_demographics_update(params)
        params['method'] = 'taobao.simba.nonsearch.demographics.update'
        required_check_result = ["campaign_id", "demographic_id_price_json"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['demographic_setting_list'] = ( result_hash['demographic_setting_list'].nil? ? [] : result_hash['demographic_setting_list']['demographic_setting'] )

        result_hash
      end

      def taobao_simba_rpt_adgroupbase_get(params)
        params['method'] = 'taobao.simba.rpt.adgroupbase.get'
        required_check_result = ["adgroup_id", "campaign_id", "end_time", "search_type", "source", "start_time", "subway_token"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_rpt_adgroupcreativebase_get(params)
        params['method'] = 'taobao.simba.rpt.adgroupcreativebase.get'
        required_check_result = ["adgroup_id", "campaign_id", "end_time", "search_type", "source", "start_time", "subway_token"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_rpt_adgroupcreativeeffect_get(params)
        params['method'] = 'taobao.simba.rpt.adgroupcreativeeffect.get'
        required_check_result = ["adgroup_id", "campaign_id", "end_time", "search_type", "source", "start_time", "subway_token"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_rpt_adgroupeffect_get(params)
        params['method'] = 'taobao.simba.rpt.adgroupeffect.get'
        required_check_result = ["adgroup_id", "campaign_id", "end_time", "search_type", "source", "start_time", "subway_token"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_rpt_adgroupkeywordbase_get(params)
        params['method'] = 'taobao.simba.rpt.adgroupkeywordbase.get'
        required_check_result = ["adgroup_id", "campaign_id", "end_time", "search_type", "source", "start_time", "subway_token"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_rpt_adgroupkeywordeffect_get(params)
        params['method'] = 'taobao.simba.rpt.adgroupkeywordeffect.get'
        required_check_result = ["adgroup_id", "campaign_id", "end_time", "search_type", "source", "start_time", "subway_token"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_rpt_adgroupnonsearchbase_get(params)
        params['method'] = 'taobao.simba.rpt.adgroupnonsearchbase.get'
        required_check_result = ["end_time", "start_time", "subway_token"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_rpt_adgroupnonsearcheffect_get(params)
        params['method'] = 'taobao.simba.rpt.adgroupnonsearcheffect.get'
        required_check_result = ["end_time", "start_time", "subway_token"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_rpt_campadgroupbase_get(params)
        params['method'] = 'taobao.simba.rpt.campadgroupbase.get'
        required_check_result = ["campaign_id", "end_time", "search_type", "source", "start_time", "subway_token"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_rpt_campadgroupeffect_get(params)
        params['method'] = 'taobao.simba.rpt.campadgroupeffect.get'
        required_check_result = ["campaign_id", "end_time", "search_type", "source", "start_time", "subway_token"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_rpt_campaignbase_get(params)
        params['method'] = 'taobao.simba.rpt.campaignbase.get'
        required_check_result = ["campaign_id", "end_time", "search_type", "source", "start_time", "subway_token"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_rpt_campaigneffect_get(params)
        params['method'] = 'taobao.simba.rpt.campaigneffect.get'
        required_check_result = ["campaign_id", "end_time", "search_type", "source", "start_time", "subway_token"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_rpt_custbase_get(params)
        params['method'] = 'taobao.simba.rpt.custbase.get'
        required_check_result = ["end_time", "source", "start_time", "subway_token"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_rpt_custeffect_get(params)
        params['method'] = 'taobao.simba.rpt.custeffect.get'
        required_check_result = ["end_time", "source", "start_time", "subway_token"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_rpt_demographicbase_get(params)
        params['method'] = 'taobao.simba.rpt.demographicbase.get'
        required_check_result = ["end_time", "start_time", "subway_token"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_rpt_demographiceffect_get(params)
        params['method'] = 'taobao.simba.rpt.demographiceffect.get'
        required_check_result = ["end_time", "start_time", "subway_token"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_simba_tools_items_top_get(params)
        params['method'] = 'taobao.simba.tools.items.top.get'
        required_check_result = ["ip", "keyword"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['rankeditems'] = ( result_hash['rankeditems'].nil? ? [] : result_hash['rankeditems']['ranked_item'] )

        result_hash
      end

      def taobao_topats_simba_campkeywordbase_get(params)
        params['method'] = 'taobao.topats.simba.campkeywordbase.get'
        required_check_result = ["campaign_id", "search_type", "source", "time_slot"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_topats_simba_campkeywordeffect_get(params)
        params['method'] = 'taobao.topats.simba.campkeywordeffect.get'
        required_check_result = ["campaign_id", "search_type", "source", "time_slot"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_favorite_add(params)
        params['method'] = 'taobao.favorite.add'
        required_check_result = ["collect_type", "item_numid", "shared"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_favorite_search(params)
        params['method'] = 'taobao.favorite.search'
        required_check_result = ["collect_type", "page_no"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['collect_items'] = ( result_hash['collect_items'].nil? ? [] : result_hash['collect_items']['collect_item'] )

        result_hash
      end

      def taobao_jipiao_policy_get(params)
        params['method'] = 'taobao.jipiao.policy.get'
        required_check_result = ["policy_id", "type"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_jipiao_policy_process(params)
        params['method'] = 'taobao.jipiao.policy.process'
        required_check_result = ["airline", "arr_airports", "cabin_rules", "day_of_weeks", "dep_airports", "policy_type", "sale_end_date", "sale_start_date", "travel_end_date", "travel_start_date", "type"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_jipiao_policystatus_update(params)
        params['method'] = 'taobao.jipiao.policystatus.update'
        required_check_result = ["policy_id", "status", "type"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_trip_jipiao_agent_itinerary_send(params)
        params['method'] = 'taobao.trip.jipiao.agent.itinerary.send'
        required_check_result = ["company_code", "express_code", "itinerary_id", "itinerary_no", "send_date"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_trip_jipiao_agent_order_confirm(params)
        params['method'] = 'taobao.trip.jipiao.agent.order.confirm'
        required_check_result = ["order_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_trip_jipiao_agent_order_fail(params)
        params['method'] = 'taobao.trip.jipiao.agent.order.fail'
        required_check_result = ["fail_type", "order_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_trip_jipiao_agent_order_find(params)
        params['method'] = 'taobao.trip.jipiao.agent.order.find'
        required_check_result = ["policy_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_trip_jipiao_agent_order_get(params)
        params['method'] = 'taobao.trip.jipiao.agent.order.get'
        required_check_result = ["order_ids"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['orders'] = ( result_hash['orders'].nil? ? [] : result_hash['orders']['at_order'] )

        result_hash
      end

      def taobao_trip_jipiao_agent_order_hk(params)
        params['method'] = 'taobao.trip.jipiao.agent.order.hk'
        required_check_result = ["order_id", "pnr_info"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_trip_jipiao_agent_order_search(params)
        params['method'] = 'taobao.trip.jipiao.agent.order.search'

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_trip_jipiao_agent_order_special_confirm(params)
        params['method'] = 'taobao.trip.jipiao.agent.order.special.confirm'
        required_check_result = ["can_pay", "order_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_trip_jipiao_agent_order_success(params)
        params['method'] = 'taobao.trip.jipiao.agent.order.success'
        required_check_result = ["order_id", "success_info"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_marketing_promotion_kfc(params)
        params['method'] = 'taobao.marketing.promotion.kfc'
        required_check_result = ["promotion_desc", "promotion_title"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_marketing_promotions_get(params)
        params['method'] = 'taobao.marketing.promotions.get'
        required_check_result = ["fields", "num_iid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['promotions'] = ( result_hash['promotions'].nil? ? [] : result_hash['promotions']['promotion'] )

        result_hash
      end

      def taobao_marketing_tags_get(params)
        params['method'] = 'taobao.marketing.tags.get'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['user_tags'] = ( result_hash['user_tags'].nil? ? [] : result_hash['user_tags']['user_tag'] )

        result_hash
      end

      def taobao_promotion_activity_get(params)
        params['method'] = 'taobao.promotion.activity.get'

        result_hash = Client.execute(params)
        result_hash['activitys'] = ( result_hash['activitys'].nil? ? [] : result_hash['activitys']['activity'] )

        result_hash
      end

      def taobao_promotion_coupondetail_get(params)
        params['method'] = 'taobao.promotion.coupondetail.get'
        required_check_result = ["coupon_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['coupon_details'] = ( result_hash['coupon_details'].nil? ? [] : result_hash['coupon_details']['coupon_detail'] )

        result_hash
      end

      def taobao_promotion_coupons_get(params)
        params['method'] = 'taobao.promotion.coupons.get'

        result_hash = Client.execute(params)
        result_hash['coupons'] = ( result_hash['coupons'].nil? ? [] : result_hash['coupons']['coupon'] )

        result_hash
      end

      def taobao_promotion_limitdiscount_detail_get(params)
        params['method'] = 'taobao.promotion.limitdiscount.detail.get'
        required_check_result = ["limit_discount_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['item_discount_detail_list'] = ( result_hash['item_discount_detail_list'].nil? ? [] : result_hash['item_discount_detail_list']['limit_discount_detail'] )

        result_hash
      end

      def taobao_promotion_limitdiscount_get(params)
        params['method'] = 'taobao.promotion.limitdiscount.get'

        result_hash = Client.execute(params)
        result_hash['limit_discount_list'] = ( result_hash['limit_discount_list'].nil? ? [] : result_hash['limit_discount_list']['limit_discount'] )

        result_hash
      end

      def taobao_promotion_meal_get(params)
        params['method'] = 'taobao.promotion.meal.get'

        result_hash = Client.execute(params)
        result_hash['meal_list'] = ( result_hash['meal_list'].nil? ? [] : result_hash['meal_list']['meal'] )

        result_hash
      end

      def taobao_ump_activities_get(params)
        params['method'] = 'taobao.ump.activities.get'
        required_check_result = ["page_no", "page_size", "tool_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['contents'] = ( result_hash['contents'].nil? ? [] : result_hash['contents'].values.flatten(1)  )

        result_hash
      end

      def taobao_ump_activities_list_get(params)
        params['method'] = 'taobao.ump.activities.list.get'
        required_check_result = ["ids"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['activities'] = ( result_hash['activities'].nil? ? [] : result_hash['activities'].values.flatten(1)  )

        result_hash
      end

      def taobao_ump_activity_add(params)
        params['method'] = 'taobao.ump.activity.add'
        required_check_result = ["content", "tool_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_ump_activity_delete(params)
        params['method'] = 'taobao.ump.activity.delete'
        required_check_result = ["act_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_ump_activity_get(params)
        params['method'] = 'taobao.ump.activity.get'
        required_check_result = ["act_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_ump_activity_update(params)
        params['method'] = 'taobao.ump.activity.update'
        required_check_result = ["act_id", "content"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_ump_detail_add(params)
        params['method'] = 'taobao.ump.detail.add'
        required_check_result = ["act_id", "content"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_ump_detail_delete(params)
        params['method'] = 'taobao.ump.detail.delete'
        required_check_result = ["detail_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_ump_detail_get(params)
        params['method'] = 'taobao.ump.detail.get'
        required_check_result = ["detail_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_ump_detail_list_add(params)
        params['method'] = 'taobao.ump.detail.list.add'
        required_check_result = ["act_id", "details"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['detail_id_list'] = ( result_hash['detail_id_list'].nil? ? [] : result_hash['detail_id_list'].values.flatten(1)  )

        result_hash
      end

      def taobao_ump_detail_update(params)
        params['method'] = 'taobao.ump.detail.update'
        required_check_result = ["content", "detail_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_ump_details_get(params)
        params['method'] = 'taobao.ump.details.get'
        required_check_result = ["act_id", "page_no", "page_size"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['contents'] = ( result_hash['contents'].nil? ? [] : result_hash['contents'].values.flatten(1)  )

        result_hash
      end

      def taobao_ump_mbb_getbycode(params)
        params['method'] = 'taobao.ump.mbb.getbycode'
        required_check_result = ["code"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_ump_mbb_getbyid(params)
        params['method'] = 'taobao.ump.mbb.getbyid'
        required_check_result = ["id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_ump_mbbs_get(params)
        params['method'] = 'taobao.ump.mbbs.get'

        result_hash = Client.execute(params)
        result_hash['mbbs'] = ( result_hash['mbbs'].nil? ? [] : result_hash['mbbs'].values.flatten(1)  )

        result_hash
      end

      def taobao_ump_mbbs_list_get(params)
        params['method'] = 'taobao.ump.mbbs.list.get'
        required_check_result = ["ids"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['mbbs'] = ( result_hash['mbbs'].nil? ? [] : result_hash['mbbs'].values.flatten(1)  )

        result_hash
      end

      def taobao_ump_range_add(params)
        params['method'] = 'taobao.ump.range.add'
        required_check_result = ["act_id", "ids", "type"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_ump_range_delete(params)
        params['method'] = 'taobao.ump.range.delete'
        required_check_result = ["act_id", "ids", "type"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_ump_range_get(params)
        params['method'] = 'taobao.ump.range.get'
        required_check_result = ["act_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['ranges'] = ( result_hash['ranges'].nil? ? [] : result_hash['ranges']['range'] )

        result_hash
      end

      def taobao_ump_tool_add(params)
        params['method'] = 'taobao.ump.tool.add'
        required_check_result = ["content"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_ump_tool_delete(params)
        params['method'] = 'taobao.ump.tool.delete'
        required_check_result = ["tool_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_ump_tool_get(params)
        params['method'] = 'taobao.ump.tool.get'
        required_check_result = ["tool_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_ump_tool_update(params)
        params['method'] = 'taobao.ump.tool.update'
        required_check_result = ["content", "tool_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_ump_tools_get(params)
        params['method'] = 'taobao.ump.tools.get'

        result_hash = Client.execute(params)
        result_hash['tools'] = ( result_hash['tools'].nil? ? [] : result_hash['tools'].values.flatten(1)  )

        result_hash
      end

      def taobao_udp_item_get(params)
        params['method'] = 'taobao.udp.item.get'
        required_check_result = ["begin_time", "end_time", "fields", "itemid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_udp_juhuasuan_get(params)
        params['method'] = 'taobao.udp.juhuasuan.get'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_udp_shop_get(params)
        params['method'] = 'taobao.udp.shop.get'
        required_check_result = ["area", "begin_time", "end_time", "fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_hotel_add(params)
        params['method'] = 'taobao.hotel.add'
        required_check_result = ["address", "city", "country", "desc", "domestic", "level", "name", "orientation", "pic", "province"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_hotel_city_get(params)
        params['method'] = 'taobao.hotel.city.get'
        required_check_result = ["country"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_hotel_get(params)
        params['method'] = 'taobao.hotel.get'
        required_check_result = ["hid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_hotel_image_upload(params)
        params['method'] = 'taobao.hotel.image.upload'
        required_check_result = ["hid", "pic"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_hotel_name_get(params)
        params['method'] = 'taobao.hotel.name.get'
        required_check_result = ["domestic", "name"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_hotel_order_booking_feedback(params)
        params['method'] = 'taobao.hotel.order.booking.feedback'
        required_check_result = ["message_id", "out_oid", "result", "session_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_hotel_order_face_check(params)
        params['method'] = 'taobao.hotel.order.face.check'
        required_check_result = ["checked", "oid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_hotel_order_face_deal(params)
        params['method'] = 'taobao.hotel.order.face.deal'
        required_check_result = ["oid", "oper_type"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_hotel_order_get(params)
        params['method'] = 'taobao.hotel.order.get'
        special_params = ["oid", "tid"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_hotel_order_pay_feedback(params)
        params['method'] = 'taobao.hotel.order.pay.feedback'
        required_check_result = ["message_id", "out_oid", "result", "session_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_hotel_order_refund_feedback(params)
        params['method'] = 'taobao.hotel.order.refund.feedback'
        required_check_result = ["message_id", "out_oid", "result", "session_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_hotel_orders_search(params)
        params['method'] = 'taobao.hotel.orders.search'

        result_hash = Client.execute(params)
        result_hash['hotel_orders'] = ( result_hash['hotel_orders'].nil? ? [] : result_hash['hotel_orders']['hotel_order'] )

        result_hash
      end

      def taobao_hotel_room_add(params)
        params['method'] = 'taobao.hotel.room.add'
        required_check_result = ["bed_type", "breakfast", "desc", "guide", "hid", "payment_type", "rid", "title"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_hotel_room_get(params)
        params['method'] = 'taobao.hotel.room.get'
        special_params = ["gid", "item_id"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_hotel_room_img_delete(params)
        params['method'] = 'taobao.hotel.room.img.delete'
        required_check_result = ["gid", "position"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_hotel_room_img_upload(params)
        params['method'] = 'taobao.hotel.room.img.upload'
        required_check_result = ["gid", "pic"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_hotel_room_quotas_query_feedback(params)
        params['method'] = 'taobao.hotel.room.quotas.query.feedback'
        required_check_result = ["avaliable_room_count", "checkin_date", "checkout_date", "message_id", "result", "total_room_price"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_hotel_room_update(params)
        params['method'] = 'taobao.hotel.room.update'
        required_check_result = ["gid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_hotel_rooms_search(params)
        params['method'] = 'taobao.hotel.rooms.search'
        special_params = ["gids", "hids", "item_ids", "rids"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)
        result_hash['rooms'] = ( result_hash['rooms'].nil? ? [] : result_hash['rooms']['room'] )

        result_hash
      end

      def taobao_hotel_rooms_update(params)
        params['method'] = 'taobao.hotel.rooms.update'

        result_hash = Client.execute(params)
        result_hash['gids'] = ( result_hash['gids'].nil? ? [] : result_hash['gids'].values.flatten(1)  )

        result_hash
      end

      def taobao_hotel_sold_hotels_increment_get(params)
        params['method'] = 'taobao.hotel.sold.hotels.increment.get'
        required_check_result = ["start_modified"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['hotels'] = ( result_hash['hotels'].nil? ? [] : result_hash['hotels']['hotel'] )

        result_hash
      end

      def taobao_hotel_sold_orders_increment_get(params)
        params['method'] = 'taobao.hotel.sold.orders.increment.get'
        required_check_result = ["end_modified", "start_modified"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['hotel_orders'] = ( result_hash['hotel_orders'].nil? ? [] : result_hash['hotel_orders']['hotel_order'] )

        result_hash
      end

      def taobao_hotel_sold_types_increment_get(params)
        params['method'] = 'taobao.hotel.sold.types.increment.get'
        required_check_result = ["start_modified"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['room_types'] = ( result_hash['room_types'].nil? ? [] : result_hash['room_types']['room_type'] )

        result_hash
      end

      def taobao_hotel_type_add(params)
        params['method'] = 'taobao.hotel.type.add'
        required_check_result = ["hid", "name"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_hotel_type_name_get(params)
        params['method'] = 'taobao.hotel.type.name.get'
        required_check_result = ["hid", "name"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_hotel_update(params)
        params['method'] = 'taobao.hotel.update'
        required_check_result = ["hid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_hotels_search(params)
        params['method'] = 'taobao.hotels.search'
        required_check_result = ["domestic"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['hotels'] = ( result_hash['hotels'].nil? ? [] : result_hash['hotels']['hotel'] )

        result_hash
      end

      def taobao_picture_category_add(params)
        params['method'] = 'taobao.picture.category.add'
        required_check_result = ["picture_category_name"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_picture_category_get(params)
        params['method'] = 'taobao.picture.category.get'

        result_hash = Client.execute(params)
        result_hash['picture_categories'] = ( result_hash['picture_categories'].nil? ? [] : result_hash['picture_categories']['picture_category'] )

        result_hash
      end

      def taobao_picture_category_update(params)
        params['method'] = 'taobao.picture.category.update'
        required_check_result = ["category_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_picture_delete(params)
        params['method'] = 'taobao.picture.delete'
        required_check_result = ["picture_ids"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_picture_get(params)
        params['method'] = 'taobao.picture.get'

        result_hash = Client.execute(params)
        result_hash['pictures'] = ( result_hash['pictures'].nil? ? [] : result_hash['pictures']['picture'] )

        result_hash
      end

      def taobao_picture_isreferenced_get(params)
        params['method'] = 'taobao.picture.isreferenced.get'
        required_check_result = ["picture_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_picture_referenced_get(params)
        params['method'] = 'taobao.picture.referenced.get'
        required_check_result = ["picture_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['references'] = ( result_hash['references'].nil? ? [] : result_hash['references']['reference_detail'] )

        result_hash
      end

      def taobao_picture_replace(params)
        params['method'] = 'taobao.picture.replace'
        required_check_result = ["image_data", "picture_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_picture_update(params)
        params['method'] = 'taobao.picture.update'
        required_check_result = ["new_name", "picture_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_picture_upload(params)
        params['method'] = 'taobao.picture.upload'
        required_check_result = ["image_input_title", "img", "picture_category_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_picture_userinfo_get(params)
        params['method'] = 'taobao.picture.userinfo.get'

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_sellercenter_role_add(params)
        params['method'] = 'taobao.sellercenter.role.add'
        required_check_result = ["name", "nick"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_sellercenter_role_info_get(params)
        params['method'] = 'taobao.sellercenter.role.info.get'
        required_check_result = ["role_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_sellercenter_rolemembers_get(params)
        params['method'] = 'taobao.sellercenter.rolemembers.get'
        required_check_result = ["role_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['subusers'] = ( result_hash['subusers'].nil? ? [] : result_hash['subusers']['sub_user_info'] )

        result_hash
      end

      def taobao_sellercenter_roles_get(params)
        params['method'] = 'taobao.sellercenter.roles.get'
        required_check_result = ["nick"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['roles'] = ( result_hash['roles'].nil? ? [] : result_hash['roles']['role'] )

        result_hash
      end

      def taobao_sellercenter_subuser_permissions_roles_get(params)
        params['method'] = 'taobao.sellercenter.subuser.permissions.roles.get'
        required_check_result = ["nick"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_sellercenter_subusers_get(params)
        params['method'] = 'taobao.sellercenter.subusers.get'
        required_check_result = ["nick"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['subusers'] = ( result_hash['subusers'].nil? ? [] : result_hash['subusers']['sub_user_info'] )

        result_hash
      end

      def taobao_sellercenter_user_permissions_get(params)
        params['method'] = 'taobao.sellercenter.user.permissions.get'
        required_check_result = ["nick"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['permissions'] = ( result_hash['permissions'].nil? ? [] : result_hash['permissions']['permission'] )

        result_hash
      end

      def taobao_vas_order_search(params)
        params['method'] = 'taobao.vas.order.search'
        required_check_result = ["article_code"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['article_biz_orders'] = ( result_hash['article_biz_orders'].nil? ? [] : result_hash['article_biz_orders']['article_biz_order'] )

        result_hash
      end

      def taobao_vas_subsc_search(params)
        params['method'] = 'taobao.vas.subsc.search'
        required_check_result = ["article_code"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['article_subs'] = ( result_hash['article_subs'].nil? ? [] : result_hash['article_subs']['article_sub'] )

        result_hash
      end

      def taobao_vas_subscribe_get(params)
        params['method'] = 'taobao.vas.subscribe.get'
        required_check_result = ["article_code", "nick"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['article_user_subscribes'] = ( result_hash['article_user_subscribes'].nil? ? [] : result_hash['article_user_subscribes']['article_user_subscribe'] )

        result_hash
      end

      def taobao_refund_get(params)
        params['method'] = 'taobao.refund.get'
        required_check_result = ["fields", "refund_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_refund_message_add(params)
        params['method'] = 'taobao.refund.message.add'
        required_check_result = ["content", "refund_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_refund_messages_get(params)
        params['method'] = 'taobao.refund.messages.get'
        required_check_result = ["fields", "refund_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['refund_messages'] = ( result_hash['refund_messages'].nil? ? [] : result_hash['refund_messages']['refund_message'] )

        result_hash
      end

      def taobao_refund_refuse(params)
        params['method'] = 'taobao.refund.refuse'
        required_check_result = ["oid", "refund_id", "refuse_message", "tid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_refunds_apply_get(params)
        params['method'] = 'taobao.refunds.apply.get'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['refunds'] = ( result_hash['refunds'].nil? ? [] : result_hash['refunds']['refund'] )

        result_hash
      end

      def taobao_refunds_receive_get(params)
        params['method'] = 'taobao.refunds.receive.get'
        required_check_result = ["fields"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['refunds'] = ( result_hash['refunds'].nil? ? [] : result_hash['refunds']['refund'] )

        result_hash
      end

      def taobao_categoryrecommend_items_get(params)
        params['method'] = 'taobao.categoryrecommend.items.get'
        required_check_result = ["category_id", "count", "recommend_type"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['favorite_items'] = ( result_hash['favorite_items'].nil? ? [] : result_hash['favorite_items']['favorite_item'] )

        result_hash
      end

      def taobao_itemrecommend_items_get(params)
        params['method'] = 'taobao.itemrecommend.items.get'
        required_check_result = ["count", "item_id", "recommend_type"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['values'] = ( result_hash['values'].nil? ? [] : result_hash['values']['favorite_item'] )

        result_hash
      end

      def taobao_shoprecommend_items_get(params)
        params['method'] = 'taobao.shoprecommend.items.get'
        required_check_result = ["count", "recommend_type", "seller_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['favorite_items'] = ( result_hash['favorite_items'].nil? ? [] : result_hash['favorite_items']['favorite_item'] )

        result_hash
      end

      def taobao_shoprecommend_shops_get(params)
        params['method'] = 'taobao.shoprecommend.shops.get'
        required_check_result = ["count", "recommend_type", "seller_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['favorite_shops'] = ( result_hash['favorite_shops'].nil? ? [] : result_hash['favorite_shops']['favorite_shop'] )

        result_hash
      end

      def taobao_userrecommend_items_get(params)
        params['method'] = 'taobao.userrecommend.items.get'
        required_check_result = ["count", "recommend_type"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['favorite_items'] = ( result_hash['favorite_items'].nil? ? [] : result_hash['favorite_items']['favorite_item'] )

        result_hash
      end

      def taobao_widget_appapirule_check(params)
        params['method'] = 'taobao.widget.appapirule.check'
        required_check_result = ["api_name"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_widget_cartpanel_get(params)
        params['method'] = 'taobao.widget.cartpanel.get'

        result_hash = Client.execute(params)
        result_hash['cart_info'] = ( result_hash['cart_info'].nil? ? [] : result_hash['cart_info']['widget_cart_info'] )

        result_hash
      end

      def taobao_widget_itempanel_get(params)
        params['method'] = 'taobao.widget.itempanel.get'
        required_check_result = ["item_id"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_widget_loginstatus_get(params)
        params['method'] = 'taobao.widget.loginstatus.get'

        result_hash = Client.execute(params)

        result_hash
      end

      def alipay_ebpp_bill_add(params)
        params['method'] = 'alipay.ebpp.bill.add'
        required_check_result = ["bill_key", "charge_inst", "merchant_order_no", "mobile", "order_type", "pay_amount", "sub_order_type"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def alipay_ebpp_bill_get(params)
        params['method'] = 'alipay.ebpp.bill.get'
        required_check_result = ["merchant_order_no", "order_type"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def alipay_ebpp_bill_pay(params)
        params['method'] = 'alipay.ebpp.bill.pay'
        required_check_result = ["alipay_order_no", "merchant_order_no", "order_type"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def alipay_ebpp_bill_payurl_get(params)
        params['method'] = 'alipay.ebpp.bill.payurl.get'
        required_check_result = ["alipay_order_no", "merchant_order_no", "order_type"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def alipay_system_oauth_token(params)
        params['method'] = 'alipay.system.oauth.token'
        required_check_result = ["grant_type"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def alipay_topats_user_accountreport_get(params)
        params['method'] = 'alipay.topats.user.accountreport.get'
        required_check_result = ["end_time", "fields", "start_time"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def alipay_user_account_freeze_get(params)
        params['method'] = 'alipay.user.account.freeze.get'

        result_hash = Client.execute(params)
        result_hash['freeze_items'] = ( result_hash['freeze_items'].nil? ? [] : result_hash['freeze_items']['account_freeze'] )

        result_hash
      end

      def alipay_user_account_get(params)
        params['method'] = 'alipay.user.account.get'

        result_hash = Client.execute(params)

        result_hash
      end

      def alipay_user_contract_get(params)
        params['method'] = 'alipay.user.contract.get'

        result_hash = Client.execute(params)

        result_hash
      end

      def alipay_user_get(params)
        params['method'] = 'alipay.user.get'
        special_params = ["auth_token"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)

        result_hash
      end

      def alipay_user_trade_search(params)
        params['method'] = 'alipay.user.trade.search'
        required_check_result = ["end_time", "page_no", "page_size", "start_time"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['trade_records'] = ( result_hash['trade_records'].nil? ? [] : result_hash['trade_records']['trade_record'] )

        result_hash
      end

      def taobao_spmeffect_get(params)
        params['method'] = 'taobao.spmeffect.get'
        required_check_result = ["date"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def tmall_items_discount_search(params)
        params['method'] = 'tmall.items.discount.search'
        special_params = ["cat", "q"]
        special_check_result = special_params - params.keys.map(&:to_s)
        raise "#{special_params.inspect} 为应用级特殊参数,具体请查看此API文档" if special_params.size == special_check_result.size

        result_hash = Client.execute(params)
        result_hash['brand_list'] = ( result_hash['brand_list'].nil? ? [] : result_hash['brand_list']['tmall_brand'] )
        result_hash['cat_list'] = ( result_hash['cat_list'].nil? ? [] : result_hash['cat_list']['tmall_cat'] )
        result_hash['item_list'] = ( result_hash['item_list'].nil? ? [] : result_hash['item_list']['tmall_search_item'] )
        result_hash['minisite_list'] = ( result_hash['minisite_list'].nil? ? [] : result_hash['minisite_list']['tmall_minisite'] )

        result_hash
      end

      def tmall_selected_items_search(params)
        params['method'] = 'tmall.selected.items.search'
        required_check_result = ["cid"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['item_list'] = ( result_hash['item_list'].nil? ? [] : result_hash['item_list']['selected_item'] )

        result_hash
      end

      def tmall_temai_items_search(params)
        params['method'] = 'tmall.temai.items.search'
        required_check_result = ["cat"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['item_list'] = ( result_hash['item_list'].nil? ? [] : result_hash['item_list']['tmall_search_tm_item'] )

        result_hash
      end

      def tmall_temai_subcats_search(params)
        params['method'] = 'tmall.temai.subcats.search'
        required_check_result = ["cat"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['cat_list'] = ( result_hash['cat_list'].nil? ? [] : result_hash['cat_list']['tmall_tm_cat'] )

        result_hash
      end

      def taobao_rds_db_create(params)
        params['method'] = 'taobao.rds.db.create'
        required_check_result = ["db_name", "instance_name"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_rds_db_delete(params)
        params['method'] = 'taobao.rds.db.delete'
        required_check_result = ["db_id", "instance_name"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_rds_db_get(params)
        params['method'] = 'taobao.rds.db.get'
        required_check_result = ["instance_name"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['rds_db_infos'] = ( result_hash['rds_db_infos'].nil? ? [] : result_hash['rds_db_infos']['rds_db_info'] )

        result_hash
      end

      def taobao_caipiao_lottery_send(params)
        params['method'] = 'taobao.caipiao.lottery.send'
        required_check_result = ["buyer_num_id", "seller_num_id", "stake_count"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_caipiao_lottery_sendbynick(params)
        params['method'] = 'taobao.caipiao.lottery.sendbynick'
        required_check_result = ["buyer_nick", "stake_count"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)

        result_hash
      end

      def taobao_caipiao_lotterytypes_get(params)
        params['method'] = 'taobao.caipiao.lotterytypes.get'

        result_hash = Client.execute(params)
        result_hash['results'] = ( result_hash['results'].nil? ? [] : result_hash['results']['lottery_type'] )

        result_hash
      end

      def taobao_caipiao_present_items_get(params)
        params['method'] = 'taobao.caipiao.present.items.get'
        required_check_result = ["end_date", "page_no", "page_size", "start_date"] - params.keys.map(&:to_s)
        raise "#{required_check_result.inspect} 为应用级必填参数,不能为空" unless required_check_result.empty?

        result_hash = Client.execute(params)
        result_hash['results'] = ( result_hash['results'].nil? ? [] : result_hash['results']['lottery_wangcai_present'] )

        result_hash
      end

      def taobao_caipiao_present_stat_get(params)
        params['method'] = 'taobao.caipiao.present.stat.get'

        result_hash = Client.execute(params)
        result_hash['results'] = ( result_hash['results'].nil? ? [] : result_hash['results']['lottery_wangcai_present_stat'] )

        result_hash
      end

      def taobao_caipiao_present_win_items_get(params)
        params['method'] = 'taobao.caipiao.present.win.items.get'

        result_hash = Client.execute(params)
        result_hash['results'] = ( result_hash['results'].nil? ? [] : result_hash['results']['lottery_wangcai_present'] )

        result_hash
      end

      def taobao_caipiao_signstatus_check(params)
        params['method'] = 'taobao.caipiao.signstatus.check'

        result_hash = Client.execute(params)

        result_hash
      end


    end
  end
end
