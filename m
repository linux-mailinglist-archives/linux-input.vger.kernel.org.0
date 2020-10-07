Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 925D9285FC1
	for <lists+linux-input@lfdr.de>; Wed,  7 Oct 2020 15:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728177AbgJGNIL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Oct 2020 09:08:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32646 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728279AbgJGNIL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 7 Oct 2020 09:08:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602076089;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GnXNwe9IIdh6YdLl3oPypcMyRe99Q71RhFkX/YDCZKM=;
        b=K6n+edYi1nGJnqPhesAr30iSUb3wOjbsChzZ05c5y+C6o4PnvsFf9YIyHZhsFHoZRNHM24
        vVBk6BA8UGendHh8It8XWN+enzLqe7v8ZgIWCCRfHfzNgX+qQ11EUDjdY0Suu5ay/Emfvj
        9XpUhLFH4OSbstALOpiO6dEY/EMBlfM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-kwGHhTZpPLm-Fu5CBCXEcQ-1; Wed, 07 Oct 2020 09:08:08 -0400
X-MC-Unique: kwGHhTZpPLm-Fu5CBCXEcQ-1
Received: by mail-ed1-f69.google.com with SMTP id 63so868505edy.9
        for <linux-input@vger.kernel.org>; Wed, 07 Oct 2020 06:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GnXNwe9IIdh6YdLl3oPypcMyRe99Q71RhFkX/YDCZKM=;
        b=hUuiMU/ykh8zz5fijtTb4Es/jUc49qiBEe5gDQSMTAfvaBOm+WDWim+iNVJxBkXh3C
         dvz4ny+/TDWcElDrR4z0dXq6AgNnY7MHFOd4BZ3J2hbhLoRMW6QUSINmNQ02RUa7Y34K
         cN9SLT0riZnTxXLl7ASu6pBqRNfzVuS3dy59TGFmZjzktcgnLHWGFEQn/8KREvuz14E8
         HAasJDcZPtmDUhWf1dQAKfjeQH3W/3fMwYyoae5wB4yxPwvpnOcf2qL4Ku1OoDZ65HXv
         j6B7Pa2eXEUHyaQN7DuRmMHPYmSdUhTSqWRuoTvHLoLjUGxc6lfs2s0/cCx9ARbbIevh
         +8+A==
X-Gm-Message-State: AOAM533bNDx4V+wSERvsYRz4X5wUFDDhV8GUPdXVGxcmDabo028pBImL
        6a3mlurJp3VPFBODkB/Do7h2V21Igkz0tfjRXRSOT/KR3i/fpwumVcXqV3zEm4Gn6uLgJujm9Ge
        qyA9riQ5H8mMAsngkm7v/sDI=
X-Received: by 2002:a50:9e6a:: with SMTP id z97mr3687699ede.32.1602076086573;
        Wed, 07 Oct 2020 06:08:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyKzyfrpQ+fsV7T2EDwv3xPt9LfubxAyDb7xJkJQ9oN2cQe2D8JcUu3ciCM6C8tB7LoorGbQ==
X-Received: by 2002:a50:9e6a:: with SMTP id z97mr3687672ede.32.1602076086318;
        Wed, 07 Oct 2020 06:08:06 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id t25sm1445573edt.24.2020.10.07.06.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2020 06:08:05 -0700 (PDT)
Subject: Re: [External] Using IIO to export laptop palm-sensor and lap-mode
 info to userspace?
To:     Bastien Nocera <hadess@hadess.net>,
        Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     linux-iio@vger.kernel.org, Nitin Joshi1 <njoshi1@lenovo.com>,
        linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
References: <9f9b0ff6-3bf1-63c4-eb36-901cecd7c4d9@redhat.com>
 <5a646527-7a1f-2fb9-7c09-8becdbff417b@lenovo.com>
 <20201007083602.00006b7e@Huawei.com>
 <218be284-4a37-e9f9-749d-c126ef1d098b@redhat.com>
 <b400b6956270a2433373dd6cbdae3332aa683f4f.camel@hadess.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <cadabe4d-7cce-281e-75fe-fcc2099848da@redhat.com>
Date:   Wed, 7 Oct 2020 15:08:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b400b6956270a2433373dd6cbdae3332aa683f4f.camel@hadess.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 10/7/20 1:35 PM, Bastien Nocera wrote:
> On Wed, 2020-10-07 at 11:51 +0200, Hans de Goede wrote:
>> <snip>
>>> Dmitry, any existing stuff like this in input?
>>
>> There already is a SW_FRONT_PROXIMITY defined in
>> input-event-codes.h, which I guess means detection if
>> someone is sitting in front of the screen. So we could add:
>>
>> SW_LAP_PROXIMITY
>> SW_PALMREST_PROXIMITY,
>>
>> And then we have a pretty decent API for this I think.
> 
>  From the point of view of writing the consumer code for this API, it's
> rather a lot of pain to open the device node (hoping that it's the
> right one for what we need), getting the initial state, setting up
> masks to avoid being woken up for every little event, and parsing those
> events.

There is not much difference with the iio sysfs API though, you would
also need to iterate over all the iio devices and test if they
are a proximity sensor (and read the new location sysfs file discussed).

> Where would the necessary bits of metadata for daemons to be able to
> find that those switches need to get added?

evdev files export info on which events they can report. Not only
the types of events (EV_SW in this case) but also a bitmask for
which event-codes they can report within that type.

> If you go down that route, you'll definitely want a want to attach the
> "palmrest" to the touchpad/keyboard that it corresponds to, otherwise
> that might have weird interactions when using external keyboards and
> touchpads. (I don't know what you'd use that proximity sensor for
> though)

The proximity sensor is primarily for deciding how strong a signal
wireless devices inside the laptop may emit.

Regards,

Hans

