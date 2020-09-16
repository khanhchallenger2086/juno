{{-- <script src="{{ asset('frontend/js/jquery.min.1.11.0.js')}}" type="text/javascript"></script> --}}
{{-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> --}}
{{-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> --}}
{{-- <script src="{{ asset('frontend/js/plugins.js')}}" type="text/javascript"></script> --}}
{{-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> --}}

{{-- <script src="{{ asset('frontend/js/scripts.js')}}" type="text/javascript"></script> --}}
{{-- <script src="{{ asset('frontend/js/scripts_main.js')}}" type="text/javascript"></script> --}}

{{-- <script src="{{ asset('frontend/js/hoian.recommender.js')}}" type="text/javascript"></script> --}}
{{-- <script src="{{ asset('frontend/js/xfbml.customerchat.js')}}" type="text/javascript"></script> --}}
{{-- <script src="{{ asset('backend/js/jquery.min.js')}}" type="text/javascript"></script> --}}
<script src="{{ asset('frontend/js/frontend.js')}}" type="text/javascript"></script>
<script>
    $(document).ready(function(){
      $(".preview a").on("click", function(){
          $(".selected").removeClass("selected");
          $(this).addClass("selected");
          var picture = $(this).data();

          event.preventDefault(); //prevents page from reloading every time you click a thumbnail


          $(".full img").fadeOut( 100, function() {
            $(".full img").attr("src", picture.full);
            $(".full").attr("href", picture.full);
            $(".full").attr("title", picture.title);

        }).fadeIn();


      });// end on click

    //   $(".full").fancybox({
    //       helpers : {
    //           title: {
    //               type: 'inside'
    //           }
    //       },
    //       closeBtn : true,
    //   });


  });//end doc ready



</script>
