$(function() {
	includeLayout($("body").find($("[data-include]")));
});

function includeLayout($body) {
	let self, url;
	let subArea = [];
	$.each($body, function() {
		self = $(this);
		url = self.data("include");
		self.load(url, function() {
			self.removeAttr("data-include");
			includeLayout($(this).find("[data-include]"));
		});
	});
}