Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16528373CD6
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 16:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233595AbhEEOBA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 10:01:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51035 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233619AbhEEOA7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 10:00:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620223202;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hwkuwYY/I7ZJjbC7oPD0q65UH/wGFXBUWii911bxvQM=;
        b=iDBTkFZxS0erwBLymQ5o8lvEEL3LA/t5ID1ohjiHB8r4u6YORHWNZ2JzIXs61dpzt8HuVO
        Mm84WhUPSTij4HfiX2BbtKxXmhlbiqpURj0xHouPCK+bakhK8xGN8I4jKGUFf0IQ/5AYdS
        wqSl9Aldi9ZHK7+0dGFNg4UkmFFvgng=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-a72F8cAjM_yEz9D6E1ru2A-1; Wed, 05 May 2021 10:00:00 -0400
X-MC-Unique: a72F8cAjM_yEz9D6E1ru2A-1
Received: by mail-ej1-f72.google.com with SMTP id v7-20020a1709061807b02903a3d1724659so488543eje.8
        for <linux-input@vger.kernel.org>; Wed, 05 May 2021 07:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hwkuwYY/I7ZJjbC7oPD0q65UH/wGFXBUWii911bxvQM=;
        b=d385xZOtI9jn84/gah73wV5TLNIuBa3uYhnMlRoo7rvb/pvxdsXJQt4lvU3TZumE0F
         uE+55JS/cm3Dg9MKPPy1CDB46pBAjm1ZrSW1Q1WBeWNWwoT8rVx8IU4zYhk4H+9ZEWHI
         EgpVXjryC5QP3HxM8XTWa8OUVNdEo3K1NEurDGWsnRa0gEG4O+hQKQQJyAqYF28yaVmB
         XqtGgSrvHoBvhu4y73DMD0EvG4CtLqOw/7E2aN6iRAtd7Nd54gUQdCXFYb4msHnwiTC7
         yrdeekt3GA+5gsBEHwyjCifZ2K1++c8Jx08e6//q2sc6i5P0J74AHjQ9C9nGuNkdGrmp
         9shw==
X-Gm-Message-State: AOAM533KQcGrCjx86iBIcmIF5TfgXCq8GfgfeFUopOlEJFtm/EmEK9+D
        mg2joakFbzUKzunl1da+b5ZvdCiaNPrW9YrM9Bpjtj3voMncx6+fUtzGpdoEgn0FKnZBBU1Y2sX
        vXMvZIRyGlpvLGoOmCcGLtSwdkt9OHvTToGy6oZnler1AJdpdZINeo2gNPaEIH56glRuz/U+TDi
        k=
X-Received: by 2002:a17:906:e206:: with SMTP id gf6mr18539097ejb.434.1620223199062;
        Wed, 05 May 2021 06:59:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIawwRkU2JM6KTZqYDF9mFH+rmujpshu9UEsI17V+v2mY5qXZLNdCLPoQTQm5pCw9MrnAEww==
X-Received: by 2002:a17:906:e206:: with SMTP id gf6mr18539079ejb.434.1620223198828;
        Wed, 05 May 2021 06:59:58 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id v19sm2964575ejy.78.2021.05.05.06.59.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 06:59:58 -0700 (PDT)
Subject: Re: [PATCH 3/3] HID: multitouch: Disable event reporting on suspend
 when our parent is not a wakeup-source
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
References: <20210306133716.453447-1-hdegoede@redhat.com>
 <20210306133716.453447-3-hdegoede@redhat.com>
 <CAO-hwJLdNiKG-+YZVSZ1hPztjgCTYrmeh2qdVvropkeeRxpYAg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2c62d70f-4878-a286-cc78-7f6360378253@redhat.com>
Date:   Wed, 5 May 2021 15:59:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAO-hwJLdNiKG-+YZVSZ1hPztjgCTYrmeh2qdVvropkeeRxpYAg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 5/5/21 3:40 PM, Benjamin Tissoires wrote:
> Hi Hans,
> 
> On Sat, Mar 6, 2021 at 2:37 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Disable event reporting on suspend when our parent is not
>> a wakeup-source. This should help save some extra power in
>> this case.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/hid/Kconfig          |  2 +-
>>  drivers/hid/hid-multitouch.c | 23 ++++++++++++++++++++++-
>>  2 files changed, 23 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
>> index 786b71ef7738..5cbe4adfd816 100644
>> --- a/drivers/hid/Kconfig
>> +++ b/drivers/hid/Kconfig
>> @@ -675,7 +675,7 @@ config HID_MONTEREY
>>
>>  config HID_MULTITOUCH
>>         tristate "HID Multitouch panels"
>> -       depends on HID
>> +       depends on USB_HID
> 
> I tried really hard during the past 8 years to not have a usbhid
> dependency on hid-multitouch.
> 
> The code below should not break the test suite, but still I am not
> that happy about the Kconfig change.
> 
> I don't see an immediate and better way of doing what you are
> achieving here, but maybe you have some magic I did not think about
> that would help to no pull USB_HID with HID_MULTITOUCH.
> 
> FTR, I think the use case of hid-multitouch *without* USB is rather
> non-existent, but there might be some weird systems with I2C only
> (edge computing?).

Interesting how you often manage to pick out the bits of patches
which I'm not 100% happy with myself either. I was thinking the
same thing myself.

We have this: "hid_is_using_ll_driver(hdev, &usb_hid_driver)" check
in various drivers under drivers/hid and so far the dependency fix
of adding a "depends on USB_HID" was not pretty but ok, because it
would be weird to enable those HID drivers on a system without
USB_HID being enabled. But I agree with you that hid-multitouch
is different. So I did try to come up with something better and
failed.

But now that I look at this with fresh eyes I think I see a
nice solution for this.

I propose to add a hid_is_usb_device() helper which is defined
in hid-core.c (1) and this helper would look like this:

bool hid_is_usb_device(struct hid_device *hid)
{
#if IS_ENABLED(CONFIG_USB_HID)
	return hid_is_using_ll_driver(hid, &usb_hid_driver);
#else
	return false;
#endif
}

And then I can use this helper function instead of directly doing
the hid_is_using_ll_driver() check in hid-multitouch.c fixing
this dependency ugliness.

1) hid-core.c is controlled by CONFIG_HID which gets selected at
the Kconfig level by CONFIG_USB_HID so there is no chance of
builtin vs module issues.

As an added bonus I can then also do a follow-up patch-set to
remove more depends on USB_HID stuff by switching to the helper
in other places too.

###

Unrelated but something else which I was wondering about while
working on this patch. 

I think that it might also be useful to change the
mt_parent_may_wake() helper introduced here into a generic
hid_parent_may_wakeup() helper in case we need a similar thing
in other places. I decided it may be best to do that once we
have a second driver needing such a check, but since we're
discussing this anyways, what is your opinion on this ?

Regards,

Hans



>>         help
>>           Generic support for HID multitouch panels.
>>
>> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
>> index cfb68e443ddd..7926295bab81 100644
>> --- a/drivers/hid/hid-multitouch.c
>> +++ b/drivers/hid/hid-multitouch.c
>> @@ -1759,12 +1759,33 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
>>  }
>>
>>  #ifdef CONFIG_PM
>> +
>> +/* Check if the parent which has the power/wakeup* sysfs attributes may wake the hdev */
>> +static bool mt_parent_may_wake(struct hid_device *hdev)
>> +{
>> +       struct device *parent = hdev->dev.parent;
>> +
>> +       /*
>> +        * USB-HID is attached to the usb_interface (our parent), the
>> +        * power/wakeup* attr are part of the usb-device which is its parent.
>> +        */
>> +       if (hid_is_using_ll_driver(hdev, &usb_hid_driver) && parent)
>> +               parent = parent->parent;
>> +
>> +       if (parent)
>> +               return device_may_wakeup(parent);
>> +
>> +       /* Huh? Play it safe and keep reporting events. */
>> +       return true;
>> +}
>> +
>>  static int mt_suspend(struct hid_device *hdev, pm_message_t state)
>>  {
>>         struct mt_device *td = hid_get_drvdata(hdev);
>>
>>         /* High latency is desirable for power savings during S3/S0ix */
>> -       if (td->mtclass.quirks & MT_QUIRK_DISABLE_WAKEUP)
>> +       if ((td->mtclass.quirks & MT_QUIRK_DISABLE_WAKEUP) ||
>> +           !mt_parent_may_wake(hdev))
>>                 mt_set_modes(hdev, HID_LATENCY_HIGH, false, false);
>>         else
>>                 mt_set_modes(hdev, HID_LATENCY_HIGH, true, true);
>> --
>> 2.30.1
>>
> 

