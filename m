Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C75B719ADE0
	for <lists+linux-input@lfdr.de>; Wed,  1 Apr 2020 16:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733048AbgDAOdN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Apr 2020 10:33:13 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37836 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732749AbgDAOdN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Apr 2020 10:33:13 -0400
Received: by mail-lj1-f195.google.com with SMTP id r24so26027941ljd.4;
        Wed, 01 Apr 2020 07:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=E7IPP7+FLfHL3BQsCPPNMuBISvBx8a52EyzbSM4UO1E=;
        b=ZTrKEuRx9E+eNlAU/TU1yLFcIRUoIl05xebAhnZ8nxC/X5yFyH697tcER5tOsRlBkR
         qWazY86KfM3BXxWzPbflVK1Rwg606WA5/Pu9aR7TrLQ04m63Wmg1gc9iJmlW9MOZYaxs
         UFjxyWdC6aA6APJ/7G5kCQ9bcSTdddu+vUuaHLPmZB8oZ8+kcDyCxhiDTpagD6Pd5/lv
         XbmW33ZU44WNdpWAJPl73swzhOKt+iSnxwXJC7Cn1YbXn6gme5Q1R5+V1IMYwiPp7yP7
         HPUINW7hpUlQFGfUG+H5RNdt7lXtqolsTkBjGgcDPZpSNksydUrf5bKdfHnnfKlruPay
         LKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E7IPP7+FLfHL3BQsCPPNMuBISvBx8a52EyzbSM4UO1E=;
        b=A5UtDAdaCyaGILiaCW/SWFl7h2WoEZMsnujigYKzaoLewn3d7IKVnQRM6zpreNieBn
         KoEQG5NpCQgdXbIRUNEb0ekeqP0Z6M6/9750LrRB1Cybe36d5yTHSX0wrddxujn/XOZO
         aDklMkIY/33UBFpIarEwYSuGIBi6g47WdSdgcWwb394YxWIXo2MAgymGrDqmiiJy7TSk
         2iVEhr3EMVy955b83GRm7X8CLxhoNOqZyyHhtFCvwDUK9pIcWwc2Tehmx8ZCCZsum3Ch
         GGefsII9wUzcyuz4NxKqfvejCQ1mop3GfSDVVXHDp3wdKvWgUXoyfqVi/ueY8me6hiiV
         emWg==
X-Gm-Message-State: AGi0Puaf+579JBRulCki7ATro3q8TekKJmTg4kJJgwJfNXXQ/TVQhf+h
        B3VqS2y9gU/SQgmDp51paa33k9Pp
X-Google-Smtp-Source: APiQypKe31q/wTpG9PE1jcJ+/xYt6QbXpuwRGtesNX4P55GMrE5zNOb8zcaKuHnPLsIrA/hRLMQhPw==
X-Received: by 2002:a2e:6809:: with SMTP id c9mr13037910lja.251.1585751590831;
        Wed, 01 Apr 2020 07:33:10 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id y16sm1266561ljc.78.2020.04.01.07.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2020 07:33:10 -0700 (PDT)
Subject: Re: [PATCH v10 52/55] input: touchscreen: atmel_mxt_ts: Added sysfs
 entry for touchscreen status
To:     "Wang, Jiada" <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200331105051.58896-1-jiada_wang@mentor.com>
 <20200331105051.58896-53-jiada_wang@mentor.com>
 <63336277-8ed2-a097-a983-6e8ac48d776e@gmail.com>
 <1ea292db-d0c3-935e-e74c-7b4afe251edc@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4dd3fa36-6ea7-1d5a-e675-a1a7066207b4@gmail.com>
Date:   Wed, 1 Apr 2020 17:33:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1ea292db-d0c3-935e-e74c-7b4afe251edc@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

01.04.2020 15:51, Wang, Jiada пишет:
> Hi Dmitry
> 
> Thanks for your comments
> 
> On 2020/04/01 0:08, Dmitry Osipenko wrote:
>> 31.03.2020 13:50, Jiada Wang пишет:
>> ...
>>> +static void mxt_watchdog_work(struct work_struct *work)
>>> +{
>>> +    struct mxt_data *data =
>>> +        container_of(work, struct mxt_data, watchdog_work.work);
>>> +    u16 info_buf;
>>> +    int ret;
>>> +
>>> +    if (data->suspended || data->in_bootloader ||
>>> +        data->mxt_status.intp_triggered)
>>> +        goto sched_work;
>>
>> Won't it become a problem if other thread puts device into suspended /
>> bootloader state in the same time?
>>
> right, I will use mutex lock to prevent such case.
> also I think data->mxt_status.intp_triggered isn't necessary,
> when lock is used.
> 
>>> +    ret = __mxt_read_reg(data->client, 0, sizeof(info_buf), &info_buf);
>>> +
>>> +    if (ret) {
>>> +        data->mxt_status.error_count++;
>>> +        data->mxt_status.dev_status = false;
>>> +    } else {
>>> +        data->mxt_status.dev_status = true;
>>> +    }
>>> +
>>> +sched_work:
>>> +    schedule_delayed_work(&data->watchdog_work,
>>> +                  msecs_to_jiffies(MXT_WATCHDOG_TIMEOUT));
>>> +}
>> ...
>>
>>> @@ -4329,6 +4390,12 @@ static int mxt_probe(struct i2c_client
>>> *client, const struct i2c_device_id *id)
>>>           msleep(MXT_RESET_TIME);
>>>       }
>>>   +    if (debug_state) {
>>> +        INIT_DELAYED_WORK(&data->watchdog_work, mxt_watchdog_work);
>>> +        schedule_delayed_work(&data->watchdog_work,
>>> +                      msecs_to_jiffies(MXT_WATCHDOG_TIMEOUT));
>>> +    }
>>> +
>>>       error = mxt_initialize(data);
>>>       if (error)
>>>           goto err_free_object;
>>> @@ -4343,6 +4410,8 @@ static int mxt_probe(struct i2c_client *client,
>>> const struct i2c_device_id *id)
>>>       return 0;
>>>     err_free_object:
>>> +    if (debug_state)
>>> +        cancel_delayed_work_sync(&data->watchdog_work);
>>>       mxt_free_input_device(data);
>>>       mxt_free_object_table(data);
>>>       if (data->reset_gpio) {
>>> @@ -4367,6 +4436,9 @@ static int mxt_remove(struct i2c_client *client)
>>>       mxt_free_input_device(data);
>>>       mxt_free_object_table(data);
>>>   +    if (debug_state)
>>> +        cancel_delayed_work_sync(&data->watchdog_work);
>>
>> What will happen if debug_state was false during of mxt_probe() and then
>> the debug_state parameter was changed to true via sysfs?
> 
> module_param debug_state is added with permission 0,
> so it's value won't change during driver operation

Thank you for the clarification, I didn't realize that setting
permission to 0 hides the parameter completely in sysfs.

>> I think the INIT_DELAYED_WORK() and cancel_delayed_work_sync() should be
>> invoked unconditionally.
>>
>>>       return 0;
>>>   }
>>>   @@ -4463,3 +4535,7 @@ module_i2c_driver(mxt_driver);
>>>   MODULE_AUTHOR("Joonyoung Shim <jy0922.shim@samsung.com>");
>>>   MODULE_DESCRIPTION("Atmel maXTouch Touchscreen driver");
>>>   MODULE_LICENSE("GPL");
>>> +
>>> +module_param(debug_state, bool, 0);
>>> +MODULE_PARM_DESC(debug_state, "Enable/Disable watchdog work to check
>>> device state (default="
>>> +         __MODULE_STRING(MXT_DEBUG_STATE) ")");
>>>
>>
>> The "default=..." part of MODULE_PARM_DESC() probably isn't really
>> useful and could be omitted, don't you think so?
>>
> since debug_state can't be updated via sysfs, so I think add it's
> default in MODULE_PARM_DESC() is useful? what's your opinion?

If you want to keep the "default" kept in the description, then perhaps
a simple "default=false" should be enough because nothing would be able
to change it to true.
