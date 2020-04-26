Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE951B8C79
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 07:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgDZFL1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 01:11:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgDZFL1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 01:11:27 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1294C061A0C;
        Sat, 25 Apr 2020 22:11:25 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id d184so7102278pfd.4;
        Sat, 25 Apr 2020 22:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=0fQ71S3rch+5OEwbe0BH+ypVlG7APOE94SWhKKO2PHs=;
        b=Itwu1EElAzR3Q2LFV/i37WUKlRlKZPhgnKsyI8xvVYF6sMcj+ApstpX2Ncnp1UOYHU
         kvFzA7RWKbc42OmoMNXuS7ZymXKBWOhhUuU81EjFyULP1fKfrsl9SQ3zjYmNmnOFvzIa
         LB4ojmqRLlMCNOUTfQjuDBovLf5hZYrzjsfBImsyDtfKsUT+IOguEXQaw1u+1M4A9zLn
         ohkEV7kE9wEfc83p2AI4Q7U/pB4AbfMarv4NwGm4lTrtDlpA0FBbr7utUdkmBA2fMNAC
         2TboycGk27bwNdZ6kuxTXUquPaTNM41T0s8WpltOKjH/ro214EnPYLC8KF4WDNaxhkuO
         tfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0fQ71S3rch+5OEwbe0BH+ypVlG7APOE94SWhKKO2PHs=;
        b=adBgZOhykGi09IfpSqv0YTTGKnMWmlrlvwpcPBwvmxMUl1JbbSSRMWFC2ozZuKnYMW
         I4WQezXWPfklbv8L5f6AyRrv9tf5/jlKT8XplksExV/oobMamv4lR/S1nDQotHZoQQHX
         edMr01zChnd47RVHu3FSc8TsOE13QTWofdG/BzKBJaUJ87D7Iqwnt9t2rz9kEo14C7x3
         P+E2z1gYUSLfBC/fMd7xhSRKURJs0V14DZ/OsI8KmbHzBrr6DIEXPrXhIPgAsYT02A14
         TV4MfJfrQudi2uC1Rvo95fJlKny+XaDM77iRF7GvmNGPqYaS+0uqcfBqDq9ltbea1QNj
         oOJw==
X-Gm-Message-State: AGi0PuakJkjw9DBtNR9XtgD3QrqPX8aN6FdDugeFbYvqAQYA706mwSzZ
        kxriSvi20eDvnNN0JCXt+LY=
X-Google-Smtp-Source: APiQypKyvtttdNUPrijBK3BpN0S4igzBQRpLqtkXxR1vYZGBo32qrQnP1V+ZeFnCymq9OJdBksHKhQ==
X-Received: by 2002:a63:7f5d:: with SMTP id p29mr16366862pgn.96.1587877885031;
        Sat, 25 Apr 2020 22:11:25 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id gv7sm8074739pjb.16.2020.04.25.22.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 22:11:24 -0700 (PDT)
Date:   Sat, 25 Apr 2020 22:11:22 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>,
        David Heidelberg <david@ixit.cz>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/9] input: elants: override touchscreen info with DT
 properties
Message-ID: <20200426051122.GQ125362@dtor-ws>
References: <cover.1586784389.git.mirq-linux@rere.qmqm.pl>
 <cb3834494e837289fa792615925f06dbd91c1f75.1586784389.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb3834494e837289fa792615925f06dbd91c1f75.1586784389.git.mirq-linux@rere.qmqm.pl>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Apr 13, 2020 at 03:32:24PM +0200, Michał Mirosław wrote:
> Allow overriding of information from hardware and support additional
> common DT properties like axis inversion. This is required for eg.
> Nexus 7 and TF300T where the programmed values in firmware differ
> from reality.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> [moved "prop" before DMA buffer]
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>

This needs a companion patch for the DT bindings.

> ---
>  drivers/input/touchscreen/elants_i2c.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index fcd3d189f184..87d686ce08f2 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -32,6 +32,7 @@
>  #include <linux/slab.h>
>  #include <linux/firmware.h>
>  #include <linux/input/mt.h>
> +#include <linux/input/touchscreen.h>
>  #include <linux/acpi.h>
>  #include <linux/of.h>
>  #include <linux/gpio/consumer.h>
> @@ -150,6 +151,7 @@ struct elants_data {
>  	unsigned int y_res;
>  	unsigned int x_max;
>  	unsigned int y_max;
> +	struct touchscreen_properties prop;
>  
>  	enum elants_state state;
>  	enum elants_iap_mode iap_mode;
> @@ -894,8 +896,7 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf,
>  
>  			input_mt_slot(input, i);
>  			input_mt_report_slot_state(input, MT_TOOL_FINGER, true);
> -			input_event(input, EV_ABS, ABS_MT_POSITION_X, x);
> -			input_event(input, EV_ABS, ABS_MT_POSITION_Y, y);
> +			touchscreen_report_pos(input, &ts->prop, x, y, true);
>  			input_event(input, EV_ABS, ABS_MT_PRESSURE, p);
>  			input_event(input, EV_ABS, ABS_MT_TOUCH_MAJOR, w);
>  
> @@ -1329,6 +1330,8 @@ static int elants_i2c_probe(struct i2c_client *client,
>  	input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
>  	input_abs_set_res(ts->input, ABS_MT_TOUCH_MAJOR, 1);
>  
> +	touchscreen_parse_properties(ts->input, true, &ts->prop);
> +
>  	error = input_register_device(ts->input);
>  	if (error) {
>  		dev_err(&client->dev,
> -- 
> 2.20.1
> 

-- 
Dmitry
