Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43016642949
	for <lists+linux-input@lfdr.de>; Mon,  5 Dec 2022 14:23:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbiLENXq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Dec 2022 08:23:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbiLENXq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 5 Dec 2022 08:23:46 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE2321AF00
        for <linux-input@vger.kernel.org>; Mon,  5 Dec 2022 05:23:43 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id d1so18516397wrs.12
        for <linux-input@vger.kernel.org>; Mon, 05 Dec 2022 05:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vwOyxQThy1veCX1PEjc6TquESN4o7K2GBr3ebuhhj7E=;
        b=BhLFVJJt2G7XCNoY4mNNSqOvQtWmCU/K3AELjc0E/rpLT7VBQHJ1MMtvw67BZbLTm+
         G+q617lv3IjAFhTPpu43OHM6Wh5720oYk7vfqajON6JhKEf6TiqHQaHrPR2b2B9tCQvA
         +p1sYVJ7CV6u7wSuRdt8KFvpP+jte2RcnA9Z7MuzZk5CoEZbu0/UFxx5GSIMqkOEsxfO
         umfJbZZZcjm+CAGugXSLY+/N9XA85wNmyjIKjvrMug/CCNnXsOZMF+EKiSz0X6/hLafd
         ZyvZ05MR/wnnKtEpm3gpYbX4lE4507vgRTzWvoMLLVedDm3n6SvRRFzBMcB6uixbs8Bf
         svdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vwOyxQThy1veCX1PEjc6TquESN4o7K2GBr3ebuhhj7E=;
        b=kYTcB+ijE3WlEhP9nOvAyf4ez/fTMVY9Ecu98rgHJqBuKt1U5uzZM5xtX+G6Tn7SZA
         FnMswQtt/ikDOP4/LmTkZDIaXiWCECnp97fuHSNYE+3ViYss2gmAJxzLdhvCawg8LmJY
         Hv4x38+vohIZ1kZiFPrbeAYR7GR9GPDEUQzximKAmzYcPZCtwDeK2yf+h8F93PGdDK8L
         RfsSVaP1CKXj6u8ZsqoSRL5m4Ok7KUI1eiBHAjuWSag2SU/g5y/7BQdvbaXQC3PXQV+S
         QVzCa2h9+i6yRZhTTH1xBO3P4zmJijvHybqwqdhQi0KkijvKJ2FBtBwe5DUpVr7pBNAo
         ahWQ==
X-Gm-Message-State: ANoB5pkMsPCaKG/y9GvfKWB5vcEv6eAsW+XlDfGLAaft7v8e8b1A89zI
        x8zv519E7+V203snyRHU2tv+sQ==
X-Google-Smtp-Source: AA0mqf6qHSOKR78lzrfpr/GjPsTOZdUgfcPMpZsmQpn5/3VYPDxqa9MpAroSoIYCF2IOjv3qXE0VUw==
X-Received: by 2002:adf:bb0b:0:b0:242:61ab:5976 with SMTP id r11-20020adfbb0b000000b0024261ab5976mr3337966wrg.257.1670246622079;
        Mon, 05 Dec 2022 05:23:42 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o35-20020a05600c512300b003a3442f1229sm23286460wms.29.2022.12.05.05.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 05:23:41 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Jonathan Cameron <jic23@kernel.org>, linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 09/32] Input: mtk-pmic-keys - switch to
 DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
In-Reply-To: <20221204180841.2211588-10-jic23@kernel.org>
References: <20221204180841.2211588-1-jic23@kernel.org>
 <20221204180841.2211588-10-jic23@kernel.org>
Date:   Mon, 05 Dec 2022 14:23:38 +0100
Message-ID: <87a642rnl1.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Dec 04, 2022 at 18:08, Jonathan Cameron <jic23@kernel.org> wrote:

> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
> SIMPLE_DEV_PM_OPS() is deprecated as it requires explicit protection
> against unused function warnings.  The new combination of pm_sleep_ptr()
> and DEFINE_SIMPLE_DEV_PM_OPS() allows the compiler to see the functions,
> thus suppressing the warning, but still allowing the unused code to be
> removed. Thus also drop the __maybe_unused markings.
>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/keyboard/mtk-pmic-keys.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
> index 9b34da0ec260..3d4ffa25e3df 100644
> --- a/drivers/input/keyboard/mtk-pmic-keys.c
> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> @@ -231,7 +231,7 @@ static int mtk_pmic_key_setup(struct mtk_pmic_keys *keys,
>  	return 0;
>  }
>  
> -static int __maybe_unused mtk_pmic_keys_suspend(struct device *dev)
> +static int mtk_pmic_keys_suspend(struct device *dev)
>  {
>  	struct mtk_pmic_keys *keys = dev_get_drvdata(dev);
>  	int index;
> @@ -247,7 +247,7 @@ static int __maybe_unused mtk_pmic_keys_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused mtk_pmic_keys_resume(struct device *dev)
> +static int mtk_pmic_keys_resume(struct device *dev)
>  {
>  	struct mtk_pmic_keys *keys = dev_get_drvdata(dev);
>  	int index;
> @@ -263,8 +263,8 @@ static int __maybe_unused mtk_pmic_keys_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static SIMPLE_DEV_PM_OPS(mtk_pmic_keys_pm_ops, mtk_pmic_keys_suspend,
> -			mtk_pmic_keys_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(mtk_pmic_keys_pm_ops, mtk_pmic_keys_suspend,
> +				mtk_pmic_keys_resume);
>  
>  static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
>  	{
> @@ -387,7 +387,7 @@ static struct platform_driver pmic_keys_pdrv = {
>  	.driver = {
>  		   .name = "mtk-pmic-keys",
>  		   .of_match_table = of_mtk_pmic_keys_match_tbl,
> -		   .pm = &mtk_pmic_keys_pm_ops,
> +		   .pm = pm_sleep_ptr(&mtk_pmic_keys_pm_ops),
>  	},
>  };
>  
> -- 
> 2.38.1
