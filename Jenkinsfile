def buildCause = currentBuild.getBuildCauses()[0].shortDescription
print buildCause
if( buildCause =~ 'Started by GitHub push' ) {
	print "triggered by hook"
	mvn_command='package'
	sh "echo ${buildCause}"
}
pipeline {
  agent any
  triggers {
    githubPush()
  }
      stages {    
	     stage ('check hook') {
		   steps {
		      script {

          // get build cause (time triggered vs. SCM change)
          // def buildCause = currentBuild.getBuildCauses()[0].shortDescription
          echo "Current build was caused by: ${buildCause}\n"
          echo "this var is coming from top"

          // e.g. "Current build was caused by: Started by GitHub push by mirekphd"
          // vs. "Started by timer"
}
		       
		   }
          }
		
      }
}
