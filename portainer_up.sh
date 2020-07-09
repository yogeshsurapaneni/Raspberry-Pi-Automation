if curl -s --head  --request GET http://127.0.0.1:9000 | grep "200 OK" > /dev/null; then 
	   echo "UP"
   else
	      echo " `date` Portainer is DOWN"
fi
