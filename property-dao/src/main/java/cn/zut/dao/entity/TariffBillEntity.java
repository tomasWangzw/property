package cn.zut.dao.entity;

import cn.zut.facade.enums.BillStatusEnum;
import cn.zut.facade.enums.BusinessLevelEnum;
import cn.zut.facade.enums.BusinessTypeEnum;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * PROJECT: property
 *
 * @author DaoYuanWang
 * @apiNote 缴费账单表
 * @date 2018/3/21
 */
@Data
public class TariffBillEntity {
    /**
     * 账单编号
     */
    private Long billNo;
    /**
     * 户号
     */
    private String houseNo;
    /**
     * 用户编号
     */
    private Long memberId;
    /**
     * 业务类型
     */
    private BusinessTypeEnum business;
    /**
     * 缴费标准等级
     */
    private BusinessLevelEnum level;
    /**
     * 资费标准编号
     */
    private Long standardId;
    /**
     * 缴费单价(冗余字段)
     */
    private BigDecimal unitPrice;
    /**
     * 逾期利率(冗余字段)
     */
    private BigDecimal overdueRate;
    /**
     * 使用量
     */
    private BigDecimal usedTotal;
    /**
     * 账单金额
     */
    private BigDecimal billAmount;
    /**
     * 账单月份
     */
    private String billMonth;
    /**
     * 支付状态
     */
    private BillStatusEnum billStatus;
    /**
     * 账单起始时间
     */
    private Date billStartDate;
    /**
     * 账单结束时间
     */
    private Date billEndDate;
    /**
     * 拓展字段
     */
    private String expand;
    /**
     * 修改时间
     */
    private Date createTime;
    /**
     * 创建时间
     */
    private Date updateTime;
}
