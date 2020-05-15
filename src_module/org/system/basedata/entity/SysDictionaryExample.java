package org.system.basedata.entity;

import java.util.ArrayList;
import java.util.List;

public class SysDictionaryExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SysDictionaryExample() {
        oredCriteria = new ArrayList<>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andDictionaryIdIsNull() {
            addCriterion("DICTIONARY_ID is null");
            return (Criteria) this;
        }

        public Criteria andDictionaryIdIsNotNull() {
            addCriterion("DICTIONARY_ID is not null");
            return (Criteria) this;
        }

        public Criteria andDictionaryIdEqualTo(Long value) {
            addCriterion("DICTIONARY_ID =", value, "dictionaryId");
            return (Criteria) this;
        }

        public Criteria andDictionaryIdNotEqualTo(Long value) {
            addCriterion("DICTIONARY_ID <>", value, "dictionaryId");
            return (Criteria) this;
        }

        public Criteria andDictionaryIdGreaterThan(Long value) {
            addCriterion("DICTIONARY_ID >", value, "dictionaryId");
            return (Criteria) this;
        }

        public Criteria andDictionaryIdGreaterThanOrEqualTo(Long value) {
            addCriterion("DICTIONARY_ID >=", value, "dictionaryId");
            return (Criteria) this;
        }

        public Criteria andDictionaryIdLessThan(Long value) {
            addCriterion("DICTIONARY_ID <", value, "dictionaryId");
            return (Criteria) this;
        }

        public Criteria andDictionaryIdLessThanOrEqualTo(Long value) {
            addCriterion("DICTIONARY_ID <=", value, "dictionaryId");
            return (Criteria) this;
        }

        public Criteria andDictionaryIdIn(List<Long> values) {
            addCriterion("DICTIONARY_ID in", values, "dictionaryId");
            return (Criteria) this;
        }

        public Criteria andDictionaryIdNotIn(List<Long> values) {
            addCriterion("DICTIONARY_ID not in", values, "dictionaryId");
            return (Criteria) this;
        }

        public Criteria andDictionaryIdBetween(Long value1, Long value2) {
            addCriterion("DICTIONARY_ID between", value1, value2, "dictionaryId");
            return (Criteria) this;
        }

        public Criteria andDictionaryIdNotBetween(Long value1, Long value2) {
            addCriterion("DICTIONARY_ID not between", value1, value2, "dictionaryId");
            return (Criteria) this;
        }

        public Criteria andDictionaryNameIsNull() {
            addCriterion("DICTIONARY_NAME is null");
            return (Criteria) this;
        }

        public Criteria andDictionaryNameIsNotNull() {
            addCriterion("DICTIONARY_NAME is not null");
            return (Criteria) this;
        }

        public Criteria andDictionaryNameEqualTo(String value) {
            addCriterion("DICTIONARY_NAME =", value, "dictionaryName");
            return (Criteria) this;
        }

        public Criteria andDictionaryNameNotEqualTo(String value) {
            addCriterion("DICTIONARY_NAME <>", value, "dictionaryName");
            return (Criteria) this;
        }

        public Criteria andDictionaryNameGreaterThan(String value) {
            addCriterion("DICTIONARY_NAME >", value, "dictionaryName");
            return (Criteria) this;
        }

        public Criteria andDictionaryNameGreaterThanOrEqualTo(String value) {
            addCriterion("DICTIONARY_NAME >=", value, "dictionaryName");
            return (Criteria) this;
        }

        public Criteria andDictionaryNameLessThan(String value) {
            addCriterion("DICTIONARY_NAME <", value, "dictionaryName");
            return (Criteria) this;
        }

        public Criteria andDictionaryNameLessThanOrEqualTo(String value) {
            addCriterion("DICTIONARY_NAME <=", value, "dictionaryName");
            return (Criteria) this;
        }

        public Criteria andDictionaryNameLike(String value) {
            addCriterion("DICTIONARY_NAME like", value, "dictionaryName");
            return (Criteria) this;
        }

        public Criteria andDictionaryNameNotLike(String value) {
            addCriterion("DICTIONARY_NAME not like", value, "dictionaryName");
            return (Criteria) this;
        }

        public Criteria andDictionaryNameIn(List<String> values) {
            addCriterion("DICTIONARY_NAME in", values, "dictionaryName");
            return (Criteria) this;
        }

        public Criteria andDictionaryNameNotIn(List<String> values) {
            addCriterion("DICTIONARY_NAME not in", values, "dictionaryName");
            return (Criteria) this;
        }

        public Criteria andDictionaryNameBetween(String value1, String value2) {
            addCriterion("DICTIONARY_NAME between", value1, value2, "dictionaryName");
            return (Criteria) this;
        }

        public Criteria andDictionaryNameNotBetween(String value1, String value2) {
            addCriterion("DICTIONARY_NAME not between", value1, value2, "dictionaryName");
            return (Criteria) this;
        }

        public Criteria andDictionaryDescIsNull() {
            addCriterion("DICTIONARY_DESC is null");
            return (Criteria) this;
        }

        public Criteria andDictionaryDescIsNotNull() {
            addCriterion("DICTIONARY_DESC is not null");
            return (Criteria) this;
        }

        public Criteria andDictionaryDescEqualTo(String value) {
            addCriterion("DICTIONARY_DESC =", value, "dictionaryDesc");
            return (Criteria) this;
        }

        public Criteria andDictionaryDescNotEqualTo(String value) {
            addCriterion("DICTIONARY_DESC <>", value, "dictionaryDesc");
            return (Criteria) this;
        }

        public Criteria andDictionaryDescGreaterThan(String value) {
            addCriterion("DICTIONARY_DESC >", value, "dictionaryDesc");
            return (Criteria) this;
        }

        public Criteria andDictionaryDescGreaterThanOrEqualTo(String value) {
            addCriterion("DICTIONARY_DESC >=", value, "dictionaryDesc");
            return (Criteria) this;
        }

        public Criteria andDictionaryDescLessThan(String value) {
            addCriterion("DICTIONARY_DESC <", value, "dictionaryDesc");
            return (Criteria) this;
        }

        public Criteria andDictionaryDescLessThanOrEqualTo(String value) {
            addCriterion("DICTIONARY_DESC <=", value, "dictionaryDesc");
            return (Criteria) this;
        }

        public Criteria andDictionaryDescLike(String value) {
            addCriterion("DICTIONARY_DESC like", value, "dictionaryDesc");
            return (Criteria) this;
        }

        public Criteria andDictionaryDescNotLike(String value) {
            addCriterion("DICTIONARY_DESC not like", value, "dictionaryDesc");
            return (Criteria) this;
        }

        public Criteria andDictionaryDescIn(List<String> values) {
            addCriterion("DICTIONARY_DESC in", values, "dictionaryDesc");
            return (Criteria) this;
        }

        public Criteria andDictionaryDescNotIn(List<String> values) {
            addCriterion("DICTIONARY_DESC not in", values, "dictionaryDesc");
            return (Criteria) this;
        }

        public Criteria andDictionaryDescBetween(String value1, String value2) {
            addCriterion("DICTIONARY_DESC between", value1, value2, "dictionaryDesc");
            return (Criteria) this;
        }

        public Criteria andDictionaryDescNotBetween(String value1, String value2) {
            addCriterion("DICTIONARY_DESC not between", value1, value2, "dictionaryDesc");
            return (Criteria) this;
        }

        public Criteria andParentIdIsNull() {
            addCriterion("PARENT_ID is null");
            return (Criteria) this;
        }

        public Criteria andParentIdIsNotNull() {
            addCriterion("PARENT_ID is not null");
            return (Criteria) this;
        }

        public Criteria andParentIdEqualTo(Long value) {
            addCriterion("PARENT_ID =", value, "parentId");
            return (Criteria) this;
        }

        public Criteria andParentIdNotEqualTo(Long value) {
            addCriterion("PARENT_ID <>", value, "parentId");
            return (Criteria) this;
        }

        public Criteria andParentIdGreaterThan(Long value) {
            addCriterion("PARENT_ID >", value, "parentId");
            return (Criteria) this;
        }

        public Criteria andParentIdGreaterThanOrEqualTo(Long value) {
            addCriterion("PARENT_ID >=", value, "parentId");
            return (Criteria) this;
        }

        public Criteria andParentIdLessThan(Long value) {
            addCriterion("PARENT_ID <", value, "parentId");
            return (Criteria) this;
        }

        public Criteria andParentIdLessThanOrEqualTo(Long value) {
            addCriterion("PARENT_ID <=", value, "parentId");
            return (Criteria) this;
        }

        public Criteria andParentIdIn(List<Long> values) {
            addCriterion("PARENT_ID in", values, "parentId");
            return (Criteria) this;
        }

        public Criteria andParentIdNotIn(List<Long> values) {
            addCriterion("PARENT_ID not in", values, "parentId");
            return (Criteria) this;
        }

        public Criteria andParentIdBetween(Long value1, Long value2) {
            addCriterion("PARENT_ID between", value1, value2, "parentId");
            return (Criteria) this;
        }

        public Criteria andParentIdNotBetween(Long value1, Long value2) {
            addCriterion("PARENT_ID not between", value1, value2, "parentId");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {
        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}