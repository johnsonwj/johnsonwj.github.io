var path = require('path');
var webpack = require('webpack');
var _ = require('lodash');

var baseConfig = require('./base');

var config = _.merge({
	entry: path.join(__dirname, '../src/components/Main'),
	cache: false,
	devtool: 'sourcemap',
	plugins: [
		new webpack.optimize.UglifyJsPlugin(),
		new webpack.optimize.AggressiveMergingPlugin(),
		new webpack.NoEmitOnErrorsPlugin()
	]
}, baseConfig);

config.module.rules.push({
	test: /\.(js|jsx)$/,
	loader: 'babel-loader?presets[]=es2015,presets[]=react',
	include: path.join(__dirname, '/../src')
});

module.exports = config;
