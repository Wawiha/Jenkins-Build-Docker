node{
    def app
        stage ('Clone') {
            checkout scm
        }
        stage ('Build image') {
            app = docker.build("kahina/nginx")
        }
        stage ('Run image') {
         docker.image('kahina/nginx').withRun('-p 83:80') { c ->
            sh 'docker ps'
            sh 'curl localhost'
         }
        }
}