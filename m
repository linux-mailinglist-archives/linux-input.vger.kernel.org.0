Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF9FF4D2942
	for <lists+linux-input@lfdr.de>; Wed,  9 Mar 2022 08:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbiCIHIa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Mar 2022 02:08:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbiCIHI2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Mar 2022 02:08:28 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47984110F
        for <linux-input@vger.kernel.org>; Tue,  8 Mar 2022 23:07:28 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id j17so1580693wrc.0
        for <linux-input@vger.kernel.org>; Tue, 08 Mar 2022 23:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=UKkOGj96yEPkJXREWpXf/ZxC/thW+x6mQGM5X+KzoqI=;
        b=Vm5nzBF+VMiWvwLDRlVhoTttIZnnwG9hQkgmU6lhcEKjellU9RaCXIbHUQ+s9vopbh
         fqUxjfZu9KfNHw0ik21qV5WvsEPBLb2xLeCE8bYKqM/3o3HZ1rPywXSqZ9IE+PZaAjp+
         AawEkLPcP0HZjlHvEiAcW9G3xfjwubjC6WHmMqI4DP4R5u2skH7xfL1CbfI0Jypn/WjX
         7XB4E+IxevaAP46ENlzhPOzW1MAcpzDA95PH3tYZ5W/2xTrtnpB5X7JR9OtP2Y/NCE2t
         0iHGLJSrJsFeBMJgqCzv2c+BS8uvMLvBEeShcEIIf/XXswwqrpXuzW0N/y6TKZWWP7jw
         p/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=UKkOGj96yEPkJXREWpXf/ZxC/thW+x6mQGM5X+KzoqI=;
        b=kdLE+NpZPBiMZTy2a7Yrlr88qaZ/PJfADR6DS1IuakEClhlwQ0XVNN6vsJGDCcVjIO
         fyYzf9ZZRIxBAoueUjPe/7mQcUsf+wl74EnaKQMcJGgRLBGhLwAXHnLF0WHb9pnhEuFp
         liWjhJxnGY+Yytiz6GS2Dg/ibcOliZAzfIYsPTTQrF0NU8lvR0IdKdUkvFvNycSXqN3Q
         f9LTcyUijaj7MT73gmpQ4Ip3YLhhDe45eqHUgbT7Jj7NTBqM3OnvLP3cfO4FfnSAzMpy
         7Ew4ZjbJZ+VLE9LSemUPiR03VGY9aTgEG8/BqxrvguHO/Z7vxSJErNxjlqgJydzCSr7G
         2YZA==
X-Gm-Message-State: AOAM530uEZbOd/EElSYN7vmFKoIrxiT4Uv69Wyq9tCWPVd2gDJ0Z91Jh
        wqs1EPB3vzCuoO1HV2Mt1v8y0Q==
X-Google-Smtp-Source: ABdhPJzlhZkmPvte5X0WJu7dgTlK9ftWSz9F9e479R/RNfghnaKH7QPJhwJ/dXiKt3gcN/HGMjhong==
X-Received: by 2002:a5d:47a4:0:b0:1f0:46e4:19bc with SMTP id 4-20020a5d47a4000000b001f046e419bcmr16034223wrb.601.1646809646825;
        Tue, 08 Mar 2022 23:07:26 -0800 (PST)
Received: from localhost ([2a01:e0a:a84:e4a0:bc38:63f8:c31:e108])
        by smtp.gmail.com with ESMTPSA id k18-20020adfe8d2000000b0020294da2b42sm1240410wrn.117.2022.03.08.23.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 23:07:26 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     cgel.zte@gmail.com, dmitry.torokhov@gmail.com
Cc:     matthias.bgg@gmail.com, lv.ruyi@zte.com.cn,
        fengping.yu@mediatek.com, m.felsch@pengutronix.de,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH] input: fix variable type
In-Reply-To: <20220308025054.2077162-1-lv.ruyi@zte.com.cn>
References: <20220308025054.2077162-1-lv.ruyi@zte.com.cn>
Date:   Wed, 09 Mar 2022 08:07:25 +0100
Message-ID: <875yontxhu.fsf@baylibre.com>
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

On Tue, Mar 08, 2022 at 02:50, cgel.zte@gmail.com wrote:

> From: Lv Ruyi (CGEL ZTE) <lv.ruyi@zte.com.cn>
>
> The irq is defined unsigned int. If the platform_get_irq return a negative
> value, data type cast may result in error.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi (CGEL ZTE) <lv.ruyi@zte.com.cn>
> ---
>  drivers/input/keyboard/mt6779-keypad.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
> index 5ff23250ed37..0dbbddc7f298 100644
> --- a/drivers/input/keyboard/mt6779-keypad.c
> +++ b/drivers/input/keyboard/mt6779-keypad.c
> @@ -91,7 +91,7 @@ static void mt6779_keypad_clk_disable(void *data)
>  static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
>  {
>  	struct mt6779_keypad *keypad;
> -	unsigned int irq;
> +	int irq;
>  	u32 debounce;
>  	bool wakeup;
>  	int error;

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> -- 
> 2.25.1
