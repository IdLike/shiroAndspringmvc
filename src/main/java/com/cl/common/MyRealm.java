package com.cl.common;
import com.cl.entity.Privilege;
import com.cl.entity.Role;
import com.cl.entity.User;
import com.cl.service.UserService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.Set;

/**
    自定义realm
 **/
public class MyRealm extends AuthorizingRealm {

    @Resource
    private UserService userService;
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
         String username=(String) principalCollection.getPrimaryPrincipal();
         Set<String> roles=new HashSet<String>();
         Set<String> permissions=new HashSet<String>();
        SimpleAuthorizationInfo simpleAuthorizationInfo=new SimpleAuthorizationInfo();

        //一个角色对应多个权限
        for(Role role:userService.findUsersByUsername(username).getRoles()){
            roles.add(role.getRolename());

            for (Privilege privilege:userService.findUsersByUsername(username).getPrivileges()){

                permissions.add(role.getRolename()+":"+privilege.getPrivilegeName());

            }
        }
        simpleAuthorizationInfo.setStringPermissions(permissions);
        simpleAuthorizationInfo.setRoles(roles);

        return simpleAuthorizationInfo;
    }

    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
       //从主体中传过来的认证信息获取用户名
        String username = (String)token.getPrincipal();

        // 根据用户输入的username从数据库查询
      User user= userService.findUsersByUsername(username);

      if(user.getPassword()==null){

          return  null;
      }
      SimpleAuthenticationInfo simpleAuthenticationInfo=new SimpleAuthenticationInfo(username,user.getPassword(),"myRealm");
        return  simpleAuthenticationInfo;
    }
}

