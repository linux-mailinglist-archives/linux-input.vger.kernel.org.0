Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1561619C375
	for <lists+linux-input@lfdr.de>; Thu,  2 Apr 2020 16:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388260AbgDBOAf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Apr 2020 10:00:35 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37513 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732584AbgDBOAf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Apr 2020 10:00:35 -0400
Received: by mail-lj1-f195.google.com with SMTP id r24so3352889ljd.4;
        Thu, 02 Apr 2020 07:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1COw4xtpJzyEyy08P/9YeupGs7pYzVvbIXcIk4QAQbo=;
        b=lmjbCP579ap4n2+okLhUGf3g3Ia/uhv7BgSZ/CmSq7U0NNBoJweoL4gYha2Dq9MD4b
         axNlZFj0TGqOgC75wS9QBz1G3aJQ6ttLFmmjoJmCIZxg9/owmqzr9hxI4OtfYATePHef
         IZUWeyNsYJ8HPdJ5J9ONZG51KVW+xH/wTIreabhx5FeeprVVjJ+f/UDZdGFxboREenAz
         ZRoiX4+aFiuzrXyaDTOlRE1mqSxjzvc32VO1GELZiv5dLbJL3F21k/w/CfozRIpX/A/M
         wCjBD75LWF6En6JVMHkxl9LXV8SoMyzdVZgC1N3Fk9h380agE/eAWUO8dnPti63kGKze
         SJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1COw4xtpJzyEyy08P/9YeupGs7pYzVvbIXcIk4QAQbo=;
        b=rFG+Y0PNJNq/77aShOCIY2mD9F/vtA84ZpJJfwwbwxKJGa6c8GLLtUWFEAvYPZdV8q
         U2tdQugMdkih7qYwu1jrxQ4x4zq9ew5dxcZhVSpVrt0sTc+T3z2iSJHK1HbO7GtkakBZ
         njwZYyKgRRRxtceqnO4AP+iC+i28PqS+WugTWoFttCTgdOvMWeJ9WEttN7jUwBfFyiLo
         PPtjgGXVcfWgQ8cdAgYb3MTpirfMqJ/8UmuUbTw7QgLGYiYFY1aAQFLgKkdtMrFtQI4x
         42rBjyGO2v0OJM2cn5lUfPPPfdr2lYAxxN9q9Ko1HXQQwbBF2Pb3tu88niENd3x1bLue
         Stlg==
X-Gm-Message-State: AGi0PuaFJ7IlCGLNt/58Ze5Pp6pA1ItZcq1u2VG/jg4g8oyHgVnj0UTj
        8EEliLTVKitje7LZWq054Zuc4dBv
X-Google-Smtp-Source: APiQypI+JRPmK/AI2g7Yoq4b21h4ZM7i9skLGwXFv4pucpbY+01YCB51KwdcjRHp2Uu53ovZuQZH6g==
X-Received: by 2002:a2e:82d0:: with SMTP id n16mr2144729ljh.174.1585836032524;
        Thu, 02 Apr 2020 07:00:32 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id o4sm3843565lfl.62.2020.04.02.07.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 07:00:31 -0700 (PDT)
Subject: Re: [PATCH v10 54/55] Input: atmel_mxt_ts: Implement synchronization
 during various operation
From:   Dmitry Osipenko <digetx@gmail.com>
To:     "Wang, Jiada" <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200331105051.58896-1-jiada_wang@mentor.com>
 <20200331105051.58896-55-jiada_wang@mentor.com>
 <c53637ef-8e5d-3243-7236-5da360021f21@gmail.com>
 <b06c7915-562f-ec68-766a-2118cfe57a0f@mentor.com>
 <b9a8865c-7754-16f7-8f66-9cd70dc42d3c@gmail.com>
Message-ID: <c5e7dc2d-08c7-e55e-352d-b9b0d86fe63e@gmail.com>
Date:   Thu, 2 Apr 2020 17:00:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <b9a8865c-7754-16f7-8f66-9cd70dc42d3c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

02.04.2020 16:24, Dmitry Osipenko пишет:
> 02.04.2020 14:50, Wang, Jiada пишет:
>> Hi Dmitry
>>
>> On 2020/04/02 1:04, Dmitry Osipenko wrote:
>>> 31.03.2020 13:50, Jiada Wang пишет:
>>>> From: Sanjeev Chugh <sanjeev_chugh@mentor.com>
>>>>
>>>> There could be scope of race conditions when sysfs is being handled
>>>> and at the same time, device removal is occurring. For example,
>>>> we don't want the device removal to begin if the Atmel device
>>>> cfg update is going on or firmware update is going on. In such
>>>> cases, wait for device update to be completed before the removal
>>>> continues.
>>>>
>>>>      Thread                                          Thread 2:
>>>> =========================                      
>>>> =========================
>>>> mxt_update_fw_store()                           mxt_remove()
>>>> mutex_lock(&data->lock)                         ...
>>>> mxt_initialize()                                //Tries to acquire lock
>>>>    request_firmware_nowait()                     mutex_lock(&data->lock)
>>>> ...                                             ==>waits for lock()
>>>> ...                                             .
>>>> ...                                             .
>>>> mutex_unlock(&data->lock)                       .
>>>>                                                  //Gets lock and
>>>> proceeds
>>>>                                                 
>>>> mxt_free_input_device();
>>>>                                                  ...
>>>>                                                 
>>>> mutex_unlock(&data->lock)
>>>>                                                  //Frees atmel driver
>>>> data
>>>>                                                  kfree(data)
>>>>
>>>> If the request_firmware_nowait() completes after the driver removal,
>>>> and callback is triggered. But kernel crashes since the module is
>>>> already removed.
>>>>
>>>> This commit adds state machine to serialize such scenarios.
>>>
>>> Won't it be easier to bump driver's module use-count by __module_get()
>>> while firmware is updating? Or remove sysfs during of mxt_remove()? >
>>
>> thanks for your inspiration, I will replace state machine with module
>> use-count.
> 
> I'm actually now thinking that the suggestion about the module-count
> wasn't very correct because this won't really help in regards to
> mxt_update_fw_store() / mxt_remove() racing.
> 
> I see that mxt_remove() already invokes the mxt_sysfs_remove(), which
> should block until mxt_update_fw_store() is completed, shouldn't it?
> 
> I guess the kfree(data) isn't the real cause of the problem and
> something like this should help:
> 
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c
> b/drivers/input/touchscreen/atmel_mxt_ts.c
> index b2edf51e1595..4e66106feeb9 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -4254,6 +4254,7 @@ static void mxt_sysfs_remove(struct mxt_data *data)
>  	struct i2c_client *client = data->client;
> 
>  	sysfs_remove_group(&client->dev.kobj, &mxt_attr_group);
> +	sysfs_remove_group(&client->dev.kobj, &mxt_fw_attr_group);
>  }
> 
>  static void mxt_reset_slots(struct mxt_data *data)
> @@ -4649,31 +4650,19 @@ static int mxt_remove(struct i2c_client *client)
>  {
>  	struct mxt_data *data = i2c_get_clientdata(client);
> 
> -	mutex_lock(&data->lock);
> -	if (data->e_state == MXT_STATE_UPDATING_CONFIG_ASYNC ||
> -	    data->e_state == MXT_STATE_UPDATING_CONFIG) {
> -		data->e_state = MXT_STATE_GOING_AWAY;
> -		mutex_unlock(&data->lock);
> -		mxt_wait_for_completion(data, &data->update_cfg_completion,
> -					MXT_CONFIG_TIMEOUT);
> -	} else {
> -		data->e_state = MXT_STATE_GOING_AWAY;
> -		mutex_unlock(&data->lock);
> -	}
> +	mxt_sysfs_remove(data);
> 
> -	disable_irq(data->irq);
> -	sysfs_remove_group(&client->dev.kobj, &mxt_fw_attr_group);
>  	if (data->reset_gpio) {
>  		sysfs_remove_link(&client->dev.kobj, "reset");
>  		gpiod_unexport(data->reset_gpio);
>  	}
> +
>  	mxt_debug_msg_remove(data);
> -	mxt_sysfs_remove(data);
>  	mxt_free_input_device(data);
>  	mxt_free_object_table(data);
> 
> 	if (debug_state)
> 		cancel_delayed_work_sync(&data->watchdog_work);
> +	disable_irq(data->irq);
> 
>  	return 0;
>  }
> 

I'm looking at this again and the original tear-down order of the
mxt_remove() looks okay, so no need to change it.

Reading the commit message, it says that request_firmware_nowait() races
with kfree(data), but that can't happen because the data is
resource-managed and request_firmware_nowait() bumps device's use-count.

https://elixir.bootlin.com/linux/v5.6.2/source/drivers/base/firmware_loader/main.c#L1043

I think this patch was ported from some very old kernel version and it's
simply not applicable to the upstream anymore.
