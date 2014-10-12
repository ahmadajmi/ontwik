# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.ontwik.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #

  # Add Talks
  add talks_path, :priority => 1.0, :changefreq => 'daily'
  Talk.find_each do |talk|
    add talk_path(talk), :lastmod => talk.updated_at
  end

  # Add Speakers
  add speakers_path, :priority => 1.0, :changefreq => 'daily'
  Speaker.find_each do |speaker|
    add speaker_path(speaker), :lastmod => speaker.updated_at
  end

end
