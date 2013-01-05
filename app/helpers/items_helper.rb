module ItemsHelper
  def render_cats(item)
    item.cats_by_cids.map(&:tb_name).join(',')
  end
end
