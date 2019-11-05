const manageTab = () => {
	$("#show-all").on("click", function() {
		$(".tab-pane").addClass("active");
	});
	$(".tab-item").on("click", function() {
		$(".tab-pane").removeClass("active");
	});
}

export default manageTab;
