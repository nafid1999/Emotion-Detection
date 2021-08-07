<?php
include "connect.php";
include "function.php";
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" type="image/png" href="https://img.icons8.com/emoji/48/000000/worried-face.png" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://kit-pro.fontawesome.com/releases/v5.13.0/css/pro.min.css" />
    <!--Bach tkhadam fontawesome pro-->
    <link rel="stylesheet" href="./css/main.css" />
    <title>Document</title>
</head>

<body>
    <div class="emotion-page">
        <div class="container">
            <div class="logo text-center">
                <div class="img-logo"><span style="color: #fb8669;font-size:1.1em;">E</span>motion+</div>
            </div>

            <?php
            if (!isset($_GET['id'])) {
                $emoId = 4;
            } else {
                $emoId = $_GET['id'];
            }
            $para = getPara($emoId);
            $emotion = getEmotion($emoId);


            ?>
            <div class="para text-center my-6">
                <h2 class="my-4 title-para"><?php echo $para['title']  ?></h2>
                <p>
                    <?php echo $para['content'] ?>
                </p>
            </div>
            <div class="quets-audio">
                <div class="row">
                    <div class="col-6">
                        <div class="quotes">
                            <ul>
                                <?php $qoutes = getqoutes($emoId);
                                shuffle($qoutes);

                                $i = 0;
                                ?>

                                <?php foreach ($qoutes as $qoute) {

                                    if ($i > 2)
                                        break;

                                    $i++
                                ?>
                                <li>
                                    <blockquote class="blockstyle">
                                        <?php echo $qoute['content'] ?>
                                    </blockquote>
                                </li>

                                <?php } ?>
                            </ul>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="audios">
                            <!-- 
 <ul>
                 
                  <li>
                    <audio controls>
                      <source
                        src="https://drive.google.com/uc?export=download&id=1zpv_BIwiTGMP9s1kLs7b84f-BgsV9XeY"
                        type="audio/ogg"
                      />
                      <source
                        src="https://drive.google.com/uc?export=download&id=1zpv_BIwiTGMP9s1kLs7b84f-BgsV9XeY"
                        type="audio/mpeg"
                      />
                      Your browser does not support the audio tag.
                    </audio>
                  </li>
                </ul>

                -->

                            <?php $song = getSongs(1) ?>
                            <div class="outer-container">
                                <audio src="<?php echo $song[0]['src'] ?>" id="track"></audio>
                            </div>

                            <div class="player-container">
                                <div class="box">
                                    <div class="track-info">
                                        <div id="track-artist" class="mb-2"><?php echo $song[0]['title'] ?></div>
                                        <div id="track-title"><?php echo $song[0]['singer'] ?></div>
                                    </div>

                                    <div>
                                        <div class="next-prev">
                                            <i class="fas fa-fast-backward fa-2x" title="Previous Track"
                                                id="prev-track"></i>
                                            <i class="fas fa-undo fa-2x" title="Back 10 seconds" id="back10"></i>
                                            <i class="far fa-stop-circle fa-2x" id="stop"></i>
                                            <div class="play-pause">
                                                <i class="far fa-play-circle fa-2x" id="play"></i>
                                                <i class="far fa-pause-circle fa-2x" id="pause"></i>
                                            </div>
                                            <i class="fas fa-redo fa-2x" title="Forward 10 seconds" id="forward10"></i>
                                            <i class="fas fa-fast-forward fa-2x" title="Next Track" id="next-track"></i>
                                        </div>
                                    </div>
                                    <div class="progress-bar">
                                        <input type="range" id="progressBar" min="0" max="" value="0" />
                                    </div>
                                    <div class="track-time">
                                        <div id="currentTime"></div>
                                        <div id="durationTime"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <?php $vidoe = getVidoe($emoId) ?>
            <div class="motiv-vidoe text-center my-4">
                <iframe src="<?php echo $vidoe['src'] ?>" title="YouTube video player" frameborder="0" id="iframe"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen></iframe>
            </div>

        </div>
    </div>

    <script>
    let temp = "";
    let tracks = [];
    let trackArtists = [];
    let trackTitles = [];
    <?php
        foreach (getSongs(1) as $song) {


        ?>
    temp = "<?php echo $song['src'] ?>";

    console.log(temp);
    tracks.push(temp);

    temp = "<?php echo $song['singer'] ?>";
    trackArtists.push(temp)

    temp = "<?php echo $song['title'] ?>";
    trackTitles.push(temp);


    // tracks = [
    //     "https://res.cloudinary.com/cbanlawi/video/upload/v1614140796/HarryStyles-WatermelonSugar_f5471p.mp3",
    //     "https://res.cloudinary.com/cbanlawi/video/upload/v1614144520/Justin_Bieber-Yummy_vercib.mp3",

    //     "https://res.cloudinary.com/cbanlawi/video/upload/v1614186705/Loud_Luxury_ft._Brando_-_Body_fm7cdr.mp3",
    // ];
    <?php
        }
        ?>
    console.log(tracks);
    </script>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js"
        integrity="sha512-2rNj2KJ+D8s1ceNasTIex6z4HWyOnEYLVC3FigGOmyQCZc2eBXKgOxQmo3oKLHyfcj53uz4QMsRCWNbLd32Q1g=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
        integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous">
    </script>

    <script src="./js/custumaudio.js"></script>





    <script>
    // var scriptTag =

    //     "<script>document.getElementById('movie_player').addEventListener('click', pauseOthers);function pauseOthers() {console.log('goood');} <" +
    //     "/script>";


    // $("iframe").contents().find("body").append(scriptTag);


    document.getElementById('play').addEventListener('click', pauseAll);

    document.getElementById('iframe').addEventListener('mouseenter', pauseAudio);

    var test = 0;

    function pauseAudio() {
        test = 1;
        console.log("test iframe");
        $('#pause').hide();
        $('#play').show();

        var audios = document.getElementsByTagName('audio');
        for (var i = 0, len = audios.length; i < len; i++) {
            audios[i].pause();
        }

    }



    function pauseAll() {
        console.log("hahaha");
        if (test == 1) {
            var iframe = document.getElementById('iframe');
            iframe.setAttribute("src", "<?php echo $vidoe['src'] ?>");
        }
        test = 0;

    }
    </script>
</body>

</html>