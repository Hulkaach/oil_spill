package com.hulkaach.oil_spill;

import jakarta.persistence.*;

import java.math.BigDecimal;

@Entity
@Table(name = "oil_spill_data")
public class OilSpillData {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String productName;
    private Integer spillTons;
    private BigDecimal timeHours;
    private BigDecimal d1M;
    private BigDecimal d2M;
    private BigDecimal areaM2;
    private BigDecimal filmThicknessMm;
    private BigDecimal oilPercent;
}
