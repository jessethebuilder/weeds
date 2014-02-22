module ItemsHelper
  ITEMS = [
            ["Afghan Kush", "Indica; Good for stress, pain, and insomnia. Very heady with good body buzz, high THC content."],
            ["Blackberry", "Indica; has high yields. helps with pain, insomnia, and stress."],
            ["Blue Cheese", "Hybrid; created by crossing blueberry and cheese. great psychedelic and euphoric effects. Used to help with stress, pain, and insomnia."],
            ["Blue City Diesel", "Hybrid; falls on the slightly indica side. with a moderate to long-lasting body buzz. Helps with pain, stress, and nausea."],
            ["Blue Dream", "Hybrid; is a cross of Blueberry and Haze and was bred to provide the body high of an indica and the cerebral sativa effects. Effects are long lasting. Helps with stress, pain, and depression."],
            ["Some Other Kind", "It's great"],
            ["Dirt Weed", "Full of seeds and gives you a thobbing headache"],
            ["Some Weed", "It's dope!"]
        ]

  def default_tweet(item)
    s = ""
    #s = item_url(@item)
    s += " #"
    s += STORE_NAME.gsub(' ', '')
    s += " has #"
    s += item.name.gsub(' ', '')
    s += ": "
    #s += item.description
    s[0..139]
  end

  def facebook_title(item)
    "#{STORE_NAME} | #{item.name}"
  end

  def og_tags(item)
    html = standard_og_tags
    html += content_tag(:meta, '', property: 'og:title', content: facebook_title(item))
    html += content_tag(:meta, '', property: 'og:description', content: item.description)
    html += content_tag(:meta, '', property: 'og:type', content: 'product')
    html += content_tag(:meta, '', property: 'og:url', content: request.url)
    html += content_tag(:meta, '', property: 'og:image', content: item.images.sample.full_url)
    html
    #h.append('<meta property="og:title" content="' + title + '">');
    #h.append('<meta property="og:type" content="' + type + '">');
    #h.append('<meta property="og:image" content="' + image_url + '">');
    #h.append('<meta property="og:url" content="' + url + '">');
    #h.append('<meta property="og:description" content="' + description + '">');
    #h.append('<meta property="og:site_name" content="' + site_name + '">');
  end


end
