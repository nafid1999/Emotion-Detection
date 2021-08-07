<?php

/*
    **Get para emotions data 
    ** 
    */
function getPara($id_emotion)
{
    global $con;
    $stmt = $con->prepare("SELECT * FROM paragraphe where emotion_id=$id_emotion");
    $stmt->execute();
    $rows = $stmt->fetchAll();
    shuffle($rows);
    return $rows[0];
}
function getqoutes($id_emotion)
{
    global $con;
    $stmt = $con->prepare("SELECT * FROM qoutes where emotion_id=$id_emotion");
    $stmt->execute();
    $rows = $stmt->fetchAll();

    return $rows;
}


function getSongs($id_emotion)
{
    global $con;
    $stmt = $con->prepare("SELECT * FROM audios where emotion_id=$id_emotion");
    $stmt->execute();
    $rows = $stmt->fetchAll();

    shuffle($rows);
    return $rows;
}

function getVidoe($id_emotion)
{
    global $con;
    $stmt = $con->prepare("SELECT * FROM vidoes where emotion_id=$id_emotion");
    $stmt->execute();
    $rows = $stmt->fetchAll();

    shuffle($rows);
    return $rows[0];
}



function getEmotion($id_emotion)
{
    global $con;
    $stmt = $con->prepare("SELECT * FROM emotion where id=$id_emotion");
    $stmt->execute();
    $rows = $stmt->fetch();
    return $rows;
}