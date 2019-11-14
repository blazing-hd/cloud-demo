node {
    stage 'Checkout'
    git url: 'https://github.com/superwogz/cloud-demo.git'

    stage 'Docker Build'
    docker.build('demo')

    stage 'Push image to ECR'
    docker.withRegistry() {
        docker.image('demo').push('latest')
    }
    



}
