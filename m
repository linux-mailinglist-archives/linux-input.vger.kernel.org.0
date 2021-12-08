Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E96946CF32
	for <lists+linux-input@lfdr.de>; Wed,  8 Dec 2021 09:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240822AbhLHIlM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Dec 2021 03:41:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20310 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240708AbhLHIlM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 8 Dec 2021 03:41:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638952660;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pjJRaHxI7BQlcZ33ir5ahyYUpKY2nsxs4o438jxQSjU=;
        b=M4lf4rH96zIy3wny2gP0NRYJXUVHsg1eVvbpMjYdvXqdys1pRObLX7mVT6Y3WsvIwV/8Qd
        v47nK8AY2U8fW56jTPou/T4mZaYyRDqI7ZC7G+lsPxkK5fwLbUpHoTvYXmvkYZNTYnaAct
        dK+HiHN45aLo6q49mpXP0Fgh1tOgUQ4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-9JSURbl4NZeilFCNhbw0SQ-1; Wed, 08 Dec 2021 03:37:39 -0500
X-MC-Unique: 9JSURbl4NZeilFCNhbw0SQ-1
Received: by mail-ed1-f71.google.com with SMTP id v22-20020a50a456000000b003e7cbfe3dfeso1509302edb.11
        for <linux-input@vger.kernel.org>; Wed, 08 Dec 2021 00:37:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pjJRaHxI7BQlcZ33ir5ahyYUpKY2nsxs4o438jxQSjU=;
        b=LuKccH7A05fVm9S6V3A39xpy2ypqqbOv10EGIlBppkeWocj7PlQPtw+GNY+94aWdgX
         9KG7xJyioVWJl/08QwtelrARU4taerJ/9aGYmSCdkDuuwQ8gQxQsg+nSJji1oiEEcqEw
         ny7j0usG/koNzXKY/DzzlupWCZfOa3lR2aSlhaKrbCtJNYzei+UUaIxZy826c7vdwhaW
         KiSjTKpCH7XTjhlZCamZ6sxvAzUJUPoOh3N3ONBpbRqijS/uUmMUZs12MI/kJboSxD/a
         +NKoCUxDCPVqU6nl+0pKSKsKdJ4xppyqTjOAy3nkwpNOL5N0+eUYoJkPSixLOapyu2i0
         7NZQ==
X-Gm-Message-State: AOAM532TDqq+grCvQZV9MDs7gavxI/xUeZphdqNNhfJ54AH3T9CdOnhC
        BzcN3a+DExEiqngI9NQjFnVNXH7Hr2k0n2MHOrWqrFYLGInf/ZnhENSLk7Hq1/Rln0pj4pgE9zH
        TczsivvRzmxduonBXLKTm0yk=
X-Received: by 2002:a17:907:1c15:: with SMTP id nc21mr5776548ejc.510.1638952658158;
        Wed, 08 Dec 2021 00:37:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvHAEzQNtMvBBlmk4Fdj7/4F4h/gFvNKXef7C1I5dm1Ibf3dpEJJ/bfUgzYr6IixQM3VSAxw==
X-Received: by 2002:a17:907:1c15:: with SMTP id nc21mr5776525ejc.510.1638952657913;
        Wed, 08 Dec 2021 00:37:37 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id dm6sm1099135ejc.89.2021.12.08.00.37.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Dec 2021 00:37:37 -0800 (PST)
Message-ID: <aa558a20-37d0-dbf0-740f-2813609fe3b5@redhat.com>
Date:   Wed, 8 Dec 2021 09:37:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 4/4] Input: goodix - Add pen support
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
References: <20211206164747.197309-1-hdegoede@redhat.com>
 <20211206164747.197309-5-hdegoede@redhat.com> <Ya+e5+TLgyLeTnhp@google.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Ya+e5+TLgyLeTnhp@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

Thank you for the review.

On 12/7/21 18:50, Dmitry Torokhov wrote:
> On Mon, Dec 06, 2021 at 05:47:47PM +0100, Hans de Goede wrote:
>> Some Goodix touchscreens have support for a (Goodix) active pen, add
>> support for this. The info on how to detect when a pen is down and to
>> detect when the stylus buttons are pressed was lifted from the out
>> of tree Goodix driver with pen support written by Adya:
>> https://gitlab.com/AdyaAdya/goodix-touchscreen-linux-driver/
>>
>> Since there is no way to tell if pen support is present, the registering
>> of the pen input_dev is delayed till the first pen event is detected.
>>
>> This has been tested on a Trekstor Surftab duo W1, a Chuwi Hi13 and
>> a Cyberbook T116 tablet.
>>
>> Link: https://gitlab.com/AdyaAdya/goodix-touchscreen-linux-driver/
>> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=202161
>> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=204513
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/input/touchscreen/goodix.c | 122 ++++++++++++++++++++++++++++-
>>  drivers/input/touchscreen/goodix.h |   1 +
>>  2 files changed, 121 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
>> index 2d38a941e7e4..691e4505cf4a 100644
>> --- a/drivers/input/touchscreen/goodix.c
>> +++ b/drivers/input/touchscreen/goodix.c
>> @@ -298,6 +298,107 @@ static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
>>  	return -ENOMSG;
>>  }
>>  
>> +static struct input_dev *goodix_create_pen_input(struct goodix_ts_data *ts)
>> +{
>> +	struct device *dev = &ts->client->dev;
>> +	struct input_dev *input;
>> +
>> +	input = devm_input_allocate_device(dev);
>> +	if (!input)
>> +		return NULL;
>> +
>> +	input_alloc_absinfo(input);
>> +	if (!input->absinfo) {
>> +		input_free_device(input);
>> +		return NULL;
>> +	}
> 
> Please drop this as input_abs_set_max() will do allocation and
> input_register_device() will reject device with ABS_* events without
> absinfo allocated.
> 
>> +
>> +	input->absinfo[ABS_X] = ts->input_dev->absinfo[ABS_MT_POSITION_X];
> 
> 	input_abs_set_max(input, ABS_X,
> 		input_abs_get_max(input, ABS_MT_POSITION_X);
> 
> or even maybe
> 
> 	input_set_abs_params(input, ABS_X,
> 		0, input_abs_get_max(input, ABS_MT_POSITION_X), 0, 0);

The reason why I'm just copying the entire absinfo struct
(and thus need the NULL check above) is because this driver uses
touchscreen_parse_properties(), so the min and fuzz values
might (theoretically) also be set through device-properties and
I wanted to cover that.

Since you don't like the above approach, I will go with the following
for the next version:

	input_set_abs_params(input, ABS_X,
			     input_abs_get_min(ts->input_dev, ABS_MT_POSITION_X),
			     input_abs_get_max(ts->input_dev, ABS_MT_POSITION_X),
			     input_abs_get_fuzz(ts->input_dev, ABS_MT_POSITION_X),
			     input_abs_get_flat(ts->input_dev, ABS_MT_POSITION_X));

(and the same for the Y axis).


> 
> 
>> +	input->absinfo[ABS_Y] = ts->input_dev->absinfo[ABS_MT_POSITION_Y];
>> +	__set_bit(ABS_X, input->absbit);
>> +	__set_bit(ABS_Y, input->absbit);
> 
> This might not be needed, depending...

Ack, will drop.

> 
>> +	input_set_abs_params(input, ABS_PRESSURE, 0, 255, 0, 0);
>> +
>> +	input_set_capability(input, EV_KEY, BTN_TOUCH);
>> +	input_set_capability(input, EV_KEY, BTN_TOOL_PEN);
>> +	input_set_capability(input, EV_KEY, BTN_STYLUS);
>> +	input_set_capability(input, EV_KEY, BTN_STYLUS2);
>> +	__set_bit(INPUT_PROP_DIRECT, input->propbit);
>> +	/*
>> +	 * The resolution of these touchscreens is about 10 units/mm, the actual
>> +	 * resolution does not matter much since we set INPUT_PROP_DIRECT.
>> +	 * Userspace wants something here though, so just set it to 10 units/mm.
>> +	 */
>> +	input_abs_set_res(input, ABS_X, 10);
>> +	input_abs_set_res(input, ABS_Y, 10);
> 
> Could it be moved next to setting up axes?

Ack, will do.

> 
>> +
>> +	input->name = "Goodix Active Pen";
>> +	input->phys = "input/pen";
>> +	input->id.bustype = BUS_I2C;
>> +	if (kstrtou16(ts->id, 10, &input->id.product))
>> +		input->id.product = 0x1001;
>> +	input->id.version = ts->version;
>> +
>> +	if (input_register_device(input) != 0) {
>> +		input_free_device(input);
> 
> Warrants a comment on why we need to free devm.
> 
> Is it going to be safely destroyed on removal? It is likely to happen
> very first thing, before we deal with interrupts, etc.

That is a very good point, since I've chosen to create the pen
input device on the first pen event, it happens after the interrupts
have been registered. So that means the driver can no longer rely
on the devm reverse-teardown order to get things right.

For the next version I will always allocate the device and only
register it on the fly. Since the devres is created when allocating
this will fix this ordering problem. The device will then still
unregister before the irq gets disabled, but it will not be
free-ed, so the irq can still safely use it.

>> +		return NULL;
>> +	}
>> +
>> +	return input;
>> +}
>> +
>> +static void goodix_ts_report_pen_down(struct goodix_ts_data *ts, u8 *data)
>> +{
>> +	int input_x, input_y, input_w;
>> +	u8 key_value;
>> +
>> +	if (!ts->input_pen) {
>> +		ts->input_pen = goodix_create_pen_input(ts);
>> +		if (!ts->input_pen)
>> +			return;
>> +	}
>> +
>> +	if (ts->contact_size == 9) {
>> +		input_x = get_unaligned_le16(&data[4]);
>> +		input_y = get_unaligned_le16(&data[6]);
>> +		input_w = get_unaligned_le16(&data[8]);
>> +	} else {
>> +		input_x = get_unaligned_le16(&data[2]);
>> +		input_y = get_unaligned_le16(&data[4]);
>> +		input_w = get_unaligned_le16(&data[6]);
>> +	}
>> +
>> +	touchscreen_report_pos(ts->input_pen, &ts->prop, input_x, input_y, false);
>> +	input_report_abs(ts->input_pen, ABS_PRESSURE, input_w);
>> +
>> +	input_report_key(ts->input_pen, BTN_TOUCH, 1);
>> +	input_report_key(ts->input_pen, BTN_TOOL_PEN, 1);
>> +
>> +	if (data[0] & GOODIX_HAVE_KEY) {
>> +		key_value = data[1 + ts->contact_size];
>> +		input_report_key(ts->input_pen, BTN_STYLUS, key_value & 0x10);
>> +		input_report_key(ts->input_pen, BTN_STYLUS2, key_value & 0x20);
> 
> Use BIT?

Ack.

> 
>> +	} else {
>> +		input_report_key(ts->input_pen, BTN_STYLUS, 0);
>> +		input_report_key(ts->input_pen, BTN_STYLUS2, 0);
>> +	}
>> +
>> +	input_sync(ts->input_pen);
>> +}
>> +
>> +static void goodix_ts_report_pen_up(struct goodix_ts_data *ts)
>> +{
>> +	if (!ts->input_pen)
>> +		return;
>> +
>> +	input_report_key(ts->input_pen, BTN_TOUCH, 0);
>> +	input_report_key(ts->input_pen, BTN_TOOL_PEN, 0);
>> +	input_report_key(ts->input_pen, BTN_STYLUS, 0);
>> +	input_report_key(ts->input_pen, BTN_STYLUS2, 0);
>> +
>> +	input_sync(ts->input_pen);
>> +}
>> +
>>  static void goodix_ts_report_touch_8b(struct goodix_ts_data *ts, u8 *coor_data)
>>  {
>>  	int id = coor_data[0] & 0x0F;
>> @@ -328,6 +429,14 @@ static void goodix_ts_report_touch_9b(struct goodix_ts_data *ts, u8 *coor_data)
>>  	input_report_abs(ts->input_dev, ABS_MT_WIDTH_MAJOR, input_w);
>>  }
>>  
>> +static void goodix_ts_release_keys(struct goodix_ts_data *ts)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < GOODIX_MAX_KEYS; i++)
>> +		input_report_key(ts->input_dev, ts->keymap[i], 0);
>> +}
>> +
>>  static void goodix_ts_report_key(struct goodix_ts_data *ts, u8 *data)
>>  {
>>  	int touch_num;
>> @@ -342,8 +451,7 @@ static void goodix_ts_report_key(struct goodix_ts_data *ts, u8 *data)
>>  				input_report_key(ts->input_dev,
>>  						 ts->keymap[i], 1);
>>  	} else {
>> -		for (i = 0; i < GOODIX_MAX_KEYS; i++)
>> -			input_report_key(ts->input_dev, ts->keymap[i], 0);
>> +		goodix_ts_release_keys(ts);
>>  	}
>>  }
>>  
>> @@ -365,6 +473,15 @@ static void goodix_process_events(struct goodix_ts_data *ts)
>>  	if (touch_num < 0)
>>  		return;
>>  
>> +	/* The pen being down is always reported as a single touch */
>> +	if (touch_num == 1 && (point_data[1] & 0x80)) {
>> +		goodix_ts_report_pen_down(ts, point_data);
>> +		goodix_ts_release_keys(ts);
>> +		goto sync; /* Release any previousle registered touches */
>> +	} else {
> 
> Not sure why we need else with goto...

It is not needed, I wrote it this way for readability, one is the
pen down path and the other the pen up path, so having that as
an if ... else ... feels more natural to me.

I plan to keep this for the next version, but if you strongly dislike this
let me know and/or feel free to modify this when you merge the next version.

Regards,

Hans


> 
>> +		goodix_ts_report_pen_up(ts);
>> +	}
>> +
>>  	goodix_ts_report_key(ts, point_data);
>>  
>>  	for (i = 0; i < touch_num; i++)
>> @@ -375,6 +492,7 @@ static void goodix_process_events(struct goodix_ts_data *ts)
>>  			goodix_ts_report_touch_8b(ts,
>>  				&point_data[1 + ts->contact_size * i]);
>>  
>> +sync:
>>  	input_mt_sync_frame(ts->input_dev);
>>  	input_sync(ts->input_dev);
>>  }
>> diff --git a/drivers/input/touchscreen/goodix.h b/drivers/input/touchscreen/goodix.h
>> index 02065d1c3263..fa8602e78a64 100644
>> --- a/drivers/input/touchscreen/goodix.h
>> +++ b/drivers/input/touchscreen/goodix.h
>> @@ -76,6 +76,7 @@ struct goodix_chip_data {
>>  struct goodix_ts_data {
>>  	struct i2c_client *client;
>>  	struct input_dev *input_dev;
>> +	struct input_dev *input_pen;
>>  	const struct goodix_chip_data *chip;
>>  	const char *firmware_name;
>>  	struct touchscreen_properties prop;
>> -- 
>> 2.33.1
>>
> 
> Thanks.
> 

