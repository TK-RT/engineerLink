// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require Chart.min
//= require activestorage
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require jquery
//= require_tree .

$(function () {
	$('#star').raty({
		size: 36,
		starOff: 'url(<%= asset_path "star-off.png" %>)',
		starOn: 'url(<%= asset_path "star-on.png" %>)',
		starHalf: 'url(<%= asset_path "star-half.png" %>)',
		half: true,
		scoreName: "evaluation[working_time]"
	});
});

$(function () {
	$('#star1').raty({
		size: 36,
		starOff: 'url<%= asset_path("star-off.png") %>',
		starOn: 'url<%= asset_path("star-on.png") %>',
		starHalf: 'url<%= asset_path("star-half.png") %>',
		half: true,
		scoreName: "evaluation[rewarding]"
	});
});

$(function () {
	$('#star2').raty({
		size: 36,
		starOff: 'url<%= asset_path("star-off.png") %>',
		starOn: 'url<%= asset_path("star-on.png") %>',
		starHalf: 'url<%= asset_path("star-half.png") %>',
		half: true,
		scoreName: "evaluation[communication]"
	});
});

$(function () {
	$('#star3').raty({
		size: 36,
		starOff: 'url<%= asset_path("star-off.png") %>',
		starOn: 'url<%= asset_path("star-on.png") %>',
		starHalf: 'url<%= asset_path("star-half.png") %>',
		half: true,
		scoreName: "evaluation[holiday]"
	});
});

$(function () {
	$('#star4').raty({
		size: 36,
		starOff: 'url<%= asset_path("star-off.png") %>',
		starOn: 'url<%= asset_path("star-on.png") %>',
		starHalf: 'url<%= asset_path("star-half.png") %>',
		half: true,
		scoreName: "evaluation[salary]"
	});
});

$(function () {
	$('#star5').raty({
		size: 36,
		starOff: 'url<%= asset_path("star-off.png") %>',
		starOn: 'url<%= asset_path("star-on.png") %>',
		starHalf: 'url<%= asset_path("star-half.png") %>',
		half: true,
		scoreName: "evaluation[growth_environment]"
	});
});
// $('.star-rate')はクチコミであるため複数個あります.
// そのため$('.star-rate')の数だけル-プ処理(forEach)を行い,ル-プ処理の中で一つ一つにratyをしてあげる
// scoreに関してはル-プ処理の中のdata属性から取得する(~.attr('data'))
