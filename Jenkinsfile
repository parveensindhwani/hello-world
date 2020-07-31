def build_cause = currentBuild.getBuildCauses()[0].shortDescription
pipeline {
  agent any
  triggers {
    githubPush()
  }
      stages {
        stage ('Git Checkout ') {

            steps {
                git branch: 'master',
                    credentialsId: 'git-credentials',
                    url: 'https://github.com/parveensindhwani/hello-world.git'
                }
            }
			
		stage ('Build') {
		   steps {
		      def buildCauses = currentBuild.rawBuild.getCauses()
		      print buildCauses
		      sh '''
		          echo $buildCauses
		          echo "it is run ${BUILD_USER} test: env.BUILD_USER"
			  cd $WORKSPACE
			  mvn clean install package
			  
			  
			  '''
			      }
            }
		stage ('Deploy') {
		   steps {
		      sh '''
		      cd $WORKSPACE
		      sudo /root/apache-tomcat-8.5.54/bin/shutdown.sh
		      sudo cp webapp/target/webapp.war /root/apache-tomcat-8.5.54/webapps/
                      sudo /root/apache-tomcat-8.5.54/bin/startup.sh  
		      '''
			      }
            }
		
		
		
		}
	} 
