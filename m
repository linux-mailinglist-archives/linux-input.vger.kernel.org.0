Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 159611CCEF9
	for <lists+linux-input@lfdr.de>; Mon, 11 May 2020 03:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729331AbgEKBFF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 10 May 2020 21:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729327AbgEKBFE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 10 May 2020 21:05:04 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3039DC061A0C;
        Sun, 10 May 2020 18:05:04 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id g4so7643749ljl.2;
        Sun, 10 May 2020 18:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KQ6nJUjgUftXoec4KqhDYa6fkD2DtlzfVc9EbzQBgBk=;
        b=Mzmx0A+jyL2syg9pn2GVJAakHENXDbZvrPs9JyP3DUajP6DOk3JzTCDTEkm0ygT4dp
         2KL2DgN7cty//fadoyVWgZh938Hm6EfLAn2M7zgFkosa+xTAsq+BauTyfObXcQ48dla4
         m1VeMwNhUnRmtc5BmcYtr95N0QrE53qCWnzP3I4b4zqqr5vqTWO1ZtsJ0rjMkvoONbJ9
         VbXVI7QInrrNSSXUCB+f72UvwaUAJrUlyHSHqreG6sLoW2ix1y5YX9EHPk8yjvBVS+WY
         SwpHt3PEE1KeSqKVM8ifOjeBz6HjnL/6XxNSOFWdo5vCEmwh9n/MlXNWl8N35bv0GbjJ
         pYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KQ6nJUjgUftXoec4KqhDYa6fkD2DtlzfVc9EbzQBgBk=;
        b=eiacBKJPN0K6UyoKH76srXKyIUxLUZ+SIuElb+2Fytt1JSWJziAY+rRGfAI3yBDZxl
         JAPmanE6W19FCASL35UnLMiep6pMal9GeBpxzDeUMputRXTIJxjMcGAa+SNyTVtF/nEz
         sjJ0LlTRkNW2XS5hRXb0ztML+hYP3oZ4iAazd0aC2cX88EE47yfQHXgW6yQzgRdUGNzS
         2zsK0aKUFZmM5BcSU3cryP4OWpU7il+lhfoyKVtOjQzjDXmLrUx2SkNsC/ahDOJpEm1u
         SQHGauTEZD9lbF508DnEvR+XXu4qbMh5tXWdpmKmT8+DWQijEeDgU7FwleAqiQK4VRUF
         /ofg==
X-Gm-Message-State: AOAM532RLB9Nb3IQqYud3svivi0f0mxKc3Ki9KMcYWUGSJY79MnJfR6e
        gCP7g3aMIiTqI/C2lNEAocs=
X-Google-Smtp-Source: ABdhPJyvQnYMXmwcgL2lts9SnDk5cC6BsrkviZ3q/XCM3xpa8WrWnqrQBFinvTwoTZ9ca+8IV6anyg==
X-Received: by 2002:a2e:b53b:: with SMTP id z27mr8518056ljm.114.1589159102415;
        Sun, 10 May 2020 18:05:02 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id c2sm8216835ljk.97.2020.05.10.18.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2020 18:05:01 -0700 (PDT)
Subject: Re: [PATCH v11 33/56] Input: atmel_mxt_ts - delay enabling IRQ when
 not using regulators
To:     Jiada Wang <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200508055656.96389-1-jiada_wang@mentor.com>
 <20200508055656.96389-34-jiada_wang@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3a942afa-c047-2c88-1c8e-a90fa018738e@gmail.com>
Date:   Mon, 11 May 2020 04:05:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200508055656.96389-34-jiada_wang@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

08.05.2020 08:56, Jiada Wang пишет:
> The path of enabling the IRQ in the probe function is not safe in level
> triggered operation, if it was already powered up and there is a message
> waiting on the device (eg finger down) because the object table has not yet
> been read. This forces the ISR into a hard loop.
> 
> Delay enabling the interrupt until it is first needed, by set flag
> IRQ_NOAUTOEN.
> 
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> CC: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/input/touchscreen/atmel_mxt_ts.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> index 7c9a738e633a..ab4eceac8fe7 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -3822,6 +3822,7 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  		return error;
>  	}
>  
> +	irq_set_status_flags(client->irq, IRQ_NOAUTOEN);
>  	error = devm_request_threaded_irq(&client->dev, client->irq,
>  					  NULL, mxt_interrupt, IRQF_ONESHOT,
>  					  client->name, data);
> @@ -3831,17 +3832,19 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  	}
>  
>  	if (data->suspend_mode == MXT_SUSPEND_REGULATOR) {
> +		enable_irq(data->irq);

Hello Jiada,

This change contradicts to the commit's message since enabling IRQ until
hardware has been fully powered-on and reset is not allowed.

>  		error = mxt_probe_regulators(data);
>  		if (error)
>  			return error;
> +
> +		disable_irq(data->irq);
>  	} else if (data->reset_gpio) {
>  		msleep(MXT_RESET_GPIO_TIME);
>  		gpiod_set_value(data->reset_gpio, 1);
>  		msleep(MXT_RESET_INVALID_CHG);
>  	}
>  
> -	disable_irq(data->irq);
> -
>  	error = mxt_initialize(data);
>  	if (error)
>  		return error;
> 

Secondly, I gave a try to this version of the series and unfortunately
it doesn't work at all:

[  125.928709] INFO: task systemd-udevd:184 blocked for more than 61
seconds.
[  125.929130]       Not tainted
5.7.0-rc4-next-20200508-00189-g0fe7f91d4a66-dirty #2206
[  125.929474] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  125.929900] systemd-udevd   D    0   184    173 0x00000080
[  125.929921] [<c098b995>] (__schedule) from [<c098bdc1>]
(schedule+0x65/0xc0)
[  125.929965] [<c098bdc1>] (schedule) from [<c0166ce3>]
(synchronize_irq+0x5b/0x7c)
[  125.930001] [<c0166ce3>] (synchronize_irq) from [<c067e0f9>]
(mxt_stop+0x51/0xe0)
[  125.930016] [<c067e0f9>] (mxt_stop) from [<c067e1d3>]
(mxt_input_close+0x13/0x34)
[  125.930042] [<c067e1d3>] (mxt_input_close) from [<c0664b19>]
(input_close_device+0x3d/0x5c)
[  125.930063] [<c0664b19>] (input_close_device) from [<c066b9df>]
(evdev_release+0xa7/0xbc)
[  125.930088] [<c066b9df>] (evdev_release) from [<c025a871>]
(__fput+0x91/0x198)
[  125.930121] [<c025a871>] (__fput) from [<c0136efb>]
(task_work_run+0x73/0x90)
[  125.930138] [<c0136efb>] (task_work_run) from [<c0108fa9>]
(do_work_pending+0x381/0x430)
[  125.930149] [<c0108fa9>] (do_work_pending) from [<c01000d1>]
(slow_work_pending+0x9/0x18)
[  125.930153] Exception stack(0xedd0ffb0 to 0xedd0fff8)

Please test everything properly and fix it in the next version.

BTW, it won't hurt to apply a spell-checker to the commit messages to
fix small typos.
