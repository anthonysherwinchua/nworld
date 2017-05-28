/* 
 * Hero Slider
 * A full-width, responsive and easy to customize slideshow. 
 * By CodyHouse (http://codyhouse.co/?p=675)
 * All resources available on CodyHouse can be used freely in both personal and commercial projects.
 */

jQuery(document).ready(function($) {

    var interval = 0; //Miliseconds. For example to 7 sec. = 7000
    var activeIndex = 0;

    //upload videos if not on mobile
    //uploadVideo($('.hero-hero-slider'));

    //change visible slide
    $('.hero-slider-nav li').on('click', function(event) {
        event.preventDefault();

        var selectedItem = $(this);
        if (!selectedItem.hasClass('selected')) {
            // if it's not already selected
            var selectedPosition = selectedItem.index(),
                activePosition = $('.hero-hero-slider .selected').index();

            activeIndex = selectedPosition;

            if (activePosition < selectedPosition) {
                nextSlide($('.hero-hero-slider'), $('.hero-slider-nav'), selectedPosition);
            } else {
                prevSlide($('.hero-hero-slider'), $('.hero-slider-nav'), selectedPosition);
            }

            updateNavigationMarker(selectedPosition + 1);
        }
    });

    function nextSlide(container, pagination, n) {
        var visibleSlide = container.find('.selected'),
            navigationDot = pagination.find('.selected');

        //Update the background
        $('.hero-hero').removeClassPrefix('bg').addClass('bg-' + (n + 1));

        visibleSlide.removeClass('selected from-left from-right')
            .addClass('is-moving')
            .one('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend', function() {
                visibleSlide.removeClass('is-moving');
            });


        var view = container.children('li').eq(n);

        $(view).addClass('selected from-right').prevAll().addClass('move-left');
        navigationDot.removeClass('selected');
        pagination.find('li').eq(n).addClass('selected');

        //$(view).closest('section').css('background-color', $(view).css('background-color'));
        $(view).closest('.hero-hero-slider').toggleClass('container', ($(view).find('.hero-img-container').length > 0) ? true : false);
        //checkVideo(visibleSlide, container, n);

        if ($('.hero-slider-nav li').size() > activeIndex) {
            activeIndex = activeIndex + 1;
        } else {
            activeIndex = 0;
            prevSlide(container, pagination, activeIndex);
        }

    }

    function prevSlide(container, pagination, n) {
        var visibleSlide = container.find('.selected'),
            navigationDot = pagination.find('.selected');

        //Update the background
        $('.hero-hero').removeClassPrefix('bg').addClass('bg-' + (n - 1));

        visibleSlide.removeClass('selected from-left from-right').addClass('is-moving').one('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend', function() {
            visibleSlide.removeClass('is-moving');
        });

        var view = container.children('li').eq(n);

        $(view).addClass('selected from-left').removeClass('move-left').nextAll().removeClass('move-left');
        navigationDot.removeClass('selected');
        pagination.find('li').eq(n).addClass('selected');

        //$(view).closest('section').css('background-color', container.children('li').eq(n).css('background-color'));
        $(view).closest('.hero-hero-slider').toggleClass('container', ($(view).find('.hero-img-container').length > 0) ? true : false);
        //checkVideo(visibleSlide, container, n);
    }

    function uploadVideo(container) {
        container.find('.hero-bg-video-wrapper').each(function() {
            var videoWrapper = $(this);
            if (videoWrapper.is(':visible')) {
                // if visible - we are not on a mobile device 
                var videoUrl = videoWrapper.data('video'),
                    video = $('<video autobuffer loop><source src="' + videoUrl + '.mp4" type="video/mp4" /><source src="' + videoUrl + '.webm" type="video/webm" /></video>');
                video.appendTo(videoWrapper);
                // play video if first slide
                if (videoWrapper.parents('.hero-bg-video.selected').length > 0) video.get(0).play();
            }
        });
    }

    function checkVideo(hiddenSlide, container, n) {
        //check if a video outside the viewport is playing - if yes, pause it
        if (hiddenSlide.find('video').length > 0) hiddenSlide.find('video').get(0).pause();

        //check if the select slide contains a video element - if yes, play the video
        if (container.children('li').eq(n).find('video').length > 0) {
            container.children('li').eq(n).find('video').get(0).play();
        }
    }

    function updateNavigationMarker(n) {
        $('.hero-marker').removeClassPrefix('item').addClass('item-' + n);
    }

    $.fn.removeClassPrefix = function(prefix) {
        //remove all classes starting with 'prefix'
        this.each(function(i, el) {
            var classes = el.className.split(" ").filter(function(c) {
                return c.lastIndexOf(prefix, 0) !== 0;
            });
            el.className = $.trim(classes.join(" "));
        });
        return this;
    };

    function sliderInterval() {
        nextSlide($('.hero-hero-slider'), $('.hero-slider-nav'), activeIndex);
    }

    if (interval > 0) {
        window.setInterval(sliderInterval, interval);
    }
});