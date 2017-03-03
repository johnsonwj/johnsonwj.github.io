var path = require('path');
var webpack = require('webpack');
var _ = require('lodash');

var baseConfig = require('./base');

var config = _.merge({
	entry: [
		'webpack-dev-server/client?http://127.0.0.1:8000',
		'webpack/hot/only-dev-server',
		'./src/components/Main'
	],
	cache: true,
	devtool: 'eval',
	plugins: [
		new webpack.HotModuleReplacementPlugin(),
		new webpack.NoEmitOnErrorsPlugin()
	]
}, baseConfig);

// Add needed loaders
config.module.rules.push({
	test: /\.(js|jsx)$/,
	loader: 'react-hot-loader!babel-loader?presets[]=es2015,presets[]=react',
	include: path.join(__dirname, '/../src')
});

module.exports = config;
