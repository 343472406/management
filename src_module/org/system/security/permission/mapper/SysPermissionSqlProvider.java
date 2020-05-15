package org.system.security.permission.mapper;

import java.util.List;
import org.apache.ibatis.jdbc.SQL;
import org.system.security.permission.entity.SysPermission;
import org.system.security.permission.entity.SysPermissionExample.Criteria;
import org.system.security.permission.entity.SysPermissionExample.Criterion;
import org.system.security.permission.entity.SysPermissionExample;

public class SysPermissionSqlProvider {
    public String deleteByExample(SysPermissionExample example) {
        SQL sql = new SQL();
        sql.DELETE_FROM("sys_permission");
        applyWhere(sql, example, false);
        return sql.toString();
    }

    public String insertSelective(SysPermission record) {
        SQL sql = new SQL();
        sql.INSERT_INTO("sys_permission");
        
        if (record.getPermissionId() != null) {
            sql.VALUES("PERMISSION_ID", "#{permissionId,jdbcType=BIGINT}");
        }
        
        if (record.getPermissionName() != null) {
            sql.VALUES("PERMISSION_NAME", "#{permissionName,jdbcType=VARCHAR}");
        }
        
        if (record.getPermissionType() != null) {
            sql.VALUES("PERMISSION_TYPE", "#{permissionType,jdbcType=VARCHAR}");
        }
        
        if (record.getExpression() != null) {
            sql.VALUES("EXPRESSION", "#{expression,jdbcType=VARCHAR}");
        }
        
        if (record.getUrl() != null) {
            sql.VALUES("URL", "#{url,jdbcType=VARCHAR}");
        }
        
        if (record.getParentId() != null) {
            sql.VALUES("PARENT_ID", "#{parentId,jdbcType=BIGINT}");
        }
        
        return sql.toString();
    }

    public String selectByExample(SysPermissionExample example) {
        SQL sql = new SQL();
        if (example != null && example.isDistinct()) {
            sql.SELECT_DISTINCT("PERMISSION_ID");
        } else {
            sql.SELECT("PERMISSION_ID");
        }
        sql.SELECT("PERMISSION_NAME");
        sql.SELECT("PERMISSION_TYPE");
        sql.SELECT("EXPRESSION");
        sql.SELECT("URL");
        sql.SELECT("PARENT_ID");
        sql.FROM("sys_permission");
        applyWhere(sql, example, false);
        
        if (example != null && example.getOrderByClause() != null) {
            sql.ORDER_BY(example.getOrderByClause());
        }
        
        return sql.toString();
    }

    public String updateByPrimaryKeySelective(SysPermission record) {
        SQL sql = new SQL();
        sql.UPDATE("sys_permission");
        
        if (record.getPermissionName() != null) {
            sql.SET("PERMISSION_NAME = #{permissionName,jdbcType=VARCHAR}");
        }
        
        if (record.getPermissionType() != null) {
            sql.SET("PERMISSION_TYPE = #{permissionType,jdbcType=VARCHAR}");
        }
        
        if (record.getExpression() != null) {
            sql.SET("EXPRESSION = #{expression,jdbcType=VARCHAR}");
        }
        
        if (record.getUrl() != null) {
            sql.SET("URL = #{url,jdbcType=VARCHAR}");
        }
        
        if (record.getParentId() != null) {
            sql.SET("PARENT_ID = #{parentId,jdbcType=BIGINT}");
        }
        
        sql.WHERE("PERMISSION_ID = #{permissionId,jdbcType=BIGINT}");
        
        return sql.toString();
    }

    protected void applyWhere(SQL sql, SysPermissionExample example, boolean includeExamplePhrase) {
        if (example == null) {
            return;
        }
        
        String parmPhrase1;
        String parmPhrase1_th;
        String parmPhrase2;
        String parmPhrase2_th;
        String parmPhrase3;
        String parmPhrase3_th;
        if (includeExamplePhrase) {
            parmPhrase1 = "%s #{example.oredCriteria[%d].allCriteria[%d].value}";
            parmPhrase1_th = "%s #{example.oredCriteria[%d].allCriteria[%d].value,typeHandler=%s}";
            parmPhrase2 = "%s #{example.oredCriteria[%d].allCriteria[%d].value} and #{example.oredCriteria[%d].criteria[%d].secondValue}";
            parmPhrase2_th = "%s #{example.oredCriteria[%d].allCriteria[%d].value,typeHandler=%s} and #{example.oredCriteria[%d].criteria[%d].secondValue,typeHandler=%s}";
            parmPhrase3 = "#{example.oredCriteria[%d].allCriteria[%d].value[%d]}";
            parmPhrase3_th = "#{example.oredCriteria[%d].allCriteria[%d].value[%d],typeHandler=%s}";
        } else {
            parmPhrase1 = "%s #{oredCriteria[%d].allCriteria[%d].value}";
            parmPhrase1_th = "%s #{oredCriteria[%d].allCriteria[%d].value,typeHandler=%s}";
            parmPhrase2 = "%s #{oredCriteria[%d].allCriteria[%d].value} and #{oredCriteria[%d].criteria[%d].secondValue}";
            parmPhrase2_th = "%s #{oredCriteria[%d].allCriteria[%d].value,typeHandler=%s} and #{oredCriteria[%d].criteria[%d].secondValue,typeHandler=%s}";
            parmPhrase3 = "#{oredCriteria[%d].allCriteria[%d].value[%d]}";
            parmPhrase3_th = "#{oredCriteria[%d].allCriteria[%d].value[%d],typeHandler=%s}";
        }
        
        StringBuilder sb = new StringBuilder();
        List<Criteria> oredCriteria = example.getOredCriteria();
        boolean firstCriteria = true;
        for (int i = 0; i < oredCriteria.size(); i++) {
            Criteria criteria = oredCriteria.get(i);
            if (criteria.isValid()) {
                if (firstCriteria) {
                    firstCriteria = false;
                } else {
                    sb.append(" or ");
                }
                
                sb.append('(');
                List<Criterion> criterions = criteria.getAllCriteria();
                boolean firstCriterion = true;
                for (int j = 0; j < criterions.size(); j++) {
                    Criterion criterion = criterions.get(j);
                    if (firstCriterion) {
                        firstCriterion = false;
                    } else {
                        sb.append(" and ");
                    }
                    
                    if (criterion.isNoValue()) {
                        sb.append(criterion.getCondition());
                    } else if (criterion.isSingleValue()) {
                        if (criterion.getTypeHandler() == null) {
                            sb.append(String.format(parmPhrase1, criterion.getCondition(), i, j));
                        } else {
                            sb.append(String.format(parmPhrase1_th, criterion.getCondition(), i, j,criterion.getTypeHandler()));
                        }
                    } else if (criterion.isBetweenValue()) {
                        if (criterion.getTypeHandler() == null) {
                            sb.append(String.format(parmPhrase2, criterion.getCondition(), i, j, i, j));
                        } else {
                            sb.append(String.format(parmPhrase2_th, criterion.getCondition(), i, j, criterion.getTypeHandler(), i, j, criterion.getTypeHandler()));
                        }
                    } else if (criterion.isListValue()) {
                        sb.append(criterion.getCondition());
                        sb.append(" (");
                        List<?> listItems = (List<?>) criterion.getValue();
                        boolean comma = false;
                        for (int k = 0; k < listItems.size(); k++) {
                            if (comma) {
                                sb.append(", ");
                            } else {
                                comma = true;
                            }
                            if (criterion.getTypeHandler() == null) {
                                sb.append(String.format(parmPhrase3, i, j, k));
                            } else {
                                sb.append(String.format(parmPhrase3_th, i, j, k, criterion.getTypeHandler()));
                            }
                        }
                        sb.append(')');
                    }
                }
                sb.append(')');
            }
        }
        
        if (sb.length() > 0) {
            sql.WHERE(sb.toString());
        }
    }
}