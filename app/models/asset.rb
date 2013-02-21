#encoding: utf-8
class Asset < ActiveRecord::Base
  attr_accessible :file

  belongs_to :coach, polymorphic: true
  belongs_to :player, polymorphic: true
  belongs_to :staff, polymorphic: true

  validates_format_of :file_file_name, :with => %r{\.(x-png|pjpeg|jpeg|jpg|png|gif)$}i, :message => "Neatļauts formāts"

  has_attached_file :file, :styles => { :thumb => "140x130#", :large => "300x400#"}, :quality => 80

  before_post_process :allow_only_images

  def allow_only_images
    if !(file.content_type =~ %r{^(image|(x-)?application)/(x-png|pjpeg|jpeg|jpg|png|gif)$}) 
      return false
    end
  end

  def is_image?
    ["image/jpeg","image/png","image/x-png","image/pjpeg","image/jpeg","image/jpg","image/gif"].include?(file_content_type)
  end

  def is_not_image?
    !is_image?
  end

  def is_first_page_image?
    first_page
  end

  def self.save_assets_for(parent_name, parent_id, asset_ids)
    if asset_ids
      asset_ids.each do |id|
        asset = Asset.find(id)
        if asset && asset.assetable_id.blank?
          asset.assetable_id = parent_id
          asset.assetable_type = parent_name
          asset.save
        end
      end
    end
  end
end
