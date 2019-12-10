Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28BE2117D1B
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2019 02:23:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727221AbfLJBXP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 20:23:15 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36687 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727059AbfLJBXP (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Dec 2019 20:23:15 -0500
Received: by mail-lj1-f195.google.com with SMTP id r19so17924303ljg.3;
        Mon, 09 Dec 2019 17:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kqwT2YZ76KH7yigSs7gBgrzgqef0EwdSdQFxmO8Z/Yc=;
        b=ixJ82yxRw60wEXQu+KAy+B0WW3sqUv5DlZkwQfdS/M7HscVX/CX4D/sKIOacZ0lCcx
         BTGvEA6GyeEtWfd9Seu66WOzNpfa2judcEPmZpXu4/V6/M+bJZ+DCyH+IAMMaPFu1Eck
         c6RA4msz2oIgbh3qFpeeU/67rxIAdAetIaKOF17tA4pAaNoDD4i6bLGfWTO9kZIEuMVe
         IaeI0FwSVF7yQf9umpZkTzoDP+OYejcjwAcaDLYPS4gxiJR7ymLiYmGHQizqK1fFh1kJ
         4H8YZrzImJRo655NQK185UFVH6sv/L08jJ/Y1602HEoWZhLehHWYFC4JNUmvw19W+Ss1
         xkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kqwT2YZ76KH7yigSs7gBgrzgqef0EwdSdQFxmO8Z/Yc=;
        b=dGnDiItBEDD8sKufWDV9iY6MZ3URdD/67fh6cHe3oCwKGaioqvxNgs8lOi6GlCn0+X
         eK3dCnKObLkxOA7djbR+PAswEmqXxCb9GTAkPfP7VM0ZjRj4eoXIuRCgmttzQVKmVu82
         WK/O4StUhTbN/JOvya3aIDXBmknX9QNSkUXX1bgv5VTYgwEdDsSn8EiyulTr0vcTR9h+
         RFVNGdl9TDC8rYX10djWdTAtSnmQMYiUIt/6jvkfY3JjhqZMwR1b2MVclzNvPdEvxgD0
         RxRW1lLrql7ZBxrafF98STqW8ELrph3rmJfvzVrXt+bMLUTRb7+F09w07cJy0lU/LTcd
         ByhA==
X-Gm-Message-State: APjAAAXsyksGGHTP1QxdY5DxjHExzdKmfnb+FERgQvHhG5s2Md4Ffh6J
        hbxWAB9GLYGxSFB1ymFfptyUxauL
X-Google-Smtp-Source: APXvYqz0QT99Pmnbt4Mb7joxr+vE2sWjdTlvsR7RXOgu/nO1XOEGpB5gxfMAFmU5P4fMRy7vgxR+bA==
X-Received: by 2002:a2e:9842:: with SMTP id e2mr19159377ljj.101.1575940991780;
        Mon, 09 Dec 2019 17:23:11 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id u19sm736783ljk.75.2019.12.09.17.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2019 17:23:11 -0800 (PST)
Subject: Re: [PATCH 6/6] input: elants: read touchscreen size for EKTF3624
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org
References: <cover.1575936961.git.mirq-linux@rere.qmqm.pl>
 <06f20ed8e50fe634c59cf3c585d37f1175133533.1575936961.git.mirq-linux@rere.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fd020252-0646-5d01-95d6-aff79b8709f6@gmail.com>
Date:   Tue, 10 Dec 2019 04:23:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <06f20ed8e50fe634c59cf3c585d37f1175133533.1575936961.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

10.12.2019 03:19, Michał Mirosław пишет:
> EKTF3624 as present in Asus TF300T tablet has touchscreen size encoded
> in different registers.
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
>  drivers/input/touchscreen/elants_i2c.c | 77 ++++++++++++++++++++++++--
>  1 file changed, 72 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index 27aca3971da5..e60a5eb9fb37 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -34,7 +34,7 @@
>  #include <linux/input/touchscreen.h>
>  #include <linux/input/mt.h>
>  #include <linux/acpi.h>
> -#include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/regulator/consumer.h>
>  #include <asm/unaligned.h>
> @@ -42,6 +42,10 @@
>  /* Device, Driver information */
>  #define DEVICE_NAME	"elants_i2c"
>  
> +/* Device IDs */
> +#define EKTH3500	0
> +#define EKTF3624	1
> +
>  /* Convert from rows or columns into resolution */
>  #define ELAN_TS_RESOLUTION(n, m)   (((n) - 1) * (m))
>  
> @@ -160,6 +164,7 @@ struct elants_data {
>  
>  	bool wake_irq_enabled;
>  	bool keep_power_in_suspend;
> +	u8 chip_id;
>  
>  	/* Must be last to be used for DMA operations */
>  	u8 buf[MAX_PACKET_SIZE] ____cacheline_aligned;
> @@ -434,7 +439,53 @@ static int elants_i2c_query_bc_version(struct elants_data *ts)
>  	return 0;
>  }
>  
> -static int elants_i2c_query_ts_info(struct elants_data *ts)
> +static int elants_i2c_query_ts_info_ektf(struct elants_data *ts)
> +{
> +	struct i2c_client *client = ts->client;
> +	int error;
> +	u8 resp[4];
> +	u16 phy_x, phy_y;
> +	const u8 get_xres_cmd[] = {
> +		CMD_HEADER_READ, E_INFO_X_RES, 0x00, 0x00
> +	};
> +	const u8 get_yres_cmd[] = {
> +		CMD_HEADER_READ, E_INFO_Y_RES, 0x00, 0x00
> +	};
> +
> +	/* Get X/Y size in mm */
> +	error = elants_i2c_execute_command(client, get_xres_cmd,
> +					   sizeof(get_xres_cmd),
> +					   resp, sizeof(resp), 1,
> +					   "get X size");
> +	if (error)
> +		return error;
> +
> +	phy_x = resp[2] | ((resp[3] & 0xF0) << 4);
> +
> +	error = elants_i2c_execute_command(client, get_yres_cmd,
> +					   sizeof(get_yres_cmd),
> +					   resp, sizeof(resp), 1,
> +					   "get Y size");
> +	if (error)
> +		return error;
> +
> +	phy_y = resp[2] | ((resp[3] & 0xF0) << 4);
> +
> +	/* calculate resolution from size */
> +	if (!ts->prop.max_x)
> +		ts->prop.max_x = 2240;
> +	ts->x_res = DIV_ROUND_CLOSEST(ts->prop.max_x, phy_x);
> +
> +	if (!ts->prop.max_y)
> +		ts->prop.max_y = 1408;
> +	ts->y_res = DIV_ROUND_CLOSEST(ts->prop.max_y, phy_y);
> +
> +	dev_dbg(&client->dev, "phy_x=%d, phy_y=%d\n", phy_x, phy_y);
> +
> +	return 0;
> +}
> +
> +static int elants_i2c_query_ts_info_ekth(struct elants_data *ts)
>  {
>  	struct i2c_client *client = ts->client;
>  	int error;
> @@ -587,8 +638,20 @@ static int elants_i2c_initialize(struct elants_data *ts)
>  		error = elants_i2c_query_test_version(ts);
>  	if (!error)
>  		error = elants_i2c_query_bc_version(ts);
> -	if (!error)
> -		error = elants_i2c_query_ts_info(ts);
> +
> +	switch (ts->chip_id) {
> +	case EKTH3500:
> +		if (!error)
> +			error = elants_i2c_query_ts_info_ekth(ts);
> +		break;
> +	case EKTF3624:
> +		if (!error)
> +			error = elants_i2c_query_ts_info_ektf(ts);
> +		break;
> +	default:
> +		unreachable();
> +		break;
> +	}
>  
>  	if (error)
>  		ts->iap_mode = ELAN_IAP_RECOVERY;
> @@ -1185,6 +1248,9 @@ static int elants_i2c_probe(struct i2c_client *client,
>  	ts->client = client;
>  	i2c_set_clientdata(client, ts);
>  
> +	if (client->dev.of_node)
> +		ts->chip_id = (uintptr_t)of_device_get_match_data(&client->dev);
> +
>  	ts->vcc33 = devm_regulator_get(&client->dev, "vcc33");
>  	if (IS_ERR(ts->vcc33)) {
>  		error = PTR_ERR(ts->vcc33);
> @@ -1422,7 +1488,8 @@ MODULE_DEVICE_TABLE(acpi, elants_acpi_id);
>  
>  #ifdef CONFIG_OF
>  static const struct of_device_id elants_of_match[] = {
> -	{ .compatible = "elan,ekth3500" },
> +	{ .compatible = "elan,ekth3500", .data = (void *)EKTH3500 },
> +	{ .compatible = "elan,ektf3624", .data = (void *)EKTF3624 },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, elants_of_match);

It also should be possible to remove elants_of_match entirely and do the
following in the I2C ID table:

static const struct i2c_device_id elants_i2c_id[] = {
	{ "ekth3500", EKTH3500 },
	{ "ektf3624", EKTF3624 },
	{ }
};
MODULE_DEVICE_TABLE(i2c, elants_i2c_id);

Then OF core will take care of device ID matching by removing the
"elan," part from the compatible value of the device-tree and comparing
it with the values in elants_i2c_id[].

And then in elants_i2c_probe() you could :

	chip->chip_id = (uintptr_t)id->driver_data;

See "drivers/mfd/max77620.c" for the example.
