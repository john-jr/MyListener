
//APi youtube
  var tag = document.createElement('script'); 
  tag.src = "https://www.youtube.com/iframe_api";
  var firstScriptTag = document.getElementsByTagName('script')[0];
  firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
 //APi youtube

 //Playlist LM
    var songs = [];
    var currentMusic = 0;
    var playlist ;

    var nomeMusica = [];
    var nomebanda =  [];

$( document ).ready(function() {
     playlist = $("#playlist");
    var tracks  = playlist.find("li a");
    for(var i=0; i<tracks.length;i++){
        

         var link = playlist.find("a")[i];
         nomeMusica.push($(link).attr("data-nomeMusic"));
         nomebanda.push($(link).attr("data-banda"));
         songs.push($(link).attr("data-id"));
        
    }
   
   
  });



function handler( event ) {
  var teste = $( event.target);

  currentMusic = $(teste).data("ps");
  escolhe(); 
}


$( "ul li" ).click( handler ).find( "a" );

  var player;
  //Playlist LM


 //APi youtube
  function onYouTubeIframeAPIReady() {   
        
    player = new YT.Player('player', {
        width: '600',
        height: '350',
        videoId: songs[currentMusic],
        playerVars: {
        'controls' : 0,
        'modestbranding' : 1,
        'rel' : 0,
        'showinfo' : 0
      },
      events: {
        'onReady': onPlayerReady,
        'onStateChange': onPlayerStateChange
      }
    });
  };

  
 var timeVideo;

  
  var ready = false;
  function onPlayerReady(event) {
    ready = true;
    $('.button-play').click(function() {
        var pst = player.getPlayerState();

        if(pst == 0 || pst == 2 || pst == 5) {
          recebeDadosLetra(nomebanda[currentMusic] , nomeMusica[currentMusic] );// api vagalume letra
            player.playVideo();

        } else if (pst == 1) {
            player.pauseVideo();
        }

    });

    $('.button-volume').click(function() {
        if(player.isMuted()) {
            player.unMute();
            $('.glyphicon-volume-down').hide();
            $('.glyphicon-volume-up').show();           
        } else {
            player.mute();
            $('.glyphicon-volume-up').hide();
            $('.glyphicon-volume-down').show();
        }

    });

    var query = document.querySelector.bind(document);

    // Once the user clicks a custom fullscreen button
    $("#fullsize").on("click", function(){
         if($("#player-view").hasClass("sumir")){
               $("#player-view").removeClass("sumir");
        }else{
              $("#player-view").addClass("sumir");
             
        }
    });
    

    $('#slider').on("slide", function(event, ui) {
        player.pauseVideo();
    });


    $('#slider').on("slidestop", function(event, ui) {
        var seekTo = (ui.value * timeVideo)/100;
        player.seekTo(seekTo, true);

        esperaControleBar();
       
    });  


}


function esperaControleBar(){
  setTimeout(function(){ player.playVideo() }, 2000);

}

   





  function onPlayerStateChange(event) {
     
    if (event.data == YT.PlayerState.PLAYING ) {
        $('.glyphicon-play').hide();
        $('.glyphicon-pause').show();


         timeVideo = player.getDuration();
        var mytimer = setInterval(function() {
          
            timeElapsed = player.getCurrentTime();
            currentTime = ( timeElapsed / timeVideo ) * 100;
            if(currentTime >= 100) {
                next();
            } else {
                 $('#slider').slider('value', currentTime);
               
            }

        }, 1000);



    } else {
        clearTimeout(mytimer);
        $('.glyphicon-pause').hide();
        $('.glyphicon-play').show();
        
    }
  }

   //APi youtube
 

   //Playlist LM
  function stopVideo() {
    player.stopVideo();
  }
 
  function playVideo() {
    if(ready){
     player.playVideo();
    }else setTimeout(function(){ playVideo() },1000);
  }

function next(){
    currentMusic++;
    if(currentMusic >= songs.length){
        currentMusic = 0;
       
        recebeDadosLetra(nomebanda[currentMusic] , nomeMusica[currentMusic] );// api vagalume letra
        player.loadVideoById(songs[currentMusic]); 
        player.playVideo();
    }else{
        recebeDadosLetra(nomebanda[currentMusic] , nomeMusica[currentMusic] );// api vagalume letra
        player.loadVideoById(songs[currentMusic]); 
        player.playVideo();
         
    }
    
}


function voltar(){
    currentMusic--;
    if(currentMusic < 0 ){
        currentMusic = songs.length - 1;
    }


      recebeDadosLetra(nomebanda[currentMusic] , nomeMusica[currentMusic] );// api vagalume letra
    
    player.loadVideoById(songs[currentMusic]); 
    player.playVideo();
}


function escolhe(){
  recebeDadosLetra(nomebanda[currentMusic] , nomeMusica[currentMusic] );// api vagalume letra
  player.loadVideoById(songs[currentMusic]); 
  player.playVideo();

   
}



$("#pular").on("click", function(){
  next();
});


$("#voltar").on("click", function(){
  voltar();
});
  //Playlist LM


 

// api vagalume letra
  $(document).ready(function(){

       $('#letra .text').hide();
     $('#letra .text2').hide();
  });

    ///////////pega os dados de busca///////////
    function recebeDadosLetra(setartista, setmusica){
       var artistas = setartista;
       var musica   = setmusica;
      fetchLetra(artistas , musica);

         $("#artista").text(artistas)
         $("#music").text(musica);
    }


    $("#procurar").on("click", function(){
         var artistas = $("#artistas").val();
        var musica   = $("#musica").val();
        fetchLetra(artistas , musica);

         $("#artista").text(artistas)
         $("#music").text(musica);
    });
    ///////////pega os dados de busca///////////


    ///////////Procura letra da musica com o artista e nome da musica///////////
    function fetchLetra (art,mus) {
      var data = jQuery.data(document,art + mus); // cache read
      if (data) {
        showLetra(data, art, mus);
        return true;
      }
      var url = "https://api.vagalume.com.br/search.php"
        +"?art="+encodeURIComponent(art)
        +"&mus="+encodeURIComponent(mus);
      // Check if browser supports CORS - http://www.w3.org/TR/cors/
      if (!jQuery.support.cors) {
        url += "&callback=?";
      }
      
      jQuery.getJSON(url,function(data) {
        // What we do with the data
        jQuery.data(document,art + mus,data); // cache write
        showLetra(data, art, mus);
      });
    }
     ///////////Procura letra da musica com o artista e nome da musica///////////



      ///////////Mostra a letra da musica///////////
    function showLetra (data,art,mus,arrayid) {
      if (! arrayid) arrayid = 0;
      if (data.type == 'exact' || data.type == 'aprox') {
        // Print lyrics text
        
        $('#letra .text').text(data.mus[arrayid].text);
        // Show buttons to open original and portuguese translation
        if (data.mus[arrayid].translate) {
          $('#letra .text2').show();
          $('#letra .text').show();
          $('#letra .col-lg-12').removeClass('col-lg-12').addClass('col-lg-6');
          $('#letra .text2').text(data.mus[arrayid].translate[0].text);

        }else{

          $('#letra .text').show();
          $('#letra .text2').hide();
          $('#letra .col-lg-6').removeClass('col-lg-6').addClass('col-lg-12');
          
        }
      } else if (data.type == 'song_notfound') {
        $('#letra .text').html(
          'Musica "'+mus+'" from "'+art+'"nao encontrada<br/>'
          +'<a target=_blank href="https://www.vagalume.com.br/add/lyrics.php">'
          +'Add this song to Vagalume &raquo;</a>'
        );
      } else {
        // Artist not found
        $('#letra .text').html(
          'Musica "'+mus+'" from "'+art+'"nao encontrada<br/>'
          +'(Artista nao encontrado)<br/>'
          +'<a target=_blank href="http://www.vagalume.com.br/add/lyrics.php">'
          +'Add this song to Vagalume &raquo;</a>'
        );
      }
    }
    ///////////Mostra a letra da musica///////////

// api vagalume letra

