const { environment } = require('@rails/webpacker')

// ここから追記
const ckeditorSVG = require('./loaders/ckeditor-svg')
const ckeditorCSS = require('./loaders/ckeditor-css')
const CKEditorWebpackPlugin = require( '@ckeditor/ckeditor5-dev-webpack-plugin' )
environment.plugins.prepend('CKEditor',new CKEditorWebpackPlugin({
    language: 'ja'
  })
)
environment.loaders.append('ckeditorCSS', ckeditorCSS)
environment.loaders.append('ckeditorSVG', ckeditorSVG)

const cssLoader = environment.loaders.get('css');
cssLoader.exclude = /(\.module\.[a-z]+$)|(ckeditor5-[^/\\]+[/\\]theme[/\\].+\.css)/

const fileLoader = environment.loaders.get('file');
fileLoader.exclude = /ckeditor5-[^/\\]+[/\\]theme[/\\]icons[/\\][^/\\]+\.svg$/
// ここまで追記

module.exports = environment
