FROM ruby:2.6.3
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn git
WORKDIR /WebMedia
COPY . /WebMedia
RUN bundle install
RUN yarn
RUN yarn add @ckeditor/ckeditor5-autoformat @ckeditor/ckeditor5-basic-styles @ckeditor/ckeditor5-block-quote @ckeditor/ckeditor5-dev-utils @ckeditor/ckeditor5-dev-webpack-plugin @ckeditor/ckeditor5-editor-classic @ckeditor/ckeditor5-essentials @ckeditor/ckeditor5-heading @ckeditor/ckeditor5-image @ckeditor/ckeditor5-link @ckeditor/ckeditor5-list @ckeditor/ckeditor5-markdown-gfm @ckeditor/ckeditor5-paragraph @ckeditor/ckeditor5-theme-lark raw-loader style-loader