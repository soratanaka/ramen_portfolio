ActionMailer::Base.perform_deliveries = false

User.create(name: 'tanaka', email: 'tanakasora44@gmail.com', password: 'tanaka', password_confirmation: 'tanaka', created_at: "2019-07-11 02:33:34", updated_at: "2019-07-11 02:33:34",admin:"ture", confirmed_at: Time.now)

10.times do |n|
  User.create!(
    name: "user#{n+1}",
    email: "user#{n+1}@example.com",
    password: "password" ,
    confirmed_at: Time.now)
end
Shop.create!(
  name: "麺屋 蕃茄",
  address: "日本、〒352-0035 埼玉県新座市栗原３丁目３−３８",
  latitude: 35.7490084,
  longitude: 139.5872443,
  place_id: "ChIJP-yVdpLpGGAR2kvftm_JX4M",
  created_at: Time.now, 
  updated_at: Time.now,
  user_id: 1)
Shop.create!(
  name: "ラーメンサニー",
  address: "日本、〒178-0064 東京都練馬区南大泉３丁目３１−１９",
  latitude: 35.7519199,
  longitude: 139.5464571,
  place_id: "ChIJfVo9jCnvGGARWUHNtjcqUfw",
  created_at: Time.now, 
  updated_at: Time.now,
  user_id: 2)
Shop.create!(
  name: "保谷 大勝軒",
  address: "日本、〒178-0064 東京都練馬区南大泉３丁目３１−１９",
  latitude: 35.74745950000001,
  longitude: 139.5666336,
  place_id: "ChIJfVo9jCnvGGARWUHNtjcqUfw",
  created_at: Time.now, 
  updated_at: Time.now,
  user_id: 2)
Shop.create!(
  name: "横浜ラーメン 初代 常翔家",
  address: "日本、〒178-0064 東京都練馬区南大泉３丁目３１−１９",
  latitude: 35.7485811,
  longitude: 139.568455,
  place_id: "ChIJfVo9jCnvGGARWUHNtjcqUfw",
  created_at: Time.now, 
  updated_at: Time.now,
  user_id: 2)

3.times do |n|
  Post.create!(
  user_id: 1,
  content: "Review#{n+1}",
  shop_id: 2)
end

3.times do |n|
  Post.create!(
  user_id: 2,
  content: "Review#{n+1}",
  shop_id: 3)
end

3.times do |n|
  Post.create!(
  user_id: 3,
  content: "Review#{n+1}",
  shop_id: 4)
end

