Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5F20193131
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 20:35:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727356AbgCYTf1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 15:35:27 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45798 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727281AbgCYTf1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 15:35:27 -0400
Received: by mail-lj1-f196.google.com with SMTP id t17so3805405ljc.12;
        Wed, 25 Mar 2020 12:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7fZLDf+lfcWl33b+ZMq73HRJnpE12IsxFS0P2yb1f7A=;
        b=ukSUhl8XWlf3YoH6GMjHzHoXhR5WjZaILKHopaRbz+T/TSY9o9sFcQCPb97iRVxJ6p
         x6mQwoajicCwY1tLxzLeWHJQSXbVcOIQLym9pJDJW7QgylQQiD1WCQWqvNj9jHcNrJ+Q
         eeDQPi2hdzhW0AyCXmSlAEnN0KzxVqZ2aAC90bvTCU7As1u1SlMtxVBv3H21pzMi6K/3
         +P8u6v8rksbpJ8lYouGUDNmf+txKX83W49VQlYsP6y+e40Z1Fq0aW1LbsqqmvdQPgxO3
         IuTbt41p4kEe4AoUzr1Rvy8ValFuBB8eHEfC80mvWc8kilJWaj1+CuIECivRbnOiWtiZ
         o/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7fZLDf+lfcWl33b+ZMq73HRJnpE12IsxFS0P2yb1f7A=;
        b=o15tj5MX/m1XpzAbnxX3nfyqg+5U8eKsRwDy5sjit0t0uJB+ULfvmYTfoludNPwSyg
         LZm6+pcC0V4DyMQ7YTKYhQEuVR8B7w/ve1t3a8Lrn7flPqJ8gcAsSvMcnhGkf8TQtiGD
         APowQtR3PC8uCqfnaM9nN1loOBoRkXXp38ThKlM4a69uE/9w7URdd9loyB9ByNhzvRyW
         ZOfe9hPnA46xkjRMgthJw7MXd5fWxRnNWmgjpn7Qdf+mhgbK5Lyu0Ge2n/aLSJwtmrqw
         GX2oyZPkpbjYpcjwAyc6W7a9FO/caYhxHkgjWUQF+Z/hhIsh4PvxM/RtY8/y/MjCQgp5
         eXQQ==
X-Gm-Message-State: ANhLgQ0Y1w+o1CGDStcxcoLGS13rqdC1EIXCw6EupUR0AKRjqDRJ+HoG
        PaRTGoCnokG5wlSnXFLkvcI=
X-Google-Smtp-Source: APiQypLFaCdWl3h7RFl0sB3C1+hTDF//3X+lqpx03g+ZZN/UNUdZlWZMuvKqyG2B8pCRsObx+2auIA==
X-Received: by 2002:a2e:b88b:: with SMTP id r11mr2953059ljp.116.1585164924279;
        Wed, 25 Mar 2020 12:35:24 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id i30sm3302532lfp.36.2020.03.25.12.35.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2020 12:35:23 -0700 (PDT)
Subject: Re: [PATCH v9 52/55] input: touchscreen: atmel_mxt_ts: Added sysfs
 entry for touchscreen status
To:     Jiada Wang <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com,
        rydberg@bitmath.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200325133334.19346-1-jiada_wang@mentor.com>
 <20200325133334.19346-53-jiada_wang@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4aeda6f1-25d8-9437-5cd0-560e43dbe081@gmail.com>
Date:   Wed, 25 Mar 2020 22:35:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200325133334.19346-53-jiada_wang@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

25.03.2020 16:33, Jiada Wang пишет:
> From: Naveen Chakka <Naveen.Chakka@in.bosch.com>
> 
> To know the current communication status of the touch controller during
> runtime, sysfs interface is added
> 
> sysfs interface: /sys/class/i2c-dev/i2c-*/device/*/touch_dev_stat
> Executing the above sysfs interface provides two output values
> 
> 1)Status of the touch device
> 	value 0 represents device is inactive
> 	value 1 represents device is active
> 2)Error counter
> 	value represents the number of times device in inactive since last read

...
>  /* Each client has this additional data */
>  struct mxt_data {
>  	struct i2c_client *client;
> @@ -372,6 +380,9 @@ struct mxt_data {
>  	const char *pcfg_name;
>  	const char *input_name;
>  	struct mxt_flash *flash;

> +	struct work_struct watchdog_work;
> +	struct timer_list watchdog_timer;

This should be replaced with a delayed_work.

> +	struct mxt_statusinfo mxt_status;
>  
>  	/* Cached parameters from object table */
>  	u16 T5_address;

...
> +static void mxt_watchdog_work(struct work_struct *work)
> +{
> +	struct mxt_data *data =
> +		container_of(work, struct mxt_data, watchdog_work);
> +	u16 info_buf;
> +	int ret = 0;
> +	u8 size = 2;

> +	if (data->suspended || data->in_bootloader)
> +		return;
> +
> +	ret = __mxt_read_reg(data->client, 0, size, &info_buf);

Looks like this need to be protected with a lock to not race with the
suspending / bootloader states.

> +	if (ret) {
> +		data->mxt_status.error_count++;
> +		data->mxt_status.dev_status = false;
> +	} else {
> +		data->mxt_status.dev_status = true;
> +	}
> +}

...> @@ -4329,6 +4414,13 @@ static int mxt_probe(struct i2c_client
*client, const struct i2c_device_id *id)
>  		msleep(MXT_RESET_TIME);
>  	}
>  
> +	INIT_WORK(&data->watchdog_work, mxt_watchdog_work);
> +
> +	/* setup watchdog timer */
> +	timer_setup(&data->watchdog_timer, mxt_watchdog_timer, 0);
> +
> +	mxt_start_wd_timer(data);

I'd expect it to be optional and opt-in by either using #ifdef
TOUCHSCREEN_ATMEL_MXT_DEBUG or having a new debugfs option to explicitly
enable the "watchdog".
