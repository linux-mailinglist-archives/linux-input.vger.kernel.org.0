Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72C7E11C1B3
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2019 01:54:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727345AbfLLAyS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Dec 2019 19:54:18 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40268 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbfLLAyS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Dec 2019 19:54:18 -0500
Received: by mail-lf1-f65.google.com with SMTP id i23so301601lfo.7;
        Wed, 11 Dec 2019 16:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=G9Qg/GyPOd9K6cMtoRafpLeoPZbmboxVDp4qkKep044=;
        b=cyG2KgzTYpa2RLZLCT1xK9/x5Wm13gaf3Z/K95ojZPT7sh5dmhhqpPvH41iT5gYXOy
         UlSOu6SWxf1bE/lQrqpspUAwGrYs/FqOTVi7spe60wfVKMfSqQi4i5FnuDYu8MxOYN6Y
         CHVThnBBlXCAFh0Fl02uoqIM6C5K5qS/EsUMsDEIDRy6vzmD3Q+yUY8A340VfO3GKOoB
         23horKorV2al/UgFbzV6a1lfyQ6J61d7cWtI1oGS0iiBIg797TBYHtmqU0kOS2HaTrvT
         z+lZhI1CpozHeRRdEwLAn4rZGj3xvpV2XFN0KZRbFfPoFi82ZGzd2odm4C71H+bV5Tpe
         yrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=G9Qg/GyPOd9K6cMtoRafpLeoPZbmboxVDp4qkKep044=;
        b=IUeGwPIP2Hwof4qLONtua9Hb9cowHQ89nBN0qgH3OssbRSm9ngM9mxoVjfTlPKGI+c
         wVVglz27AbggYIuyFUZwBrdUYgnk7+RVtfreq4Pg+M2XUfJJPJ4vye80W1eOY5LapKl/
         EflABHct6rsf9tt5lq8tGFRE5fTgYZDggXf8SzIZ0lJmveG+jq41rfE5HQqRvaEwI5+A
         VLaz3nhyj0x0L3A26Wrsq1iEV/wEH9FcU93AGKsb2cEQTYg8BwEXelBqiKKrjcsf8Q5V
         zpeTOg3+emiySpTa7tiOWp2aNJigJ1+NDoCtHyuD0BL9sffGbmRsKGHF5UYdhbMs5P1W
         Pxtw==
X-Gm-Message-State: APjAAAUqS9mBPNuBaay/0qSWafk6TkmHUR07ah7+55LC/fEYewsNeG0U
        6QWS97acmvetcw/VFwWP4+E=
X-Google-Smtp-Source: APXvYqzEMmSTnj9o5/mEH8I77pXpxWljgb2sZufJlSi5xWVeo5B4nrSzy0u0LnC2dkGHFCp8w2tEGg==
X-Received: by 2002:ac2:420e:: with SMTP id y14mr4083282lfh.145.1576112055177;
        Wed, 11 Dec 2019 16:54:15 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id l8sm1974300ljj.96.2019.12.11.16.54.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 16:54:14 -0800 (PST)
Subject: Re: [PATCH v2 2/9] input: elants: support old touch report format
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh-dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>
References: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
 <2b5e15ea600c33dfab4aa50e360ec553f1af7db0.1576079249.git.mirq-linux@rere.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f53b507c-76dd-8733-9698-952aa7a7301f@gmail.com>
Date:   Thu, 12 Dec 2019 03:54:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <2b5e15ea600c33dfab4aa50e360ec553f1af7db0.1576079249.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

11.12.2019 19:03, Michał Mirosław пишет:
> Support ELAN touchpad sensor with older firmware as found on eg. Asus
> Transformer Pads.
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
>  drivers/input/touchscreen/elants_i2c.c | 36 ++++++++++++++++++--------
>  1 file changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index 887888c53996..eadd26d5a06f 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -65,6 +65,7 @@
>  #define CMD_HEADER_REK		0x66
>  
>  /* FW position data */
> +#define PACKET_SIZE_OLD		40
>  #define PACKET_SIZE		55
>  #define MAX_CONTACT_NUM		10
>  #define FW_POS_HEADER		0
> @@ -792,7 +793,8 @@ static int elants_i2c_fw_update(struct elants_data *ts)
>   * Event reporting.
>   */
>  
> -static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf)
> +static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf,
> +				size_t report_len)
>  {
>  	struct input_dev *input = ts->input;
>  	unsigned int n_fingers;
> @@ -804,7 +806,8 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf)
>  			buf[FW_POS_STATE];
>  
>  	dev_dbg(&ts->client->dev,
> -		"n_fingers: %u, state: %04x\n",  n_fingers, finger_state);
> +		"n_fingers: %u, state: %04x, report_len: %zu\n",
> +		n_fingers, finger_state, report_len);
>  
>  	for (i = 0; i < MAX_CONTACT_NUM && n_fingers; i++) {
>  		if (finger_state & 1) {
> @@ -814,8 +817,16 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf)
>  			pos = &buf[FW_POS_XY + i * 3];
>  			x = (((u16)pos[0] & 0xf0) << 4) | pos[1];
>  			y = (((u16)pos[0] & 0x0f) << 8) | pos[2];
> -			p = buf[FW_POS_PRESSURE + i];
> -			w = buf[FW_POS_WIDTH + i];
> +			if (report_len == PACKET_SIZE_OLD) {
> +				w = buf[FW_POS_WIDTH + i / 2];
> +				w >>= 4 * (~i & 1);	// little-endian-nibbles
> +				w |= w << 4;
> +				w |= !w;
> +				p = w;

Did you copy this from the downstream driver as-is? I'm looking at the
Nexus 7 driver and it does the following for older format:

u8 size_idx[] = { 35, 35, 36, 36, 37, 37, 38, 38, 39, 39 };
unsigned int s;

if (i & 1)
	s = buf[size_idx[i]];
else
	s = buf[size_idx[i]] / 16;

w = s & 0xf;
p = s * 16;

> +			} else {
> +				p = buf[FW_POS_PRESSURE + i];
> +				w = buf[FW_POS_WIDTH + i];
> +			}
>  
>  			dev_dbg(&ts->client->dev, "i=%d x=%d y=%d p=%d w=%d\n",
>  				i, x, y, p, w);
> @@ -848,7 +859,8 @@ static u8 elants_i2c_calculate_checksum(u8 *buf)
>  	return checksum;
>  }
>  
> -static void elants_i2c_event(struct elants_data *ts, u8 *buf)
> +static void elants_i2c_event(struct elants_data *ts, u8 *buf,
> +			     size_t report_len)
>  {
>  	u8 checksum = elants_i2c_calculate_checksum(buf);
>  
> @@ -862,7 +874,7 @@ static void elants_i2c_event(struct elants_data *ts, u8 *buf)
>  			 "%s: unknown packet type: %02x\n",
>  			 __func__, buf[FW_POS_HEADER]);
>  	else
> -		elants_i2c_mt_event(ts, buf);
> +		elants_i2c_mt_event(ts, buf, report_len);
>  }
>  
>  static irqreturn_t elants_i2c_irq(int irq, void *_dev)
> @@ -920,7 +932,8 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
>  			break;
>  
>  		case QUEUE_HEADER_SINGLE:
> -			elants_i2c_event(ts, &ts->buf[HEADER_SIZE]);
> +			elants_i2c_event(ts, &ts->buf[HEADER_SIZE],
> +					 ts->buf[FW_HDR_LENGTH]);
>  			break;
>  
>  		case QUEUE_HEADER_NORMAL:
> @@ -933,17 +946,18 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
>  			}
>  
>  			report_len = ts->buf[FW_HDR_LENGTH] / report_count;
> -			if (report_len != PACKET_SIZE) {
> +			if (report_len != PACKET_SIZE &&
> +			    report_len != PACKET_SIZE_OLD) {
>  				dev_err(&client->dev,
> -					"mismatching report length: %*ph\n",
> +					"unsupported report length: %*ph\n",
>  					HEADER_SIZE, ts->buf);
>  				break;
>  			}
>  
>  			for (i = 0; i < report_count; i++) {
>  				u8 *buf = ts->buf + HEADER_SIZE +
> -							i * PACKET_SIZE;
> -				elants_i2c_event(ts, buf);
> +					  i * report_len;
> +				elants_i2c_event(ts, buf, report_len);
>  			}
>  			break;
>  
> 
