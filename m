Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9F141913D1
	for <lists+linux-input@lfdr.de>; Tue, 24 Mar 2020 16:03:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727455AbgCXPDN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Mar 2020 11:03:13 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45532 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727168AbgCXPDM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Mar 2020 11:03:12 -0400
Received: by mail-lj1-f196.google.com with SMTP id t17so8270234ljc.12;
        Tue, 24 Mar 2020 08:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=I7ST19asnOGG0MvlKCXAazKkdXSFzwFfpgOHQe5IauY=;
        b=C3p61EaT7Ansyr+VG6Zms58wIAIdlIeXUlQlRWHEzHgosPG4eTbCfxvVKOlyXpuMKJ
         UMkA1qSBDLqjzZ516QFLp4yt/3qfUxBqxaJvBcj8LZRy5cJV/emrqMeNA2nm29VTd2LB
         hiEAduSEjAUca7c2TVIcxwNXORz+W2Jp/c7HbXw49iP9KCTBTjVgORNWm9RkbmupOjSv
         JEVaicWfU4oPm+je2fjhGZATErWWRg61aEQFM2ACPsTnQMSoVrgcqo9qraE09ZGwUs66
         36Jk6bVFpRsAfcxYVr4XYYsPZgsAxbQbfj2lIAHEjvJvV51/QFoQMSrgcyRDIzF8qS8S
         XR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I7ST19asnOGG0MvlKCXAazKkdXSFzwFfpgOHQe5IauY=;
        b=FZVoQR+j6Nf7EYVtVNvHf3AeXPz6/MQuJYn0Vbv6cokHAkMVdAmLbPwZDjn9v9wUZ8
         X2nb4OIZOeICSVLWT59j6YN8LPg9D7RlNRD0sMSno6MaasItL/ruHdWXyPukL3huM4uS
         P6ZmEV7dvdkgYjKaRI5zS6zB61L48JVaKRavg0DUc9Qat7TGgH8fupwWC60hkQ+mAOFU
         0RbOoZU+G1+UwkoPMBwSe5ddgfLD+yUoGAz5YqyNx6/i0eORf2uWrldjIk0Pl48CIwmJ
         9blFRgrh+eW3xEfDZP7VQseNxpVowuMIlmtrf7ABa4pUZqGAmkK1dlOl3uHKEJmBv7El
         9/AA==
X-Gm-Message-State: ANhLgQ0RarWSR7xuEm+XwzhcS5GA4jRqR/GzcNpUnSaWXYJIH+mS4H6c
        wodMcWA4aDkeYrwXTfCNSz8=
X-Google-Smtp-Source: ADFU+vsH+UIsIfX+xigBdx82/+KW5l3a/4mEXGfuKimOIM5aB97Q/HYnQwUG5Nhu8rQhgSr0M287WA==
X-Received: by 2002:a05:651c:50e:: with SMTP id o14mr17295986ljp.241.1585062190955;
        Tue, 24 Mar 2020 08:03:10 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id h10sm10347020ljg.38.2020.03.24.08.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2020 08:03:10 -0700 (PDT)
Subject: Re: [PATCH v7 00/48] atmel_mxt_ts misc
From:   Dmitry Osipenko <digetx@gmail.com>
To:     "Wang, Jiada" <jiada_wang@mentor.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com, rydberg@bitmath.org,
        dmitry.torokhov@gmail.com, nick@shmanahar.org, bsz@semihalf.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200212084218.32344-1-jiada_wang@mentor.com>
 <c583d151-9243-cbde-a04b-bc0389d9be5a@gmail.com>
 <89e4bb0b-b2eb-0b67-4307-fb2af914b1c0@mentor.com>
 <f9b221e7-f189-3e47-adab-1cbc49490d4b@gmail.com>
 <bd3c487b-b065-3e4f-6ab1-f344a4113fcd@mentor.com>
 <5d8fdfc1-cc95-59db-b83e-87bb16ea79e8@gmail.com>
Message-ID: <60f89c4e-91e0-e660-58e7-5b152bc3e8e7@gmail.com>
Date:   Tue, 24 Mar 2020 18:03:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5d8fdfc1-cc95-59db-b83e-87bb16ea79e8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

24.03.2020 17:54, Dmitry Osipenko пишет:
> 23.03.2020 05:25, Wang, Jiada пишет:
>> Hello Dmitry
>>
>> On 2020/03/21 0:53, Dmitry Osipenko wrote:
>>> Hello Jiada,
>>>
>>> 20.03.2020 06:37, Wang, Jiada пишет:
>>>> Hello Dmitry
>>>>
>>>> I have submitted v8 patch-set to address your comments towards v7
>>>> patch-set,
>>>> most of checkpatch warnings and errors have been addressed,
>>>>
>>>> But I didn't update for following two types of warnings
>>>> since I want to keep consistency with legacy code
>>>>
>>>> WARNING: DEVICE_ATTR unusual permissions '0600' used
>>>> #290: FILE: drivers/input/touchscreen/atmel_mxt_ts.c:3761:
>>>> +static DEVICE_ATTR(debug_v2_enable, 0600, NULL,
>>>
>>> What will happen if you'll use 0644? Will an empty line be returned or
>>> driver will crash?
>>>
>> debug_v2_enable doesn't have .show callback implemented, so after change
>> permission to 644, read of it results in an I/O error,
>>
>> for other 0600 permission interfaces (t38_data, t25 and debug_enable)
>> added in this series,
>> change to 644 can return expected information when read.
>>
>> Do you think it's better to change debug_v2_enable to 0200,
>> and others to 0644?
> 
> Since the debug_enable has mxt_debug_enable_show(), the same should be
> done for debug_v2_enable, for consistency.
> 
> The permissions should be 0644 for everything that is read/write.
> 
> The 0200 should be used for everything that is root-only and write-only.
> 

Also, please take a look at [1], see DEVICE_ATTR_WO() and
DEVICE_BOOL_ATTR() macros, which should be handy.

[1]
https://elixir.bootlin.com/linux/v5.6-rc7/source/include/linux/device.h#L125
