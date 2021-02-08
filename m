Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 405953134FC
	for <lists+linux-input@lfdr.de>; Mon,  8 Feb 2021 15:22:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232680AbhBHOVi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Feb 2021 09:21:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59712 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232684AbhBHOTW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Feb 2021 09:19:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612793873;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qtey4c35yoJG8YcPRW/vRCJjpPgDfPUO2mEimGsvBm4=;
        b=VfGILiM1WUID0ftzpBXHU+E8S1RaOSYOyW75v6aXbtX3i4YVZSHbm3eh7vjg0HHU/kUhK5
        D1hjs4C27YEvB1GpxnpTohKtZp3Hh0BnJKIfBSVBfQxlabFJ9l0IKGamlTpylsPnRYYkeO
        4MpRM79Mg2XmOaja4XFLFqI4lPY1uA4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-mUWI2-geNVmmYolaqps9Lw-1; Mon, 08 Feb 2021 09:17:50 -0500
X-MC-Unique: mUWI2-geNVmmYolaqps9Lw-1
Received: by mail-ed1-f69.google.com with SMTP id g2so13424168edq.14
        for <linux-input@vger.kernel.org>; Mon, 08 Feb 2021 06:17:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qtey4c35yoJG8YcPRW/vRCJjpPgDfPUO2mEimGsvBm4=;
        b=Sh8es/PG7LH0V1W7riqH4HI8pjw5SqDWPJt8UihhAkUf5YFKevAXn+MeZuLYJQdZj9
         GWx5ehGru5WNQKgl5gfSGOvQZG8z+Q+CPTxilfCGEqPPLcmSzfeceOECMIDUONznsuq7
         PqtpVqsxmwlBBmDgmPAZ7QLegDruiUmGCKVx28TqQapEfzJNuBnGAOjJWIIGjvEvPmQX
         9fQfpFdmmDjQnCWoyL4owDlfIBIzuUyKmwLwu2pFJtolhg0a1ksNj5jZ8uwERrqqGaGj
         KMF6b6Kd9D/X1bGJBjXdDwSMbIBYbhPGIAE/6OnsNfJqrgp/QOTbvWKqNDQUfyTOer7p
         Anmg==
X-Gm-Message-State: AOAM532qGJaps4A2jVCfRxapTlimP8B/6sYl7bD+lmkI8+LUIMYvJny7
        IcFl7q0BvhtBfoZOX1zag0KjB8qzlsCcqgMUH3nvcV5wzXudN05n2+acGxXMYDcyaqBj+HKXe/8
        rAUwggMOCMlSEQz2R0abOQgg=
X-Received: by 2002:a17:906:f2cd:: with SMTP id gz13mr17003846ejb.83.1612793869562;
        Mon, 08 Feb 2021 06:17:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsMmdGtqoc9KY6ZRHk5FY8g0FX5/ZJoKFmLev+/XQ8P1SHy5fuuFfWQRfDMxZxJKXfr49p1A==
X-Received: by 2002:a17:906:f2cd:: with SMTP id gz13mr17003824ejb.83.1612793869357;
        Mon, 08 Feb 2021 06:17:49 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e16sm3952235eja.85.2021.02.08.06.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Feb 2021 06:17:48 -0800 (PST)
Subject: Re: [PATCH 1/2] iio: documentation: Document proximity sensor label
 use
To:     Bastien Nocera <hadess@hadess.net>,
        Jonathan Cameron <jic23@kernel.org>
Cc:     linux-input@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-iio@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Pearson <mpearson@lenovo.com>
References: <20210207123720.8357-1-hdegoede@redhat.com>
 <2b7a0374f4af5e2113c1d209246b506d7f42ae29.camel@hadess.net>
 <676c9b71-ffc6-343e-f4ef-b0ec73fdb906@redhat.com>
 <8c07c3f3515088b1c5a8ef6c45574233ca371590.camel@hadess.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <77eb5419-fbb6-ba7d-5e57-7886815dc0e9@redhat.com>
Date:   Mon, 8 Feb 2021 15:17:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <8c07c3f3515088b1c5a8ef6c45574233ca371590.camel@hadess.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 2/8/21 3:16 PM, Bastien Nocera wrote:
> On Mon, 2021-02-08 at 14:50 +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 2/8/21 2:40 PM, Bastien Nocera wrote:
>>> On Sun, 2021-02-07 at 13:37 +0100, Hans de Goede wrote:
>>>> Add an entry to Documentation/ABI/testing/sysfs-bus-iio for
>>>> the new device and channel label sysfs-attribute support.
>>>>
>>>> And document the standardized labels which may be used with
>>>> proximity
>>>> sensors to hint userspace about the intended use of the sensor.
>>>>
>>>> Using labels to differentiate between the multiple proximity
>>>> sensors
>>>> which a modern laptop/tablet may have was discussed in this
>>>> thread:
>>>> https://lore.kernel.org/linux-iio/9f9b0ff6-3bf1-63c4-eb36-901cecd7c4d9@redhat.com/
>>>>
>>>> As mentioned the "proximity-wifi*" labels are already being used
>>>> in
>>>> this manner on some chromebooks, see e.g.:
>>>> arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>>>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lte-sku.dtsi
>>>>
>>>> And the "proximity-palmrest" and "proximity-lap" labels are
>>>> intended
>>>> to be used with the lap and palmrest sensors found in recent
>>>> Lenovo
>>>> ThinkPad models.
>>>
>>> Both patches in the series look fine to me.
>>
>> Thank you for checking.
>>
>>> Is IIO the interface you plan on using to implement the lap
>>> detection
>>> for the thinkpad_acpi driver?
>>
>> ATM both the lap detection and the palmrest proximity detection are
>> already available using thinkpad_acpi specific sysfs attributes:
>>
>> [hans@x1 linux]$ cat
>> /sys/bus/platform/devices/thinkpad_acpi/dytc_lapmode 
>> 0
>> [hans@x1 linux]$ cat
>> /sys/bus/platform/devices/thinkpad_acpi/palmsensor 
>> 1
>>
>> Which I think you are already aware of ?
> 
> I didn't know those actually landed upstream (or I didn't remember), I
> was waiting on the SW_LAP_PROXIMITY input device method to land:
> https://gitlab.freedesktop.org/hadess/power-profiles-daemon/-/merge_requests/42
> 
> That's abandoned, right?

Yes that has been abandoned, sorry.

>>   These will not be going
>> anywhere since dropping these would be a userspace ABI break.
>>
>> With that said, yes the plan is to extend the thinkpad_acpi driver
>> to also report lap / palmrest proximity through IIO using these
>> labels.
> 
> OK, good to know.
> 
> I've filed:
> https://gitlab.freedesktop.org/hadess/iio-sensor-proxy/-/issues/321
> so we can eventually export more than a single proximity sensor through
> the D-Bus interface in the future.

Ok.

Regards,

Hans

