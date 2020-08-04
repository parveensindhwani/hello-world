def buildCause = currentBuild.getBuildCauses()[0].shortDescription
print buildCause
if( buildCause =~ 'Started by an SCM change' ) {
	print "triggered by hook defined in top"
	
}
node {
    
    stage('Preparation') { // for display 
        print "checking out code"
        git([url: 'https://github.com/parveensindhwani/hello-world.git', branch: 'develop', credentialsId: 'git-creds'])
    }
}
