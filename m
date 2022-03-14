Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1909F4D8711
	for <lists+linux-input@lfdr.de>; Mon, 14 Mar 2022 15:38:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236783AbiCNOjL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Mar 2022 10:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237905AbiCNOjK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Mar 2022 10:39:10 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47DA1DED0
        for <linux-input@vger.kernel.org>; Mon, 14 Mar 2022 07:37:58 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id r6so23914680wrr.2
        for <linux-input@vger.kernel.org>; Mon, 14 Mar 2022 07:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=1H47GtrR4sj+BFcR6DrzSoSzorsYvLbj5gf1Z0F31Js=;
        b=v9xUYrp1M+T4r9G7pfEP1yq8+liGfVprVCrAA3Uj1hkxLGZHEcXuoHdiTIUq/MMdrB
         xNEnbHjMOsdgvnLegS0ErwFWWeF5ZNM4ad9DL9zxPRD7PWvTiKGz4aOyOIk3Wgd30zfe
         8zlH3D9Nw+iKouIQeHRjEi5c2XJTjTu68BSXei7IHkn+r/4OvqXvFmxecNNG8W6lRsi8
         h03EmBfvD1G5tUByWA0zg9+I+TSFswSHGzL9FnYEtuQ5dsicr2MlTzDhHrnrwGrActIM
         +dPUCIsUgYup6ItUsJPZ1KpSI87oq5WZub/NOhV4U9eK5b1LXFq29J9r4x+Wn7YHY9TL
         6LSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=1H47GtrR4sj+BFcR6DrzSoSzorsYvLbj5gf1Z0F31Js=;
        b=6WDKki8CHUm6Ubrs+RT5eKdMGXRild3HlZbZwJwi8LGhLV7+mzM3/o0VSEZNUjzJ+W
         628038mhehubyHjE1oKziUITkQhdNd4DCBLnuOziBhkZSbrlWh5LP7COUpE/e7dMoP3q
         Ban13qBaRfB6Vegx0/Si0gcq2m9x6/2y38s2O/r2sOpZ+cs2v3LeEIde4JLCPNgNjcfc
         M/356JHhSJcK6ZpdPcXHaOOp7UhUOx1BAZUYHFyplHhsFRARhbriAFTgiD3Z3c6JH8Lk
         q10p9uD7kEocNo1Hdgp59Ob+rjU0lNgZUKhLEckp1xmhdk7O9XM3UKjPodMXbPVF+m9p
         FZkQ==
X-Gm-Message-State: AOAM532ZgH2VngIHQTezOlLTcLqCD7x3rRfNiTLbfiyjFfdnLgL1yGKa
        J81YX3yznlkve2AI6aQVjMBsGw==
X-Google-Smtp-Source: ABdhPJz9pVLkc4i/cRnZ6Zq8iAS8ZTD8YEoNOpbv0lAta8I01TxZ/xsG+kVxLbC+y2/7ECGbCOuWNA==
X-Received: by 2002:adf:a58a:0:b0:1ef:603f:fb58 with SMTP id g10-20020adfa58a000000b001ef603ffb58mr16585915wrc.472.1647268676768;
        Mon, 14 Mar 2022 07:37:56 -0700 (PDT)
Received: from localhost ([2a01:cb19:826e:8e00:1c43:3164:432d:c3c3])
        by smtp.gmail.com with ESMTPSA id n7-20020a05600c3b8700b00389a6241669sm20016392wms.33.2022.03.14.07.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 07:37:56 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "fengping.yu" <fengping.yu@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: mt6779-keypad - fix signedness bug in probe
In-Reply-To: <20220314140038.GA30883@kili>
References: <20220314140038.GA30883@kili>
Date:   Mon, 14 Mar 2022 15:37:55 +0100
Message-ID: <87wngw1tx8.fsf@baylibre.com>
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

Hi Dan,

On lun., mars 14, 2022 at 17:00, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The "irq" variable needs to be signed for the error handling to work.
>
> Fixes: f28af984e771 ("Input: mt6779-keypad - add MediaTek keypad driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Thank you for the patch.

This was already reported and fixed at [1]

[1] https://lore.kernel.org/linux-input/20220308025054.2077162-1-lv.ruyi@zte.com.cn/

> ---
>  drivers/input/keyboard/mt6779-keypad.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
> index 5ff23250ed37..abd7e346203d 100644
> --- a/drivers/input/keyboard/mt6779-keypad.c
> +++ b/drivers/input/keyboard/mt6779-keypad.c
> @@ -91,10 +91,10 @@ static void mt6779_keypad_clk_disable(void *data)
>  static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
>  {
>  	struct mt6779_keypad *keypad;
> -	unsigned int irq;
>  	u32 debounce;
>  	bool wakeup;
>  	int error;
> +	int irq;
>  
>  	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
>  	if (!keypad)
> -- 
> 2.20.1
