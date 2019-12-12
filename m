Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEDBC11C182
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2019 01:34:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727193AbfLLAek (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Dec 2019 19:34:40 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41939 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbfLLAek (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Dec 2019 19:34:40 -0500
Received: by mail-lj1-f193.google.com with SMTP id h23so208817ljc.8;
        Wed, 11 Dec 2019 16:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lfmanDWtZG3y3lJcI6oG7JnQAfGL9a+2cuiNfOFKa/U=;
        b=fMzZaQbCHQtOYueUIJe4RpN4ud9nulBhYYNsRlejm9BHPdtBBYb8brKQsPjZYQ4gXz
         BRqwkLmdE5B7R8BnxhNA2xA4A1BSgfBGXiPAsI4yDsqdThulQvE1Xt2tIsScQuzNP9Zo
         L4pBbg68FkyycdSq/XHyNWwxh4cej1dCJzl/txXhpSLV8hoI5zBgfyN+0qp8p54jiDrK
         7zd3b/Vaa/RMD0Yr0p5iy/zV/BQ+gKYUY5IA1TC7R3OBu5FILh/50ydgo6jV525E4GFk
         2DzUVyD2PTlMbw1Bj7rQ9k3hXYgMNY7POP2BhvRvzBjkwCh5Rt5okimkUoeC4oukCOl7
         GZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lfmanDWtZG3y3lJcI6oG7JnQAfGL9a+2cuiNfOFKa/U=;
        b=p9eZsjL3+jrlNpYbyiDM9pKts/cDdue1v7KMvtaEcDsjCYgnzz8PhcBGvobBcQsZRE
         XmsCmHOofpk9l4h+KQyX2nwv07XA2Sw2VMu8sTzCNcihPe2dQLhLAfBxRKPKeMmT8HPk
         tDiid3nMbVlDeon9WjlyvV4beNhANeiii5ar3/b+BmFQ8+Lc84Cc0F+VKvtgh08DtzfZ
         LH+F2ElgAOUwtgq2xGmDm8/Z8tt/UUXUXozq+yw8gtbtd7gnUdaGydV1WFUugdDzantH
         yAb4HBSK0SEw0EKnWj5f+Mid54LQ1ib5AHfXmciJw2qr74drMdFOtp8z6aIuX4zM//gt
         5VDw==
X-Gm-Message-State: APjAAAWxJGn2vAYLYJ0AROzBG+cYCZsbnQGWn4U+j1VDzprEgCsDNhrW
        D7I0FQ9Yw6SqUm2Y2ttiMJA=
X-Google-Smtp-Source: APXvYqxUH+e7IDh7nFPQWY2Ftj5nPQ0qbSz4e9jk5LEJUrFPBZ0hJxpZfg34qYZBeaPXXSmtGWinqw==
X-Received: by 2002:a2e:6c06:: with SMTP id h6mr3889022ljc.246.1576110877803;
        Wed, 11 Dec 2019 16:34:37 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id y8sm1985797lji.56.2019.12.11.16.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 16:34:36 -0800 (PST)
Subject: Re: [PATCH v2 1/9] input: elants: document some registers and values
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
 <82f3e18f260a3f372944401d12f8f92bd64bc9d2.1576079249.git.mirq-linux@rere.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4496f2db-0d14-2a55-ba6b-1e67da1fb04d@gmail.com>
Date:   Thu, 12 Dec 2019 03:34:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <82f3e18f260a3f372944401d12f8f92bd64bc9d2.1576079249.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

11.12.2019 19:03, Michał Mirosław пишет:
> Add information found in downstream kernels, to make the code less
> magic.
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
>  drivers/input/touchscreen/elants_i2c.c | 29 +++++++++++++++++++++-----
>  1 file changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index d4ad24ea54c8..887888c53996 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -77,7 +77,11 @@
>  
>  #define HEADER_REPORT_10_FINGER	0x62
>  
> -/* Header (4 bytes) plus 3 fill 10-finger packets */
> +/* Power state */
> +#define PWR_STATE_DEEP_SLEEP	0
> +#define PWR_STATE_NORMAL	1
> +
> +/* Header (4 bytes) plus 3 full 10-finger packets */
>  #define MAX_PACKET_SIZE		169
>  
>  #define BOOT_TIME_DELAY_MS	50
> @@ -87,10 +91,21 @@
>  #define E_ELAN_INFO_BC_VER	0x10
>  #define E_ELAN_INFO_TEST_VER	0xE0
>  #define E_ELAN_INFO_FW_ID	0xF0
> +#define E_POWER_MODE		0x40
> +#define E_POWER_STATE		0x50
> +#define E_INFO_X_RES		0x60
> +#define E_INFO_Y_RES		0x63
>  #define E_INFO_OSR		0xD6
>  #define E_INFO_PHY_SCAN		0xD7
>  #define E_INFO_PHY_DRIVER	0xD8

> +/* FW write command, 0x54 0x?? 0x0, 0x01 */
> +#define E_POWER_MODE_BATTERY	0x40
> +#define E_POWER_MODE_AC		0x41

These commands are not utilized yet, but perhaps it's okay to add the
definitions if you're going to add support for power source switching.

> +#define E_POWER_MODE_USB	0x42
> +#define E_POWER_STATE_SLEEP	0x50
> +#define E_POWER_STATE_RESUME	0x58
> +
>  #define MAX_RETRIES		3
>  #define MAX_FW_UPDATE_RETRIES	30
>  
> @@ -231,8 +246,8 @@ static int elants_i2c_calibrate(struct elants_data *ts)
>  {
>  	struct i2c_client *client = ts->client;
>  	int ret, error;
> -	static const u8 w_flashkey[] = { 0x54, 0xC0, 0xE1, 0x5A };
> -	static const u8 rek[] = { 0x54, 0x29, 0x00, 0x01 };
> +	static const u8 w_flashkey[] = { CMD_HEADER_WRITE, 0xC0, 0xE1, 0x5A };
> +	static const u8 rek[] = { CMD_HEADER_WRITE, 0x29, 0x00, 0x01 };
>  	static const u8 rek_resp[] = { CMD_HEADER_REK, 0x66, 0x66, 0x66 };
>  
>  	disable_irq(client->irq);
> @@ -1295,7 +1310,9 @@ static int __maybe_unused elants_i2c_suspend(struct device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
>  	struct elants_data *ts = i2c_get_clientdata(client);
> -	const u8 set_sleep_cmd[] = { 0x54, 0x50, 0x00, 0x01 };
> +	const u8 set_sleep_cmd[] = {
> +		CMD_HEADER_WRITE, E_POWER_STATE_SLEEP, 0x00, 0x01
> +	};
>  	int retry_cnt;
>  	int error;
>  
> @@ -1332,7 +1349,9 @@ static int __maybe_unused elants_i2c_resume(struct device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
>  	struct elants_data *ts = i2c_get_clientdata(client);
> -	const u8 set_active_cmd[] = { 0x54, 0x58, 0x00, 0x01 };
> +	const u8 set_active_cmd[] = {
> +		CMD_HEADER_WRITE, E_POWER_STATE_RESUME, 0x00, 0x01
> +	};
>  	int retry_cnt;
>  	int error;
>  
> 

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>

