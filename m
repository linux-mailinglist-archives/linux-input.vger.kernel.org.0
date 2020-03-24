Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD42C1913B6
	for <lists+linux-input@lfdr.de>; Tue, 24 Mar 2020 15:55:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727674AbgCXOzA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Mar 2020 10:55:00 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36522 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727065AbgCXOy7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Mar 2020 10:54:59 -0400
Received: by mail-lj1-f196.google.com with SMTP id g12so18910367ljj.3;
        Tue, 24 Mar 2020 07:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AOSS3eFveilVZn/DBbbwh0izNJbKh2tnXbF729vy+ig=;
        b=WrlNghczCsey37/MKE3w8tCZ2XzHcdmxxQnDbBLx/KkZdZJaB48QcwugA33f5AYk5I
         KQ9H4EcdVf5G0OY/4B94T4N2OuEjHl8mCBhcYsRdr385N33Llhupz5oStGeGW2LLTWJa
         38wNnLTn57+OPZH86ID4htim9sSaWwM0b1bqI+dVKKfyTnSTMyB5RAkzn7thHQVBSF0C
         tFBXDAKeVrBUOhpRpjOfavyD/bUs8+h4mYs7OtAFVwIhj+C7HeaOYW50htqulzwDICzZ
         FkomX58TuXFMnrDSSRMlD4mj2BBPYE7UGX2uVIH5O3UKAdFYK0b9S2yY0dsxdOHFwHg3
         s9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AOSS3eFveilVZn/DBbbwh0izNJbKh2tnXbF729vy+ig=;
        b=ZAPaPo/iNon6cBmt9lVJk4JFM71D7OSNqd0mqHAXfWnVAgJcJ5g2Ww03etWXoy0jS0
         4VN8QACBtkEAlX12NjxJVp8EKF2r+Sw7zneFDQw6bdk465YeDSw8gnvEIxb1XaTZeiLw
         Sajx3MR37rKU6LTgDEcS3EKjJ4Au1t/sbysDzjqyMtzdsriri0xpTaLsNTSuBlYL1joQ
         1afTgzA7KuXv4s+wXJonjJl5MjhH95CefTBU/58uD+o3P+p8bUU7LfYnbkArWXe8v51R
         YOjUCxCEgGY0BnRkP9PvZ9Bl3eTO+DH9xzMYOAUzMS6sNwMomXw4BJduxCPZw2WRZ3kT
         Hxug==
X-Gm-Message-State: ANhLgQ0yXqP7ArcFRwMnaLmtHVnnC/BNOpDH0zJeO1aAQtm54U2zZtfc
        A7Kr3QL3q00fmAeOLcfLTvI=
X-Google-Smtp-Source: ADFU+vveJotGWX053MYJksGQ4e55grhJu+aTUF4p1M6m8YJCoBbxN+4WPmArxVjhO/YKIcbaGGSUwQ==
X-Received: by 2002:a05:651c:201d:: with SMTP id s29mr3721559ljo.214.1585061697401;
        Tue, 24 Mar 2020 07:54:57 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id y20sm10270084ljd.35.2020.03.24.07.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2020 07:54:56 -0700 (PDT)
Subject: Re: [PATCH v7 00/48] atmel_mxt_ts misc
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5d8fdfc1-cc95-59db-b83e-87bb16ea79e8@gmail.com>
Date:   Tue, 24 Mar 2020 17:54:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <bd3c487b-b065-3e4f-6ab1-f344a4113fcd@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

23.03.2020 05:25, Wang, Jiada пишет:
> Hello Dmitry
> 
> On 2020/03/21 0:53, Dmitry Osipenko wrote:
>> Hello Jiada,
>>
>> 20.03.2020 06:37, Wang, Jiada пишет:
>>> Hello Dmitry
>>>
>>> I have submitted v8 patch-set to address your comments towards v7
>>> patch-set,
>>> most of checkpatch warnings and errors have been addressed,
>>>
>>> But I didn't update for following two types of warnings
>>> since I want to keep consistency with legacy code
>>>
>>> WARNING: DEVICE_ATTR unusual permissions '0600' used
>>> #290: FILE: drivers/input/touchscreen/atmel_mxt_ts.c:3761:
>>> +static DEVICE_ATTR(debug_v2_enable, 0600, NULL,
>>
>> What will happen if you'll use 0644? Will an empty line be returned or
>> driver will crash?
>>
> debug_v2_enable doesn't have .show callback implemented, so after change
> permission to 644, read of it results in an I/O error,
> 
> for other 0600 permission interfaces (t38_data, t25 and debug_enable)
> added in this series,
> change to 644 can return expected information when read.
> 
> Do you think it's better to change debug_v2_enable to 0200,
> and others to 0644?

Since the debug_enable has mxt_debug_enable_show(), the same should be
done for debug_v2_enable, for consistency.

The permissions should be 0644 for everything that is read/write.

The 0200 should be used for everything that is root-only and write-only.
