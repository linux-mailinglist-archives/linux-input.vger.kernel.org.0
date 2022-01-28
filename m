Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2BB49F6C9
	for <lists+linux-input@lfdr.de>; Fri, 28 Jan 2022 11:03:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbiA1KDO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Jan 2022 05:03:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235921AbiA1KDM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Jan 2022 05:03:12 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 709B2C06173B
        for <linux-input@vger.kernel.org>; Fri, 28 Jan 2022 02:03:12 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id i187-20020a1c3bc4000000b0034d2ed1be2aso7802111wma.1
        for <linux-input@vger.kernel.org>; Fri, 28 Jan 2022 02:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=vQHl1kKziPP//RPPVFscaIeYrQPiD/BKe7PC4j8ax6c=;
        b=Fzv1T+rGFotkDidQaBLfjgeshzec1rdrJugreJ4E4ER511twVIjRsOWbmAmgAJhSjH
         soAr9SxHMN2Xd4icay0VOiQTdwpi3tz3SKBN/fxILgf7SD50gxPSUZraeQSsfgeQBO9V
         DcZ3rReVzhtCSf7rJ7QT7dWsvh8/pFCQroSXhYUEzn04XvlVonYA4PD+9GHrmRcD7krF
         ERhZuKgCrhUFpyQ6g7pNA5XYtNK6hYzhqRzujjb0YtEL9lqv9De3qaGgo2ya/1uWGHR2
         Zx+3EkM+VvtQ+Elu29Bzbqgp+vR1468RQhMEwCCIdI1c1c1JhN8qxFW2kYDS4nFmRwxp
         CE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=vQHl1kKziPP//RPPVFscaIeYrQPiD/BKe7PC4j8ax6c=;
        b=WenIIGPss6QQnl+vgT4Lw7RDdhJIoOxczsNXPBnUiUB0QOWmPI977mRvpaWoOoAZMI
         3ivfPGdcazvxjo1Tx7JN5MDgpNsF1prBwOhWmlOrvBgUgpKq7pRR21QFf4alhIFaASdi
         Jh6lDl8kkqqeq3Pj6hZc796ZV0mjM3xOGbA0tYoX8gsC8gZ+1FTWc/aMIX1J8NpBhBv0
         u0VlpgM2ET5Tc31SSzhtpBsN70USpBzlDixQIZ3ksHYN7l2Vo+Ob03lt17v84GhB7yKQ
         qPwPNUnPUgglVpSOwg8m9ZxUInodiVl1/0hVQ7hv3vDVWUjdoiiUJh/cZUO+fmHpYPa/
         EHsQ==
X-Gm-Message-State: AOAM532u67Vmi0KJBRCXikxTNQkVQLGHlhlmBr0Z3jVP6CzelzOF87Ee
        dhfQCDVfflSDzPhW32gdTFYYlA==
X-Google-Smtp-Source: ABdhPJyVqxevH/KOBMCOHMp1EH4UYJ2z6Ysjjih/WI63AVmR57PKiAmJIQN3MQ9MQW35Da3EV7C4KA==
X-Received: by 2002:a7b:c350:: with SMTP id l16mr6542037wmj.146.1643364190814;
        Fri, 28 Jan 2022 02:03:10 -0800 (PST)
Received: from localhost ([2a01:cb1a:7d:5d4:c222:c6fc:1de7:17bc])
        by smtp.gmail.com with ESMTPSA id e10sm5407686wrq.53.2022.01.28.02.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 02:03:10 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Fengping Yu <fengping.yu@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Fabien Parent <fparent@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 2/3] Input: mt6779-keypad - Add MediaTek keypad driver
In-Reply-To: <YfK4UcuCfF7JfI7H@smile.fi.intel.com>
References: <20220127111526.3716689-1-mkorpershoek@baylibre.com>
 <20220127111526.3716689-3-mkorpershoek@baylibre.com>
 <YfK4UcuCfF7JfI7H@smile.fi.intel.com>
Date:   Fri, 28 Jan 2022 11:03:08 +0100
Message-ID: <87v8y4p483.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jan 27, 2022 at 17:20, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Thu, Jan 27, 2022 at 12:15:25PM +0100, Mattijs Korpershoek wrote:
>> From: "fengping.yu" <fengping.yu@mediatek.com>
>> 
>> This patch adds matrix keypad support for Mediatek SoCs.
>
> Some comments which may be addressed now or in the follow-up patch(es).
> Up to you.
Hi Andy,
Thank you for your review and your suggestions.

>
> ...
>
>> +static const struct regmap_config mt6779_keypad_regmap_cfg = {
>> +	.reg_bits = 32,
>> +	.val_bits = 32,
>
>> +	.reg_stride = sizeof(u32),
>
> I'm wondering if we need this when we have reg_bits = 32 already.

Per my understanding, .reg_stride is mainly used to check for invalid register
addresses in regmap_{read,write}():

    if (!IS_ALIGNED(reg, map->reg_stride))
            return -EINVAL;

If .reg_stride is not set, regmap core will default it to 1.
It's not computed from reg_bits.

So I think we still need it.
>
>> +	.max_register = 36,
>> +};
>
> ...
>
>> +	regmap_write(keypad->regmap, MTK_KPD_DEBOUNCE,
>> +		     (debounce * 32) & MTK_KPD_DEBOUNCE_MASK);
>
> I'm wondering if << 5 is more specific to show that the value
> is based on 2^5 units.

The datasheet I've seen states: "De-bounce time = KP_DEBOUNCE / 32ms"
But rewriting it as 1 << 5 seems reasonable as well:
regmap_write(keypad->regmap, MTK_KPD_DEBOUNCE,
            (debounce * (1 << 5)) & MTK_KPD_DEBOUNCE_MASK);

I don't have any preference on this one.
If I have to send a v21, I will rewrite it using (1 << 5)

>
> ...
>
>> +	error = devm_add_action_or_reset(&pdev->dev, mt6779_keypad_clk_disable, keypad->clk);
>
> You have this long line...
>
>> +	error = devm_request_threaded_irq(&pdev->dev, irq,
>> +					  NULL, mt6779_keypad_irq_handler,
>> +					  IRQF_ONESHOT,
>> +					  MTK_KPD_NAME, keypad);
>
> ...at the same time you may reduce LOCs here...
Ack. will join lines to reduce LOCs if I have to send v21.
>
>> +	if (error) {
>> +		dev_err(&pdev->dev, "Failed to request IRQ#%d:%d\n",
>> +			irq, error);
>
> ...and here.
Ack. will join lines to reduce LOCs if I have to send v21.

>
>> +		return error;
>> +	}
>
> -- 
> With Best Regards,
> Andy Shevchenko
