Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 319904CE22E
	for <lists+linux-input@lfdr.de>; Sat,  5 Mar 2022 03:15:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbiCECQg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Mar 2022 21:16:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiCECQe (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Mar 2022 21:16:34 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D34C91DC9AC
        for <linux-input@vger.kernel.org>; Fri,  4 Mar 2022 18:15:40 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id mv5-20020a17090b198500b001bf2a039831so2689431pjb.5
        for <linux-input@vger.kernel.org>; Fri, 04 Mar 2022 18:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dI6nGsM9yzEiyYK5KAefaWvjpzRJqsHVRNkCHoeERy4=;
        b=YDlPnjrzfw6Gifg9p8IaauRI7KCap2k3Wyv1RQLnd++e99HgqZJFkf8vLicjTJkc9b
         z7cgR1TtsJeC9wtkJFVysKHkYgR2zFllZ1zWSXeMoXTQx5XaDbxiadWWSa5FidczX/hC
         KnuE3Kg9X8Kk/lgnvNSALIcPDm71CdWd5Oo04U3xwZkLFIivQIO4CbwVg7tsGF3jAtRJ
         zTwcIHJO5Xjj4I9GYbb6aHosIVxVwrmoc/6p5ChceqyJvxDCosPcnWcmZAM9z9GCEoSO
         qzoI6hCP94gebdRbG+kkz0ZEFnRnB5vc65F/jRMf7lcEVybU7KJN7LSXgbZOM07B3/DD
         k1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dI6nGsM9yzEiyYK5KAefaWvjpzRJqsHVRNkCHoeERy4=;
        b=ibhhHGIcxmJ/ObtC6fwuSeKJ/xgjGG0EQ/0+EtGWhZXJVrMVtmPkINFCZv53F5XdMC
         Qu5SHMpYSiWPE1UuF5Hi6dXqgQCqMbIoyYWsWL+i/6DthJFoE/nDbcGqksJDkam9hfKD
         bibx+bYAIsn3Bp8NL/JZ2P0Q6sq+ZU+j/89udGoac4x5COskO9EBuJSQbuZlPuwJRsZ7
         y1inQJKrSrYpmLQaGCkkLfE16jBFQWdfBuhZvsikEw5KI/Fz2M+0hCTD9ibMxpeRuXCp
         sp7peTHe3u8xauc2wOGI4BY7/FloKwomy79Ftlk6cHRoKhJZ0E+lfyp4TGJrEG9gutc2
         YUSw==
X-Gm-Message-State: AOAM531m1FtxntdnfmpzqXGP62mgYYOLPlgU0SnYDE4R+hxt2XeeNPZW
        gdMuCDvn1kBS1bZKTLSCU9w=
X-Google-Smtp-Source: ABdhPJwOfDdB0OAIsNlzc5gAavi0R/IGCFGheDYXu58wh+S6xaa8IwlmwXVuqgW5Hf08mbOI9bHhQg==
X-Received: by 2002:a17:90a:8591:b0:1b9:da10:2127 with SMTP id m17-20020a17090a859100b001b9da102127mr13698116pjn.13.1646446540106;
        Fri, 04 Mar 2022 18:15:40 -0800 (PST)
Received: from google.com ([2620:15c:202:201:763d:48b4:9a92:4bce])
        by smtp.gmail.com with ESMTPSA id n34-20020a056a000d6200b004e1ba1016absm7179512pfv.31.2022.03.04.18.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 18:15:38 -0800 (PST)
Date:   Fri, 4 Mar 2022 18:15:36 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, Michael Srba <Michael.Srba@seznam.cz>,
        Nikita Travkin <nikita@trvn.ru>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v3] Input: zinitix - Do not report shadow fingers
Message-ID: <YiLHyOQw/Zp+IQ4+@google.com>
References: <20220228233017.2270599-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228233017.2270599-1-linus.walleij@linaro.org>
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

On Tue, Mar 01, 2022 at 12:30:17AM +0100, Linus Walleij wrote:
> +static void zinitix_report_fingers(struct bt541_ts_data *bt541, struct touch_event *te)
>  {
> -	input_mt_slot(bt541->input_dev, slot);
> -	input_mt_report_slot_state(bt541->input_dev, MT_TOOL_FINGER, true);
> -	touchscreen_report_pos(bt541->input_dev, &bt541->prop,
> -			       le16_to_cpu(p->x), le16_to_cpu(p->y), true);
> -	input_report_abs(bt541->input_dev, ABS_MT_TOUCH_MAJOR, p->width);
> +	struct point_coord *p;
> +	u16 x, y;
> +	unsigned long fmask;
> +	int i;
> +
> +	/*
> +	 * If the corresponding finger is not active, do not report
> +	 * what is happening on it.
> +	 */
> +	fmask = te->finger_mask;
> +	for_each_set_bit(i, &fmask, MAX_SUPPORTED_FINGER_NUM) {
> +		p = &te->point_coord[i];
> +
> +		/* Skip nonexisting fingers */
> +		if (!(p->sub_status & SUB_BIT_EXIST))
> +			continue;
> +
> +		x = le16_to_cpu(p->x);
> +		y = le16_to_cpu(p->y);
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

I think reporting releases should be a priority, or at least we should
not be skipping it if for some reason both up and down bits are set.
Also I believe we should be using SUB_BIT_* defines here (even though
they are the same).

> +		} else if (p->sub_status & BIT_MOVE) {
> +			/* Finger moves while pressed down */
> +			input_mt_report_slot_state(bt541->input_dev, MT_TOOL_FINGER, true);
> +			touchscreen_report_pos(bt541->input_dev, &bt541->prop, x, y, true);
> +			input_report_abs(bt541->input_dev, ABS_MT_TOUCH_MAJOR, p->width);
> +			dev_dbg(&bt541->client->dev, "finger %d move (%u, %u)\n", i, x, y);
> +		} else {
> +			dev_dbg(&bt541->client->dev, "unknown finger event\n");
> +		}
> +	}
>  }
>  
>  static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
> @@ -335,7 +373,6 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
>  	struct i2c_client *client = bt541->client;
>  	struct touch_event touch_event;
>  	int error;
> -	int i;
>  
>  	memset(&touch_event, 0, sizeof(struct touch_event));
>  
> @@ -346,10 +383,7 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
>  		goto out;
>  	}
>  
> -	for (i = 0; i < MAX_SUPPORTED_FINGER_NUM; i++)
> -		if (touch_event.point_coord[i].sub_status & SUB_BIT_EXIST)
> -			zinitix_report_finger(bt541, i,
> -					      &touch_event.point_coord[i]);
> +	zinitix_report_fingers(bt541, &touch_event);

I actually liked that we iterated over individual contacts here. I took
the liberty to rearrange your patch a bit, could you please tell me if
the version below looks OK to you?

Thanks!

-- 
Dmitry

Input: zinitix - do not report shadow fingers

From: Linus Walleij <linus.walleij@linaro.org>

I observed the following problem with the BT404 touch pad
running the Phosh UI:

When e.g. typing on the virtual keyboard pressing "g" would
produce "ggg".

After some analysis it turns out the firmware reports that three
fingers hit that coordinate at the same time, finger 0, 2 and
4 (of the five available 0,1,2,3,4).

DOWN
  Zinitix-TS 3-0020: finger 0 down (246, 395)
  Zinitix-TS 3-0020: finger 1 up (0, 0)
  Zinitix-TS 3-0020: finger 2 down (246, 395)
  Zinitix-TS 3-0020: finger 3 up (0, 0)
  Zinitix-TS 3-0020: finger 4 down (246, 395)
UP
  Zinitix-TS 3-0020: finger 0 up (246, 395)
  Zinitix-TS 3-0020: finger 2 up (246, 395)
  Zinitix-TS 3-0020: finger 4 up (246, 395)

This is one touch and release: i.e. this is all reported on
touch (down) and release.

There is a field in the struct touch_event called finger_cnt
which is actually a bitmask of the fingers active in the
event.

Rename this field finger_mask as this matches the use contents
better, then use for_each_set_bit() to iterate over just the
fingers that are actally active.

Factor out a finger reporting function zinitix_report_fingers()
to handle all fingers.

Also be more careful in reporting finger down/up: we were
reporting every event with input_mt_report_slot_state(..., true);
but this should only be reported on finger down or move,
not on finger up, so also add code to check p->sub_status
to see what is happening and report correctly.

After this my Zinitix BT404 touchscreen report fingers
flawlessly.

The vendor drive I have notably does not use the "finger_cnt"
and contains obviously incorrect code like this:

  if (touch_dev->touch_info.finger_cnt > MAX_SUPPORTED_FINGER_NUM)
      touch_dev->touch_info.finger_cnt = MAX_SUPPORTED_FINGER_NUM;

As MAX_SUPPORTED_FINGER_NUM is an ordinal and the field is
a bitmask this seems quite confused.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/zinitix.c |   44 ++++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index 129ebc810de8..8bd03278ad9a 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -135,7 +135,7 @@ struct point_coord {
 
 struct touch_event {
 	__le16	status;
-	u8	finger_cnt;
+	u8	finger_mask;
 	u8	time_stamp;
 	struct point_coord point_coord[MAX_SUPPORTED_FINGER_NUM];
 };
@@ -322,11 +322,32 @@ static int zinitix_send_power_on_sequence(struct bt541_ts_data *bt541)
 static void zinitix_report_finger(struct bt541_ts_data *bt541, int slot,
 				  const struct point_coord *p)
 {
+	u16 x, y;
+
+	if (unlikely(!(p->sub_status &
+		       (SUB_BIT_UP | SUB_BIT_DOWN | SUB_BIT_MOVE)))) {
+		dev_dbg(&bt541->client->dev, "unknown finger event %#02x\n",
+			p->sub_status);
+		return;
+	}
+
+	x = le16_to_cpu(p->x);
+	y = le16_to_cpu(p->y);
+
 	input_mt_slot(bt541->input_dev, slot);
-	input_mt_report_slot_state(bt541->input_dev, MT_TOOL_FINGER, true);
-	touchscreen_report_pos(bt541->input_dev, &bt541->prop,
-			       le16_to_cpu(p->x), le16_to_cpu(p->y), true);
-	input_report_abs(bt541->input_dev, ABS_MT_TOUCH_MAJOR, p->width);
+	if (input_mt_report_slot_state(bt541->input_dev, MT_TOOL_FINGER,
+				       !(p->sub_status & SUB_BIT_UP))) {
+		touchscreen_report_pos(bt541->input_dev,
+				       &bt541->prop, x, y, true);
+		input_report_abs(bt541->input_dev,
+				 ABS_MT_TOUCH_MAJOR, p->width);
+		dev_dbg(&bt541->client->dev, "finger %d %s (%u, %u)\n",
+			slot, p->sub_status & SUB_BIT_DOWN ? "down" : "move",
+			x, y);
+	} else {
+		dev_dbg(&bt541->client->dev, "finger %d up (%u, %u)\n",
+			slot, x, y);
+	}
 }
 
 static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
@@ -334,6 +355,7 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
 	struct bt541_ts_data *bt541 = bt541_handler;
 	struct i2c_client *client = bt541->client;
 	struct touch_event touch_event;
+	unsigned long finger_mask;
 	int error;
 	int i;
 
@@ -346,10 +368,14 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
 		goto out;
 	}
 
-	for (i = 0; i < MAX_SUPPORTED_FINGER_NUM; i++)
-		if (touch_event.point_coord[i].sub_status & SUB_BIT_EXIST)
-			zinitix_report_finger(bt541, i,
-					      &touch_event.point_coord[i]);
+	finger_mask = touch_event.finger_mask;
+	for_each_set_bit(i, &finger_mask, MAX_SUPPORTED_FINGER_NUM) {
+		const struct point_coord *p = &touch_event.point_coord[i];
+
+		/* Only process contacts that are actually reported */
+		if (p->sub_status & SUB_BIT_EXIST)
+			zinitix_report_finger(bt541, i, p);
+	}
 
 	input_mt_sync_frame(bt541->input_dev);
 	input_sync(bt541->input_dev);
