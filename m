Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79D18152A09
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2020 12:41:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728276AbgBELlO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Feb 2020 06:41:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48550 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727170AbgBELlO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 5 Feb 2020 06:41:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580902872;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8IoqlVD3x7tzNwYQat+2esADiu4HlfrteFLMz2QjgLA=;
        b=YiOBG+fOqsJWHLFd6qOWkWAr4p+H9EkvrLuahNAB3eSXOBw0vohsNRxFhIecfobRDjuHj5
        PH28cqz49OdUpnovwgFiqR7QLmTV+ItDQLIQxDdmQfVzefWSu5u0lCAXBy1eZ8/qJ/6yGF
        m1wBqOVmaLs/PxkBajkrpv3ZVB9qkKo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-a6DvQ1M4M_GPnr50BtcnYg-1; Wed, 05 Feb 2020 06:41:03 -0500
X-MC-Unique: a6DvQ1M4M_GPnr50BtcnYg-1
Received: by mail-wm1-f69.google.com with SMTP id u11so879455wmb.4
        for <linux-input@vger.kernel.org>; Wed, 05 Feb 2020 03:41:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8IoqlVD3x7tzNwYQat+2esADiu4HlfrteFLMz2QjgLA=;
        b=ORAvfCyWVVXbuxtQOeFUxF8G4prvkUYQ5fNhyzoA17+7+TafFkyBa3EDrrcgbE8BhT
         gjPFZw/RYCUQBupL7BhsR5lqD5ZBKsp1zCKPrsTPUGdKKSeIVsLCjXK15dWnetFNNu1Y
         9XDDQ3DqpUbXvy8CUdKKAeq7D1Kd1ujmT+gNZbE4cxkZ04cvHNvrViAp9GdhyBibAlZp
         ht4abLPdFPEHRJJ4FrSe8+ByN7JJN3WuXNsuvRNsIDE2uqRliMWp2gUP4Yl0epMiUKw5
         XozUCRHz0HaayweW/f+YLe1F1vp/3I+kICMtpE7ftAiqS/RQ6bH5APhERooACLEiUNDA
         K6Gg==
X-Gm-Message-State: APjAAAUzHn1vQiKfBXs9NVhJnfF55N87mdmqQ4DkPXrlwIc3n+z1iLB4
        kjLOcM3oXqt7Ms9zwNLqCf0UvtDngXKH8EMd+kC2IjRYDzIuLuh/1/g7eof+4HH9JwcOdJhVVWA
        AaQ8JMLwlXGvVY8yqFm55EqA=
X-Received: by 2002:a1c:4d07:: with SMTP id o7mr5500453wmh.174.1580902861576;
        Wed, 05 Feb 2020 03:41:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqyHJy/+I2EVLZ7sxCf1QlhwahxrKZH184v0ZW52HFNYSKwjRwnvEVhYuMgzcF1NMNf/BiLu1g==
X-Received: by 2002:a1c:4d07:: with SMTP id o7mr5500416wmh.174.1580902861224;
        Wed, 05 Feb 2020 03:41:01 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2c7-a62e-15d1-2bef.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2c7:a62e:15d1:2bef])
        by smtp.gmail.com with ESMTPSA id j5sm24898532wrb.33.2020.02.05.03.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 03:41:00 -0800 (PST)
Subject: Re: [PATCH 01/10] Input: goodix - Refactor IRQ pin GPIO accesses
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     linux-input@vger.kernel.org, Dmitry Mastykin <mastichi@gmail.com>
References: <20200101145429.16185-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <622815fb-a135-23cd-d371-19d3a2990756@redhat.com>
Date:   Wed, 5 Feb 2020 12:40:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200101145429.16185-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi all,

On 1/1/20 3:54 PM, Hans de Goede wrote:
> Suspending Goodix touchscreens requires changing the interrupt pin to
> output before sending them a power-down command. Followed by wiggling
> the interrupt pin to wake the device up, after which it is put back
> in input mode.
> 
> So far we have only effectively supported this on devices which use
> devicetree. On X86 ACPI platforms both looking up the pins; and using a
> pin as both IRQ and GPIO is a bit more complicated. E.g. on some devices
> we cannot directly access the IRQ pin as GPIO and we need to call ACPI
> methods to control it instead.
> 
> This commit adds a new irq_pin_access_method field to the goodix_chip_data
> struct and adds goodix_irq_direction_output and goodix_irq_direction_input
> helpers which together abstract the GPIO accesses to the IRQ pin.
> 
> This is a preparation patch for adding support for properly suspending the
> touchscreen on X86 ACPI platforms.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1786317
> BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199207
> Cc: Dmitry Mastykin <mastichi@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

ping?

Can we get this series merged please?

Bastien, if you have time it would be good if you can review this series please?

Regards,

Hans





> ---
>   drivers/input/touchscreen/goodix.c | 62 ++++++++++++++++++++++++------
>   1 file changed, 51 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index 0403102e807e..08806a00a9b9 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -31,6 +31,11 @@
>   
>   struct goodix_ts_data;
>   
> +enum goodix_irq_pin_access_method {
> +	irq_pin_access_none,
> +	irq_pin_access_gpio,
> +};
> +
>   struct goodix_chip_data {
>   	u16 config_addr;
>   	int config_len;
> @@ -53,6 +58,7 @@ struct goodix_ts_data {
>   	const char *cfg_name;
>   	struct completion firmware_loading_complete;
>   	unsigned long irq_flags;
> +	enum goodix_irq_pin_access_method irq_pin_access_method;
>   	unsigned int contact_size;
>   };
>   
> @@ -502,17 +508,48 @@ static int goodix_send_cfg(struct goodix_ts_data *ts,
>   	return 0;
>   }
>   
> +static int goodix_irq_direction_output(struct goodix_ts_data *ts,
> +				       int value)
> +{
> +	switch (ts->irq_pin_access_method) {
> +	case irq_pin_access_none:
> +		dev_err(&ts->client->dev,
> +			"%s called without an irq_pin_access_method set\n",
> +			__func__);
> +		return -EINVAL;
> +	case irq_pin_access_gpio:
> +		return gpiod_direction_output(ts->gpiod_int, value);
> +	}
> +
> +	return -EINVAL; /* Never reached */
> +}
> +
> +static int goodix_irq_direction_input(struct goodix_ts_data *ts)
> +{
> +	switch (ts->irq_pin_access_method) {
> +	case irq_pin_access_none:
> +		dev_err(&ts->client->dev,
> +			"%s called without an irq_pin_access_method set\n",
> +			__func__);
> +		return -EINVAL;
> +	case irq_pin_access_gpio:
> +		return gpiod_direction_input(ts->gpiod_int);
> +	}
> +
> +	return -EINVAL; /* Never reached */
> +}
> +
>   static int goodix_int_sync(struct goodix_ts_data *ts)
>   {
>   	int error;
>   
> -	error = gpiod_direction_output(ts->gpiod_int, 0);
> +	error = goodix_irq_direction_output(ts, 0);
>   	if (error)
>   		return error;
>   
>   	msleep(50);				/* T5: 50ms */
>   
> -	error = gpiod_direction_input(ts->gpiod_int);
> +	error = goodix_irq_direction_input(ts);
>   	if (error)
>   		return error;
>   
> @@ -536,7 +573,7 @@ static int goodix_reset(struct goodix_ts_data *ts)
>   	msleep(20);				/* T2: > 10ms */
>   
>   	/* HIGH: 0x28/0x29, LOW: 0xBA/0xBB */
> -	error = gpiod_direction_output(ts->gpiod_int, ts->client->addr == 0x14);
> +	error = goodix_irq_direction_output(ts, ts->client->addr == 0x14);
>   	if (error)
>   		return error;
>   
> @@ -617,6 +654,9 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
>   
>   	ts->gpiod_rst = gpiod;
>   
> +	if (ts->gpiod_int && ts->gpiod_rst)
> +		ts->irq_pin_access_method = irq_pin_access_gpio;
> +
>   	return 0;
>   }
>   
> @@ -889,7 +929,7 @@ static int goodix_ts_probe(struct i2c_client *client,
>   	if (error)
>   		return error;
>   
> -	if (ts->gpiod_int && ts->gpiod_rst) {
> +	if (ts->irq_pin_access_method == irq_pin_access_gpio) {
>   		/* reset the controller */
>   		error = goodix_reset(ts);
>   		if (error) {
> @@ -912,7 +952,7 @@ static int goodix_ts_probe(struct i2c_client *client,
>   
>   	ts->chip = goodix_get_chip_data(ts->id);
>   
> -	if (ts->gpiod_int && ts->gpiod_rst) {
> +	if (ts->irq_pin_access_method == irq_pin_access_gpio) {
>   		/* update device config */
>   		ts->cfg_name = devm_kasprintf(&client->dev, GFP_KERNEL,
>   					      "goodix_%d_cfg.bin", ts->id);
> @@ -943,7 +983,7 @@ static int goodix_ts_remove(struct i2c_client *client)
>   {
>   	struct goodix_ts_data *ts = i2c_get_clientdata(client);
>   
> -	if (ts->gpiod_int && ts->gpiod_rst)
> +	if (ts->irq_pin_access_method == irq_pin_access_gpio)
>   		wait_for_completion(&ts->firmware_loading_complete);
>   
>   	return 0;
> @@ -956,7 +996,7 @@ static int __maybe_unused goodix_suspend(struct device *dev)
>   	int error;
>   
>   	/* We need gpio pins to suspend/resume */
> -	if (!ts->gpiod_int || !ts->gpiod_rst) {
> +	if (ts->irq_pin_access_method == irq_pin_access_none) {
>   		disable_irq(client->irq);
>   		return 0;
>   	}
> @@ -967,7 +1007,7 @@ static int __maybe_unused goodix_suspend(struct device *dev)
>   	goodix_free_irq(ts);
>   
>   	/* Output LOW on the INT pin for 5 ms */
> -	error = gpiod_direction_output(ts->gpiod_int, 0);
> +	error = goodix_irq_direction_output(ts, 0);
>   	if (error) {
>   		goodix_request_irq(ts);
>   		return error;
> @@ -979,7 +1019,7 @@ static int __maybe_unused goodix_suspend(struct device *dev)
>   				    GOODIX_CMD_SCREEN_OFF);
>   	if (error) {
>   		dev_err(&ts->client->dev, "Screen off command failed\n");
> -		gpiod_direction_input(ts->gpiod_int);
> +		goodix_irq_direction_input(ts);
>   		goodix_request_irq(ts);
>   		return -EAGAIN;
>   	}
> @@ -999,7 +1039,7 @@ static int __maybe_unused goodix_resume(struct device *dev)
>   	struct goodix_ts_data *ts = i2c_get_clientdata(client);
>   	int error;
>   
> -	if (!ts->gpiod_int || !ts->gpiod_rst) {
> +	if (ts->irq_pin_access_method == irq_pin_access_none) {
>   		enable_irq(client->irq);
>   		return 0;
>   	}
> @@ -1008,7 +1048,7 @@ static int __maybe_unused goodix_resume(struct device *dev)
>   	 * Exit sleep mode by outputting HIGH level to INT pin
>   	 * for 2ms~5ms.
>   	 */
> -	error = gpiod_direction_output(ts->gpiod_int, 1);
> +	error = goodix_irq_direction_output(ts, 1);
>   	if (error)
>   		return error;
>   
> 

