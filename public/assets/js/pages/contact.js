var Contact = function () {

    return {

        //Map
        initMap: function () {
			var map;
			$(document).ready(function(){
			  map = new GMaps({
				div: '#map',
				lat: 46.936078,
				lng: 28.78536
			  });
			   var marker = map.addMarker({
		            lat: 46.936078,
					lng: 28.78536,
		            title: 'NCCM GRUP'
		        });
			});
        }

    };
}();
