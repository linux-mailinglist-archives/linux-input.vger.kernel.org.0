Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A29E4117CD9
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2019 02:03:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727448AbfLJBDX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 20:03:23 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37187 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727073AbfLJBDX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Dec 2019 20:03:23 -0500
Received: by mail-lj1-f195.google.com with SMTP id u17so17861304lja.4;
        Mon, 09 Dec 2019 17:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Gm6i6qWQ1sKIz4SMMqeT6Pkh0KtZ5FmEQQWK1xpXhYg=;
        b=utw6wVq8SCj6tkBIhNsQaP3RRFd+h6n6jF+l0y3gX3S6FyudFPQjQk7v0NY/7cEYDv
         dR5qpNMtOGabl5ap/kkmS2h4lF+20RNfsrzFBc4Js9Kagw257WpsMSVykq61zRWKBF3p
         AkUh4pLDMZSlrXcNaLp5qb8cW3/xAONrOPu1Pmwdaz4gSrpk/z2suYuJ3AYW7IltUrV3
         iC9ciHBC8Pmwu6H2BfEvAsycJBxjHtngxxB9Lzehh+7sloxdbUkIXI4vT5r32W1zncSa
         Z1JWikdiYn+WPLguuH1D4Xwdc5N5DEA1edz1IYjReNTRrJgLjdhn9dOaz5fQMYL5Gg7g
         BOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Gm6i6qWQ1sKIz4SMMqeT6Pkh0KtZ5FmEQQWK1xpXhYg=;
        b=iaunrmZmW2eZg87ECUylqppzgJYS58EvTb9XtkiF/cYox7S5GRZeAs9l2JbVnU5JXk
         AGXPHyvnqfpI7o7MoQrIPLqF2LEFcZB/1oPodQy9hC9ZnedduZ9Zsg90gZ+eL1Mm364p
         HRK23X/AUGKG2Sy84ATs1He3U4UZsDXOa3PU31VTmvKu2WnJ3aqNTeqROj5wBsTQdSeS
         QwcKfYgtPE+znp6UIja6sRYAVmJqbCdViPt3bc2rq1LiDPniQvSLOCzUsV/WL+E77R1u
         qUWL08LbeaX+LVihV73k6gX3qJAyXAieOCJpM55dtCc2bl9rbY0XguWC3j0uS7d+iuiK
         u2lQ==
X-Gm-Message-State: APjAAAWGtSGRYh3wtGi5kXh8NESImnfjjCj9GltwtKLIOWjABMdjQqCX
        K3EhKospKBd0bzNi0GgWHaIrjogV
X-Google-Smtp-Source: APXvYqzc9uOxWSESXSZiw8rEsw97HAm53f7FiodlZYB9v7625PFavw7T3m767nvmg41n3PiZ9E2dCA==
X-Received: by 2002:a2e:5304:: with SMTP id h4mr19244308ljb.75.1575939800200;
        Mon, 09 Dec 2019 17:03:20 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id g5sm505771lfc.11.2019.12.09.17.03.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2019 17:03:19 -0800 (PST)
Subject: Re: [PATCH 3/6] input: elants: support common touchscreen DT
 properties
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org
References: <cover.1575936961.git.mirq-linux@rere.qmqm.pl>
 <7e650a6ef98e3178d6829c3c2c83f21437070d84.1575936961.git.mirq-linux@rere.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <17bb20b8-a62c-828f-d329-cd3aa89c1c06@gmail.com>
Date:   Tue, 10 Dec 2019 04:03:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <7e650a6ef98e3178d6829c3c2c83f21437070d84.1575936961.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

10.12.2019 03:19, Michał Mirosław пишет:
> Support common DT properties like axis inversions to complement
> information obtained from device's firmware.
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
>  drivers/input/touchscreen/elants_i2c.c | 27 ++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index eadd26d5a06f..02bd5e3e2171 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -31,6 +31,7 @@
>  #include <linux/buffer_head.h>
>  #include <linux/slab.h>
>  #include <linux/firmware.h>
> +#include <linux/input/touchscreen.h>
>  #include <linux/input/mt.h>
>  #include <linux/acpi.h>
>  #include <linux/of.h>
> @@ -146,8 +147,7 @@ struct elants_data {
>  	u16 hw_version;
>  	unsigned int x_res;	/* resolution in units/mm */
>  	unsigned int y_res;
> -	unsigned int x_max;
> -	unsigned int y_max;
> +	struct touchscreen_properties prop;
>  
>  	enum elants_state state;
>  	enum elants_iap_mode iap_mode;
> @@ -498,10 +498,10 @@ static int elants_i2c_query_ts_info(struct elants_data *ts)
>  			 rows, cols, osr);
>  	} else {
>  		/* translate trace number to TS resolution */
> -		ts->x_max = ELAN_TS_RESOLUTION(rows, osr);
> -		ts->x_res = DIV_ROUND_CLOSEST(ts->x_max, phy_x);
> -		ts->y_max = ELAN_TS_RESOLUTION(cols, osr);
> -		ts->y_res = DIV_ROUND_CLOSEST(ts->y_max, phy_y);
> +		ts->prop.max_x = ELAN_TS_RESOLUTION(rows, osr);
> +		ts->x_res = DIV_ROUND_CLOSEST(ts->prop.max_x, phy_x);
> +		ts->prop.max_y = ELAN_TS_RESOLUTION(cols, osr);
> +		ts->y_res = DIV_ROUND_CLOSEST(ts->prop.max_y, phy_y);
>  	}
>  
>  	return 0;
> @@ -833,8 +833,7 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf,
>  
>  			input_mt_slot(input, i);
>  			input_mt_report_slot_state(input, MT_TOOL_FINGER, true);
> -			input_event(input, EV_ABS, ABS_MT_POSITION_X, x);
> -			input_event(input, EV_ABS, ABS_MT_POSITION_Y, y);
> +			touchscreen_report_pos(input, &ts->prop, x, y, true);
>  			input_event(input, EV_ABS, ABS_MT_PRESSURE, p);
>  			input_event(input, EV_ABS, ABS_MT_TOUCH_MAJOR, w);
>  
> @@ -1251,13 +1250,15 @@ static int elants_i2c_probe(struct i2c_client *client,
>  	ts->input->name = "Elan Touchscreen";
>  	ts->input->id.bustype = BUS_I2C;
>  
> +	touchscreen_parse_properties(ts->input, true, &ts->prop);

Shouldn't this function be invoked after setting the max x/y sizes with
the hardware values? That's what all other drivers do and then you won't
need to set the ts->prop.max_x/y above in the code.

>  	__set_bit(BTN_TOUCH, ts->input->keybit);
>  	__set_bit(EV_ABS, ts->input->evbit);
>  	__set_bit(EV_KEY, ts->input->evbit);
>  
>  	/* Single touch input params setup */
> -	input_set_abs_params(ts->input, ABS_X, 0, ts->x_max, 0, 0);
> -	input_set_abs_params(ts->input, ABS_Y, 0, ts->y_max, 0, 0);
> +	input_set_abs_params(ts->input, ABS_X, 0, ts->prop.max_x, 0, 0);
> +	input_set_abs_params(ts->input, ABS_Y, 0, ts->prop.max_y, 0, 0);
>  	input_set_abs_params(ts->input, ABS_PRESSURE, 0, 255, 0, 0);
>  	input_abs_set_res(ts->input, ABS_X, ts->x_res);
>  	input_abs_set_res(ts->input, ABS_Y, ts->y_res);
> @@ -1271,8 +1272,10 @@ static int elants_i2c_probe(struct i2c_client *client,
>  		return error;
>  	}
>  
> -	input_set_abs_params(ts->input, ABS_MT_POSITION_X, 0, ts->x_max, 0, 0);
> -	input_set_abs_params(ts->input, ABS_MT_POSITION_Y, 0, ts->y_max, 0, 0);
> +	input_set_abs_params(ts->input, ABS_MT_POSITION_X,
> +			     0, ts->prop.max_x, 0, 0);
> +	input_set_abs_params(ts->input, ABS_MT_POSITION_Y,
> +			     0, ts->prop.max_y, 0, 0);
>  	input_set_abs_params(ts->input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
>  	input_set_abs_params(ts->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
>  	input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
> 

