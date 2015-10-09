$(document).ready(function() {

    var $slider = $('.slider');
    var $slide = 'li';
    var $slides = $slider.find($slide);
    var fadeInTime = 1500;
    var fadeOutTime = 1500;
    var time_between_slides = 4000;

    $slides.first().addClass('active');
    $slides.first().fadeIn(fadeInTime);

    setInterval(
      function() {
        var $i = $slider.find($slide + '.active').index();

        $slides.eq($i).removeClass('active');
        $slides.eq($i).fadeOut(fadeOutTime);

        if ($slides.length == $i + 1)
          $i = -1;

        $slides.eq($i + 1).fadeIn(fadeInTime);
        $slides.eq($i + 1).addClass('active');
      }
      , time_between_slides
    );

});
