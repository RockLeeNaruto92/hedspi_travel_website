FactoryGirl.define do
  factory :image do
    remote_url_url {Settings.images.samples.places.sample}
    owner_id 0

    factory :place do
      owner_type {Settings.owner_types.place}
    end
  end
end
