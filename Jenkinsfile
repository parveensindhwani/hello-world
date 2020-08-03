def buildCause = currentBuild.getBuildCauses()[0].shortDescription
print buildCause
properties([pipelineTriggers([[$class: 'GitHubPushTrigger'], pollSCM('H/2 * * * *')])])
node {
    def buildCause1 = currentBuild.getBuildCauses()[0].shortDescription
    print buildCause1
    stage('Preparation') { // for display purposes dummy1
      print "test job"  
    }
    
}
