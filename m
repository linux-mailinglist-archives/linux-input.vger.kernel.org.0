Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5654003CC
	for <lists+linux-input@lfdr.de>; Fri,  3 Sep 2021 19:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235774AbhICRG3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Sep 2021 13:06:29 -0400
Received: from phobos.denx.de ([85.214.62.61]:49490 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229692AbhICRG2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 3 Sep 2021 13:06:28 -0400
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 398D3829C6;
        Fri,  3 Sep 2021 19:05:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1630688727;
        bh=SHp4vZFyakq3AEwg7U+zBXt0xfNOnWq3KWeX9lMcPxc=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=yN75hr2Xti67rAR+vLDu7nrN4dVXe601Z3J8+1tOM94mq7LQTgSCqoNhBUJWMPP+Z
         YaYlwLsCbCXgRReo3e8bbhUP0z6lmm1Ouqzh2RNfZJl5uo/tAz7Qb9bWVsyDvL/rzG
         cIZtnAZFaxVQjr3KhZ9Lr0cjVA+L3pH/ONa4c2rdAgiST/t7q9R7Wbfm2YQlLdW8eV
         0OyJO44socZEFqpxyic7i2LolxBJCjmAwp6/y1YwsamUQLUI7l/jZvSQhAX6egwgyf
         +5JjPyHFUllHtvdzY7R8dooyML90JE5sdyocdeJsSETW95TIiz0Pb1xsEchpVi4tfV
         yur118v983Hmg==
Subject: Re: [PATCH v2] Input: ili210x - Set the device name according to the
 device model
To:     Rogerio Pimentel <rpimentel.silva@gmail.com>,
        dmitry.torokhov@gmail.com, hansemro@outlook.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210903165448.26545-1-rpimentel.silva@gmail.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <6bd7c7e4-2dab-088e-cd2f-f8311ef8b1b6@denx.de>
Date:   Fri, 3 Sep 2021 19:05:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903165448.26545-1-rpimentel.silva@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 9/3/21 6:54 PM, Rogerio Pimentel wrote:
> Adding the device model into the device name is useful when
> applications need to set different parameters according to the
> touchscreen being used, e.g. X11 calibration points.
> 
> Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
> ---
> 
> Changes since v1: Get the device ID from touchscreen controller
> instead of driver's device list.
> 
>   drivers/input/touchscreen/ili210x.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> index 199cf3daec10..7a897a03ed70 100644
> --- a/drivers/input/touchscreen/ili210x.c
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -19,10 +19,14 @@
>   #define ILI251X_DATA_SIZE1	31
>   #define ILI251X_DATA_SIZE2	20
>   
> +#define ILI_NAME_LEN		27
> +#define ILITEK_TS_NAME "Ilitek ILI%x%x Touchscreen"
> +
>   /* Touchscreen commands */
>   #define REG_TOUCHDATA		0x10
>   #define REG_PANEL_INFO		0x20
>   #define REG_CALIBRATE		0xcc
> +#define REG_TS_MODEL		0x61

Have a look at the following patch for the extra register names:
[PATCH v3 2/3] Input: ili210x - export ili251x version details via sysfs

>   struct ili2xxx_chip {
>   	int (*read_reg)(struct i2c_client *client, u8 reg,
> @@ -384,6 +388,8 @@ static int ili210x_i2c_probe(struct i2c_client *client,
>   	struct input_dev *input;
>   	int error;
>   	unsigned int max_xy;
> +	unsigned char buf[2];
> +	char *model_name;
>   
>   	dev_dbg(dev, "Probing for ILI210X I2C Touschreen driver");
>   
> @@ -430,7 +436,10 @@ static int ili210x_i2c_probe(struct i2c_client *client,
>   	i2c_set_clientdata(client, priv);
>   
>   	/* Setup input device */
> -	input->name = "ILI210x Touchscreen";
> +	input->name = ILITEK_TS_NAME;
> +	model_name = (char *)input->name;
> +	priv->chip->read_reg(priv->client, REG_TS_MODEL, buf, 2);

Please check return value of ^ that function.

> +	snprintf(model_name, ILI_NAME_LEN, input->name, buf[1], buf[0]);
>   	input->id.bustype = BUS_I2C;

This was still tested only on ili2511, right ?
