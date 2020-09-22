Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D060274D39
	for <lists+linux-input@lfdr.de>; Wed, 23 Sep 2020 01:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbgIVXVU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Sep 2020 19:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgIVXVT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Sep 2020 19:21:19 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 323FAC061755;
        Tue, 22 Sep 2020 16:21:19 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id b19so15564824lji.11;
        Tue, 22 Sep 2020 16:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wto1lfSHBTmfREetyWLDZnc6AY7l78uuUDVKMqaUTyE=;
        b=ID8iAlY4ls9D/QjT0mUgVU9OdN2PG9hI9yj5d/6o0kdBfSGxQl19P7WCagqvhDm9K0
         JjwwlnEQM73tlCtBEsV1bO7votjB6wEFN+wSw0d5GA/cl3kRE9e7pQMEPep7k6g1z9mM
         OiPGa+ZridNOyQPlReXoSkAcZxpBdy8COxWgdhaU+7RqRCpX3XmTcO2pcHfzgfVIi8cR
         de3H4evSX5N9wwiWEesfYeE3LKLUsUa2hDJ4X/JeH/Zk9GNNHUT/tctvG2VzDjbRqLWi
         QeGjxz5A0YRTegUQuD3/lc/h6KhwQ4FVcAY21DNzobRBWy0KVnhbW0X7OvfGz6ROFk+5
         gMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wto1lfSHBTmfREetyWLDZnc6AY7l78uuUDVKMqaUTyE=;
        b=lGBaiHIuj5mDwSMEIo4FAa8Zg0FfSSrNrbD7nG3/TcNRml+g5m9eB+Cm3tU8W3YTK7
         EVY1mwBDyWxJrw8vW0zRnNipDwbIrJM9xqYGGubt4xWaAtCtWFy8nqh0qYQZuViX/7az
         U1Mx+s9q6sO/YbBkBagJjIZaL17AXvWky6d4lW/razmWIgz3KsPi+g9HeGR5Y2kISbiJ
         YdjbHBKNHr1zzTOYrcqwk/w0qFcGGuCpMrWjbqQf+94p4y0f/lrM5+UJcuPPbEL58FZs
         XhwhwqIP94GzHkYYqlHhrzrtj9RXVWC9VlDGbY2SEmDqVHCxtHGcoYa+Q6ScLSmH9skP
         J6xw==
X-Gm-Message-State: AOAM531QXwUuZxPUYzTPtXBNZqOW0LPXa+69AnuvZCCdXFP4ARENOcKT
        u9bZSEqLcbJx2vGAEXpp2zo=
X-Google-Smtp-Source: ABdhPJwCwb0txemQccr9IvfcvZNgCRr0ozV2cVM5l12Fx+BFOlmogtc32aMjAJCgPKiG0X49BZ/ddA==
X-Received: by 2002:a2e:a411:: with SMTP id p17mr753838ljn.282.1600816877662;
        Tue, 22 Sep 2020 16:21:17 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id 13sm3933886lfn.239.2020.09.22.16.21.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2020 16:21:17 -0700 (PDT)
Subject: Re: [PATCH v1 2/3] Input: atmel_mxt_ts - implement I2C retries for
 mXT1368
To:     Jiada Wang <jiada_wang@mentor.com>, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     nick@shmanahar.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200921140054.2389-1-jiada_wang@mentor.com>
 <20200921140054.2389-2-jiada_wang@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e8c700b5-93f3-4069-1b9e-a85934a52515@gmail.com>
Date:   Wed, 23 Sep 2020 02:21:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200921140054.2389-2-jiada_wang@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

21.09.2020 17:00, Jiada Wang пишет:
> According to datasheet, mXT1386 chip has a WAKE line, it is used
> to wake the chip up from deep sleep mode before communicating with
> it via the I2C-compatible interface.
> 
> if the WAKE line is connected to a GPIO line, the line must be
> asserted 25 ms before the host attempts to communicate with the mXT1386.
> If the WAKE line is connected to the SCL pin, the mXT1386 will send a
> NACK on the first attempt to address it, the host must then retry 25 ms
> later.
> 
> This patch adds compatible string "atmel,mXT1386" for mXT1386 controller,
> when I2C transfer on mXT1386 fails, retry the transfer once after a 25 ms
> sleep.
> 
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> ---
>  drivers/input/touchscreen/atmel_mxt_ts.c | 44 +++++++++++++++++-------
>  1 file changed, 32 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> index 98f17fa3a892..96d5f4d64cb0 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -198,6 +198,7 @@ enum t100_type {
>  #define MXT_CRC_TIMEOUT		1000	/* msec */
>  #define MXT_FW_RESET_TIME	3000	/* msec */
>  #define MXT_FW_CHG_TIMEOUT	300	/* msec */
> +#define MXT_WAKEUP_TIME		25	/* msec */
>  
>  /* Command to unlock bootloader */
>  #define MXT_UNLOCK_CMD_MSB	0xaa
> @@ -627,7 +628,9 @@ static int mxt_send_bootloader_cmd(struct mxt_data *data, bool unlock)
>  static int __mxt_read_reg(struct i2c_client *client,
>  			       u16 reg, u16 len, void *val)
>  {
> +	struct device_node *np = client->dev.of_node;
>  	struct i2c_msg xfer[2];
> +	bool retried = false;
>  	u8 buf[2];
>  	int ret;
>  
> @@ -646,22 +649,30 @@ static int __mxt_read_reg(struct i2c_client *client,
>  	xfer[1].len = len;
>  	xfer[1].buf = val;
>  
> -	ret = i2c_transfer(client->adapter, xfer, 2);
> -	if (ret == 2) {
> -		ret = 0;
> -	} else {
> -		if (ret >= 0)
> -			ret = -EIO;
> +retry_read:
> +	ret = i2c_transfer(client->adapter, xfer, ARRAY_SIZE(xfer));
> +	if (ret != ARRAY_SIZE(xfer)) {
> +		if (of_device_is_compatible(np, "atmel,mXT1386") && !retried) {

Hello, Jiada!

This looks almost good to me! But I think we should add "bool
retry_i2c_transfers" to the struct mxt_data and then set it to true for
atmel,mXT1386 because of_device_is_compatible() looks a bit too bulky
and this is usually discouraged to have in the code.

Secondly, we should also add a clarifying comment to the code, telling
why retries are needed for 1386, something like this:

static int mxt_probe(struct i2c_client *client, const struct
i2c_device_id *id)
{
...

/*
 * The mXT1386 has a dedicated WAKE-line that could be connected to a
 * dedicated GPIO, or to the I2C SCL pin, or permanently asserted LOW.
 * It's used for waking controller from a deep-sleep and it needs to be
 * asserted LOW for 25 milliseconds before issuing I2C transfer if
controller
 * was in a deep-sleep mode. If WAKE-line is connected to I2C SCL pin, then
 * the first I2C transfer will get an instant NAK and transfer needs to be
 * retried after 25ms. There are too many places in the code where the
wake-up
 * needs to be inserted, hence it's much easier to add a retry to the common
 * I2C accessors, also given that the WAKE-GPIO is unsupported by the
driver.
 */
if (of_device_is_compatible(np, "atmel,mXT1386")
	data->retry_i2c_transfers = true;
