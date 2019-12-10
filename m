Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1711117CE8
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2019 02:07:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727383AbfLJBHo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 20:07:44 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35059 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727073AbfLJBHn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Dec 2019 20:07:43 -0500
Received: by mail-lf1-f68.google.com with SMTP id 15so12294843lfr.2;
        Mon, 09 Dec 2019 17:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CsKsxE9V1/fyWLOppIqtil5CBbw0lCC6v9XLnAGn8bY=;
        b=cg9uNY29bc8MX413KwHac7ijtMAAcnVOeNpYDp9pqfZU6MDLL44KfV/f3b92s0frGq
         FbhzlwIbKGxKvoZFBvfCgR9JbimWovTG2KCnNIPT6IEprHgJ53Q9YAHzQo8XzYBwToHE
         4XlL8cK631C1zrFMFcqffjOwaO4kUNeg0VwD+EP9CrAxMT1h/7tdsAeS7k1Rc3BtY0ow
         fylH40onRlYGDHgEsbWDkaHh8LkHXJlMbrKXec7DXb9ZmRIcnC+nNwUp6gJopLQ1Q51y
         MqqD21qEgpVaQ/cY9PkLRfpm/NdNwEL7bdIKt8+nXXJzX3230sSQ9GrLswehcL8H9tQV
         ResQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CsKsxE9V1/fyWLOppIqtil5CBbw0lCC6v9XLnAGn8bY=;
        b=jm+az/YSNez1YvHnB4H7NTNgFZh2bL+bFk9BOl0K+clH7SqlFoGgJX48fg0WFcmW1n
         uKgpngK8kSbXSNVBQVuPFQwTySThun/poOZqYTpjPjG+9o0aniCQOzLIL13x5Oi17SS7
         aZTY0lxTnf9Y/3SG68DsJzkq4/NRXNwvtOn7OaD9UzWV6TwLfaDPPUf4VBBpwqVCFhYV
         iDwK+gn2HXQTZPtS5rnMb6doxfRRnnrEcs3Fhr4Ex0fKVyDWKmYsRUc68btLUxq9YHu2
         fMEGD8ht1Ul1lFOjlq4N/GfMbQa5uU+eLGLBlzKsLmg+rYH0Lb9t7ryY0c8kprRyTzOZ
         yDaw==
X-Gm-Message-State: APjAAAVgcQWnZpLPCTmwmFtjWwYdJT6TXGFgCr5wlIzv+o4oByLU6TXc
        QvopDXVuGOq6ssPYa/9WZ49DaTZt
X-Google-Smtp-Source: APXvYqxMR1g4cQnAagqewEIWiQA7jUZHC2LLJhhTouZB9uDc8y61B4hLn53zqmFjRmNRCYv4y+EeZQ==
X-Received: by 2002:a19:4849:: with SMTP id v70mr16957860lfa.30.1575940060615;
        Mon, 09 Dec 2019 17:07:40 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id u13sm509049lfq.19.2019.12.09.17.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2019 17:07:40 -0800 (PST)
Subject: Re: [PATCH 3/6] input: elants: support common touchscreen DT
 properties
From:   Dmitry Osipenko <digetx@gmail.com>
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org
References: <cover.1575936961.git.mirq-linux@rere.qmqm.pl>
 <7e650a6ef98e3178d6829c3c2c83f21437070d84.1575936961.git.mirq-linux@rere.qmqm.pl>
 <17bb20b8-a62c-828f-d329-cd3aa89c1c06@gmail.com>
Message-ID: <944c8df1-5729-671e-86f8-c43300bc50bb@gmail.com>
Date:   Tue, 10 Dec 2019 04:07:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <17bb20b8-a62c-828f-d329-cd3aa89c1c06@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

10.12.2019 04:03, Dmitry Osipenko пишет:
> 10.12.2019 03:19, Michał Mirosław пишет:
>> Support common DT properties like axis inversions to complement
>> information obtained from device's firmware.
>>
>> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
>> ---
>>  drivers/input/touchscreen/elants_i2c.c | 27 ++++++++++++++------------
>>  1 file changed, 15 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
>> index eadd26d5a06f..02bd5e3e2171 100644
>> --- a/drivers/input/touchscreen/elants_i2c.c
>> +++ b/drivers/input/touchscreen/elants_i2c.c
>> @@ -31,6 +31,7 @@
>>  #include <linux/buffer_head.h>
>>  #include <linux/slab.h>
>>  #include <linux/firmware.h>
>> +#include <linux/input/touchscreen.h>
>>  #include <linux/input/mt.h>
>>  #include <linux/acpi.h>
>>  #include <linux/of.h>
>> @@ -146,8 +147,7 @@ struct elants_data {
>>  	u16 hw_version;
>>  	unsigned int x_res;	/* resolution in units/mm */
>>  	unsigned int y_res;
>> -	unsigned int x_max;
>> -	unsigned int y_max;
>> +	struct touchscreen_properties prop;
>>  
>>  	enum elants_state state;
>>  	enum elants_iap_mode iap_mode;
>> @@ -498,10 +498,10 @@ static int elants_i2c_query_ts_info(struct elants_data *ts)
>>  			 rows, cols, osr);
>>  	} else {
>>  		/* translate trace number to TS resolution */
>> -		ts->x_max = ELAN_TS_RESOLUTION(rows, osr);
>> -		ts->x_res = DIV_ROUND_CLOSEST(ts->x_max, phy_x);
>> -		ts->y_max = ELAN_TS_RESOLUTION(cols, osr);
>> -		ts->y_res = DIV_ROUND_CLOSEST(ts->y_max, phy_y);
>> +		ts->prop.max_x = ELAN_TS_RESOLUTION(rows, osr);
>> +		ts->x_res = DIV_ROUND_CLOSEST(ts->prop.max_x, phy_x);
>> +		ts->prop.max_y = ELAN_TS_RESOLUTION(cols, osr);
>> +		ts->y_res = DIV_ROUND_CLOSEST(ts->prop.max_y, phy_y);
>>  	}
>>  
>>  	return 0;
>> @@ -833,8 +833,7 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf,
>>  
>>  			input_mt_slot(input, i);
>>  			input_mt_report_slot_state(input, MT_TOOL_FINGER, true);
>> -			input_event(input, EV_ABS, ABS_MT_POSITION_X, x);
>> -			input_event(input, EV_ABS, ABS_MT_POSITION_Y, y);
>> +			touchscreen_report_pos(input, &ts->prop, x, y, true);
>>  			input_event(input, EV_ABS, ABS_MT_PRESSURE, p);
>>  			input_event(input, EV_ABS, ABS_MT_TOUCH_MAJOR, w);
>>  
>> @@ -1251,13 +1250,15 @@ static int elants_i2c_probe(struct i2c_client *client,
>>  	ts->input->name = "Elan Touchscreen";
>>  	ts->input->id.bustype = BUS_I2C;
>>  
>> +	touchscreen_parse_properties(ts->input, true, &ts->prop);
> 
> Shouldn't this function be invoked after setting the max x/y sizes with
> the hardware values? That's what all other drivers do and then you won't
> need to set the ts->prop.max_x/y above in the code.


>>  	__set_bit(BTN_TOUCH, ts->input->keybit);
>>  	__set_bit(EV_ABS, ts->input->evbit);
>>  	__set_bit(EV_KEY, ts->input->evbit);
>>  
>>  	/* Single touch input params setup */
>> -	input_set_abs_params(ts->input, ABS_X, 0, ts->x_max, 0, 0);
>> -	input_set_abs_params(ts->input, ABS_Y, 0, ts->y_max, 0, 0);
>> +	input_set_abs_params(ts->input, ABS_X, 0, ts->prop.max_x, 0, 0);
>> +	input_set_abs_params(ts->input, ABS_Y, 0, ts->prop.max_y, 0, 0);
>>  	input_set_abs_params(ts->input, ABS_PRESSURE, 0, 255, 0, 0);
>>  	input_abs_set_res(ts->input, ABS_X, ts->x_res);
>>  	input_abs_set_res(ts->input, ABS_Y, ts->y_res);

I'm actually wondering why this part is needed at all, the driver
doesn't report single-touch events.

>> @@ -1271,8 +1272,10 @@ static int elants_i2c_probe(struct i2c_client *client,
>>  		return error;
>>  	}
>>  
>> -	input_set_abs_params(ts->input, ABS_MT_POSITION_X, 0, ts->x_max, 0, 0);
>> -	input_set_abs_params(ts->input, ABS_MT_POSITION_Y, 0, ts->y_max, 0, 0);
>> +	input_set_abs_params(ts->input, ABS_MT_POSITION_X,
>> +			     0, ts->prop.max_x, 0, 0);
>> +	input_set_abs_params(ts->input, ABS_MT_POSITION_Y,
>> +			     0, ts->prop.max_y, 0, 0);
>>  	input_set_abs_params(ts->input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
>>  	input_set_abs_params(ts->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
>>  	input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
>>
> 

