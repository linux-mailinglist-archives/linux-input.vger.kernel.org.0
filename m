Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E54319583C
	for <lists+linux-input@lfdr.de>; Fri, 27 Mar 2020 14:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgC0Nn5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Mar 2020 09:43:57 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:32862 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbgC0Nn5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Mar 2020 09:43:57 -0400
Received: by mail-lj1-f195.google.com with SMTP id f20so10286022ljm.0;
        Fri, 27 Mar 2020 06:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=h3HMsR6HZU31G+xQ5I9GeaveOctSpxG3dZcbeLk7cIc=;
        b=GKvNLfr95azbSrXv7DMgjchOFqCOYfl5grnsAA+bRFz4Y8CAnxX8hIy7GbIiGA7Jay
         ouZ/DX2BUCgA5AT3f8ClxcDjBXt7/0xFWn1NZCynNwmEqvSI6f7+2yAYii4lz+G0I2wo
         fGlOVaAlVe+kyJTmvrquB/unfkjv7JS7xysAzgUKeT10Ajb0n7xz8fMjf6y3Lb+6ZOOR
         vGK1eBTQnXPYcuvwp3IoZLAfwTSFafGkxmm//RvwOfX5rKTBHZ/cl/CWhwqTpvrqxUNz
         9fNbg3hRnCA/3bXyoGVJiPSo8cOjbBosw9oOTbAxSsS6MGzjOuNScX8eBazI6Jv7wygg
         ynNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h3HMsR6HZU31G+xQ5I9GeaveOctSpxG3dZcbeLk7cIc=;
        b=Sz5wTm66BsRZyycHMZ0vsCAt+Z6WAbnQYPOu/SI4L1AMdDrpdhv55GZOrgDEKWDnIV
         p7JdCcJ1Qdrv2iYe89vZhNz/CVy05hpTP1IKOwICWErOwqPUk5DGqV+7apJGpRg0aBY2
         exptjo8cO5jpGxqJpfLJAwg93Qq/pxjnnIxWkLPqxepipMFHiKR+WWmbyKs+2iw55xsO
         VjkEZB+xxOw1DOpjvKvX4Vn/Lsn84E2NZy8twlqOSBAZb2D7AF7YzCZmFYAbrM5Iqfd+
         xp9hzn4BXQUh+a8Zn7XlUwFV9y2aPqaVSUzBtsFeQrB+1dFwW9KR3lQksmyUKpA1iWVL
         /dTg==
X-Gm-Message-State: AGi0PuaZLgNpDJQ4OaG4sKDTnYk+Nvya7Zk/Kc5x5kgA0mG5VfSULuTG
        IRfqhUwHbqJb4DYUMp1ESLI=
X-Google-Smtp-Source: APiQypK3GwcTU1z2CorSBvReY5Rip+JCow1O1vGOD2yzZmUWOFpm6JEGznsM60IM52m//93WnEJQTQ==
X-Received: by 2002:a2e:3012:: with SMTP id w18mr8713173ljw.100.1585316635323;
        Fri, 27 Mar 2020 06:43:55 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id o192sm870042lfa.89.2020.03.27.06.43.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2020 06:43:54 -0700 (PDT)
Subject: Re: [PATCH v9 52/55] input: touchscreen: atmel_mxt_ts: Added sysfs
 entry for touchscreen status
From:   Dmitry Osipenko <digetx@gmail.com>
To:     "Wang, Jiada" <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com,
        rydberg@bitmath.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200325133334.19346-1-jiada_wang@mentor.com>
 <20200325133334.19346-53-jiada_wang@mentor.com>
 <4aeda6f1-25d8-9437-5cd0-560e43dbe081@gmail.com>
 <b9368137-2fdc-558d-c27c-54d56950f7b8@mentor.com>
 <5b03bf10-d4f1-fb3d-4561-1097630c195a@gmail.com>
Message-ID: <a7f77683-f86d-5e23-6afc-96834cbb55cc@gmail.com>
Date:   Fri, 27 Mar 2020 16:43:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5b03bf10-d4f1-fb3d-4561-1097630c195a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

27.03.2020 16:37, Dmitry Osipenko пишет:
> 27.03.2020 15:49, Wang, Jiada пишет:
>>>> +static void mxt_watchdog_work(struct work_struct *work)
>>>> +{
>>>> +    struct mxt_data *data =
>>>> +        container_of(work, struct mxt_data, watchdog_work);
>>>> +    u16 info_buf;
>>>> +    int ret = 0;
>>>> +    u8 size = 2;

There is no need to initialize the ret variable.

>>>> +    if (data->suspended || data->in_bootloader)
>>>> +        return;
>>>> +
>>>> +    ret = __mxt_read_reg(data->client, 0, size, &info_buf);

The "size" argument could be replaced with "sizeof(info_buf)".
