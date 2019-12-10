Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC96118C62
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2019 16:21:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727272AbfLJPVI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Dec 2019 10:21:08 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46153 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727223AbfLJPVH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Dec 2019 10:21:07 -0500
Received: by mail-lj1-f194.google.com with SMTP id z17so20291815ljk.13;
        Tue, 10 Dec 2019 07:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8lyoZyzsZNTOAf8Nzqym+U3Y69zCHzXOvzwC1owD+S0=;
        b=J+1+Af0JHG58PlH408ipfa111DWb0WPeJF2NIjCnB+ugmxJ4n9spb6luGk47BCPdMc
         Xjw32kYP3ItG9Ro7E97HH2ZfmnIkzHIub+sL7ayp/dWawthbdfAxQCXf+RQT5u0t1PGT
         c/CocoitL4nroLToESUzTVxI2Izi6hTn5jYcUd4N/2JT5uQONfD18v/hghHvVcN+Bpdd
         FbLjno8or6NdIPNN/iQCdUZ6T0/ZkNrTMGJwVx2+HtbPfXka2Ep2Rnx5oiOIS6/n2cO8
         B+/iwLeLejRL9J/7ARHg+A7ou/rwYSzpOe45nS4AjZLSV2drC+XK77IFrOyMflSmKXau
         2N3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8lyoZyzsZNTOAf8Nzqym+U3Y69zCHzXOvzwC1owD+S0=;
        b=N34KYfZ8wM+EeI8T+yhOsbMU59lqAy0yGse0wYJIPBGHiEyBLUma3rLEQRNc5eOlXN
         xnoLInv0Jhsr8c6+ZCo6APGJTpHNAPBD1IaAb/kxbfQSdqOydRP6IrctVuZ48GLXl/W/
         LINuPxSTOhACJslYPDYo1qEYTMY+p7nQ+JSevuwaKBgEq8rv8KrGKprNqw6OWcLdOVaa
         8w+MeAIyhxyXnT1fFTMRzhpPQAbuhGXOyIcymaifrodxb8FYzSZNnRknmHBO345FXub1
         qNU1PUWD1d6KoQXuitF2T3Qh4U3ejbr9wbC/Tx2iIlTmaNhiRtKdksgs7ouxRfR8Gx85
         lJVw==
X-Gm-Message-State: APjAAAUQtnl3FMeJmy+zakswyJguNzh8fWCVEKS0hnqq7Z4ZnDnU7fnz
        /NeTinLXaAFdoIxFmOqCbcwoY4tZ
X-Google-Smtp-Source: APXvYqzdxvr3ddYPqp008DAMyebSx01uJv+XuaMs8KFVPyiBdie6L1P71GLLiPzWAql6FmO8NRGDMw==
X-Received: by 2002:a2e:90da:: with SMTP id o26mr20913058ljg.25.1575991264325;
        Tue, 10 Dec 2019 07:21:04 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id q186sm1992249ljq.30.2019.12.10.07.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2019 07:21:03 -0800 (PST)
Subject: Re: [PATCH 3/6] input: elants: support common touchscreen DT
 properties
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org
References: <cover.1575936961.git.mirq-linux@rere.qmqm.pl>
 <7e650a6ef98e3178d6829c3c2c83f21437070d84.1575936961.git.mirq-linux@rere.qmqm.pl>
 <17bb20b8-a62c-828f-d329-cd3aa89c1c06@gmail.com>
 <20191210023818.GB15246@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2c9cd83c-518f-2f22-c3e7-ac629a181b8d@gmail.com>
Date:   Tue, 10 Dec 2019 18:21:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191210023818.GB15246@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

10.12.2019 05:38, Michał Mirosław пишет:
> On Tue, Dec 10, 2019 at 04:03:18AM +0300, Dmitry Osipenko wrote:
>> 10.12.2019 03:19, Michał Mirosław пишет:
>>> Support common DT properties like axis inversions to complement
>>> information obtained from device's firmware.a
> [...]
>>> @@ -498,10 +498,10 @@ static int elants_i2c_query_ts_info(struct elants_data *ts)
>>>  			 rows, cols, osr);
>>>  	} else {
>>>  		/* translate trace number to TS resolution */
>>> -		ts->x_max = ELAN_TS_RESOLUTION(rows, osr);
>>> -		ts->x_res = DIV_ROUND_CLOSEST(ts->x_max, phy_x);
>>> -		ts->y_max = ELAN_TS_RESOLUTION(cols, osr);
>>> -		ts->y_res = DIV_ROUND_CLOSEST(ts->y_max, phy_y);
>>> +		ts->prop.max_x = ELAN_TS_RESOLUTION(rows, osr);
>>> +		ts->x_res = DIV_ROUND_CLOSEST(ts->prop.max_x, phy_x);
>>> +		ts->prop.max_y = ELAN_TS_RESOLUTION(cols, osr);
>>> +		ts->y_res = DIV_ROUND_CLOSEST(ts->prop.max_y, phy_y);
>>>  	}
>>>  
>>>  	return 0;
>>> @@ -833,8 +833,7 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf,
>>>  
>>>  			input_mt_slot(input, i);
>>>  			input_mt_report_slot_state(input, MT_TOOL_FINGER, true);
>>> -			input_event(input, EV_ABS, ABS_MT_POSITION_X, x);
>>> -			input_event(input, EV_ABS, ABS_MT_POSITION_Y, y);
>>> +			touchscreen_report_pos(input, &ts->prop, x, y, true);
>>>  			input_event(input, EV_ABS, ABS_MT_PRESSURE, p);
>>>  			input_event(input, EV_ABS, ABS_MT_TOUCH_MAJOR, w);
>>>  
>>> @@ -1251,13 +1250,15 @@ static int elants_i2c_probe(struct i2c_client *client,
>>>  	ts->input->name = "Elan Touchscreen";
>>>  	ts->input->id.bustype = BUS_I2C;
>>>  
>>> +	touchscreen_parse_properties(ts->input, true, &ts->prop);
>>
>> Shouldn't this function be invoked after setting the max x/y sizes with
>> the hardware values? That's what all other drivers do and then you won't
>> need to set the ts->prop.max_x/y above in the code.
> 
> This is done later in the series - this patch only adds axis inversion
> support and ignores DT-provided sizes.

What is the reason of splitting it into two patches?

Perhaps I'm still missing something, but why something a bit more simple
like this wouldn't yield exactly the same result:

diff --git a/drivers/input/touchscreen/elants_i2c.c
b/drivers/input/touchscreen/elants_i2c.c
index d4ad24ea54c8..8763a3b25c29 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -32,6 +32,7 @@
 #include <linux/slab.h>
 #include <linux/firmware.h>
 #include <linux/input/mt.h>
+#include <linux/input/touchscreen.h>
 #include <linux/acpi.h>
 #include <linux/of.h>
 #include <linux/gpio/consumer.h>
@@ -147,6 +148,8 @@ struct elants_data {

 	/* Must be last to be used for DMA operations */
 	u8 buf[MAX_PACKET_SIZE] ____cacheline_aligned;
+
+	struct touchscreen_properties prop;
 };

 static int elants_i2c_send(struct i2c_client *client,
@@ -807,8 +810,7 @@ static void elants_i2c_mt_event(struct elants_data
*ts, u8 *buf)

 			input_mt_slot(input, i);
 			input_mt_report_slot_state(input, MT_TOOL_FINGER, true);
-			input_event(input, EV_ABS, ABS_MT_POSITION_X, x);
-			input_event(input, EV_ABS, ABS_MT_POSITION_Y, y);
+			touchscreen_report_pos(ts->input, &ts->prop, x, y, true);
 			input_event(input, EV_ABS, ABS_MT_PRESSURE, p);
 			input_event(input, EV_ABS, ABS_MT_TOUCH_MAJOR, w);

@@ -1249,6 +1251,8 @@ static int elants_i2c_probe(struct i2c_client *client,
 	input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
 	input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);

+	touchscreen_parse_properties(ts->input, true, &ts->prop);
+
 	error = input_register_device(ts->input);
 	if (error) {
 		dev_err(&client->dev,
