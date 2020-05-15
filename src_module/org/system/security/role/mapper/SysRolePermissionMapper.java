package org.system.security.role.mapper;

import java.util.List;
import org.apache.ibatis.annotations.DeleteProvider;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.type.JdbcType;
import org.system.security.role.entity.SysRolePermission;
import org.system.security.role.entity.SysRolePermissionExample;

public interface SysRolePermissionMapper {
    @DeleteProvider(type=SysRolePermissionSqlProvider.class, method="deleteByExample")
    int deleteByExample(SysRolePermissionExample example);

    @Insert({
        "insert into sys_role_permission (ROLE_ID, PERMISSION_ID)",
        "values (#{roleId,jdbcType=BIGINT}, #{permissionId,jdbcType=BIGINT})"
    })
    int insert(SysRolePermission record);

    @InsertProvider(type=SysRolePermissionSqlProvider.class, method="insertSelective")
    int insertSelective(SysRolePermission record);

    @SelectProvider(type=SysRolePermissionSqlProvider.class, method="selectByExample")
    @Results({
        @Result(column="ROLE_ID", property="roleId", jdbcType=JdbcType.BIGINT),
        @Result(column="PERMISSION_ID", property="permissionId", jdbcType=JdbcType.BIGINT)
    })
    List<SysRolePermission> selectByExample(SysRolePermissionExample example);
}