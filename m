Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53B9463AA0C
	for <lists+linux-input@lfdr.de>; Mon, 28 Nov 2022 14:51:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232141AbiK1NvP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Nov 2022 08:51:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232133AbiK1NvO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Nov 2022 08:51:14 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D9261EC40
        for <linux-input@vger.kernel.org>; Mon, 28 Nov 2022 05:51:12 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id o7-20020a05600c510700b003cffc0b3374so8410371wms.0
        for <linux-input@vger.kernel.org>; Mon, 28 Nov 2022 05:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=A4qIw9CSlOm6ggm9ciNJN1TeZJOcMp5IoO7x7apMWbY=;
        b=PUheZR1NpZnwy4KRhNf7nnLwIkGHB+FvPg3d4NllsEb6kJdBq7yONBrs3hMeyWlnn1
         zq7ZDz79pngmWJGbOOpg7tjdv722XGMIA04Jsft2i512lr13vEq85Gy8pUH0PKhRieln
         XQS+nVeEIzJPmfy5m7XTKjGQ6VRITUaWFNyBu5tcAumfrmGV5H5nWfrykIKNxDbwpvTB
         8hgO296977TfbN+W61Ok9Fi/tYwiQfR/1wUcsq3pyTu5Pn6o+ohkdoHtkmUZPSdSZ+qq
         Sv+9WnU8J0Vs/sWd7h/Pqtpe60IPEmIyYYHgzk8Y67wIP/PY01VQyNFEVT2hCPxE01im
         /Qug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A4qIw9CSlOm6ggm9ciNJN1TeZJOcMp5IoO7x7apMWbY=;
        b=dI8OSmpsZHktzoUszhJZF5l+3xlpagL1duCtS1SiolhTdjzEpItho/eewwDLC74IJ1
         GlxULyII8pyCmLGxHynQ7tffLdkNo8IhSsS3MiL+PvMu0/aCm1i1cDxHRyvn3uR/WJWY
         wIaO+b/yQ0Rq+Bm/ms1be0ZxRccQyYIwQMuhGFUpVS3LV7GMEnwnH6hbNWGQgNeJqbu+
         5WuhsHXICK/gvn3OVnu3z8jHs/7JlIWQgqU5QOZ2uemwbEl1m7m2nKlqKJXnuoGTbEva
         NnMDa8EljVM0vyI13Gkuq7fZ2qdvcqH+/d2lqsvv6oDacN6dhvvSpKkVIyJ4z45owEKC
         G8TA==
X-Gm-Message-State: ANoB5pkoeLAbyN/RbwRSuT5O1W8AYUUlBKwrP5JVZziavY9fTFFQQowV
        NbbuJyuJf7dSWAUYfcP9GOvNuA==
X-Google-Smtp-Source: AA0mqf6nkBPng31LSUbczvahgKFmzQ1kx1CywnM+9hcT4gIL7Y/Lh2Y4uDKbcBxCZeQ9OdymBWy/Ug==
X-Received: by 2002:a1c:f606:0:b0:3b4:bf6d:f9ba with SMTP id w6-20020a1cf606000000b003b4bf6df9bamr37179147wmc.133.1669643471076;
        Mon, 28 Nov 2022 05:51:11 -0800 (PST)
Received: from localhost ([2a01:cb19:85e6:1900:2bf7:7388:731d:c4e1])
        by smtp.gmail.com with ESMTPSA id g6-20020a5d5406000000b00241d2df4960sm10884840wrv.17.2022.11.28.05.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 05:51:10 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     "Lin, Meng-Bo" <linmengbo0689@protonmail.com>,
        linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Corey Minyard <cminyard@mvista.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Zheng Yongjun <zhengyongjun3@huawei.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Stephan Gerhold <stephan@gerhold.net>,
        Nikita Travkin <nikita@trvn.ru>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] Input: stmfts - retry commands after timeout
In-Reply-To: <20221117142753.2477-1-linmengbo0689@protonmail.com>
References: <20221117142753.2477-1-linmengbo0689@protonmail.com>
Date:   Mon, 28 Nov 2022 14:51:09 +0100
Message-ID: <87wn7frxv6.fsf@baylibre.com>
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

On Thu, Nov 17, 2022 at 14:28, "Lin, Meng-Bo" <linmengbo0689@protonmail.com> wrote:

> Add #define STMFTS_RETRY_COUNT 3 to retry stmfts_command() 3 times.
> Without it, STMFTS_SYSTEM_RESET or STMFTS_SLEEP_OUT may return -110 to
> failed attempt due to no event received for completion.
>
> Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/touchscreen/stmfts.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
> index d5bd170808fb..22de34966373 100644
> --- a/drivers/input/touchscreen/stmfts.c
> +++ b/drivers/input/touchscreen/stmfts.c
> @@ -68,6 +68,7 @@
>  #define STMFTS_DATA_MAX_SIZE	(STMFTS_EVENT_SIZE * STMFTS_STACK_DEPTH)
>  #define STMFTS_MAX_FINGERS	10
>  #define STMFTS_DEV_NAME		"stmfts"
> +#define STMFTS_RETRY_COUNT	3
>  
>  enum stmfts_regulators {
>  	STMFTS_REGULATOR_VDD,
> @@ -317,19 +318,20 @@ static irqreturn_t stmfts_irq_handler(int irq, void *dev)
>  
>  static int stmfts_command(struct stmfts_data *sdata, const u8 cmd)
>  {
> -	int err;
> +	int err, retry;
>  
>  	reinit_completion(&sdata->cmd_done);
>  
> -	err = i2c_smbus_write_byte(sdata->client, cmd);
> -	if (err)
> -		return err;
> -
> -	if (!wait_for_completion_timeout(&sdata->cmd_done,
> -					 msecs_to_jiffies(1000)))
> -		return -ETIMEDOUT;
> +	for (retry = 0; retry < STMFTS_RETRY_COUNT; retry++) {
> +		err = i2c_smbus_write_byte(sdata->client, cmd);
> +		if (err)
> +			return err;
>  
> -	return 0;
> +		if (wait_for_completion_timeout(&sdata->cmd_done,
> +						msecs_to_jiffies(1000)))
> +			return 0;
> +	}
> +	return -ETIMEDOUT;
>  }
>  
>  static int stmfts_input_open(struct input_dev *dev)
> -- 
> 2.30.2
