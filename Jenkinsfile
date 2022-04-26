pipeline {
    agent none 
    stages {
        stage("npm") {
            agent {
                docker {
                    image 'node:17-bullseye'
                }
            }
            steps {
                dir('DotnetTemplate.Web') {
                    sh "npm ci --no-audit"
                    sh "npm run test-with-coverage"
                }
            }
        }
        stage("dotnet") {
            agent {
                docker {
                    image 'mcr.microsoft.com/dotnet/sdk:6.0'
                }
            }
            steps {
                dir('DotnetTemplate.Web') {
                    sh "dotnet build"
                    sh "dotnet test"
                    cobertura coberturaReportFile: 'coverage/cobertura-coverage.xml'
                }
            }
        }
    }
}