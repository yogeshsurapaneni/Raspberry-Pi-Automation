if curl -s --head  --request GET http://127.0.0.1:9000 | grep "200 OK" > /dev/null;

then 
	      result=0
   	   
else
	      result=1
fi


if [ $result == 1 ];
then
	echo "`date` --- Site DOWN"

fi
