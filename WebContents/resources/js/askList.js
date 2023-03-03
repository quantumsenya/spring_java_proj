$(function() {

	$('.pagination a').click(function(e){
		e.preventDefault();
		let form = $('<form/>');
		let pageNum = $(this).attr('href');
		let pageNumInput = $('<input/>',{
			type : 'hidden',
			name : 'page',
			value : pageNum
		});
		
		form.attr('method','get')
			.attr('action',`${contextPath}/askList`)
			.append(pageNumInput)
			.appendTo('body')
			.submit();
	});

})