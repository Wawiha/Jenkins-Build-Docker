node{
    def app
        stage ('Clone') {
            checkout scm
        }
        stage('Docker') {
            sh 'curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
            && tar xzvf docker-17.04.0-ce.tgz \
            && mv docker/docker /usr/local/bin \
            && sh sudo chown root:jenkins /run/docker.sock \
            && rm -r docker docker-17.04.0-ce.tgz'
        }

        stage ('Build image') {
            app = docker.build("kahina/nginx")
        }
        stage ('Run image') {
         docker.image('kahina/nginx').withRun('-p 80:80') { c ->
            sh 'docker ps'
            sh 'curl localhost'
         }
        }
}
