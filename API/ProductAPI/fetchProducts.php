<?php

  //MySQL database Connection
  $con=mysqli_connect('php.example.com','admin','123','scannerapp');

  //Received JSON into $json variable
  $json = file_get_contents('php://input');

  //Decoding the received JSON and store into $obj variable.
  $obj = json_decode($json,true);

  if(isset($obj["ean"])){

    $ean = mysqli_real_escape_string($con,$obj['ean']);

    //Declare array variable
    $result=[];

    //Select Query
    $sql="SELECT * FROM products WHERE ean='{$ean}'";
    $res=$con->query($sql);

    if($res->num_rows>0){

      $row=$res->fetch_assoc();

      $result=$row;

    }else{

      $result['fetchStatus']=false;
      $result['message']="Invalid Product Details";
    }

    // Converting the array into JSON format.
    $json_data=json_encode($result);

    // Echo the $json.
    echo $json_data;
    http_response_code(201);
  }
?>
