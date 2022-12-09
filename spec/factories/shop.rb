FactoryBot.define do
  factory :shop do
    name                 {"魁花"}
    address              {"日本、〒178-0064 東京都練馬区南大泉３丁目３１−１９"}
    latitude             {"35.7484179"}
    longitude            {"139.5629282"}
    place_id             {"ChIJfVo9jCnvGGARWUHNtjcqUfw"}
  end
  factory :second_shop, class: Shop do
    name                 {"はづき sanvitalia"}
    address              {"日本、〒352-0035 埼玉県新座市栗原３丁目３−３８"}
    latitude             {"35.7603281"}
    longitude            {"139.5530323"}
    place_id             {"ChIJP-yVdpLpGGAR2kvftm_JX4M"}
  end
end