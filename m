Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6321E7609CC
	for <lists+linux-input@lfdr.de>; Tue, 25 Jul 2023 07:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231545AbjGYFwu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Jul 2023 01:52:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231769AbjGYFwa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Jul 2023 01:52:30 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6911819B1
        for <linux-input@vger.kernel.org>; Mon, 24 Jul 2023 22:52:29 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5221e487e08so4226218a12.0
        for <linux-input@vger.kernel.org>; Mon, 24 Jul 2023 22:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690264348; x=1690869148;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j8mvJAA5aywRfr61U/BuIUTr3XfxmNfpzqbATuVCpcc=;
        b=CmVz7PqEqlEumznmTCYxtu3dR6b/y5yAJ1WR2Js7J2naksoGQ7q4mFrjD3ohlcMQIG
         7UAnAEDTk4X/N5EujcxFVa6KOrnIaRadciAqEE7prvaWD4swmEtsbwh84N6kvnph1uHY
         XkvJaGDgdUJhqakeBEAuHyoj99VYsjb6bVLlN6OToykUTutBdgUWr4xsFZBqGfmH7koe
         R4+sGGoXKIsTQ9Mt0SnMt86bu0a/C/2EXWtYX3tQCHYCNY3bvgf0gB6S27m0r/kxWVA/
         DLsRpu6oHBlfOPNSS+5WevWw9ywx46brYXHlZ5esi3IaJD5vVe+GG7uflCEw3FMmAlMk
         wxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690264348; x=1690869148;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j8mvJAA5aywRfr61U/BuIUTr3XfxmNfpzqbATuVCpcc=;
        b=AcFi80NL2fTzuH2AA94DbuK7pGXzszN3DTbJhdT84VW2JB+D+AnjipPYQvU3zgcivy
         1Pp1Py0m3KdmBlz11MbsAOQTpn9bwNR5knBBvSnEK76AhmVobYu7FS9/QPYxZLgjz+m1
         PH1vfMbp2CSKitift0kGm79H8F84SjfMrNON6LTknQC1FTYJ7tv8hRU9+ivwM5ef5U3T
         IK0bqewKImEK2SJRdsNaH08Dkn+NixGR6yMVy8UTTSWX/Yyb0nGXCvPJCu7S3xcCCIcd
         S0N4omGbT4ZQ8sJP3eVspSqlOHprSkaXNdxoIWWbg1sj6iIZgb38pCg+oBjQBx4a6XLJ
         2ong==
X-Gm-Message-State: ABy/qLYN9ZFqX2bfKFQs1sTI6z9E+gndlbmpPJQk/Nl+9y6P0UkxWxsW
        whY940IzxwhyQbbOaVbB+unuYg==
X-Google-Smtp-Source: APBJJlF0n8EjpzdM+NYj5kuq58LpPKGXEqU+0sJ9QpGZ3jPjgq+zRv8KvrtT7en0yZt7r2N0o/nEOg==
X-Received: by 2002:a17:906:e:b0:991:d5ad:f1a7 with SMTP id 14-20020a170906000e00b00991d5adf1a7mr11652519eja.51.1690264347885;
        Mon, 24 Jul 2023 22:52:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id s5-20020a170906168500b00991e2b5a27dsm7585537ejd.37.2023.07.24.22.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 22:52:20 -0700 (PDT)
Message-ID: <5dd56c31-7ca3-dd39-0623-e4fd18ac6f68@linaro.org>
Date:   Tue, 25 Jul 2023 07:52:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/3] input: pm8xxx-vib: refactor to easily support new
 SPMI vibrator
Content-Language: en-US
To:     Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org,
        dmitry.baryshkov@linaro.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     quic_collinsd@quicinc.com, quic_subbaram@quicinc.com,
        quic_kamalw@quicinc.com, jestar@qti.qualcomm.com
References: <20230725054138.129497-1-quic_fenglinw@quicinc.com>
 <20230725054138.129497-2-quic_fenglinw@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230725054138.129497-2-quic_fenglinw@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 25/07/2023 07:41, Fenglin Wu wrote:
> Currently, all vibrator control register addresses are hard coded,
> including the base address and the offset, it's not flexible to support
> new SPMI vibrator module which is usually included in different PMICs
> with different base address. Refactor this by introducing the HW type
> terminology and contain the register offsets/masks/shifts in reg_filed
> data structures corresponding to each vibrator type, and the base address
> value defined in 'reg' property will be added for SPMI vibrators.
> 
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---
>  drivers/input/misc/pm8xxx-vibrator.c | 130 ++++++++++++++++-----------
>  1 file changed, 77 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/input/misc/pm8xxx-vibrator.c b/drivers/input/misc/pm8xxx-vibrator.c
> index 04cb87efd799..77bb0018d4e1 100644
> --- a/drivers/input/misc/pm8xxx-vibrator.c
> +++ b/drivers/input/misc/pm8xxx-vibrator.c
> @@ -12,36 +12,36 @@
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
>  
> +#define SSBI_VIB_DRV_EN_MANUAL_MASK	0xfc
> +#define SSBI_VIB_DRV_LEVEL_MASK		0xf8
> +#define SSBI_VIB_DRV_SHIFT		3
> +#define SPMI_VIB_DRV_LEVEL_MASK		0xff
> +#define SPMI_VIB_DRV_SHIFT		0
> +
>  #define VIB_MAX_LEVEL_mV	(3100)
>  #define VIB_MIN_LEVEL_mV	(1200)
>  #define VIB_MAX_LEVELS		(VIB_MAX_LEVEL_mV - VIB_MIN_LEVEL_mV)
>  
>  #define MAX_FF_SPEED		0xff
>  
> -struct pm8xxx_regs {
> -	unsigned int enable_addr;
> -	unsigned int enable_mask;
> +enum pm8xxx_vib_type {
> +	SSBI_VIB,
> +	SPMI_VIB_GEN1,
> +};
>  
> -	unsigned int drv_addr;
> -	unsigned int drv_mask;
> -	unsigned int drv_shift;
> -	unsigned int drv_en_manual_mask;
> +enum {
> +	VIB_DRV_REG,
> +	VIB_EN_REG,
> +	VIB_MAX_REG,
>  };
>  
> -static const struct pm8xxx_regs pm8058_regs = {
> -	.drv_addr = 0x4A,
> -	.drv_mask = 0xf8,
> -	.drv_shift = 3,
> -	.drv_en_manual_mask = 0xfc,
> +static struct reg_field ssbi_vib_regs[VIB_MAX_REG] = {

Change from const to non-const is wrong. How do you support multiple
devices? No, this is way too fragile now.

...

>  
>  	/*
>  	 * pmic vibrator supports voltage ranges from 1.2 to 3.1V, so
> @@ -168,38 +166,65 @@ static int pm8xxx_vib_probe(struct platform_device *pdev)
>  {
>  	struct pm8xxx_vib *vib;
>  	struct input_dev *input_dev;
> -	int error;
> +	struct device *dev = &pdev->dev;
> +	struct regmap *regmap;
> +	struct reg_field *regs;
> +	int error, i;
>  	unsigned int val;
> -	const struct pm8xxx_regs *regs;
> +	u32 reg_base;
>  
> -	vib = devm_kzalloc(&pdev->dev, sizeof(*vib), GFP_KERNEL);
> +	vib = devm_kzalloc(dev, sizeof(*vib), GFP_KERNEL);

Not really related. Split cleanup from new features.

>  	if (!vib)
>  		return -ENOMEM;
>  
> -	vib->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> -	if (!vib->regmap)
> +	regmap = dev_get_regmap(dev->parent, NULL);
> +	if (!regmap)
>  		return -ENODEV;
>  
> -	input_dev = devm_input_allocate_device(&pdev->dev);
> +	input_dev = devm_input_allocate_device(dev);
>  	if (!input_dev)
>  		return -ENOMEM;
>  
>  	INIT_WORK(&vib->work, pm8xxx_work_handler);
>  	vib->vib_input_dev = input_dev;
>  
> -	regs = of_device_get_match_data(&pdev->dev);
> +	vib->hw_type = (enum pm8xxx_vib_type)of_device_get_match_data(dev);
>  
> -	/* operate in manual mode */
> -	error = regmap_read(vib->regmap, regs->drv_addr, &val);
> +	regs = ssbi_vib_regs;
> +	if (vib->hw_type != SSBI_VIB) {
> +		error = fwnode_property_read_u32(dev->fwnode, "reg", &reg_base);
> +		if (error < 0) {
> +			dev_err(dev, "Failed to read reg address, rc=%d\n", error);
> +			return error;
> +		}
> +
> +		if (vib->hw_type == SPMI_VIB_GEN1)
> +			regs = spmi_vib_gen1_regs;
> +
> +		for (i = 0; i < VIB_MAX_REG; i++)
> +			if (regs[i].reg != 0)
> +				regs[i].reg += reg_base;
> +	}
> +
> +	error = devm_regmap_field_bulk_alloc(dev, regmap, vib->r_fields, regs, VIB_MAX_REG);
>  	if (error < 0)
> +	{

That's not a Linux coding style.

Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.

> +		dev_err(dev, "Failed to allocate regmap failed, rc=%d\n", error);

No need to print errors on allocation failures.

>  		return error;
> +	}
>  
> -	val &= regs->drv_en_manual_mask;
> -	error = regmap_write(vib->regmap, regs->drv_addr, val);
> +	error = regmap_field_read(vib->r_fields[VIB_DRV_REG], &val);
>  	if (error < 0)
>  		return error;


Best regards,
Krzysztof

