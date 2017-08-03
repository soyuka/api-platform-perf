composer update
rm -r var/cache/*
bin/console server:stop
bin/console server:start
echo "no cache"
curl -w "Time total: %{time_total}" -o /dev/null -s "http://localhost:8001/foos.jsonld?pagination=false"
echo "cache"
curl -w "Time total: %{time_total}" -o /dev/null -s "http://localhost:8001/foos.jsonld?pagination=false"
