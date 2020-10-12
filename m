Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A175928B469
	for <lists+linux-input@lfdr.de>; Mon, 12 Oct 2020 14:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388429AbgJLMNl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Oct 2020 08:13:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45867 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388361AbgJLMNl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Oct 2020 08:13:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602504819;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5HU91LHnQTKR2yQDGosbdEj8ORh/GmI6UcUCZ5/zDmA=;
        b=MgQf2pTDCD8pyvfX1RZjI3Xk1PLdpQzeiRypN9doGnsY9K6ujMswWmXoHcp91QI5FX+EMu
        kV2WjhuDctCgERxAIgJ/60//mln9FdpmLrlAS6AUxobWtPJOI65Y3OkKniftZtzRqi5H4F
        lLwX7LUCRBvjHxMQHMs6/XwJVv0jwwM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-32d2h-TdOuqXEmJ3Ov4cmA-1; Mon, 12 Oct 2020 08:13:38 -0400
X-MC-Unique: 32d2h-TdOuqXEmJ3Ov4cmA-1
Received: by mail-ej1-f70.google.com with SMTP id z18so1160117eji.1
        for <linux-input@vger.kernel.org>; Mon, 12 Oct 2020 05:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5HU91LHnQTKR2yQDGosbdEj8ORh/GmI6UcUCZ5/zDmA=;
        b=L5bw172uaqVpso1FumU44XlFmW1ELJB3gouz9T5DlmwkQ76GZ8dtq9Ee7kfXzaXEbI
         ZVw9xRDIZS1har4Igrk5bZbOAuYq+ut2QO6rN7OBt9V+0Aa4+q9GrsrtGNXfmQA2oZEZ
         ubFF27BCQfHrGfHvubvnZrSIaZKJBUCqNWYDvaLd5mn+U2Eqk7NdYpA3IyTAFlAxOeZt
         eo6eA5Y7FsctTnD9v9II0Yy5D6wl5jnqvMf6g5GozP3O63B2taeKIwBPLmmMpDIvyv/M
         Zx7DhYrPCewrubVXKSVYOJUu+rB7W8Pdq3TJAlwTSO3+01bMlmGKHxlHcuLBOEGSUT4M
         GVGQ==
X-Gm-Message-State: AOAM532y7NXl9xnuVAu/2YyHY5qHHUqQvlZQdBjEZc2gfdYrqvcSL05k
        mAsLaZ5NJyrXAVGy9hnzYBlv+NIJDqKmfnmGQFdSQo6c9W0u3YXOFkmruQv6O387zilg+TTy+v5
        lv2EuzD+vIo6gcjcaCzDR5b4=
X-Received: by 2002:aa7:de06:: with SMTP id h6mr13743875edv.31.1602504816762;
        Mon, 12 Oct 2020 05:13:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1pGP3YmjRYLrr2z+ODGXwKFMGo9xoGCpv3tIVimfcq47P6z2EG4I+0wu9XIX+ZAwzLDd9mg==
X-Received: by 2002:aa7:de06:: with SMTP id h6mr13743846edv.31.1602504816454;
        Mon, 12 Oct 2020 05:13:36 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id a10sm10516044ejs.11.2020.10.12.05.13.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2020 05:13:35 -0700 (PDT)
Subject: Re: [External] Using IIO to export laptop palm-sensor and lap-mode
 info to userspace?
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     Bastien Nocera <hadess@hadess.net>,
        Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-iio@vger.kernel.org, Nitin Joshi1 <njoshi1@lenovo.com>,
        linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
References: <9f9b0ff6-3bf1-63c4-eb36-901cecd7c4d9@redhat.com>
 <5a646527-7a1f-2fb9-7c09-8becdbff417b@lenovo.com>
 <20201007083602.00006b7e@Huawei.com>
 <218be284-4a37-e9f9-749d-c126ef1d098b@redhat.com>
 <b400b6956270a2433373dd6cbdae3332aa683f4f.camel@hadess.net>
 <cadabe4d-7cce-281e-75fe-fcc2099848da@redhat.com>
 <5273a1de9db682cd41e58553fe57707c492a53b7.camel@hadess.net>
 <272074b5-b28e-1b74-8574-3dc2d614269a@redhat.com>
 <20201008001424.GA3713@labundy.com>
 <9893a32c-02c8-f00c-7f00-6287d55043ab@redhat.com>
 <20201009021949.GA3629@labundy.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <961aeee6-22e9-75dc-9fcf-45cee00ab62c@redhat.com>
Date:   Mon, 12 Oct 2020 14:13:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201009021949.GA3629@labundy.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 10/9/20 4:19 AM, Jeff LaBundy wrote:
> Hi Hans,
> 
> On Thu, Oct 08, 2020 at 09:10:19AM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 10/8/20 2:14 AM, Jeff LaBundy wrote:
>>> Hi all,
>>>
>>> On Wed, Oct 07, 2020 at 03:32:07PM +0200, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 10/7/20 3:29 PM, Bastien Nocera wrote:
>>>>> On Wed, 2020-10-07 at 15:08 +0200, Hans de Goede wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 10/7/20 1:35 PM, Bastien Nocera wrote:
>>>>>>> On Wed, 2020-10-07 at 11:51 +0200, Hans de Goede wrote:
>>>>>>>> <snip>
>>>>>>>>> Dmitry, any existing stuff like this in input?
>>>
>>> It seems we are talking about "specific absorption rate" (SAR) type
>>> devices that signal the WLAN controller to reduce transmitted power
>>> while a user is nearby.
>>
>> Yes and no. At least the lap-mode detection (laptop on someones
>> lap rather then sitting on a table) is currently used by the
>> embedded-controller for thermal management decisions, basically
>> when on someones lap the configurable TPD of the CPU is set lower
>> to keep the laptop's bottom skin temperate < 45 degrees Celsius
>> (I think it is 45 but the exact number does not matter).
> 
> This is a much-appreciated feature. :)
> 
>>
>> The lap-mode info is currently exported with a thinkpad_acpi specific
>> sysfs attribute with the idea that userspace could potentially use
>> this to indicate to the user that turbo clocks will be lower
>> because of this.
>>
>> With upcoming WLAN cards with configurable transmit power,
>> this will also be used as what you call a SAR device.
>>
>> AFAIK the palmrest case is mostly a SAR device.
>>
>> Note I'm explaining the alternative lap-mode use-case to make
>> sure everyone is on the same page. I completely agree with the
>> gist of your email :)
> 
> Acknowledged on all counts; thank you for this additional background
> information.
> 
>>
>>> I just wanted to chime in and confirm that we do have at least one
>>> precedent for these being in input (keyboard/iqs62x-keys) and not
>>> iio so I agree with Jonathan here. My argument is that we want to
>>> signal binary events (user grabbed onto or let go of the handset)
>>> rather than deliver continuous data.
>>
>> I was curious what keycode you are using for this, but I see
>> that the keycodes come from devicetree, so I guess I should
>> just ask: what keycode are you using for this ?
> 
> The idea here was that a vendor might implement their own daemon
> that interprets any keycode of their choice, hence leaving the
> keycodes assignable via devicetree.
> 
> This particular device also acts as a capacitive/inductive button
> sensor, and these applications were the primary motivation for it
> landing in input with its status bits mapped to keycodes.
> 
> I don't think there are any keycodes that exist today that would
> universally work for this application. The couple that seem most
> closely related (e.g. KEY_WLAN or KEY_RFKILL) are typically used
> for disabling the adapter entirely or for airplane mode (please
> correct me if I'm wrong).

You're right (aka not wrong), KEY_WLAN and KEY_RFKILL are used to
toggle wireless radios on/off and re-using them for some SAR
purpose would lead to nothing but confusion. We really need to
define some standard *new* event-codes for this, such as e.g.
the proposed SW_LAP_PROXIMITY and SW_PALMREST_PROXIMITY.

> To that end, I'm keen to see how this interface unfolds because
> SAR detection tends to be an available mode of operation for
> several of the capacitive touch devices I've been working with.

I guess that for touchscreens at least (which are on the front),
using the existing SW_FRONT_PROXIMITY would make the most sense.

Regards,

Hans

