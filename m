Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9A5429DC0
	for <lists+linux-input@lfdr.de>; Tue, 12 Oct 2021 08:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbhJLGdv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Oct 2021 02:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232340AbhJLGdu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Oct 2021 02:33:50 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C18DC061570;
        Mon, 11 Oct 2021 23:31:49 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id t2so63458132wrb.8;
        Mon, 11 Oct 2021 23:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=/yaxBYLNhr7azLryClYJJw40Q60DIU/cT3EkSFMT5MM=;
        b=qQRc0UwaV8VLr0DEw01f0PmT9KCjNZpa00ePp36vo8oS1rtQHqKVOU1QztCFviyXET
         6gNNJnUymP29rqgdHCSW1Ik11sY9sympmwQbPLZrFSkHKBZImIDt3TLfOvrHDbvlIp3y
         0N723Xjz/DoaZa4QtqC59sJhr5SefFzwcnhJKuBfMtvILCXIiCrSH35PIp8g+QlGxil3
         DbOe4sRaRSF1QEw7IC/fRrqVoQi92ZLlLk52wbquIuEG9q/PIRDY2ceUDQ9cgFH73w6J
         fozbJ9FPsCoG6Fmx9GXMGn+WwxD9TIY8wyOxk0gyh35If2zkD3y5Favl5nHGlVUK1Ce8
         +lAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/yaxBYLNhr7azLryClYJJw40Q60DIU/cT3EkSFMT5MM=;
        b=KooleRSU1MmpSuFYzFc4lRsflgoB4faXclR1ak1Y/64nybOm3TqsXmOO+M0fjJndXn
         ivTQOSMOyn8Gk/kdD5t2Au7MXSvR8LajehWpfyGoQaBGf1goYLXXfu7iEaDUT7FWzVJm
         HQk2xznq2wo/L0bCqzMkXFcDrcRqY9KIw5kJqLgEqXHnvo2cIZc/wIFss3BKKCKYW+XJ
         pBbd+oTAdCjFzMmWhqRLun1JiJQGskj2Qzjaxwa923DONg6Xsp0Mo+LvkAtXRoxb2NpT
         Y6DG40TtM19HheEnmKjOqhmg08xp/d4u1lDnwvQ6Z890ssD2acf5AFhi907lzip0P9Hx
         DNpQ==
X-Gm-Message-State: AOAM530f2GVX6wHipUgq33KmWCxOzyMSzMJoKrpbC0H6ITt42mbQiACo
        QYZQrig5WYfSc/9vz5A0xc4=
X-Google-Smtp-Source: ABdhPJwsw7/crgsyvPPuer5onjTMT7HkB+Zjc66YbwQGW94FXUxVs0YqpS5ulkawoXHBBp0MsjHQ8Q==
X-Received: by 2002:adf:e390:: with SMTP id e16mr29259610wrm.217.1634020308024;
        Mon, 11 Oct 2021 23:31:48 -0700 (PDT)
Received: from [192.168.1.21] ([195.245.16.219])
        by smtp.gmail.com with ESMTPSA id z133sm1592231wmc.45.2021.10.11.23.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 23:31:47 -0700 (PDT)
Message-ID: <0659a1c0088e573eb04caa87e6673ebc1ce79702.camel@gmail.com>
Subject: Re: [PATCH 1/4] Input: ep93xx_keypad - annotate suspend/resume as
 __maybe_unused
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Date:   Tue, 12 Oct 2021 08:31:46 +0200
In-Reply-To: <20211012013735.3523140-1-dmitry.torokhov@gmail.com>
References: <20211012013735.3523140-1-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi!

On Mon, 2021-10-11 at 18:37 -0700, Dmitry Torokhov wrote:
> Instead of guarding suspend/resume methods with #ifdef CONFIG_PM
> let's mark them as __maybe_unused as this allows better compile
> coverage.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
>  drivers/input/keyboard/ep93xx_keypad.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/keyboard/ep93xx_keypad.c b/drivers/input/keyboard/ep93xx_keypad.c
> index e0e931e796fa..a0c6cdf8e0d3 100644
> --- a/drivers/input/keyboard/ep93xx_keypad.c
> +++ b/drivers/input/keyboard/ep93xx_keypad.c
> @@ -175,8 +175,7 @@ static void ep93xx_keypad_close(struct input_dev *pdev)
>  }
>  
>  
> -#ifdef CONFIG_PM_SLEEP
> -static int ep93xx_keypad_suspend(struct device *dev)
> +static int __maybe_unused ep93xx_keypad_suspend(struct device *dev)
>  {
>         struct platform_device *pdev = to_platform_device(dev);
>         struct ep93xx_keypad *keypad = platform_get_drvdata(pdev);
> @@ -197,7 +196,7 @@ static int ep93xx_keypad_suspend(struct device *dev)
>         return 0;
>  }
>  
> -static int ep93xx_keypad_resume(struct device *dev)
> +static int __maybe_unused ep93xx_keypad_resume(struct device *dev)
>  {
>         struct platform_device *pdev = to_platform_device(dev);
>         struct ep93xx_keypad *keypad = platform_get_drvdata(pdev);
> @@ -220,7 +219,6 @@ static int ep93xx_keypad_resume(struct device *dev)
>  
>         return 0;
>  }
> -#endif
>  
>  static SIMPLE_DEV_PM_OPS(ep93xx_keypad_pm_ops,
>                          ep93xx_keypad_suspend, ep93xx_keypad_resume);

-- 
Alexander Sverdlin.


