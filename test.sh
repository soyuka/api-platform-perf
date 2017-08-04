composer update
rm -r var/cache/*
bin/console server:stop
bin/console server:start
echo "no cache"
curl -w "Time total: %{time_total}" -o /dev/null -s "http://localhost:8001/foos.jsonld?pagination=false"
echo "cache"
curl -w "Time total: %{time_total}" -o /dev/null -s "http://localhost:8001/foos.jsonld?pagination=false"
echo "Let's patch this shit"
cd vendor/api-platform/core
patch -p1 < ../../../perf.patch
cd ../../../
rm -r var/cache/*
bin/console server:stop
bin/console server:start
echo "no cache"
curl -w "Time total: %{time_total}" -o /dev/null -s "http://localhost:8001/foos.jsonld?pagination=false"
echo "cache"
curl -w "Time total: %{time_total}" -o /dev/null -s "http://localhost:8001/foos.jsonld?pagination=false"
