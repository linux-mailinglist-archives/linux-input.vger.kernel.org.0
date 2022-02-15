Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F3804B6344
	for <lists+linux-input@lfdr.de>; Tue, 15 Feb 2022 07:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232543AbiBOGHl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Feb 2022 01:07:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234308AbiBOGHk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Feb 2022 01:07:40 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C423C5592
        for <linux-input@vger.kernel.org>; Mon, 14 Feb 2022 22:07:28 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id i21so31699683pfd.13
        for <linux-input@vger.kernel.org>; Mon, 14 Feb 2022 22:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LZujN+PZ6xewyNSqi1pNV5pTrCTfjQ2eJo9kzET7s3g=;
        b=Udg8KbT4sCVO0oOAxdqPxSbLrSo2R1Zdfer4kTtafMD3TvlBcUykFfMRXgFX4xedQ7
         fmYB+aTnT2tTvSQXesi2ZxUhE3ILtdEO0MU5ULTeymrrVKOQ7tekf1Av7sOWCiHcdzRB
         +qpepI/c2nKnc/sQ/NKvhP3LzCLFBgz7DnIqvXZg5w/JSDPpkOfCUSSSMWgbPDPUzcLE
         moWoCRyzrBM8XLlBGE9HmWoWQzTm8Yj6p21bkApJ3oGPIGYwcEBMF9Hocf69NZBaBh9J
         /HTciXmfgwrpXjriGLQi4LUiI1ylr4hsmeS4wEeLea+apvCSc5nYPTciOs7vyBpPslZW
         vn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LZujN+PZ6xewyNSqi1pNV5pTrCTfjQ2eJo9kzET7s3g=;
        b=7c+sOGxSmevwewZK+hXZBO0Z0156pzvqPcuxASYQ/SC3idhRkFIaHiRfQB2NfBRqg6
         cVPuQ0Goy20ifAJNxorauJsJ1MJ9qh9Oj/KQscEUKFUWpDJtrFphqT5BGbR6fyjoQCOP
         9IA9FpESgBnQ8Utg6MYlcpG7Wf1LMaJjjwmhHyp4IabyxAUN9uFuOC64eppUravG0ieQ
         xDxAuKLoHxqtfL867A992zHiZzQ6OmdCWiZl4fzeDpEOkk3g564h9SDvfBEjubrO8JVI
         kJoe1L/G1GbBZ+iEgab4YkHCHtXnKaJyMXRbtwOr/LyOh3/CrTd0oLGBermd4jEas4No
         FTsw==
X-Gm-Message-State: AOAM531sPa8ddKPZtF5xFAh4TXxxvu5XuhjIOm+a5dDvCe3t6Ge1U7CC
        JezDwxrkwSmvS+BWrfc25BU=
X-Google-Smtp-Source: ABdhPJwFJ0KYmMwHj5CMAeShhMu+3zQL7feTZj9rZEX0bLRDLVZG9hBmZmI5KWWMm3J0uWQrtwNcCQ==
X-Received: by 2002:a05:6a00:1345:: with SMTP id k5mr2763672pfu.37.1644905247303;
        Mon, 14 Feb 2022 22:07:27 -0800 (PST)
Received: from google.com ([2620:15c:202:201:fffe:8570:13af:4c81])
        by smtp.gmail.com with ESMTPSA id q17sm38961737pfk.108.2022.02.14.22.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 22:07:26 -0800 (PST)
Date:   Mon, 14 Feb 2022 22:07:24 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, Michael Srba <Michael.Srba@seznam.cz>,
        Nikita Travkin <nikita@trvn.ru>
Subject: Re: [PATCH] Input: zinitix - Do not report shadow fingers
Message-ID: <YgtDHDbxfO/4mFRf@google.com>
References: <20220215001253.1109876-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215001253.1109876-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

On Tue, Feb 15, 2022 at 01:12:53AM +0100, Linus Walleij wrote:
> I observed the following problem with the BT404 touch pad
> running the Phosh UI:
> 
> When e.g. typing on the virtual keyboard pressing "g" would
> produce "ggg".
> 
> After some analysis it turns out the firmware reports that three
> fingers hit that coordinate at the same time, finger 0, 2 and
> 4 (of the five available 0,1,2,3,4).
> 
> DOWN
>   Zinitix-TS 3-0020: finger 0 down (246, 395)
>   Zinitix-TS 3-0020: finger 1 up (0, 0)
>   Zinitix-TS 3-0020: finger 2 down (246, 395)
>   Zinitix-TS 3-0020: finger 3 up (0, 0)
>   Zinitix-TS 3-0020: finger 4 down (246, 395)
> UP
>   Zinitix-TS 3-0020: finger 0 up (246, 395)
>   Zinitix-TS 3-0020: finger 2 up (246, 395)
>   Zinitix-TS 3-0020: finger 4 up (246, 395)
> 
> This is one touch and release: i.e. this is all reported on
> touch (down) and release.
> 
> After augmenting the driver to remember all fingers we report in
> a single touch event and filter out any duplicates we get this
> debug print:
> 
> DOWN
>   Zinitix-TS 3-0020: finger 0 down (257, 664)
>   Zinitix-TS 3-0020: finger 1 up (0, 0)
>   Zinitix-TS 3-0020: ignore shadow finger 2 at (257, 664)
>   Zinitix-TS 3-0020: ignore shadow finger 3 at (0, 0)
>   Zinitix-TS 3-0020: ignore shadow finger 4 at (257, 664)
> UP
>   Zinitix-TS 3-0020: finger 0 up (257, 664)
>   Zinitix-TS 3-0020: ignore shadow finger 2 at (257, 664)
>   Zinitix-TS 3-0020: ignore shadow finger 4 at (257, 664)
> 
> As it is physically impossible to place two fingers at the same
> point at the screen this seems safe to do.
> 
> The "finger 1 up (0, 0)" type messages of releaseing ghost
> fingers does not go away, and even though this is mostly
> incorrect too, we cannot rule out some finger being released
> at (0, 0) in the generic case, so it needs to stay.
> 
> Notice that the ghostly release of fingers 1 and 3 only
> happens on finger down events, not on finger up.
> 
> This appears to me as the best we can do. After this my
> screen is nicely interactive.

I see that there is "finger_cnt" that we completely ignore in the
driver. I wonder if we actually pay attention to it we would not need to
do all this?

Thanks.

> 
> Cc: Michael Srba <Michael.Srba@seznam.cz>
> Cc: Nikita Travkin <nikita@trvn.ru>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/input/touchscreen/zinitix.c | 78 ++++++++++++++++++++++++-----
>  1 file changed, 66 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
> index 129ebc810de8..7655a09b65bc 100644
> --- a/drivers/input/touchscreen/zinitix.c
> +++ b/drivers/input/touchscreen/zinitix.c
> @@ -319,14 +319,72 @@ static int zinitix_send_power_on_sequence(struct bt541_ts_data *bt541)
>  	return 0;
>  }
>  
> -static void zinitix_report_finger(struct bt541_ts_data *bt541, int slot,
> -				  const struct point_coord *p)
> +static void zinitix_report_fingers(struct bt541_ts_data *bt541, struct touch_event *te)
>  {
> -	input_mt_slot(bt541->input_dev, slot);
> -	input_mt_report_slot_state(bt541->input_dev, MT_TOOL_FINGER, true);
> -	touchscreen_report_pos(bt541->input_dev, &bt541->prop,
> -			       le16_to_cpu(p->x), le16_to_cpu(p->y), true);
> -	input_report_abs(bt541->input_dev, ABS_MT_TOUCH_MAJOR, p->width);
> +	struct point_coord *p;
> +	u16 reported_x[MAX_SUPPORTED_FINGER_NUM];
> +	u16 reported_y[MAX_SUPPORTED_FINGER_NUM];
> +	u16 x, y;
> +	int i, j;
> +	int ridx = 0;
> +	bool ignore;
> +
> +	for (i = 0; i < MAX_SUPPORTED_FINGER_NUM; i++) {
> +		p = &te->point_coord[i];
> +
> +		/* Skip nonexisting fingers */
> +		if (!p->sub_status & SUB_BIT_EXIST)
> +			continue;
> +
> +		x = le16_to_cpu(p->x);
> +		y = le16_to_cpu(p->y);
> +
> +		/*
> +		 * Check if this has already been reported and is just a shadow
> +		 * finger
> +		 */
> +		ignore = false;
> +		for (j = 0; j < ridx; j++) {
> +			if (x == reported_x[j] && y == reported_y[j]) {
> +				ignore = true;
> +				break;
> +			}
> +		}
> +
> +		if (ignore) {
> +			dev_dbg(&bt541->client->dev,
> +				"ignore shadow finger %d at (%u, %u)\n", i, x, y);
> +			continue;
> +		}
> +
> +		input_mt_slot(bt541->input_dev, i);
> +
> +		if (p->sub_status & BIT_DOWN) {
> +			/* Finger down */
> +			input_mt_report_slot_state(bt541->input_dev, MT_TOOL_FINGER, true);
> +			touchscreen_report_pos(bt541->input_dev, &bt541->prop, x, y, true);
> +			input_report_abs(bt541->input_dev, ABS_MT_TOUCH_MAJOR, p->width);
> +			dev_dbg(&bt541->client->dev, "finger %d down (%u, %u)\n", i, x, y);
> +		} else if (p->sub_status & BIT_UP) {
> +			/* Release finger */
> +			input_mt_report_slot_state(bt541->input_dev, MT_TOOL_FINGER, false);
> +			touchscreen_report_pos(bt541->input_dev, &bt541->prop, x, y, true);
> +			input_report_abs(bt541->input_dev, ABS_MT_TOUCH_MAJOR, 0);
> +			dev_dbg(&bt541->client->dev, "finger %d up (%u, %u)\n", i, x, y);
> +		} else if (p->sub_status & BIT_MOVE) {
> +			/* Finger moves while pressed down */
> +			input_mt_report_slot_state(bt541->input_dev, MT_TOOL_FINGER, true);
> +			touchscreen_report_pos(bt541->input_dev, &bt541->prop, x, y, true);
> +			input_report_abs(bt541->input_dev, ABS_MT_TOUCH_MAJOR, p->width);
> +			dev_dbg(&bt541->client->dev, "finger %d move (%u, %u)\n", i, x, y);
> +		} else {
> +			dev_dbg(&bt541->client->dev, "unknown finger event\n");
> +		}
> +
> +		reported_x[ridx] = x;
> +		reported_y[ridx] = y;
> +		ridx++;
> +	}
>  }
>  
>  static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
> @@ -335,7 +393,6 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
>  	struct i2c_client *client = bt541->client;
>  	struct touch_event touch_event;
>  	int error;
> -	int i;
>  
>  	memset(&touch_event, 0, sizeof(struct touch_event));
>  
> @@ -346,10 +403,7 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
>  		goto out;
>  	}
>  
> -	for (i = 0; i < MAX_SUPPORTED_FINGER_NUM; i++)
> -		if (touch_event.point_coord[i].sub_status & SUB_BIT_EXIST)
> -			zinitix_report_finger(bt541, i,
> -					      &touch_event.point_coord[i]);
> +	zinitix_report_fingers(bt541, &touch_event);
>  
>  	input_mt_sync_frame(bt541->input_dev);
>  	input_sync(bt541->input_dev);
> -- 
> 2.34.1
> 

-- 
Dmitry
