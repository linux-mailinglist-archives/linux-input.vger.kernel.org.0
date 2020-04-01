Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40F2219AF70
	for <lists+linux-input@lfdr.de>; Wed,  1 Apr 2020 18:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732213AbgDAQKT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Apr 2020 12:10:19 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40643 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbgDAQKT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Apr 2020 12:10:19 -0400
Received: by mail-lf1-f68.google.com with SMTP id j17so129253lfe.7;
        Wed, 01 Apr 2020 09:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HEnB8jHAJMmBnOi3vNk/NoBJPvGBCFUIxb8pJ9DBAwA=;
        b=ASNduxi7dfvhue+fdAPH75VHF0etBl9hjZxLd+N3PwuMpwGHMxpVX+ld5hDZZaMuwI
         W2uWlmOmbW+7DcFwRdscE1dokjWGRR2GIPnURnNU+Y2DrkSUfm36PU5Sn6RSgOjKsATM
         dz1CLLOC3CEIbnAp3+c4rMMksVqVD7RdmoFfIA8Fb7DzmIKZYbB5xXG2aanLHU1gSA+3
         BungEGlLYiHcsIaK8NPooD1J6f1O6Wrc9+i/xrsZlA7bH1NMT2kERY7znN3dU2KqCx4S
         h1ThSVasQQJJiHQfnE8wJNtz0BUeXptgidRmuKOGo9hOnBgW368V8J6Hpx1SMGrDyLgg
         uOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HEnB8jHAJMmBnOi3vNk/NoBJPvGBCFUIxb8pJ9DBAwA=;
        b=Iy8hT0OZyHd133JcTK0SEhfPRXB0My9ZFtoZajxPV8yshR6AnNYq5XDGoDK8xEM/W3
         xutCljTTenfjH0A9+D/eRqg+eKHJtE1Nq5k6SIRW/7vM4DvKgDgfcq0/GhP69z2snmEu
         u1Q6ThnW1dIiv8mNTEux/K/DmtEtoB0Y1HfvDV5CEIkpn9cBv4k+TE/BfzX3IuWZeWiR
         BilGzIhRV5DHOcfCRl4t3VxO3a9kpA9+eHLWEFik6VjutiktILdLUJuUqBALg+ToMdlX
         aMZ/sLKwUkh9n2wGFS6JLBsATbYLi+zoBy6l0OiEMFFzF2Sl5rY+7CE/fipiGV1niNaZ
         yuoQ==
X-Gm-Message-State: AGi0PuaFfM9d+bJZQvD7bx1YXZ6T6K6YTHqF6eZ4Sttss7F597I0fer6
        a37DSeAV2phdVlGAhvnqvUM=
X-Google-Smtp-Source: APiQypKJeWuLeIeO5b5sxDF70kECni9FjfiY7Ov3YtEiLs9bMfRiOkzgXn4cA3XSQ3HIUtRlScwgxQ==
X-Received: by 2002:a19:43:: with SMTP id 64mr2378107lfa.67.1585757416576;
        Wed, 01 Apr 2020 09:10:16 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id b1sm2016187lfb.22.2020.04.01.09.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2020 09:10:15 -0700 (PDT)
Subject: Re: [PATCH v10 52/55] input: touchscreen: atmel_mxt_ts: Added sysfs
 entry for touchscreen status
From:   Dmitry Osipenko <digetx@gmail.com>
To:     "Wang, Jiada" <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200331105051.58896-1-jiada_wang@mentor.com>
 <20200331105051.58896-53-jiada_wang@mentor.com>
 <63336277-8ed2-a097-a983-6e8ac48d776e@gmail.com>
 <1ea292db-d0c3-935e-e74c-7b4afe251edc@mentor.com>
 <4dd3fa36-6ea7-1d5a-e675-a1a7066207b4@gmail.com>
Message-ID: <e4c9623c-9ee9-90f9-8251-c36443352072@gmail.com>
Date:   Wed, 1 Apr 2020 19:10:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <4dd3fa36-6ea7-1d5a-e675-a1a7066207b4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

01.04.2020 17:33, Dmitry Osipenko пишет:
> 01.04.2020 15:51, Wang, Jiada пишет:
>> Hi Dmitry
>>
>> Thanks for your comments
>>
>> On 2020/04/01 0:08, Dmitry Osipenko wrote:
>>> 31.03.2020 13:50, Jiada Wang пишет:
>>> ...
>>>> +static void mxt_watchdog_work(struct work_struct *work)
>>>> +{
>>>> +    struct mxt_data *data =
>>>> +        container_of(work, struct mxt_data, watchdog_work.work);
>>>> +    u16 info_buf;
>>>> +    int ret;
>>>> +
>>>> +    if (data->suspended || data->in_bootloader ||
>>>> +        data->mxt_status.intp_triggered)
>>>> +        goto sched_work;
>>>
>>> Won't it become a problem if other thread puts device into suspended /
>>> bootloader state in the same time?
>>>
>> right, I will use mutex lock to prevent such case.
>> also I think data->mxt_status.intp_triggered isn't necessary,
>> when lock is used.

Won't it be cleaner to stop/start the watchdog instead of messing with
the locks?

>>>> +    ret = __mxt_read_reg(data->client, 0, sizeof(info_buf), &info_buf);
>>>> +
>>>> +    if (ret) {
>>>> +        data->mxt_status.error_count++;
>>>> +        data->mxt_status.dev_status = false;
>>>> +    } else {
>>>> +        data->mxt_status.dev_status = true;
>>>> +    }
>>>> +
>>>> +sched_work:
>>>> +    schedule_delayed_work(&data->watchdog_work,
>>>> +                  msecs_to_jiffies(MXT_WATCHDOG_TIMEOUT));
>>>> +}
>>> ...
>>>
>>>> @@ -4329,6 +4390,12 @@ static int mxt_probe(struct i2c_client
>>>> *client, const struct i2c_device_id *id)
>>>>           msleep(MXT_RESET_TIME);
>>>>       }
>>>>   +    if (debug_state) {
>>>> +        INIT_DELAYED_WORK(&data->watchdog_work, mxt_watchdog_work);
>>>> +        schedule_delayed_work(&data->watchdog_work,
>>>> +                      msecs_to_jiffies(MXT_WATCHDOG_TIMEOUT));
>>>> +    }
>>>> +
>>>>       error = mxt_initialize(data);
>>>>       if (error)
>>>>           goto err_free_object;
>>>> @@ -4343,6 +4410,8 @@ static int mxt_probe(struct i2c_client *client,
>>>> const struct i2c_device_id *id)
>>>>       return 0;
>>>>     err_free_object:
>>>> +    if (debug_state)
>>>> +        cancel_delayed_work_sync(&data->watchdog_work);
>>>>       mxt_free_input_device(data);
>>>>       mxt_free_object_table(data);
>>>>       if (data->reset_gpio) {
>>>> @@ -4367,6 +4436,9 @@ static int mxt_remove(struct i2c_client *client)
>>>>       mxt_free_input_device(data);
>>>>       mxt_free_object_table(data);
>>>>   +    if (debug_state)
>>>> +        cancel_delayed_work_sync(&data->watchdog_work);
>>>
>>> What will happen if debug_state was false during of mxt_probe() and then
>>> the debug_state parameter was changed to true via sysfs?
>>
>> module_param debug_state is added with permission 0,
>> so it's value won't change during driver operation
> 
> Thank you for the clarification, I didn't realize that setting
> permission to 0 hides the parameter completely in sysfs.

Anyways, I'm still thinking that the condition removal will make code
cleaner a tad.
