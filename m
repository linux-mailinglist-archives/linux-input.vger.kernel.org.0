Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 878E1180066
	for <lists+linux-input@lfdr.de>; Tue, 10 Mar 2020 15:40:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgCJOky (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Mar 2020 10:40:54 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:56336 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726391AbgCJOky (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Mar 2020 10:40:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583851252;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Dq1vhF0dKjl3fc6nNZ48fRNH1oQ4uhM71+xleaLQo+Y=;
        b=NPD8MwQSXUyYORtDwn8vb6gV3y3YqWDNh8dj+4efsSwCunqjOuqtSZsAgKUYQmGm9G3+nY
        +pefE8w5eyJpXBAHfWSTlaY1FiIxA4xXY0STefs9iODzrIXGt1BrkJf20DMZNhwodKF6P0
        H8l67LTRBt8JUuA+/KoeuuOIW/7ZPqY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-HEu-q-hJMoK9V6WDeI3GaA-1; Tue, 10 Mar 2020 10:40:50 -0400
X-MC-Unique: HEu-q-hJMoK9V6WDeI3GaA-1
Received: by mail-wr1-f69.google.com with SMTP id j17so2215781wru.19
        for <linux-input@vger.kernel.org>; Tue, 10 Mar 2020 07:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Dq1vhF0dKjl3fc6nNZ48fRNH1oQ4uhM71+xleaLQo+Y=;
        b=Bq+a+iXgGyUsKwCgCa9/d/7d+MkhoV7I5JrQCZINsZlKs08lTmywfhPGzKsjYXAr41
         fsVx3U3c1tWfu3jmCTEv720NYIFbDApuQA5RjSGVaMRWGvRD7CYn2gTHVgIeUR2F5Dn7
         WaYoLSCSxDwZroqod5M68GZUMZQ9E96emhPxtIZFCBxHlmnvqSjF0fzL73Un7jm/wzhj
         zcbYZeNKmeB7TcDGGbP1fxHC0m49EsBe/2Q1jSOZxQlgZi0EiIn0lEZ7ZNynZnMlH73B
         JzkMDs8tDeyl8lmyIBq0vKN8dWHLtf0s8x98XoNBwEYaJPSWzr5p5eUJSwgMpIkGybVp
         /dOQ==
X-Gm-Message-State: ANhLgQ3UmS5rAfaqCSr4uD8QNTyftvm5O0erCtSO68ZwoW5euneFll7s
        OGkXHbv1X/pbGOK4mY4LM29zr/bxLga3ChJdZ15at6O7YUcj2pDfbL7ZEh20yg9kk38onjflcR2
        y9BQgFnDKexzukx2OnzWfzUw=
X-Received: by 2002:a5d:6086:: with SMTP id w6mr27365667wrt.224.1583851249132;
        Tue, 10 Mar 2020 07:40:49 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsTQQc7XQk5NgxXrenpCxl8xat4Sb6jj+rVrXgT+E+CmeX01V7St328+dRgV3FTmmNabzqKMg==
X-Received: by 2002:a5d:6086:: with SMTP id w6mr27365649wrt.224.1583851248863;
        Tue, 10 Mar 2020 07:40:48 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id y184sm4460282wmd.43.2020.03.10.07.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2020 07:40:48 -0700 (PDT)
Subject: Re: [PATCH 1/2] Input: goodix - Add support for touch-keys and
 keycode mapping
To:     Dmitry Mastykin <dmastykin@astralinux.ru>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     linux-input@vger.kernel.org
References: <20200310131705.13516-1-dmastykin@astralinux.ru>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <44683bdc-9608-d6ea-2b87-b2c65b09f754@redhat.com>
Date:   Tue, 10 Mar 2020 15:40:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310131705.13516-1-dmastykin@astralinux.ru>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

Thank you for your patches.

On 3/10/20 2:17 PM, Dmitry Mastykin wrote:
> KEY_LEFTMETA is assigned to the first touch-key (it will be the default
> keycode for devices with a single touch-key).
> KEY_F1, KEY_F2... are assigned to other touch-keys.
> One may assign any keycodes via HWDB.

I think the commit message could use some work, e.g. something like this:

###

Subj: Input: goodix - Add support for more then one touch-key

Some devices with a goodix touchscreen have more then 1 capacitive
touch-key. This commit replaces the current support for a single
touch-key, which ignored the reported key-code. With support for
up to 7 touch-keys, based upon checking the key-code which is
post-fixed to any reported touch-data.

KEY_LEFTMETA is assigned to the first touch-key (it will still be
the default keycode for devices with a single touch-key).
KEY_F1, KEY_F2... are assigned as default keycode for the other
touch-keys.

This commit also add supports for keycode remapping, so that
systemd-udev's hwdb can be used to remap the codes to send
keycodes to match the icons on the buttons for devices with more
then 1 touch-key.

###

> Previous press/release behavior has changed.
> Before: both press/release events were generated on key touch.
> Now: press/release events correspond to real touch and release now.

Looking at the old code I do not think that this is correct,
the old code keeps reporting KEY_LEFTMETA as pressed as long as
the GOODIX_HAVE_KEY is set. I guess the undesirable behavior you
describe here was the result of an earlier version of your
patch to support more then one touch key.

> Signed-off-by: Dmitry Mastykin <dmastykin@astralinux.ru>

Other then the remarks about the commit message this looks
good to me.

Regards,

Hans


> ---
>   drivers/input/touchscreen/goodix.c | 54 ++++++++++++++++++++++++------
>   1 file changed, 44 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index fdec508..6a7ecc6 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -38,6 +38,7 @@
>   #define GOODIX_CONTACT_SIZE		8
>   #define GOODIX_MAX_CONTACT_SIZE		9
>   #define GOODIX_MAX_CONTACTS		10
> +#define GOODIX_MAX_KEYS			7
>   
>   #define GOODIX_CONFIG_MIN_LENGTH	186
>   #define GOODIX_CONFIG_911_LENGTH	186
> @@ -55,6 +56,7 @@
>   #define GOODIX_REG_ID			0x8140
>   
>   #define GOODIX_BUFFER_STATUS_READY	BIT(7)
> +#define GOODIX_HAVE_KEY			BIT(4)
>   #define GOODIX_BUFFER_STATUS_TIMEOUT	20
>   
>   #define RESOLUTION_LOC		1
> @@ -100,6 +102,7 @@ struct goodix_ts_data {
>   	enum goodix_irq_pin_access_method irq_pin_access_method;
>   	unsigned int contact_size;
>   	u8 config[GOODIX_CONFIG_MAX_LENGTH];
> +	unsigned short keymap[GOODIX_MAX_KEYS];
>   };
>   
>   static int goodix_check_cfg_8(struct goodix_ts_data *ts,
> @@ -285,8 +288,14 @@ static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
>   	 */
>   	max_timeout = jiffies + msecs_to_jiffies(GOODIX_BUFFER_STATUS_TIMEOUT);
>   	do {
> +		/*
> +		 * We are going to read ts->contact_size * max(1, touch_num) + 2
> +		 * bytes, where + 2 consists of reading 1 extra byte for the
> +		 * header + 1 extra byte for the footer which contains the
> +		 * touch-key code.
> +		 */
>   		error = goodix_i2c_read(ts->client, GOODIX_READ_COOR_ADDR,
> -					data, ts->contact_size + 1);
> +					data, ts->contact_size + 2);
>   		if (error) {
>   			dev_err(&ts->client->dev, "I2C transfer error: %d\n",
>   					error);
> @@ -299,10 +308,10 @@ static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
>   				return -EPROTO;
>   
>   			if (touch_num > 1) {
> -				data += 1 + ts->contact_size;
> +				data += 2 + ts->contact_size;
>   				error = goodix_i2c_read(ts->client,
>   						GOODIX_READ_COOR_ADDR +
> -							1 + ts->contact_size,
> +							2 + ts->contact_size,
>   						data,
>   						ts->contact_size *
>   							(touch_num - 1));
> @@ -353,6 +362,23 @@ static void goodix_ts_report_touch_9b(struct goodix_ts_data *ts, u8 *coor_data)
>   	input_report_abs(ts->input_dev, ABS_MT_WIDTH_MAJOR, input_w);
>   }
>   
> +static void goodix_ts_report_key(struct goodix_ts_data *ts, u8 *data)
> +{
> +	int touch_num;
> +	u8 key_value;
> +	int i;
> +
> +	if (data[0] & GOODIX_HAVE_KEY) {
> +		touch_num = data[0] & 0x0f;
> +		key_value = data[1 + ts->contact_size * touch_num];
> +		for (i = 0; i < GOODIX_MAX_KEYS; ++i)
> +			if (key_value & (1 << i))
> +				input_report_key(ts->input_dev, ts->keymap[i], 1);
> +	} else
> +		for (i = 0; i < GOODIX_MAX_KEYS; ++i)
> +			input_report_key(ts->input_dev, ts->keymap[i], 0);
> +}
> +
>   /**
>    * goodix_process_events - Process incoming events
>    *
> @@ -363,7 +389,7 @@ static void goodix_ts_report_touch_9b(struct goodix_ts_data *ts, u8 *coor_data)
>    */
>   static void goodix_process_events(struct goodix_ts_data *ts)
>   {
> -	u8  point_data[1 + GOODIX_MAX_CONTACT_SIZE * GOODIX_MAX_CONTACTS];
> +	u8  point_data[2 + GOODIX_MAX_CONTACT_SIZE * GOODIX_MAX_CONTACTS];
>   	int touch_num;
>   	int i;
>   
> @@ -371,11 +397,7 @@ static void goodix_process_events(struct goodix_ts_data *ts)
>   	if (touch_num < 0)
>   		return;
>   
> -	/*
> -	 * Bit 4 of the first byte reports the status of the capacitive
> -	 * Windows/Home button.
> -	 */
> -	input_report_key(ts->input_dev, KEY_LEFTMETA, point_data[0] & BIT(4));
> +	goodix_ts_report_key(ts, point_data);
>   
>   	for (i = 0; i < touch_num; i++)
>   		if (ts->contact_size == 9)
> @@ -961,6 +983,7 @@ static int goodix_i2c_test(struct i2c_client *client)
>   static int goodix_configure_dev(struct goodix_ts_data *ts)
>   {
>   	int error;
> +	int i;
>   
>   	ts->int_trigger_type = GOODIX_INT_TRIGGER;
>   	ts->max_touch_num = GOODIX_MAX_CONTACTS;
> @@ -978,8 +1001,19 @@ static int goodix_configure_dev(struct goodix_ts_data *ts)
>   	ts->input_dev->id.product = ts->id;
>   	ts->input_dev->id.version = ts->version;
>   
> +	ts->input_dev->keycode = ts->keymap;
> +	ts->input_dev->keycodesize = sizeof(ts->keymap[0]);
> +	ts->input_dev->keycodemax = GOODIX_MAX_KEYS;
> +
>   	/* Capacitive Windows/Home button on some devices */
> -	input_set_capability(ts->input_dev, EV_KEY, KEY_LEFTMETA);
> +	for (i = 0; i < GOODIX_MAX_KEYS; ++i) {
> +		if (i == 0)
> +			ts->keymap[i] = KEY_LEFTMETA;
> +		else
> +			ts->keymap[i] = KEY_F1 + (i - 1);
> +
> +		input_set_capability(ts->input_dev, EV_KEY, ts->keymap[i]);
> +	}
>   
>   	input_set_capability(ts->input_dev, EV_ABS, ABS_MT_POSITION_X);
>   	input_set_capability(ts->input_dev, EV_ABS, ABS_MT_POSITION_Y);
> 

