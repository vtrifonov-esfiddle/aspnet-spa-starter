tryCount=0
errorCode=1
while [ $tryCount -le 3 ] && [ $errorCode -ne 0 ]
do
    curl --head $ASPNET_REACT_PRODUCTION_URI
    errorCode=$?
    echo "$ASPNET_REACT_PRODUCTION_URI; try count: $tryCount; Error Code: $errorCode"
    sleep 5
    tryCount=$(( tryCount + 1 ))
done

exit $errorCode