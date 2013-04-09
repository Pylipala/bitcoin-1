default:
	@./node_modules/jade/bin/jade test.jade
	@./node_modules/coffee-script/bin/coffee -c bitcoin.coffee
