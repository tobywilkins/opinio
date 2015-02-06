ActiveAdmin.register Poll do



  index do
    column :title
    column "Image A" do |poll|
      image_tag(poll.image_a.url)
    end
    column :caption_a
    column "Image B" do |poll|
      image_tag(poll.image_b.url)
    end
    column :caption_b
    column :total_votes 
    column :created_at
    actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
