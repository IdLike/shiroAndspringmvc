import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.Factory;
import org.junit.Assert;
import org.junit.Test;

public class TestShiro {

    @Test
    public  void testShiroIni(){
        //通过ini文件配置工厂
        Factory<org.apache.shiro.mgt.SecurityManager>  factory= new IniSecurityManagerFactory("classpath:shiro.ini");
        //
        SecurityUtils.setSecurityManager(factory.getInstance());
        Subject subject=SecurityUtils.getSubject();

        UsernamePasswordToken token=new UsernamePasswordToken("zhangsan","123");
        try {
            //登陆验证
            subject.login(token);
        }catch (AuthenticationException e){
            System.out.println("登陆失败");
            e.printStackTrace();
        }

        Assert.assertEquals(true,subject.isAuthenticated());
        subject.logout();


    }
}
