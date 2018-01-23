
/* Observer */
(function(global){
  function Observer(){
		this.fns = [];
	}

	Observer.prototype = {
		constructor: Observer,
		subscribe: function(fn){
			if(typeof fn === 'function'){
				this.fns.push(fn);
			}

			return this;
		},
		unsubscribe: function(fn){
			var fns = this.fns;
			
			if(arguments.length === 0){
				this.fns = []
			}
			
			if(typeof fn !== 'function'){
				return;
			}

			
			for(var i = 0, len = fns.length; i < len; i++){
				if(fns[i] === fn){
					fns.splice(i, 1);
					i--;
					len--;
				}
			}

			return this;
		},
		fire: function(){
			var fns = this.fns;
			for(var i = 0, len = fns.length; i < len; i++){
				fns[i].apply(null, arguments);
			}

			return this;
		}
	}


	global.PA || (global.PA = {});
	global.PA.ui || (global.PA.ui = {});
	global.PA.ui.Observer = Observer;

}(this));

/* throttle */
(function(global){
	function throttle(func, time, context){
		clearTimeout(func.timeId);
		func.timeId = setTimeout(function(){
			func.call(context || window);
		}, time || 25);
	}
	
	global.PA || (global.PA = {});
	global.PA.ui || (global.PA.ui = {});
	global.PA.ui.throttle = throttle;
}(this));




(function(global){
	
	var isIE6 = navigator.appVersion.toLowerCase().indexOf('msie 6') > -1;
	
	function lightbox(option){
		var defaultOption = {
			isFixed: false,
			clickMask: false,
			targetClass: null,
			maskClass: null
		}
		this.option = $.extend({}, defaultOption, option);
		
		this.$dom = this.option.target;
		this.$mask = $('<div></div>');
		
		this.shown = new PA.ui.Observer();
		this.hiden = new PA.ui.Observer();
		this.disposed = new PA.ui.Observer();
		
		this.attachEvent();
	}
	
	lightbox.prototype = {
		constructor: lightbox,
		getDom: function(){
			return this.$dom;
		},
		attachEvent: function(){
			var me = this,
				$dom = me.$dom,
				option = me.option,
				$mask = me.$mask;
				
			$dom.find('*').each(function(){
				var $this = $(this);
				if($this.attr('data-pa-lightbox') === 'close'){
					$this.bind('click', function(){
						me.hide();
					});
				}
			});
			
			if(option.clickMask){
				$mask.bind('click', function(){
					me.hide();
				});
			}
		},
		show: function(callback){
			var $body = $('body'),
				me = this,
				$dom = me.$dom,
				$mask = me.$mask,
				option = me.option,
				$window = $(window),
				$document = $(document),
				scrollFun, resizeFun;
			
			$mask.hide()
				.css({
					left: 0,
					top: 0,
					opacity: '0.5',
					width: '100%',
					height: '100%',
					backgroundColor: '#000',
					zIndex: 998
				})
				.addClass(option.maskClass)
				.appendTo($body);

			$dom.hide()
				.css({
					left: '50%',
					top: '50%',
					zIndex: 999
				})
				.addClass(option.targetClass)
				.appendTo($body);
			
			resizeFun = function(){
				var wHeight = $window.height();
				var wScrollTop = $window.scrollTop();
				$mask.css({
					position: 'absolute',
					height: wHeight,
					marginTop: wScrollTop
				});
			}
			
			if(isIE6){
				resizeFun();
				$window.bind('resize', function(){
							PA.ui.throttle(resizeFun);
						});
			}else{
				$mask.css({
					position: 'fixed'
				});
			}
			
			if(option.isFixed){
				if(isIE6){
					this.$dom.css({
							position: 'absolute'
						})
						.show()
						.css({
							marginTop: $window.scrollTop() - $dom.height()/2,
							marginLeft: $window.scrollLeft() - $dom.width()/2
						})
						.hide();
					
					scrollFun = function(){
						var wHeight = $window.height();
						var dHeight = $dom.height();
						var wScrollTop = $window.scrollTop();
						$mask.css({
							marginTop: wScrollTop
						});
						
						/* scroll to the bottom */
						if((dHeight > wHeight) && (wHeight + wScrollTop + dHeight - wHeight >= $document.height())){
							return;
						}
						
						$dom.css({
							marginTop: wScrollTop - dHeight/2
						});
					}

					$window.bind('scroll', function (){
							PA.ui.throttle(scrollFun);
						})
						.bind('resize', function(){
							PA.ui.throttle(scrollFun);
						});
				}else{
					$dom.css({
							position: 'fixed'
						})
						.show()
						.css({
							marginTop: -$dom.height()/2,
							marginLeft: -$dom.width()/2
						})
						.hide();
				}
			}else{
				$dom.css({
						position: 'absolute'
					})
					.show()
					.css({
						marginTop: $window.scrollTop() - $dom.height()/2,
						marginLeft: $window.scrollLeft() - $dom.width()/2
					})
					.hide();
			}
			
			$dom.fadeIn(100, function(){
				me.$mask.fadeIn(60, function(){
					me.shown.fire();
					if(typeof callback === 'function'){
						callback();
					}
				})
			});
		},
		hide: function(callback){
			var me = this;
			this.$mask.hide();
			this.$dom.fadeOut('normal', function(){
				me.hiden.fire();
				if(typeof callback === 'function'){
					callback();
				}
			});
		},
		dispose: function(callback){
			this.$mask.remove();
			this.$dom.remove();
			this.disposed.fire();
			if(typeof callback === 'function'){
				callback();
			}
		},
		subscribe: function(target, callback){
			if(typeof callback === 'function'){
				target.subscribe(callback);
			}
		},
		onShown: function(callback){
			this.subscribe(this.shown, callback);
		},
		onHidden: function(callback){
			this.subscribe(this.hiden, callback);
		},
		onDisposed: function(callback){
			this.subscribe(this.disposed, callback);
		}
	}
	
	global.PA || (global.PA = {});
	global.PA.ui || (global.PA.ui = {});
	global.PA.ui.lightbox = lightbox;
	
}(this));


$(function(){
	
	window.PA || (window.PA = {});
	
	PA.lightbox1 = (function(){
		var lightbox = new PA.ui.lightbox({
			target: $('.normal').clone(),
			isFixed: true,
			clickMask: false
		});
		
		var attachEvent = function(){
			var $dom = lightbox.getDom();
			var notice = {
				$dom: $dom.find('.lottery-notice'),
				show: function(){
					this.$dom.show();
				},
				hide: function(){
					this.$dom.hide();
				}
			}
			
			$dom.find('.lottery-btn-o').bind('click', function(e){
				e.preventDefault();
				if(true){
					notice.show();
				}
			});
		}
		
		attachEvent();

		return {
			show: function(callback){
				lightbox.show(callback);
			},
            getDom: lightbox.getDom()
		};
	})();

	PA.lightbox2 = (function(){
		var lightbox = new PA.ui.lightbox({
			target: $('div.jiaocheng').clone(),
			isFixed: true,
			clickMask: true
		});
		
		var attachEvent = function(){
			var $dom = lightbox.getDom();
			$dom.find('.lottery-btn-y').bind('click', function(e){
				e.preventDefault();
				lightbox.hide();
			});
		}
		
		attachEvent();
		
		return {
			show: function(callback){
				lightbox.show(callback);
			},
            hide:function(callback){
                lightbox.hide(callback);
            },
            getDom:function(){
                return lightbox.getDom();
            }
		};
	})();
	
	PA.lightbox3 = (function(){
		var lightbox = new PA.ui.lightbox({
			target: $('div.getintegral_login').clone(),
			isFixed: true,
			clickMask: false
		});
		
		return {
			show: function(callback){
				lightbox.show(callback);
			}
		};
	})();
	
});