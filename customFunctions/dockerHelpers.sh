#beautify setup should be completed first
#This can vary from project to project

#function shows beautified logs for docker container
function dlog() {
    name=$1
    container_id=$(docker ps | grep $name | awk '{print $1}')
    docker logs -f $container_id | beautify
}

function pods() {
    ENV=$1
    kubectl get pods -n $ENV
}