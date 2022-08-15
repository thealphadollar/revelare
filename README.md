# { Personal } Website Using Jekyll Theme
![license](https://img.shields.io/badge/license-MIT-blue.svg?link=https://github.com/dono-app/ios/blob/master/LICENSE)

## {Cogito, Ergo Sum}
My [personal website](https://thealphadollar.github.io/) to summarize my thoughts, projects, and progress in life at one place for me to look back at how silly I've been
and smile.

# General Instructions

## To Run Locally

1. Install Ruby - `sudo apt-get install ruby-full build-essential zlib1g-dev -y`
2. Add Ruby to PATH. Replace `~/.zshrc` with your own shell config file.
```bash
echo '# Install Ruby Gems to ~/gems' >> ~/.zshrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.zshrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```
3. Install Jekyll and Bundler - `gem install jekyll bundler`
4. Install Jekyll dependencies - `bundle install`
5. Run Jekyll - `bundle exec jekyll serve`

## To Include Youtube Video

- Add the following in the file to include video - do not remove the quotes around ID.

```
{% include youtubePlayer.html id="YOUTUBE_VIDEO_ID" start=START_SECONDS %}
```

NOTE: Uses [jekyll-embed-video](https://github.com/nathancy/jekyll-embed-video)

## To Add Caption To Image

```
![]({{ 'img/posts/facing-my-insecurities/heart-in-cage.png' | relative_url }})
*Heart Inside A Cage Surrounded By Knives | Illustration By Aditi Maurya*
```

Set using https://github.com/thealphadollar/thealphadollar.github.io/blob/master/css/imageCaption.css

## OpenSource Softwares Used

The website uses the following open source projects:

  1. [{ Personal }](https://github.com/le4ker/personal-jekyll-theme)
  2. [Grayscale](http://startbootstrap.com/template-overviews/grayscale/)
  3. [hammer.js](https://hammerjs.github.io/)
  4. [highlightjs](https://highlightjs.org/)
  5. [RRSSB](https://github.com/kni-labs/rrssb)
  6. [Timeline](https://github.com/kirbyt/timeline-jekyll-theme)
  7. [typed.js](https://github.com/mattboldt/typed.js/)
