class ProductSerializer < ActiveModel::Serializer
  attributes :expire_date, :name, :sku_id, :categories, :attachments, :price, :description

  def attachments
    self.object.attachments.map do |attach|
      { img_path: attach.img_path }
    end
  end

  def categories
    self.object.categories.map do |category|
      { name: category.name}
    end
  end
end
