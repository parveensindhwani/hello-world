node {
    def buildCause = currentBuild.getBuildCauses()[0].shortDescription
    print buildCause
    properties([pipelineTriggers([[$class: 'GitHubPushTrigger']])])
    stage('Preparation') { // for display purposes
      print "test job"  
    }
    
}
