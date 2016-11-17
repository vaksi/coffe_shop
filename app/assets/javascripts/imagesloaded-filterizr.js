$('.filtr-container').imagesLoaded( function() {
  $(function() {
    //Initialize filterizr with default options
    $('.filtr-container').filterizr();

    //Simple filter controls
    $('.simplefilter li').click(function() {
      $('.simplefilter li').removeClass('active');
      $(this).addClass('active');
    });
  });
  console.log('all images are loaded');
});