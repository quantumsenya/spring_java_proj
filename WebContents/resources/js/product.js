$(function(){
	
	let category = $('.category').val();
	let type = new URLSearchParams(location.search).get('type');
	let keyword = new URLSearchParams(location.search).get('keyword');
	
	console.log(type);
	console.log(keyword);
	
	// 페이지 이동 
	$('.pagination a').click(function(e){
		e.preventDefault();
		let form = $('<form/>');
		let pageNum = $(this).attr('href');
		let pageNumInput = $('<input/>',{
			type : 'hidden',
			name : 'page',
			value : pageNum
		});
		let typeInput = $('<input/>',{
			type : 'hidden',
			name : 'type',
			value : type
		});
		let keywordInput = $('<input/>',{
			type : 'hidden',
			name : 'keyword',
			value : keyword
		});
		
		form.attr('method','get')
			.attr('action',`${contextPath}/product/list/${category}`)
			.append(pageNumInput)
			.append(typeInput)
			.append(keywordInput)
			.appendTo('body')
			.submit();
	});
	
	// 검색 
	$('.searchForm button').click(function(){
		let category = $('.searchForm').find('.category').val();
		$('.searchForm')
			.attr('action',`${contextPath}/board/list/${category}`)
			.submit();
	})
	
})