Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 775A750A4CA
	for <lists+linux-input@lfdr.de>; Thu, 21 Apr 2022 17:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1390353AbiDUP72 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Apr 2022 11:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1390354AbiDUP71 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Apr 2022 11:59:27 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CE7441329
        for <linux-input@vger.kernel.org>; Thu, 21 Apr 2022 08:56:28 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id n126-20020a1c2784000000b0038e8af3e788so3705832wmn.1
        for <linux-input@vger.kernel.org>; Thu, 21 Apr 2022 08:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=hg5+t1tI5/VExu379t4FoAPQBxLcwwkKr34fdizzuVw=;
        b=VzskJkCcDCQbeuv/k5llpkz4MigKpI5bifyH/1Z3VnG7fM1Qi3Ou/M3Okn85+05OnL
         u/Osp0MQGZ9KhfU4ZrfCJ8/FW9W0Vw3Erk41E5XcOvTxnVJ+x9zpAwYdG2kSveNKHp9V
         kuzIAQ1eRoGPj4JWwccHQ8SaL08bwgBtbCjkXbMI1UgaGxzL/SWoDwD6aUKJbBuQoD9v
         vMD/mUg8CoZse6tkH/vG4Z6vBFQfKnMzYC0PKbRFWV7sEO2jRDui1/VFxUv64SOzH8Mz
         KLKOzwHlJ3r4bGoxiPmXzH8lqqUZnq9Rsyp0Mh9mFDY0NHl+bB7IP/diNoHndg2LyY0w
         /zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=hg5+t1tI5/VExu379t4FoAPQBxLcwwkKr34fdizzuVw=;
        b=Z3j0y4ETqP89eWVnWiAlrp8fTxdNfwvs62g+MLtEkrCRGebmJ/OABnomiqgOFs094c
         xTKmEOOOkQxZ9vE33X1jKjJ/KKPilevGWAHUzJ2O3O1eh6gGzN7UBk8vwI1oPCUD0a/Y
         16cWk4vzbQqH61wv6BH+axleFM8y593Bbs4xRMXrEVWBbzbToiQ6qYIyk4iLoRILqD1B
         hKOyVMZI+QizhfmFllXY9UmO+1phYLU4Ct8JO/BqH6OdWxQXq7K0l0BOVaZ8TtRqX+2B
         83vAkPwPvbI+F7g1XaN7eIrGAZF+uems1Kj82YMubXTbxfqxQw97COtEURAEqdZMNYvd
         l0+A==
X-Gm-Message-State: AOAM532QmSzziAtOji538a+S47jwmeGZ72X/FjAevsfhlZsNHvXSQtXf
        7pIGRFJ7qHZkBJAKP3XpDLJ9GA==
X-Google-Smtp-Source: ABdhPJxfH6CtSqSm5CaL6PkezTdrkLgN3B7QyDME5WxDMEF1GYNxMeqXUldfWl7CVfsIIILdrWSOQQ==
X-Received: by 2002:a05:600c:1d08:b0:38f:fb9d:5758 with SMTP id l8-20020a05600c1d0800b0038ffb9d5758mr24852wms.89.1650556587103;
        Thu, 21 Apr 2022 08:56:27 -0700 (PDT)
Received: from localhost ([2a01:cb19:85e6:1900:e19f:c42c:d783:89c1])
        by smtp.gmail.com with ESMTPSA id o10-20020a5d47ca000000b0020a992ce354sm3020151wrc.76.2022.04.21.08.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 08:56:26 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Fabien Parent <fparent@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] Input: mtk-pmic-keys: rename platform data struct
In-Reply-To: <20220415153629.1817202-5-fparent@baylibre.com>
References: <20220415153629.1817202-1-fparent@baylibre.com>
 <20220415153629.1817202-5-fparent@baylibre.com>
Date:   Thu, 21 Apr 2022 17:56:25 +0200
Message-ID: <87ilr2zaza.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On ven., avril 15, 2022 at 17:36, Fabien Parent <fparent@baylibre.com> wrote:

> Rename the struct that is given to the .data field of the of_device_id
> entries to reflect that this structure will not only contain register
> definitions but also other platform data.
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Tested-by: Mattijs Korpershoek <mkorpershoek@baylibre.com> # on mt8183-pumpkin 

> ---
>  drivers/input/keyboard/mtk-pmic-keys.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
> index c31ab4368388..a0da644fe93d 100644
> --- a/drivers/input/keyboard/mtk-pmic-keys.c
> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> @@ -50,12 +50,12 @@ struct mtk_pmic_keys_regs {
>  	.intsel_mask		= _intsel_mask,		\
>  }
>  
> -struct mtk_pmic_regs {
> +struct mtk_pmic_keys_pdata {
>  	const struct mtk_pmic_keys_regs keys_regs[MTK_PMIC_MAX_KEY_COUNT];
>  	u32 pmic_rst_reg;
>  };
>  
> -static const struct mtk_pmic_regs mt6397_regs = {
> +static const struct mtk_pmic_keys_pdata mt6397_pdata = {
>  	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
>  		MTK_PMIC_KEYS_REGS(MT6397_CHRSTATUS,
>  		0x8, MT6397_INT_RSV, 0x10),
> @@ -65,7 +65,7 @@ static const struct mtk_pmic_regs mt6397_regs = {
>  	.pmic_rst_reg = MT6397_TOP_RST_MISC,
>  };
>  
> -static const struct mtk_pmic_regs mt6323_regs = {
> +static const struct mtk_pmic_keys_pdata mt6323_pdata = {
>  	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
>  		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
>  		0x2, MT6323_INT_MISC_CON, 0x10),
> @@ -75,7 +75,7 @@ static const struct mtk_pmic_regs mt6323_regs = {
>  	.pmic_rst_reg = MT6323_TOP_RST_MISC,
>  };
>  
> -static const struct mtk_pmic_regs mt6358_regs = {
> +static const struct mtk_pmic_keys_pdata mt6358_pdata = {
>  	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
>  		MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
>  				   0x2, MT6358_PSC_TOP_INT_CON0, 0x5),
> @@ -255,13 +255,13 @@ static SIMPLE_DEV_PM_OPS(mtk_pmic_keys_pm_ops, mtk_pmic_keys_suspend,
>  static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
>  	{
>  		.compatible = "mediatek,mt6397-keys",
> -		.data = &mt6397_regs,
> +		.data = &mt6397_pdata,
>  	}, {
>  		.compatible = "mediatek,mt6323-keys",
> -		.data = &mt6323_regs,
> +		.data = &mt6323_pdata,
>  	}, {
>  		.compatible = "mediatek,mt6358-keys",
> -		.data = &mt6358_regs,
> +		.data = &mt6358_pdata,
>  	}, {
>  		/* sentinel */
>  	}
> @@ -277,7 +277,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
>  	static const char *const irqnames[] = { "powerkey", "homekey" };
>  	static const char *const irqnames_r[] = { "powerkey_r", "homekey_r" };
>  	struct mtk_pmic_keys *keys;
> -	const struct mtk_pmic_regs *mtk_pmic_regs;
> +	const struct mtk_pmic_keys_pdata *mtk_pmic_keys_pdata;
>  	struct input_dev *input_dev;
>  	const struct of_device_id *of_id =
>  		of_match_device(of_mtk_pmic_keys_match_tbl, &pdev->dev);
> @@ -288,7 +288,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
>  
>  	keys->dev = &pdev->dev;
>  	keys->regmap = pmic_chip->regmap;
> -	mtk_pmic_regs = of_id->data;
> +	mtk_pmic_keys_pdata = of_id->data;
>  
>  	keys->input_dev = input_dev = devm_input_allocate_device(keys->dev);
>  	if (!input_dev) {
> @@ -310,7 +310,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
>  	}
>  
>  	for_each_child_of_node(node, child) {
> -		keys->keys[index].regs = &mtk_pmic_regs->keys_regs[index];
> +		keys->keys[index].regs = &mtk_pmic_keys_pdata->keys_regs[index];
>  
>  		keys->keys[index].irq =
>  			platform_get_irq_byname(pdev, irqnames[index]);
> @@ -358,7 +358,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
>  		return error;
>  	}
>  
> -	mtk_pmic_keys_lp_reset_setup(keys, mtk_pmic_regs->pmic_rst_reg);
> +	mtk_pmic_keys_lp_reset_setup(keys, mtk_pmic_keys_pdata->pmic_rst_reg);
>  
>  	platform_set_drvdata(pdev, keys);
>  
> -- 
> 2.35.2
