Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0FEF1845AA
	for <lists+linux-input@lfdr.de>; Fri, 13 Mar 2020 12:10:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbgCMLKy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Mar 2020 07:10:54 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52458 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726464AbgCMLKy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Mar 2020 07:10:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584097853;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LB6qkdux4fXta57Utly0BigU6E3JthYrCbuDU+5TbtI=;
        b=G4cTgxOFMGXBzMaQeT2KcSKIQu4vlFV959m7KTPtI33nQgMMPjSt0MUxstRwCM1lMqQoex
        9IlxRcC/AE57GgJtHdSQzY7N8gSQ1F8Y6FcVUS0eJzziEOfk0S25rGPzXaX4LU3U5mhxgd
        ay9aKIs5uOGOLqQUATYRIDNeIFU8Rf0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-36Jp4z_8NVW-K8br9cD4nA-1; Fri, 13 Mar 2020 07:10:51 -0400
X-MC-Unique: 36Jp4z_8NVW-K8br9cD4nA-1
Received: by mail-wr1-f69.google.com with SMTP id z13so4097318wrv.7
        for <linux-input@vger.kernel.org>; Fri, 13 Mar 2020 04:10:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LB6qkdux4fXta57Utly0BigU6E3JthYrCbuDU+5TbtI=;
        b=nEVFAJ772Xtsk6JQIAOOucQaLa8MMzhuPvttcjdXcxsQ4b3o9D/eWhmCHIXGz9UlY5
         Pic71Fl9RRMi+I/1YTp0k8aK6ckuLtusJTg+ceInWGGUkz78wl/r5A/beCqN0Q3Zi4Tj
         +t/i8EJlVMH8ZaS4qM/nFx+agsUTwraYa41a21wrBKjXVUc412Ib6eFnupySppKBjNZy
         +l35q/zilk6dml98iO5uskBzZs8dXliPJg/oAvBCFMScc/b+MrEmOP9SJFZF02fWWtXv
         h4TtOpDfWeoei58DiSwUxNpaZC15wM93TvskH+DlZst/vp74xy9ct97AJhoePMNw4JmR
         Z8HA==
X-Gm-Message-State: ANhLgQ2rbzivuZZVaiM7zxf6SGDK1mUQzTW9o14SBFErbIeIp73OVtRT
        7lJ1P5vOHWA18lnuACV14lD3xleFh/SMYsc5gR6Iay9nXN7bS3PnYJtvbmVgcDnDvFNnPPTm2Ky
        7duVPfPvW4NS9Q+f4Afvq8lo=
X-Received: by 2002:a5d:6408:: with SMTP id z8mr17098002wru.122.1584097850384;
        Fri, 13 Mar 2020 04:10:50 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvX/y2OacXs25cZOXMIQUXpz9PXsLFe8uabKTI9H/B+/oNkP3h0RLV6B8SiFvcqsuNEhANV+Q==
X-Received: by 2002:a5d:6408:: with SMTP id z8mr17097979wru.122.1584097850146;
        Fri, 13 Mar 2020 04:10:50 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id e7sm59622708wrt.70.2020.03.13.04.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2020 04:10:49 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] Input: goodix - Add support for more then one
 touch-key
To:     Dmitry Mastykin <dmastykin@astralinux.ru>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     linux-input@vger.kernel.org
References: <20200312145009.27449-1-dmastykin@astralinux.ru>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4526f57e-2232-5ef3-6820-e2b9094aef0c@redhat.com>
Date:   Fri, 13 Mar 2020 12:10:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200312145009.27449-1-dmastykin@astralinux.ru>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 3/12/20 3:50 PM, Dmitry Mastykin wrote:
> Some devices with a goodix touchscreen have more then 1 capacitive
> touch-key. This commit replaces the current support for a single
> touch-key, which ignored the reported key-code. With support for
> up to 7 touch-keys, based upon checking the key-code which is
> post-fixed to any reported touch-data.
> 
> KEY_LEFTMETA is assigned to the first touch-key (it will still be
> the default keycode for devices with a single touch-key).
> KEY_F1, KEY_F2... are assigned as default keycode for the other
> touch-keys.
> 
> This commit also add supports for keycode remapping, so that
> systemd-udev's hwdb can be used to remap the codes to send
> keycodes to match the icons on the buttons for devices with more
> then 1 touch-key.
> 
> Signed-off-by: Dmitry Mastykin <dmastykin@astralinux.ru>

Thank you.

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
> Changes in v2:
> - Improve commit message
> ---
>   drivers/input/touchscreen/goodix.c | 54 ++++++++++++++++++++++++------
>   1 file changed, 44 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index adb9b92..daf1781 100644
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

