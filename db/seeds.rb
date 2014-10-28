Impression.create!([
  {impressionable_type: "Talk", impressionable_id: 1, user_id: 1, controller_name: "talks", action_name: "show", view_name: nil, request_hash: "f22bd40ea6080df66bbb0e7dc03b5b25915ea42ad6fb286b1e5d48074f16321e", ip_address: "127.0.0.1", session_hash: "f3a63c5f9bb3902b995194397c15ac7a", message: nil, referrer: "http://localhost:3000/talks/new"}
])
Profile.create!([
  {nickname: "ahmadajmi", name: "λhmad λjmi", location: "Cairo - Egypt", image: "https://pbs.twimg.com/profile_images/467036748334120960/XP2Mtdcs.jpeg", description: "Front-End Developer @Cloud9ers", website_url: "http://t.co/CNsQz6q2PM", twitter_url: "https://twitter.com/ahmadajmi", profile_background_image_url: "http://pbs.twimg.com/profile_background_images/355127442/background.jpg", profile_background_image_url_https: "https://pbs.twimg.com/profile_background_images/355127442/background.jpg", provider: "twitter", uid: "22498966", profile_banner: nil}
])
Talk.create!([
  {url: "https://www.ted.com/talks/jennifer_pahlka_coding_a_better_government", url_type: "video", version: "1.0", provider_url: "http://www.ted.com", provider_name: "TED", title: "Coding a better government", html: "<iframe class=\"embedly-embed\" src=\"//cdn.embedly.com/widgets/media.html?src=http%3A%2F%2Fembed.ted.com%2Ftalks%2Fjennifer_pahlka_coding_a_better_government.html&url=https%3A%2F%2Fwww.ted.com%2Ftalks%2Fjennifer_pahlka_coding_a_better_government&image=https%3A%2F%2Fimg-ssl.tedcdn.com%2Fr%2Fimages.ted.com%2Fimages%2Fted%2F8a3803576b960b90b3f55b6c0edab9eb8eb2f0fa_800x600.jpg%3Fc%3D1280%252C720%26ll%3D1%26quality%3D89%26w%3D1200&key=d0f5609b11f54f0e9b139bcad1c4faa1&type=text%2Fhtml&schema=ted\" width=\"640\" height=\"360\" scrolling=\"no\" frameborder=\"0\" allowfullscreen></iframe>", description: "Can government be run like the Internet, permissionless and open? Coder and activist Jennifer Pahlka believes it can - and that apps, built quickly and cheaply, are a powerful new way to connect citizens to their governments - and their neighbors.", author_name: "Jennifer Pahlka", author_url: nil, width: "640", height: "360", thumbnail_url: "https://img-ssl.tedcdn.com/r/images.ted.com/images/ted/8a3803576b960b90b3f55b6c0edab9eb8eb2f0fa_800x600.jpg?c=1280%2C720&ll=1&quality=89&w=1200", thumbnail_width: "800", thumbnail_height: "600", profile_id: 1, view_count: 1, topic_id: "1"},
  {url: "https://www.youtube.com/watch?v=62RvRQuMVyg", url_type: "video", version: "1.0", provider_url: "http://www.youtube.com/", provider_name: "YouTube", title: "Writing a Massive Angular App at Google NG Conf", html: "<iframe class=\"embedly-embed\" src=\"//cdn.embedly.com/widgets/media.html?src=http%3A%2F%2Fwww.youtube.com%2Fembed%2F62RvRQuMVyg%3Ffeature%3Doembed&url=http%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3D62RvRQuMVyg&image=http%3A%2F%2Fi.ytimg.com%2Fvi%2F62RvRQuMVyg%2Fhqdefault.jpg&key=d0f5609b11f54f0e9b139bcad1c4faa1&type=text%2Fhtml&schema=youtube\" width=\"854\" height=\"480\" scrolling=\"no\" frameborder=\"0\" allowfullscreen></iframe>", description: "www.ng-conf.org ng-conf is a two day, single track conference focused on delivering the highest quality training in the Angular JavaScript framework. 500 to 700 Developers from across the country will converge on beautiful Salt Lake City, UT to participate in training sessions by the Google Angular team, and other Angular experts.", author_name: "ng-conf 2014", author_url: "http://www.youtube.com/user/ngconfvideos", width: "854", height: "480", thumbnail_url: "http://i.ytimg.com/vi/62RvRQuMVyg/hqdefault.jpg", thumbnail_width: "480", thumbnail_height: "360", profile_id: 1, view_count: 0, topic_id: "3"},
  {url: "http://vimeo.com/102811680", url_type: "video", version: "1.0", provider_url: "https://vimeo.com/", provider_name: "Vimeo", title: "Stephanie Lynn - How to fight M.E. and the prejudice that comes with it? And win.", html: "<iframe class=\"embedly-embed\" src=\"//cdn.embedly.com/widgets/media.html?src=http%3A%2F%2Fplayer.vimeo.com%2Fvideo%2F102811680&src_secure=1&url=http%3A%2F%2Fvimeo.com%2F102811680&image=http%3A%2F%2Fi.vimeocdn.com%2Fvideo%2F485305197_1280.jpg&key=d0f5609b11f54f0e9b139bcad1c4faa1&type=text%2Fhtml&schema=vimeo\" width=\"1280\" height=\"720\" scrolling=\"no\" frameborder=\"0\" allowfullscreen></iframe>", description: "What happens when you get ill? And what happens when no-one knows why? At 15 years old Stephanie Lynn developed M.E.. This is her moving story, warts and all, of how she fought the disease and the prejudice that comes with it.", author_name: "The Do Lectures", author_url: "http://vimeo.com/thedolectures", width: "1280", height: "720", thumbnail_url: "http://i.vimeocdn.com/video/485305197_1280.jpg", thumbnail_width: "1280", thumbnail_height: "720", profile_id: 1, view_count: 0, topic_id: "5"}
])
PublicActivity::ORM::ActiveRecord::Activity.create!([
  {trackable_id: 1, trackable_type: "Talk", owner_id: 1, owner_type: "Profile", key: "talk.create", parameters: {}, recipient_id: nil, recipient_type: nil},
  {trackable_id: 2, trackable_type: "Talk", owner_id: 1, owner_type: "Profile", key: "talk.create", parameters: {}, recipient_id: nil, recipient_type: nil},
  {trackable_id: 3, trackable_type: "Talk", owner_id: 1, owner_type: "Profile", key: "talk.create", parameters: {}, recipient_id: nil, recipient_type: nil}
])
ActsAsTaggableOn::Tagging.create!([
  {tag_id: 1, taggable_id: 1, taggable_type: "Talk", tagger_id: nil, tagger_type: nil, context: "tags"},
  {tag_id: 2, taggable_id: 2, taggable_type: "Talk", tagger_id: nil, tagger_type: nil, context: "tags"},
  {tag_id: 3, taggable_id: 3, taggable_type: "Talk", tagger_id: nil, tagger_type: nil, context: "tags"}
])
ActsAsTaggableOn::Tag.create!([
  {name: "python", taggings_count: 1},
  {name: "business", taggings_count: 1},
  {name: "Angular", taggings_count: 1}
])
Topic.create!([
  {name: "Programming"},
  {name: "Programming"},
  {name: "Technology"},
  {name: "Science"},
  {name: "How-to & DIY"},
  {name: "Health"},
  {name: "Education"},
  {name: "Design"},
  {name: "Business"}
])
