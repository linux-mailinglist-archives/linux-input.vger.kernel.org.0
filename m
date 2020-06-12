Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7FDB1F754B
	for <lists+linux-input@lfdr.de>; Fri, 12 Jun 2020 10:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgFLIak (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 Jun 2020 04:30:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25238 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726353AbgFLIak (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 Jun 2020 04:30:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591950638;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OPWeA1qjGBNWCHfcjBnCq0fW8SyKcT5HP9U/4tli77g=;
        b=IfB0Re+Hw8n5xqCi3O5/730isKOLBbSEGIWPZ1mHiWzPXR1dCDhuBdNIviCvrqn8iyj7H5
        z9HGBViZmwIyIZh0zImW1bO475W2xNCyB+39ucdiPdmc8wPuZskS+DdeccdT5O0zRSFt1W
        /RZWwirfmBtYrUbPRrsOmtjfGijqs7M=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-GyTw-E_vNwO7VjrC0EpMaQ-1; Fri, 12 Jun 2020 04:30:29 -0400
X-MC-Unique: GyTw-E_vNwO7VjrC0EpMaQ-1
Received: by mail-ed1-f72.google.com with SMTP id b100so2625712edf.2
        for <linux-input@vger.kernel.org>; Fri, 12 Jun 2020 01:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OPWeA1qjGBNWCHfcjBnCq0fW8SyKcT5HP9U/4tli77g=;
        b=laUcbPmko31rUn58/jHVd24p65LXXYH6dp8Z5aPdtdaDWrkWW8T5hYFiK5ldhRYMVh
         NDTT9BJULR7drVTJQtS9ENrMyVC9mEyPVgDoKS5+7yy4wF12CAIGeEM1CMbREAFK05eP
         QQxCQKANknlZmwhogvVFTugKE58FkXI5uKI653KfzLfDmNyAWqpOWuI/TaGbfkiGpLmn
         dxZPDFN0JyfNVPhRd+KG5OMacFrwjNXQuqSUlVjfNR25icU6OyUKjVI+NMOTdL16y6mB
         PuvvS6SpYWeeo1smjR9KXi2Lu//gXyc/BB50bEPROMiy26ju7SPj4bsYBqQ5sLZjmJy+
         cVqQ==
X-Gm-Message-State: AOAM532rcVN/VrN3G35JtWJJq6Qrs4ap3xk4uvSqQXtATne2QYZ5Trj9
        j+S2P8G0GFejzJipbvSYmuP0M/RV1hvHvfl0RrIfWomJfHkfDTkbt1PDx81TjTBpJgqe1RQ0LLd
        76zytXZ150PQhJDTalpLwvT8=
X-Received: by 2002:a17:906:150c:: with SMTP id b12mr11118838ejd.545.1591950627662;
        Fri, 12 Jun 2020 01:30:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzK+lnhXJPHcxkk+0REwmXPmNz4y9unDpw9LWEppS+/VYsL4Zuy/fGvFVeGkarTC5boVCicqQ==
X-Received: by 2002:a17:906:150c:: with SMTP id b12mr11118797ejd.545.1591950627331;
        Fri, 12 Jun 2020 01:30:27 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id k24sm2761134edk.95.2020.06.12.01.30.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2020 01:30:26 -0700 (PDT)
Subject: Re: [PATCH v4 0/7] Support inhibiting input devices
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Linux PM <linux-pm@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-iio@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>,
        linux-input@vger.kernel.org,
        linux-tegra <linux-tegra@vger.kernel.org>,
        patches@opensource.cirrus.com,
        ibm-acpi-devel@lists.sourceforge.net,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
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
        Peter Hutterer <peter.hutterer@redhat.com>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Collabora Kernel ML <kernel@collabora.com>
References: <2336e15d-ff4b-bbb6-c701-dbf3aa110fcd@redhat.com>
 <20200608112211.12125-1-andrzej.p@collabora.com>
 <964ca07a-3da5-101f-7edf-64bdeec98a4b@redhat.com>
 <CAJZ5v0hB2ra2K=dd9ZjVyy1V2b1PmFHm79uDO2HtHU1D_4YUbw@mail.gmail.com>
 <6136f26c-e090-e025-af55-4c5f3a6aec92@collabora.com>
 <3e61c9c1-b211-da9f-c55b-b44eb6522f2a@redhat.com>
 <2d5fd063-66bc-c707-4041-84a17c0a7d04@collabora.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <40988408-8f36-3a52-6439-34084de6b129@redhat.com>
Date:   Fri, 12 Jun 2020 10:30:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <2d5fd063-66bc-c707-4041-84a17c0a7d04@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 6/10/20 3:41 PM, Andrzej Pietrasiewicz wrote:
> Hi Hans,
> 
> W dniu 10.06.2020 o 15:21, Hans de Goede pisze:
>> Hi,
>>
>> On 6/10/20 3:12 PM, Andrzej Pietrasiewicz wrote:
>>> Hi All,
>>>
>>> W dniu 10.06.2020 o 12:38, Rafael J. Wysocki pisze:
>>>> On Wed, Jun 10, 2020 at 11:50 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>
>>>>> Hi All,
>>>>>
>>>>> On 6/8/20 1:22 PM, Andrzej Pietrasiewicz wrote:
>>>>>> This is a quick respin of v3, with just two small changes, please see
>>>>>> the changelog below.
>>>>>>
>>>>>> Userspace might want to implement a policy to temporarily disregard input
>>>>>> from certain devices.
>>>>>>
>>>>>> An example use case is a convertible laptop, whose keyboard can be folded
>>>>>> under the screen to create tablet-like experience. The user then must hold
>>>>>> the laptop in such a way that it is difficult to avoid pressing the keyboard
>>>>>> keys. It is therefore desirable to temporarily disregard input from the
>>>>>> keyboard, until it is folded back. This obviously is a policy which should
>>>>>> be kept out of the kernel, but the kernel must provide suitable means to
>>>>>> implement such a policy.
>>>>>
>>>>> First of all sorry to start a somewhat new discussion about this
>>>>> while this patch set is also somewhat far along in the review process,
>>>>> but I believe what I discuss below needs to be taken into account.
>>>>>
>>>>> Yesterday I have been looking into why an Asus T101HA would not stay
>>>>> suspended when the LID is closed. The cause is that the USB HID multi-touch
>>>>> touchpad in the base of the device starts sending events when the screen
>>>>> gets close to the touchpad (so when the LID is fully closed) and these
>>>>> events are causing a wakeup from suspend. HID multi-touch devices
>>>>> do have a way to tell them to fully stop sending events, also disabling
>>>>> the USB remote wakeup the device is doing. The question is when to tell
>>>>> it to not send events though ...
>>>>>
>>>>> So now I've been thinking about how to fix this and I believe that there
>>>>> is some interaction between this problem and this patch-set.
>>>>>
>>>>> The problem I'm seeing on the T101HA is about wakeups, so the question
>>>>> which I want to discuss is:
>>>>>
>>>>> 1. How does inhibiting interact with enabling /
>>>>> disabling the device as a wakeup source ?
>>>>>
>>>>> 2. Since we have now made inhibiting equal open/close how does open/close
>>>>> interact with a device being a wakeup source ?
>>>>>
>>>>> And my own initial (to be discussed) answers to these questions:
>>>>>
>>>>> 1. It seems to me that when a device is inhibited it should not be a
>>>>> wakeup source, so where possible a input-device-driver should disable
>>>>> a device's wakeup capabilities on suspend if inhibited
>>>>
>>>> If "inhibit" means "do not generate any events going forward", then
>>>> this must also cover wakeup events, so I agree.
>>>
>>> I agree, too.
>>>
>>>>
>>>>> 2. This one is trickier I don't think we have really clearly specified
>>>>> any behavior here. The default behavior of most drivers seems to be
>>>>> using something like this in their suspend callback:
>>>>>
>>>>>           if (device_may_wakeup(dev))
>>>>>                   enable_irq_wake(data->irq);
>>>>>           else if (input->users)
>>>>>                   foo_stop_receiving_events(data);
>>>>>
>>>>> Since this is what most drivers seem to do I believe we should keep
>>>>> this as is and that we should just clearly document that if the
>>>>> input_device has users (has been opened) or not does not matter
>>>>> for its wakeup behavior.
>>>>>
>>>>> Combining these 2 answers leads to this new pseudo code template
>>>>> for an input-device's suspend method:
>>>>>
>>>>>          /*
>>>>>           * If inhibited we have already disabled events and
>>>>>           * we do NOT want to setup the device as wake source.
>>>>>           */
>>>>>          if (input->inhibited)
>>>>>                  return 0;
>>>
>>> Right, if a device is inhibited it shouldn't become a wakeup source,
>>> because that would contradict the purpose of being inhibited.
>>
>> Ack. Note I do think that we need to document this (and more
>> in general the answer to both questions from above) clearly so
>> that going forward if there are any questions about how this is
>> supposed to work we can just point to the docs.
>>
>> Can you do a follow-up patch, or include a patch in your next
>> version which documents this (once we agree on what "this"
>> exactly is) ?
> 
> Sure I can. Just need to know when "this" becomes stable enough ;)
> If this series otherwise looks mature enough I would opt for a
> follow-up patch.

FWIW after my flip-flop to agreeing with Dmitry that the 2
(inhibit vs wakeup) should be completely orthogonal this new
policy is stable/mature from my pov (and consistent with how
we handle wakeup vs input_dev->users).

I still think it would be good to do a follow-up documentation
patch documenting that these (and esp. inhibit) are orthogonal.

This will mean for example that if a device is inhibit but
still wakeup enabled and the device's close method silences
the devices, that it needs to be unsilenced in suspend.
This might be worth mentioning in the docs even though
drivers which silence the device on close should already
unsilence the device on suspend when it is wakeup-enabled.

Note maybe we should give it a couple of days for others to
give their opinion before you submit the follow-up documentation
patch.

Regards,

Hans



