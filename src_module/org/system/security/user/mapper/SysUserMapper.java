package org.system.security.user.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.DeleteProvider;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.type.JdbcType;
import org.system.security.user.entity.SysUser;
import org.system.security.user.entity.SysUserExample;

public interface SysUserMapper {
    @DeleteProvider(type=SysUserSqlProvider.class, method="deleteByExample")
    int deleteByExample(SysUserExample example);

    @Delete({
        "delete from sys_user",
        "where USER_ID = #{userId,jdbcType=BIGINT}"
    })
    int deleteByPrimaryKey(Long userId);

    @Insert({
        "insert into sys_user (USER_ID, USER_NAME, ",
        "USER_REALNAME, PHONE, ",
        "EMAIL, GENDER, ID_CARD, ",
        "PASSWORD, SALT, ",
        "STATUS, DEPT_ID, ROLE_ID, ",
        "SUPERIOR_ID, CREATE_TIME, ",
        "CREATE_USER, UPDATE_TIME, ",
        "UPDATE_USER)",
        "values (#{userId,jdbcType=BIGINT}, #{userName,jdbcType=VARCHAR}, ",
        "#{userRealname,jdbcType=VARCHAR}, #{phone,jdbcType=VARCHAR}, ",
        "#{email,jdbcType=VARCHAR}, #{gender,jdbcType=INTEGER}, #{idCard,jdbcType=VARCHAR}, ",
        "#{password,jdbcType=VARCHAR}, #{salt,jdbcType=VARCHAR}, ",
        "#{status,jdbcType=INTEGER}, #{deptId,jdbcType=BIGINT}, #{roleId,jdbcType=BIGINT}, ",
        "#{superiorId,jdbcType=BIGINT}, #{createTime,jdbcType=TIMESTAMP}, ",
        "#{createUser,jdbcType=BIGINT}, #{updateTime,jdbcType=TIMESTAMP}, ",
        "#{updateUser,jdbcType=BIGINT})"
    })
    int insert(SysUser record);

    @InsertProvider(type=SysUserSqlProvider.class, method="insertSelective")
    int insertSelective(SysUser record);

    @SelectProvider(type=SysUserSqlProvider.class, method="selectByExample")
    @Results({
        @Result(column="USER_ID", property="userId", jdbcType=JdbcType.BIGINT, id=true),
        @Result(column="USER_NAME", property="userName", jdbcType=JdbcType.VARCHAR),
        @Result(column="USER_REALNAME", property="userRealname", jdbcType=JdbcType.VARCHAR),
        @Result(column="PHONE", property="phone", jdbcType=JdbcType.VARCHAR),
        @Result(column="EMAIL", property="email", jdbcType=JdbcType.VARCHAR),
        @Result(column="GENDER", property="gender", jdbcType=JdbcType.INTEGER),
        @Result(column="ID_CARD", property="idCard", jdbcType=JdbcType.VARCHAR),
        @Result(column="PASSWORD", property="password", jdbcType=JdbcType.VARCHAR),
        @Result(column="SALT", property="salt", jdbcType=JdbcType.VARCHAR),
        @Result(column="STATUS", property="status", jdbcType=JdbcType.INTEGER),
        @Result(column="DEPT_ID", property="deptId", jdbcType=JdbcType.BIGINT),
        @Result(column="ROLE_ID", property="roleId", jdbcType=JdbcType.BIGINT),
        @Result(column="SUPERIOR_ID", property="superiorId", jdbcType=JdbcType.BIGINT),
        @Result(column="CREATE_TIME", property="createTime", jdbcType=JdbcType.TIMESTAMP),
        @Result(column="CREATE_USER", property="createUser", jdbcType=JdbcType.BIGINT),
        @Result(column="UPDATE_TIME", property="updateTime", jdbcType=JdbcType.TIMESTAMP),
        @Result(column="UPDATE_USER", property="updateUser", jdbcType=JdbcType.BIGINT)
    })
    List<SysUser> selectByExample(SysUserExample example);

    @Select({
        "select",
        "USER_ID, USER_NAME, USER_REALNAME, PHONE, EMAIL, GENDER, ID_CARD, PASSWORD, ",
        "SALT, STATUS, DEPT_ID, ROLE_ID, SUPERIOR_ID, CREATE_TIME, CREATE_USER, UPDATE_TIME, ",
        "UPDATE_USER",
        "from sys_user",
        "where USER_ID = #{userId,jdbcType=BIGINT}"
    })
    @Results({
        @Result(column="USER_ID", property="userId", jdbcType=JdbcType.BIGINT, id=true),
        @Result(column="USER_NAME", property="userName", jdbcType=JdbcType.VARCHAR),
        @Result(column="USER_REALNAME", property="userRealname", jdbcType=JdbcType.VARCHAR),
        @Result(column="PHONE", property="phone", jdbcType=JdbcType.VARCHAR),
        @Result(column="EMAIL", property="email", jdbcType=JdbcType.VARCHAR),
        @Result(column="GENDER", property="gender", jdbcType=JdbcType.INTEGER),
        @Result(column="ID_CARD", property="idCard", jdbcType=JdbcType.VARCHAR),
        @Result(column="PASSWORD", property="password", jdbcType=JdbcType.VARCHAR),
        @Result(column="SALT", property="salt", jdbcType=JdbcType.VARCHAR),
        @Result(column="STATUS", property="status", jdbcType=JdbcType.INTEGER),
        @Result(column="DEPT_ID", property="deptId", jdbcType=JdbcType.BIGINT),
        @Result(column="ROLE_ID", property="roleId", jdbcType=JdbcType.BIGINT),
        @Result(column="SUPERIOR_ID", property="superiorId", jdbcType=JdbcType.BIGINT),
        @Result(column="CREATE_TIME", property="createTime", jdbcType=JdbcType.TIMESTAMP),
        @Result(column="CREATE_USER", property="createUser", jdbcType=JdbcType.BIGINT),
        @Result(column="UPDATE_TIME", property="updateTime", jdbcType=JdbcType.TIMESTAMP),
        @Result(column="UPDATE_USER", property="updateUser", jdbcType=JdbcType.BIGINT)
    })
    SysUser selectByPrimaryKey(Long userId);

    @UpdateProvider(type=SysUserSqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(SysUser record);

    @Update({
        "update sys_user",
        "set USER_NAME = #{userName,jdbcType=VARCHAR},",
          "USER_REALNAME = #{userRealname,jdbcType=VARCHAR},",
          "PHONE = #{phone,jdbcType=VARCHAR},",
          "EMAIL = #{email,jdbcType=VARCHAR},",
          "GENDER = #{gender,jdbcType=INTEGER},",
          "ID_CARD = #{idCard,jdbcType=VARCHAR},",
          "PASSWORD = #{password,jdbcType=VARCHAR},",
          "SALT = #{salt,jdbcType=VARCHAR},",
          "STATUS = #{status,jdbcType=INTEGER},",
          "DEPT_ID = #{deptId,jdbcType=BIGINT},",
          "ROLE_ID = #{roleId,jdbcType=BIGINT},",
          "SUPERIOR_ID = #{superiorId,jdbcType=BIGINT},",
          "CREATE_TIME = #{createTime,jdbcType=TIMESTAMP},",
          "CREATE_USER = #{createUser,jdbcType=BIGINT},",
          "UPDATE_TIME = #{updateTime,jdbcType=TIMESTAMP},",
          "UPDATE_USER = #{updateUser,jdbcType=BIGINT}",
        "where USER_ID = #{userId,jdbcType=BIGINT}"
    })
    int updateByPrimaryKey(SysUser record);
}