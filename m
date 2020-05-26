Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D6411D7B1C
	for <lists+linux-input@lfdr.de>; Mon, 18 May 2020 16:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbgEROXa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 May 2020 10:23:30 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:38956 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728109AbgEROX3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 May 2020 10:23:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589811807;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=N4kEWsurXWVRb491n6rW9nQFxH83gE62FpZ7K4CZ4Y8=;
        b=EtuJtl/zmxbDA4q2YSqQHMq9Abrhz9Vez3ilNH34CZpV2DLA23OyeKAA8Ehq+hIbYFLyuv
        DG4Yh5ZC+ArCeMmk86pdDD3ppPvyd9Izj/X9LDx6o4m0gh0fwn92K8Ikhgq1bQTIXnZ0bi
        yqpupaSv65gV/OzVSc1Pe2li2RKNLbE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-lUTltTY5M3qfN-nnlAgYFQ-1; Mon, 18 May 2020 10:23:25 -0400
X-MC-Unique: lUTltTY5M3qfN-nnlAgYFQ-1
Received: by mail-wr1-f70.google.com with SMTP id l12so5747560wrw.9
        for <linux-input@vger.kernel.org>; Mon, 18 May 2020 07:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N4kEWsurXWVRb491n6rW9nQFxH83gE62FpZ7K4CZ4Y8=;
        b=B4g9m8HVuDDxHGr4hzn1d9XLdA/NYb7XPk9wmCrga2RLRqelqjgXvP/aY9hELHutjA
         7rV+/D7CuAZI5rzVaHWgVV61ZHY6tRqDMaHG4QVQYS4ywL6hUPvgRI3iurCDt85Pvtdn
         qvwS10y4qKvzXEg8r5y8YmmTNOGo/7r9dQDGkvJHsligjHZBt/LjLZhgSRnMsHZOqdta
         oyMbmwAbFY3Q/nSrkMzSIiEZp54c3bWlgLr7oa5J2sf/rlAHCeupF9wm1TIT0NI07I6e
         Uy6HAPDAx/D8A6QEhqMbZMhWKHiSDiTGgECXgySjMgzVASHInjQrSgP3LBjaXbfAGJqg
         NZZg==
X-Gm-Message-State: AOAM531tx9vnzJA1hBR5RK0bK9QU0CefhD7jH9VK7dhXOG7Z4dZcsvsu
        iqK72rdTnbjOXWG9AJgu+X7kQGKeRnjOgtRI5wsSvf9UEGIQw9Wl9vRVAl0mzj9ooLx8LUxRWTQ
        ghKejJyMcHCBYEcbiM0qww9o=
X-Received: by 2002:adf:e388:: with SMTP id e8mr19930280wrm.174.1589811804153;
        Mon, 18 May 2020 07:23:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyi/JVZYfBkPZCJ33i9pkkZ3Iw8Uks7lUYbBZX8naP80oeusj8a8mSkVZW0YdNpNt9SYero8A==
X-Received: by 2002:adf:e388:: with SMTP id e8mr19930254wrm.174.1589811803884;
        Mon, 18 May 2020 07:23:23 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id g187sm16732224wmf.30.2020.05.18.07.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 07:23:23 -0700 (PDT)
Subject: Re: [PATCHv2 0/7] Support inhibiting input devices
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-input@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        patches@opensource.cirrus.com,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Barry Song <baohua@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Nick Dyer <nick@shmanahar.org>,
        Ferruh Yigit <fery@cypress.com>,
        Sangwon Jee <jeesw@melfas.com>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        kernel@collabora.com, Peter Hutterer <peter.hutterer@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>
References: <20200506002746.GB89269@dtor-ws>
 <20200515164943.28480-1-andrzej.p@collabora.com>
 <842b95bb-8391-5806-fe65-be64b02de122@redhat.com>
 <e6030957-97dc-5b04-7855-bc14a78164c8@collabora.com>
 <6d9921fc-5c2f-beda-4dcd-66d6970a22fe@redhat.com>
 <09679de4-75d3-1f29-ec5f-8d42c84273dd@collabora.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f674ba4f-bd83-0877-c730-5dc6ea09ae4b@redhat.com>
Date:   Mon, 18 May 2020 16:23:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <09679de4-75d3-1f29-ec5f-8d42c84273dd@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 5/18/20 3:49 PM, Andrzej Pietrasiewicz wrote:
> Hi Hans,
> 
> W dniu 18.05.2020 o 14:24, Hans de Goede pisze:
>> Hi,
>>
>> On 5/18/20 12:48 PM, Andrzej Pietrasiewicz wrote:
>>> Hi Hans,
>>>
>>> W dniu 15.05.2020 o 20:19, Hans de Goede pisze:
>>>> Hi Andrezj,
>>>>
>>>> On 5/15/20 6:49 PM, Andrzej Pietrasiewicz wrote:
>>>>> Userspace might want to implement a policy to temporarily disregard input
>>>>> from certain devices, including not treating them as wakeup sources.
>>>>>
>>>>> An example use case is a laptop, whose keyboard can be folded under the
>>>>> screen to create tablet-like experience. The user then must hold the laptop
>>>>> in such a way that it is difficult to avoid pressing the keyboard keys. It
>>>>> is therefore desirable to temporarily disregard input from the keyboard,
>>>>> until it is folded back. This obviously is a policy which should be kept
>>>>> out of the kernel, but the kernel must provide suitable means to implement
>>>>> such a policy.
>>>>
>>>> Actually libinput already binds together (inside libinput) SW_TABLET_MODE
>>>> generating evdev nodes and e.g. internal keyboards on devices with 360°
>>>> hinges for this reason. libinput simply closes the /dev/input/event#
>>>> node when folded and re-opens it when the keyboard should become active
>>>> again. Thus not only suppresses events but allows e.g. touchpads to
>>>> enter runtime suspend mode which saves power. Typically closing the
>>>> /dev/input/event# node will also disable the device as wakeup source.
>>>>
>>>> So I wonder what this series actually adds for functionality for
>>>> userspace which can not already be achieved this way?
>>>>
>>>> I also noticed that you keep the device open (do not call the
>>>> input_device's close callback) when inhibited and just throw away
>>>
>>> I'm not sure if I understand you correctly, it is called:
>>>
>>> +static inline void input_stop(struct input_dev *dev)
>>> +{
>>> +    if (dev->poller)
>>> +        input_dev_poller_stop(dev->poller);
>>> +    if (dev->close)
>>> +        dev->close(dev);
>>>                  ^^^^^^^^^^^^^^^^
>>> +static int input_inhibit(struct input_dev *dev)
>>> +{
>>> +    int ret = 0;
>>> +
>>> +    mutex_lock(&dev->mutex);
>>> +
>>> +    if (dev->inhibited)
>>> +        goto out;
>>> +
>>> +    if (dev->users) {
>>> +        if (dev->inhibit) {
>>> +            ret = dev->inhibit(dev);
>>> +            if (ret)
>>> +                goto out;
>>> +        }
>>> +        input_stop(dev);
>>>                  ^^^^^^^^^^^^^^^^
>>>
>>> It will not be called when dev->users is zero, but if it is zero,
>>> then nobody has opened the device yet so there is nothing to close.
>>
>> Ah, I missed that.
>>
>> So if the device implements the inhibit call back then on
>> inhibit it will get both the inhibit and close callback called?
>>
> 
> That's right. And conversely, upon uninhibit open() and uninhibit()
> callbacks will be invoked. Please note that just as with open()/close(),
> providing inhibit()/uninhibit() is optional.

Ack.

>> And what happens if the last user goes away and the device
>> is not inhibited?
> 
> close() is called as usually.

But not inhibit, hmm, see below.

>> I'm trying to understand here what the difference between the 2
>> is / what the goal of having a separate inhibit callback ?
>>
> 
> Drivers have very different ideas about what it means to suspend/resume
> and open/close. The optional inhibit/uninhibit callbacks are meant for
> the drivers to know that it is this particular action going on.

So the inhibit() callback triggers the "suspend" behavior ?
But shouldn't drivers which are capable of suspending the device
always do so on close() ?

Since your current proposal also calls close() on inhibit() I
really see little difference between an inhibit() and the last
user of the device closing it and IMHO unless there is a good
reason to actually differentiate the 2 it would be better
to only stick with the existing close() and in cases where
that does not put the device in a low-power mode yet, fix
the existing close() callback to do the low-power mode
setting instead of adding a new callback.

> For inhibit() there's one more argument: close() does not return a value,
> so its meaning is "do some last cleanup" and as such it is not allowed
> to fail - whatever its effect is, we must deem it successful. inhibit()
> does return a value and so it is allowed to fail.

Well, we could make close() return an error and at least in the inhibit()
case propagate that to userspace. I wonder if userspace is going to
do anything useful with that error though...

In my experience errors during cleanup/shutdown are best logged
(using dev_err) and otherwise ignored, so that we try to clean up
as much possible. Unless the very first step of the shutdown process
fails the device is going to be in some twilight zone state anyways
at this point we might as well try to cleanup as much as possible.

> All in all, it is up to the drivers to decide which callback they
> provide. Based on my work so far I would say that there are tens
> of simple cases where open() and close() are sufficient, out of total
> ~400 users of input_allocate_device():
> 
> $ git grep "input_allocate_device(" | grep -v ^Documentation | \
> cut -f1 -d: | sort | uniq | wc
>      390     390   13496

So can you explain a bit more about the cases where only having
open/close is not sufficient?  So far I have the feeling that
those are all we need and that we really do not need separate
[un]inhibit callbacks.

Regards,

Hans

