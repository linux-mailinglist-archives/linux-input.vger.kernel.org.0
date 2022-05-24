Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 344AC5323FC
	for <lists+linux-input@lfdr.de>; Tue, 24 May 2022 09:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235175AbiEXHYo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 May 2022 03:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233739AbiEXHYm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 May 2022 03:24:42 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E297CB35
        for <linux-input@vger.kernel.org>; Tue, 24 May 2022 00:24:41 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id p19so1587692wmg.2
        for <linux-input@vger.kernel.org>; Tue, 24 May 2022 00:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=AjWSodLOo8ZPJy6O0FlUERSrMcBBp3JgmwXgCuABWKY=;
        b=2GrWBC208uKvWnarte0fbHotpeC/ayk+QVlBl9wQwBF+g9AeVdwpxvmmu1Jjkq2qmM
         xiCLo3QJBM0YGlMcr15fhl6yuiPI/7TomlDhysJCJ93CUQM9SKY3P1oOAZExz1nxjNLZ
         1vLG22aAt9PcxivPCvdMPJW/yVq7l1OCFzFILLT7wJajIO6Ngf3hfC/BZij7SC42PoXV
         3rE2HF0a/brq6fP/m89FtcRyMSgs3nmMuoHnxI9mir9z11Pk9h2mqciu2JWC09v79gZ/
         rrwF23yFKqpJvVfmILrQ6HxEz9NHkK+fv+x6dJW6oLZcvAWrh4B0hqsVSz3Pu8aMNZB1
         yHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=AjWSodLOo8ZPJy6O0FlUERSrMcBBp3JgmwXgCuABWKY=;
        b=mzBnG2yl/yCO1cYxPumyealAkIABYk43gMx9MrhJWVZM2rUJ4iF1TUNWHU/E0cKeOx
         WDcRQKDgpoa16RIRUeo8eKhLmPAxUr6Ws3+QEjlbrIxWBgIR/2b05OGvCF83UUhe4aWY
         +dv2nw5mAsoddfYoA5oIUphoPNxw6jPSyVqVE7QLDA/seSJCI56c0fh9iTSeZSSJXY/W
         q5NqZxyMqiXxCgKv2cmPYCkvonacJ1hNv3JJjgINM5Qv2GSuDapvtA3cZbzlJjg5OB2+
         L9hFwhEKE3luAD0iPCU0dtTBc1xbAm48gtQB+GaBN5vVZN4OHwYzvjrUabmIqxl1q4x7
         DE7A==
X-Gm-Message-State: AOAM532N5Gp11WGvOLyn99LevQxtElO50hMRpvXIVZmDq3Qc95K/76Rj
        AzWSQmFE/o3aMxUlRMxxQKim3g==
X-Google-Smtp-Source: ABdhPJzE9aWITFtiFFRNGY2dX+P743fTQhoFoU891iRxPYgTeFrPs9sSk/w06Y2GmZkZCVOi+Z+2Eg==
X-Received: by 2002:a05:600c:acb:b0:397:bdb:ffea with SMTP id c11-20020a05600c0acb00b003970bdbffeamr2441172wmr.56.1653377079785;
        Tue, 24 May 2022 00:24:39 -0700 (PDT)
Received: from localhost ([2a01:cb19:85e6:1900:de85:21d6:6f2:c7e3])
        by smtp.gmail.com with ESMTPSA id m7-20020adfa3c7000000b0020d0cdbf7eesm12131452wrb.111.2022.05.24.00.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 00:24:39 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: mtk-pmic-keys - use single update when
 configuring long press behavior
In-Reply-To: <YowH0Q5HAGU7Grx2@google.com>
References: <YowH0Q5HAGU7Grx2@google.com>
Date:   Tue, 24 May 2022 09:24:38 +0200
Message-ID: <87wnebe6kp.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On lun., mai 23, 2022 at 15:16, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> Instead of doing 3 read-modify-write operations when configuring behavior
> of long-press, consolidate everything into one.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Hi Dmitry,

Thank you for improving the driver.

I've tested this with evtest on mt8183-pumpkin on input/next
(fabcf4d8696839a8da8a3f90d1fd30ae923ddde7).
Note that I needed to add [1] on top as well for the driver to be
loaded, since [1] is not part of input/next

[1] https://lore.kernel.org/r/20220121140323.4080640-5-mkorpershoek@baylibre.com/

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

Tested-by: Mattijs Korpershoek <mkorpershoek@baylibre.com> # on mt8183-pumpkin
> ---
>  drivers/input/keyboard/mtk-pmic-keys.c | 71 ++++++++++----------------
>  1 file changed, 28 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
> index c31ab4368388..d2f0db245ff6 100644
> --- a/drivers/input/keyboard/mtk-pmic-keys.c
> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> @@ -18,17 +18,11 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  
> -#define MTK_PMIC_PWRKEY_RST_EN_MASK	0x1
> -#define MTK_PMIC_PWRKEY_RST_EN_SHIFT	6
> -#define MTK_PMIC_HOMEKEY_RST_EN_MASK	0x1
> -#define MTK_PMIC_HOMEKEY_RST_EN_SHIFT	5
> -#define MTK_PMIC_RST_DU_MASK		0x3
> -#define MTK_PMIC_RST_DU_SHIFT		8
> -
> -#define MTK_PMIC_PWRKEY_RST		\
> -	(MTK_PMIC_PWRKEY_RST_EN_MASK << MTK_PMIC_PWRKEY_RST_EN_SHIFT)
> -#define MTK_PMIC_HOMEKEY_RST		\
> -	(MTK_PMIC_HOMEKEY_RST_EN_MASK << MTK_PMIC_HOMEKEY_RST_EN_SHIFT)
> +#define MTK_PMIC_RST_DU_MASK	GENMASK(9, 8)
> +#define MTK_PMIC_RST_DU_SHIFT	8
> +#define MTK_PMIC_RST_KEY_MASK	GENMASK(6, 5)
> +#define MTK_PMIC_PWRKEY_RST	BIT(6)
> +#define MTK_PMIC_HOMEKEY_RST	BIT(5)
>  
>  #define MTK_PMIC_PWRKEY_INDEX	0
>  #define MTK_PMIC_HOMEKEY_INDEX	1
> @@ -108,53 +102,44 @@ enum mtk_pmic_keys_lp_mode {
>  };
>  
>  static void mtk_pmic_keys_lp_reset_setup(struct mtk_pmic_keys *keys,
> -		u32 pmic_rst_reg)
> +					 u32 pmic_rst_reg)
>  {
> -	int ret;
>  	u32 long_press_mode, long_press_debounce;
> +	u32 value, mask;
> +	int error;
>  
> -	ret = of_property_read_u32(keys->dev->of_node,
> -		"power-off-time-sec", &long_press_debounce);
> -	if (ret)
> +	error = of_property_read_u32(keys->dev->of_node, "power-off-time-sec",
> +				     &long_press_debounce);
> +	if (error)
>  		long_press_debounce = 0;
>  
> -	regmap_update_bits(keys->regmap, pmic_rst_reg,
> -			   MTK_PMIC_RST_DU_MASK << MTK_PMIC_RST_DU_SHIFT,
> -			   long_press_debounce << MTK_PMIC_RST_DU_SHIFT);
> +	mask = MTK_PMIC_RST_DU_MASK;
> +	value = long_press_debounce << MTK_PMIC_RST_DU_SHIFT;
>  
> -	ret = of_property_read_u32(keys->dev->of_node,
> -		"mediatek,long-press-mode", &long_press_mode);
> -	if (ret)
> +	error  = of_property_read_u32(keys->dev->of_node,
> +				      "mediatek,long-press-mode",
> +				      &long_press_mode);
> +	if (error)
>  		long_press_mode = LP_DISABLE;
>  
>  	switch (long_press_mode) {
> -	case LP_ONEKEY:
> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
> -				   MTK_PMIC_PWRKEY_RST,
> -				   MTK_PMIC_PWRKEY_RST);
> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
> -				   MTK_PMIC_HOMEKEY_RST,
> -				   0);
> -		break;
>  	case LP_TWOKEY:
> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
> -				   MTK_PMIC_PWRKEY_RST,
> -				   MTK_PMIC_PWRKEY_RST);
> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
> -				   MTK_PMIC_HOMEKEY_RST,
> -				   MTK_PMIC_HOMEKEY_RST);
> -		break;
> +		value |= MTK_PMIC_HOMEKEY_RST;
> +		fallthrough;
> +
> +	case LP_ONEKEY:
> +		value |= MTK_PMIC_PWRKEY_RST;
> +		fallthrough;
> +
>  	case LP_DISABLE:
> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
> -				   MTK_PMIC_PWRKEY_RST,
> -				   0);
> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
> -				   MTK_PMIC_HOMEKEY_RST,
> -				   0);
> +		mask |= MTK_PMIC_RST_KEY_MASK;
>  		break;
> +
>  	default:
>  		break;
>  	}
> +
> +	regmap_update_bits(keys->regmap, pmic_rst_reg, mask, value);
>  }
>  
>  static irqreturn_t mtk_pmic_keys_irq_handler_thread(int irq, void *data)
> -- 
> 2.36.1.124.g0e6072fb45-goog
>
>
> -- 
> Dmitry
