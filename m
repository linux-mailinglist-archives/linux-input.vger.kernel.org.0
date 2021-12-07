Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A01446C21E
	for <lists+linux-input@lfdr.de>; Tue,  7 Dec 2021 18:50:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240187AbhLGRyG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Dec 2021 12:54:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240180AbhLGRyG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Dec 2021 12:54:06 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1635C061574
        for <linux-input@vger.kernel.org>; Tue,  7 Dec 2021 09:50:35 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id np3so29049pjb.4
        for <linux-input@vger.kernel.org>; Tue, 07 Dec 2021 09:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xMNTKIQszHFbXUKwq72VNL0JX+EwjepHXW8gG/8mKyk=;
        b=MYvbh8hKFnhSqMpa0PsdSEfAA+HnMqwW3Rwk5Sd0DL2cngJRIz0zeYUMKkXJLZnuUG
         NMSAyZoowXGOgjSL9l7hmG5j+AOL0SAfVEZkNiT62mC9IjYxqG3P9h7qaSTYajrE/KYB
         9qx7DNSCXxzgHVspzNtwFxODD+KYh+PDhPINucdC5JI7jXF2jmWyH1H2pT4OIlOzzxky
         v0yFSbJzrvUBN+RrK7Ugv5LXCDbunOn7t9V1pHJ9lSl+0i97oMOVUIh560QSWJz+bmSj
         reX9a7VqacRDXayjYEpCPyWqmh9Oal1LpcBuuPTJOGFt7fdEHYDs+YmbIBIGstdICdcv
         Eq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xMNTKIQszHFbXUKwq72VNL0JX+EwjepHXW8gG/8mKyk=;
        b=tJ17rUxefk6Na8F6t5IoBCyFt2MFfa4ZOrEI3sae++LXPomFFAVDYbWhIi6g2opL9p
         FZCs+x9vFzMzQWOVkW6DWHRUhRHZ1igy6NAnOUPhxDjl6AB1XJbkoZKlaE877Rg9OuBT
         8HMzO22pv9HXRqbcXsPvLxDWnbNuVmWvewBOBaAWcxHMg2kOYrbOd1chKfxNbxEHGyTG
         40ewWM4XH4iq9JupAvlw5uayu2rQ9oANmP9QqgnkHs4ThZiyVT8svJ67cM7y7RiFN+VL
         uL5DFL6a37M2MjmTKGQb4thAD42u6U2gHovjKQbLq7O+MaybNT060DFNPIPjA/Qh1V1j
         Xz+w==
X-Gm-Message-State: AOAM530jBU2LujL+ZLom1Yv5eb9ccCFz/Mo9bjKwu2iSaP15Xm9Tmwto
        4XiLCtomF0oCTnPwe+IWkBe//upW5CA=
X-Google-Smtp-Source: ABdhPJw9cVrHZ3wUy9cuaWfvEBuV83rCzQ7JEPNeA7dbuYuaR3FKYR9GzQGoNA/+GXTZWO41wY6LHg==
X-Received: by 2002:a17:903:185:b0:141:f5f3:dae with SMTP id z5-20020a170903018500b00141f5f30daemr53250557plg.56.1638899435120;
        Tue, 07 Dec 2021 09:50:35 -0800 (PST)
Received: from google.com ([2620:15c:202:201:b77e:2967:5c50:8e5c])
        by smtp.gmail.com with ESMTPSA id a1sm384843pfv.99.2021.12.07.09.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 09:50:33 -0800 (PST)
Date:   Tue, 7 Dec 2021 09:50:31 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: Re: [PATCH 4/4] Input: goodix - Add pen support
Message-ID: <Ya+e5+TLgyLeTnhp@google.com>
References: <20211206164747.197309-1-hdegoede@redhat.com>
 <20211206164747.197309-5-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206164747.197309-5-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Dec 06, 2021 at 05:47:47PM +0100, Hans de Goede wrote:
> Some Goodix touchscreens have support for a (Goodix) active pen, add
> support for this. The info on how to detect when a pen is down and to
> detect when the stylus buttons are pressed was lifted from the out
> of tree Goodix driver with pen support written by Adya:
> https://gitlab.com/AdyaAdya/goodix-touchscreen-linux-driver/
> 
> Since there is no way to tell if pen support is present, the registering
> of the pen input_dev is delayed till the first pen event is detected.
> 
> This has been tested on a Trekstor Surftab duo W1, a Chuwi Hi13 and
> a Cyberbook T116 tablet.
> 
> Link: https://gitlab.com/AdyaAdya/goodix-touchscreen-linux-driver/
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=202161
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=204513
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/input/touchscreen/goodix.c | 122 ++++++++++++++++++++++++++++-
>  drivers/input/touchscreen/goodix.h |   1 +
>  2 files changed, 121 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index 2d38a941e7e4..691e4505cf4a 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -298,6 +298,107 @@ static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
>  	return -ENOMSG;
>  }
>  
> +static struct input_dev *goodix_create_pen_input(struct goodix_ts_data *ts)
> +{
> +	struct device *dev = &ts->client->dev;
> +	struct input_dev *input;
> +
> +	input = devm_input_allocate_device(dev);
> +	if (!input)
> +		return NULL;
> +
> +	input_alloc_absinfo(input);
> +	if (!input->absinfo) {
> +		input_free_device(input);
> +		return NULL;
> +	}

Please drop this as input_abs_set_max() will do allocation and
input_register_device() will reject device with ABS_* events without
absinfo allocated.

> +
> +	input->absinfo[ABS_X] = ts->input_dev->absinfo[ABS_MT_POSITION_X];

	input_abs_set_max(input, ABS_X,
		input_abs_get_max(input, ABS_MT_POSITION_X);

or even maybe

	input_set_abs_params(input, ABS_X,
		0, input_abs_get_max(input, ABS_MT_POSITION_X), 0, 0);


> +	input->absinfo[ABS_Y] = ts->input_dev->absinfo[ABS_MT_POSITION_Y];
> +	__set_bit(ABS_X, input->absbit);
> +	__set_bit(ABS_Y, input->absbit);

This might not be needed, depending...

> +	input_set_abs_params(input, ABS_PRESSURE, 0, 255, 0, 0);
> +
> +	input_set_capability(input, EV_KEY, BTN_TOUCH);
> +	input_set_capability(input, EV_KEY, BTN_TOOL_PEN);
> +	input_set_capability(input, EV_KEY, BTN_STYLUS);
> +	input_set_capability(input, EV_KEY, BTN_STYLUS2);
> +	__set_bit(INPUT_PROP_DIRECT, input->propbit);
> +	/*
> +	 * The resolution of these touchscreens is about 10 units/mm, the actual
> +	 * resolution does not matter much since we set INPUT_PROP_DIRECT.
> +	 * Userspace wants something here though, so just set it to 10 units/mm.
> +	 */
> +	input_abs_set_res(input, ABS_X, 10);
> +	input_abs_set_res(input, ABS_Y, 10);

Could it be moved next to setting up axes?

> +
> +	input->name = "Goodix Active Pen";
> +	input->phys = "input/pen";
> +	input->id.bustype = BUS_I2C;
> +	if (kstrtou16(ts->id, 10, &input->id.product))
> +		input->id.product = 0x1001;
> +	input->id.version = ts->version;
> +
> +	if (input_register_device(input) != 0) {
> +		input_free_device(input);

Warrants a comment on why we need to free devm.

Is it going to be safely destroyed on removal? It is likely to happen
very first thing, before we deal with interrupts, etc.


> +		return NULL;
> +	}
> +
> +	return input;
> +}
> +
> +static void goodix_ts_report_pen_down(struct goodix_ts_data *ts, u8 *data)
> +{
> +	int input_x, input_y, input_w;
> +	u8 key_value;
> +
> +	if (!ts->input_pen) {
> +		ts->input_pen = goodix_create_pen_input(ts);
> +		if (!ts->input_pen)
> +			return;
> +	}
> +
> +	if (ts->contact_size == 9) {
> +		input_x = get_unaligned_le16(&data[4]);
> +		input_y = get_unaligned_le16(&data[6]);
> +		input_w = get_unaligned_le16(&data[8]);
> +	} else {
> +		input_x = get_unaligned_le16(&data[2]);
> +		input_y = get_unaligned_le16(&data[4]);
> +		input_w = get_unaligned_le16(&data[6]);
> +	}
> +
> +	touchscreen_report_pos(ts->input_pen, &ts->prop, input_x, input_y, false);
> +	input_report_abs(ts->input_pen, ABS_PRESSURE, input_w);
> +
> +	input_report_key(ts->input_pen, BTN_TOUCH, 1);
> +	input_report_key(ts->input_pen, BTN_TOOL_PEN, 1);
> +
> +	if (data[0] & GOODIX_HAVE_KEY) {
> +		key_value = data[1 + ts->contact_size];
> +		input_report_key(ts->input_pen, BTN_STYLUS, key_value & 0x10);
> +		input_report_key(ts->input_pen, BTN_STYLUS2, key_value & 0x20);

Use BIT?

> +	} else {
> +		input_report_key(ts->input_pen, BTN_STYLUS, 0);
> +		input_report_key(ts->input_pen, BTN_STYLUS2, 0);
> +	}
> +
> +	input_sync(ts->input_pen);
> +}
> +
> +static void goodix_ts_report_pen_up(struct goodix_ts_data *ts)
> +{
> +	if (!ts->input_pen)
> +		return;
> +
> +	input_report_key(ts->input_pen, BTN_TOUCH, 0);
> +	input_report_key(ts->input_pen, BTN_TOOL_PEN, 0);
> +	input_report_key(ts->input_pen, BTN_STYLUS, 0);
> +	input_report_key(ts->input_pen, BTN_STYLUS2, 0);
> +
> +	input_sync(ts->input_pen);
> +}
> +
>  static void goodix_ts_report_touch_8b(struct goodix_ts_data *ts, u8 *coor_data)
>  {
>  	int id = coor_data[0] & 0x0F;
> @@ -328,6 +429,14 @@ static void goodix_ts_report_touch_9b(struct goodix_ts_data *ts, u8 *coor_data)
>  	input_report_abs(ts->input_dev, ABS_MT_WIDTH_MAJOR, input_w);
>  }
>  
> +static void goodix_ts_release_keys(struct goodix_ts_data *ts)
> +{
> +	int i;
> +
> +	for (i = 0; i < GOODIX_MAX_KEYS; i++)
> +		input_report_key(ts->input_dev, ts->keymap[i], 0);
> +}
> +
>  static void goodix_ts_report_key(struct goodix_ts_data *ts, u8 *data)
>  {
>  	int touch_num;
> @@ -342,8 +451,7 @@ static void goodix_ts_report_key(struct goodix_ts_data *ts, u8 *data)
>  				input_report_key(ts->input_dev,
>  						 ts->keymap[i], 1);
>  	} else {
> -		for (i = 0; i < GOODIX_MAX_KEYS; i++)
> -			input_report_key(ts->input_dev, ts->keymap[i], 0);
> +		goodix_ts_release_keys(ts);
>  	}
>  }
>  
> @@ -365,6 +473,15 @@ static void goodix_process_events(struct goodix_ts_data *ts)
>  	if (touch_num < 0)
>  		return;
>  
> +	/* The pen being down is always reported as a single touch */
> +	if (touch_num == 1 && (point_data[1] & 0x80)) {
> +		goodix_ts_report_pen_down(ts, point_data);
> +		goodix_ts_release_keys(ts);
> +		goto sync; /* Release any previousle registered touches */
> +	} else {

Not sure why we need else with goto...

> +		goodix_ts_report_pen_up(ts);
> +	}
> +
>  	goodix_ts_report_key(ts, point_data);
>  
>  	for (i = 0; i < touch_num; i++)
> @@ -375,6 +492,7 @@ static void goodix_process_events(struct goodix_ts_data *ts)
>  			goodix_ts_report_touch_8b(ts,
>  				&point_data[1 + ts->contact_size * i]);
>  
> +sync:
>  	input_mt_sync_frame(ts->input_dev);
>  	input_sync(ts->input_dev);
>  }
> diff --git a/drivers/input/touchscreen/goodix.h b/drivers/input/touchscreen/goodix.h
> index 02065d1c3263..fa8602e78a64 100644
> --- a/drivers/input/touchscreen/goodix.h
> +++ b/drivers/input/touchscreen/goodix.h
> @@ -76,6 +76,7 @@ struct goodix_chip_data {
>  struct goodix_ts_data {
>  	struct i2c_client *client;
>  	struct input_dev *input_dev;
> +	struct input_dev *input_pen;
>  	const struct goodix_chip_data *chip;
>  	const char *firmware_name;
>  	struct touchscreen_properties prop;
> -- 
> 2.33.1
> 

Thanks.

-- 
Dmitry
