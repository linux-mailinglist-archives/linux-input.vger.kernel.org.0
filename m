Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 050326059C7
	for <lists+linux-input@lfdr.de>; Thu, 20 Oct 2022 10:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbiJTIbl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Oct 2022 04:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbiJTIbj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Oct 2022 04:31:39 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2E6A15D0A0
        for <linux-input@vger.kernel.org>; Thu, 20 Oct 2022 01:31:37 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so1663888wmb.0
        for <linux-input@vger.kernel.org>; Thu, 20 Oct 2022 01:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/hCpDbVRoc+q/9gSPADK7PRRzF3tzQ7+LRZVH7HnjY8=;
        b=ZOwrGT8YlcyuCniv3v2gcTGYsyOsF1bRQP+5/n5cJtEfVLBTSwrkPRnwTHYdXH5AS4
         GpbQhf/EJDFhESbVNKeMcOA4AP/2TpsnqAwRkh1zuw8DPcNFNt3I1DKvWc8OhxL47HyO
         94eUlug5J2DmCBN69I9GYPdf+CiQJEmygXdjpETIGeowjOre0R79sv7c1Q9RQ0aeSgjA
         mt/1gthUycDV4pJjcXRfNC8PgwaWu2zZ3S9r53z1oORZ2tRITN3YHmhzLqhKj86MHQ3y
         7h/s9aWZfmFMX5F4eVOhSoMD5mrH13LUCX+GXuMWABU1wXjzGcvvXu+zda+XvTRoiu9v
         naog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/hCpDbVRoc+q/9gSPADK7PRRzF3tzQ7+LRZVH7HnjY8=;
        b=2vUmrXSt0GfxxkZJxmoxiweNlqaTd9CWHMLzY0Z4dq593Ikm6+yTaOt4pYs4Z+Al5b
         YR01SM7gf+2Aks8nvZroAbaI9t2BAijlsAOf7gkJtohIS63gHIEVX8Y7z7uFF/4i6way
         IHDI0ECf9dZRjEqm1m3m11CRZ+N8AqKGI7C5T4JdiD9dtDP4HZRetd7TBjFMLMT4iK3e
         g8Izh0qNndMcXLQzjV6zW26VkN+Cd5yot3Eh7UoNHW1G3SEgRO4BWzRm6AdLPASpQQkO
         0RlKkLul6DrtwOJGABKtIHuUAXg6/ONWbnMLPG8f2bVMMW/qtopn+UC4pmDuovHT2fVR
         P2ng==
X-Gm-Message-State: ACrzQf2fzYRDrWfbLKw/E01orgucGytR3atSgg3o6qdxg0ENDF7e3iTk
        /nwxiYwhaVsVO354V/6x7/M3PA==
X-Google-Smtp-Source: AMsMyM6iQl1yh/y0HEH9uS1CZVI3KrJmHjy5uCOsdpFu/YF84jxhh6xVVSE8CZ2CG6O57/gkvjT9Lg==
X-Received: by 2002:a05:600c:a08:b0:3bc:eb4c:b90 with SMTP id z8-20020a05600c0a0800b003bceb4c0b90mr8488441wmp.184.1666254696083;
        Thu, 20 Oct 2022 01:31:36 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id j28-20020a5d6e5c000000b0022cd27bc8c1sm19246814wrz.9.2022.10.20.01.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 01:31:35 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Jason Andryuk <jandryuk@gmail.com>, linux-kernel@vger.kernel.org
Cc:     xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
        Phillip Susi <phill@thesusis.net>, stable@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: xen-kbdfront - drop keys to shrink modalias
In-Reply-To: <20221019201458.21803-1-jandryuk@gmail.com>
References: <20221019201458.21803-1-jandryuk@gmail.com>
Date:   Thu, 20 Oct 2022 10:31:34 +0200
Message-ID: <87zgdq99qx.fsf@baylibre.com>
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

On Wed, Oct 19, 2022 at 16:14, Jason Andryuk <jandryuk@gmail.com> wrote:

> xen kbdfront registers itself as being able to deliver *any* key since
> it doesn't know what keys the backend may produce.
>
> Unfortunately, the generated modalias gets too large and uevent creation
> fails with -ENOMEM.
>
> This can lead to gdm not using the keyboard since there is no seat
> associated [1] and the debian installer crashing [2].
>
> Trim the ranges of key capabilities by removing some BTN_* ranges.
> While doing this, some neighboring undefined ranges are removed to trim
> it further.
>
> This removes:
> BTN_DPAD_UP(0x220)..BTN_DPAD_RIGHT(0x223)
> Empty space 0x224..0x229
>
> Emtpy space 0x2bd..0x2bf
> BTN_TRIGGER_HAPPY(0x2c0)..BTN_TRIGGER_HAPPY40(0x2e7)
> Empty space 0x2e8..0x2ff
>
> The modalias shrinks from 2082 to 1754 bytes.
>
> [1] https://github.com/systemd/systemd/issues/22944
> [2] https://lore.kernel.org/xen-devel/87o8dw52jc.fsf@vps.thesusis.net/T/
>
> Cc: Phillip Susi <phill@thesusis.net>
> Cc: stable@vger.kernel.org
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/misc/xen-kbdfront.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/input/misc/xen-kbdfront.c b/drivers/input/misc/xen-kbdfront.c
> index 8d8ebdc2039b..23f37211be78 100644
> --- a/drivers/input/misc/xen-kbdfront.c
> +++ b/drivers/input/misc/xen-kbdfront.c
> @@ -256,7 +256,14 @@ static int xenkbd_probe(struct xenbus_device *dev,
>  		__set_bit(EV_KEY, kbd->evbit);
>  		for (i = KEY_ESC; i < KEY_UNKNOWN; i++)
>  			__set_bit(i, kbd->keybit);
> -		for (i = KEY_OK; i < KEY_MAX; i++)
> +		/* In theory we want to go KEY_OK..KEY_MAX, but that grows the
> +		 * modalias line too long.  KEY_KBD_LCD_MENU5 is the last
> +		 * defined non-button key. There is a gap of buttons from
> +		 * BTN_DPAD_UP..BTN_DPAD_RIGHT and KEY_ALS_TOGGLE is the next
> +		 * defined. */
> +		for (i = KEY_OK; i < BTN_DPAD_UP; i++)
> +			__set_bit(i, kbd->keybit);
> +		for (i = KEY_ALS_TOGGLE; i <= KEY_KBD_LCD_MENU5; i++)
>  			__set_bit(i, kbd->keybit);
>  
>  		ret = input_register_device(kbd);
> -- 
> 2.37.3
