node {
  def app

 stage('Clone repository') {
    checkout scm
  }

 stage('Build image') {
    app = docker.build("docker.squareboard.cloud/sqbdocd")
  }

 stage('Push image') {
    docker.withRegistry('https://docker.squareboard.cloud', 'docker-reg-creds') {
      shortCommit = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
      app.push("dev-${shortCommit}")
      app.push("dev-latest")
    }
  }
}
