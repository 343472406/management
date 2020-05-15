package org.system.basedata.mapper;

import java.util.List;
import org.apache.ibatis.jdbc.SQL;
import org.system.basedata.entity.SysDictionary;
import org.system.basedata.entity.SysDictionaryExample.Criteria;
import org.system.basedata.entity.SysDictionaryExample.Criterion;
import org.system.basedata.entity.SysDictionaryExample;

public class SysDictionarySqlProvider {
    public String deleteByExample(SysDictionaryExample example) {
        SQL sql = new SQL();
        sql.DELETE_FROM("sys_dictionary");
        applyWhere(sql, example, false);
        return sql.toString();
    }

    public String insertSelective(SysDictionary record) {
        SQL sql = new SQL();
        sql.INSERT_INTO("sys_dictionary");
        
        if (record.getDictionaryId() != null) {
            sql.VALUES("DICTIONARY_ID", "#{dictionaryId,jdbcType=BIGINT}");
        }
        
        if (record.getDictionaryName() != null) {
            sql.VALUES("DICTIONARY_NAME", "#{dictionaryName,jdbcType=VARCHAR}");
        }
        
        if (record.getDictionaryDesc() != null) {
            sql.VALUES("DICTIONARY_DESC", "#{dictionaryDesc,jdbcType=VARCHAR}");
        }
        
        if (record.getParentId() != null) {
            sql.VALUES("PARENT_ID", "#{parentId,jdbcType=BIGINT}");
        }
        
        return sql.toString();
    }

    public String selectByExample(SysDictionaryExample example) {
        SQL sql = new SQL();
        if (example != null && example.isDistinct()) {
            sql.SELECT_DISTINCT("DICTIONARY_ID");
        } else {
            sql.SELECT("DICTIONARY_ID");
        }
        sql.SELECT("DICTIONARY_NAME");
        sql.SELECT("DICTIONARY_DESC");
        sql.SELECT("PARENT_ID");
        sql.FROM("sys_dictionary");
        applyWhere(sql, example, false);
        
        if (example != null && example.getOrderByClause() != null) {
            sql.ORDER_BY(example.getOrderByClause());
        }
        
        return sql.toString();
    }

    public String updateByPrimaryKeySelective(SysDictionary record) {
        SQL sql = new SQL();
        sql.UPDATE("sys_dictionary");
        
        if (record.getDictionaryName() != null) {
            sql.SET("DICTIONARY_NAME = #{dictionaryName,jdbcType=VARCHAR}");
        }
        
        if (record.getDictionaryDesc() != null) {
            sql.SET("DICTIONARY_DESC = #{dictionaryDesc,jdbcType=VARCHAR}");
        }
        
        if (record.getParentId() != null) {
            sql.SET("PARENT_ID = #{parentId,jdbcType=BIGINT}");
        }
        
        sql.WHERE("DICTIONARY_ID = #{dictionaryId,jdbcType=BIGINT}");
        
        return sql.toString();
    }

    protected void applyWhere(SQL sql, SysDictionaryExample example, boolean includeExamplePhrase) {
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