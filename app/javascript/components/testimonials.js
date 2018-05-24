function testimonials() {
  $(document).ready(function(){
      $("#testimonial-slider").owlCarousel({
          items:1,
          itemsDesktop:[1000,1],
          itemsDesktopSmall:[979,1],
          itemsTablet:[768,1],
          pagination:true,
          navigation:true,
          navigationText:["",""],
          slideSpeed:1000,
          autoPlay:true
      });
  });
}
export { testimonials };
