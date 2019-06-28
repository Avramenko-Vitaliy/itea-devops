// call via curl -u admin:admin --data-urlencode "script=$(<./jenkins-setup.groovy)" http://127.0.0.1:8080/scriptText/
import jenkins.model.*
import hudson.security.*
import hudson.tools.*
import hudson.model.*
import hudson.plugins.audit_trail.*
import org.jenkinsci.plugins.*
import com.cloudbees.plugins.credentials.*
import com.cloudbees.plugins.credentials.common.*
import com.cloudbees.plugins.credentials.domains.*
import com.cloudbees.plugins.credentials.impl.*
import com.cloudbees.jenkins.plugins.sshcredentials.impl.*
import hudson.plugins.sshslaves.*
import hudson.util.Secret
import org.jenkinsci.plugins.plaincredentials.*
import org.jenkinsci.plugins.plaincredentials.impl.*
import ru.yandex.qatools.allure.jenkins.tools.*
import jenkins.model.GlobalConfiguration
import hudson.model.UpdateSite
import jenkins.model.Jenkins

// Common vars
def git_password = System.getenv('GIT_PASSWORD')
def environment = System.getenv('ENV')

// plugin settings
def inst = Jenkins.getInstance()


def allure = inst.getDescriptor("ru.yandex.qatools.allure.jenkins.tools.AllureCommandlineInstallation")
def installer = new AllureCommandlineInstaller("2.3")
def prop = new InstallSourceProperty([installer])
def sinst = new AllureCommandlineInstallation("allure", "", [prop])
allure.setInstallations(sinst)
allure.save()

domain = Domain.global()
store = Jenkins.instance.getExtensionList('com.cloudbees.plugins.credentials.SystemCredentialsProvider')[0].getStore()

// SimpleThemeConfig
def theme_config = inst.getDescriptorByType(org.codefirst.SimpleThemeDecorator)

theme_config.cssUrl = "https://jenkins-contrib-themes.github.io/jenkins-material-theme/dist/material-" + System.getenv('JENKINS_COLOR_SCHEMA') + ".css"

theme_config.save()

// add users and secrettext for github and slack
domain = Domain.global()
store = Jenkins.instance.getExtensionList('com.cloudbees.plugins.credentials.SystemCredentialsProvider')[0].getStore()

usernameAndPassword = new UsernamePasswordCredentialsImpl(
    CredentialsScope.GLOBAL,
    "git-hhtp",
		"",
    "avramenko-vitaliy",
    git_password
)


store.addCredentials(domain, usernameAndPassword)


// mail configuration
def desc = inst.getDescriptor("hudson.tasks.Mailer")

desc.setSmtpAuth("notifications@services.example.com", "smtp_password")
desc.setReplyToAddress("no-reply@services.example.com")
desc.setSmtpHost("mail.services.example.com")
desc.setUseSsl(false)
desc.setSmtpPort("25")
desc.setCharset("UTF-8")
desc.save()

// Jenkis Main Settings
import jenkins.model.JenkinsLocationConfiguration
jlc = JenkinsLocationConfiguration.get()
def linkUri = "http://" + System.getenv('APP_INTERNAL_HOST')

jlc.setUrl(linkUri)

jlc.setAdminAddress("notifications@services.example.com")
jlc.save()

inst.setNumExecutors(5)

def j = Jenkins.instance
for(UpdateSite site : j.getUpdateCenter().getSiteList()) {
    site.neverUpdate = true
    try {
        site.data = null
        site.dataLastReadFromFile = -1
    } catch(Exception e) {}
    site.dataTimestamp = 0
    new File(j.getRootDir(), "updates/${site.id}.json").delete()
}

//https://wiki.jenkins-ci.org/display/JENKINS/Features+controlled+by+system+properties
System.setProperty('hudson.model.UpdateCenter.never', 'true')
