Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E16813B3356
	for <lists+linux-input@lfdr.de>; Thu, 24 Jun 2021 17:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231761AbhFXQBp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Jun 2021 12:01:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50688 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232477AbhFXQBo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Jun 2021 12:01:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624550364;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Oirb5aqEE/FIh9229Zdnjuw30cGe9kA4LxvC7z5oeI0=;
        b=Nk95XZDh/2tbwJJeAkaTaRUqAsGthHSCmNYUxwDac3zBl0EOgTcRW6TiHhJX9mJO/t65Na
        1e6T8XboXXXPjyq0NqYxaeT0i1hdIZd2KzXgdNyYGeW45Seg+IEfr8Vuw8rK8/mQSef7/J
        Q3ZVqxDJZz6vci7Mf3jOe1zuVkv8wkI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-VBkZlY4_OIeYuFFiyZMI_Q-1; Thu, 24 Jun 2021 11:59:23 -0400
X-MC-Unique: VBkZlY4_OIeYuFFiyZMI_Q-1
Received: by mail-ed1-f69.google.com with SMTP id dy23-20020a05640231f7b0290394996f1452so3599363edb.18
        for <linux-input@vger.kernel.org>; Thu, 24 Jun 2021 08:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Oirb5aqEE/FIh9229Zdnjuw30cGe9kA4LxvC7z5oeI0=;
        b=jCq3Etg5SRhsbu4RdKBa+7oou/I1+el6jLeaGNe1QiJS0G/Qfjfqd7q6csqBz871wt
         j14yNvotQMCQYb5gDZBurPRiDmSlODdEjgTq6l7QeviEbigpulgpPoGZmGmZi+18BSfX
         VQGF2KraB0ym7Sbcg0pHd2NR+RgW6OvbmwvVH7o6J6KbwltJP21I4pYzTk4fsSdjZpM8
         0mdcl53RCS/svcpS2u1RT30ZZkl0tfsl/dJFk70GRhNGGDzpfCMAxs2tnVA8bPtmWL2s
         SORgBoe2r7g5kobQ2kNVUGoMM4f8KmgVDY5X1Xc6ajH45OgMdC7Obmt0eo0L28IjJG9r
         3gpQ==
X-Gm-Message-State: AOAM532dv+nnfzAhVfQgzHpzQwWZiw22QuwgjXpZYx8tdZfAC4xefUnX
        r+Y7OCAM2yY9csRxhp+I4gsCf42GNETZr8KXXafP3mqysOucJJ7pxMgQJtwSg2SzAvG/W5qhme0
        qKzc31zaodLdWCYFKN5r5wg5QA8EW1U6fBQDxwi8RCdHGX6wjKX/0JSXjRzRTg24kd6lnIKypob
        0=
X-Received: by 2002:a17:906:bfc9:: with SMTP id us9mr5871400ejb.493.1624550362037;
        Thu, 24 Jun 2021 08:59:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwi/wquDtoCf1Y3hWYbv2tCwspY9KDEWR6vtO2+yvAm1Tb55LMEy/e9MiBuO4qT1Z+8C5yiOA==
X-Received: by 2002:a17:906:bfc9:: with SMTP id us9mr5871380ejb.493.1624550361797;
        Thu, 24 Jun 2021 08:59:21 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ee47sm2214062edb.51.2021.06.24.08.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 08:59:21 -0700 (PDT)
Subject: Re: [PATCH 1/4] HID: core: Add hid_hw_may_wakeup() function
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org
References: <20210529151424.12212-1-hdegoede@redhat.com>
 <20210529151424.12212-2-hdegoede@redhat.com>
 <1837eed3-8f99-d9be-0d35-d4b21c0e6f4e@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e578896a-52a5-63e2-cf59-fd18d6d0da8f@redhat.com>
Date:   Thu, 24 Jun 2021 17:59:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1837eed3-8f99-d9be-0d35-d4b21c0e6f4e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 6/24/21 2:16 PM, Benjamin Tissoires wrote:
> Hi Hans,
> 
> On 5/29/21 5:14 PM, Hans de Goede wrote:
>> Add a hid_hw_may_wakeup() function, which is the equivalent of
>> hid_hw_may_wakeup() for hid devices.
> 
> nitpick here, but I think the second `hid_hw_may_wakeup()` is probably wrong.

Right, the second `hid_hw_may_wakeup()` here should be
`device_may_wakeup()`. Jiri can you fix this up while applying
or do you want a new version ?

>> In most cases this just returns device_may_wakeup(hdev->dev.parent),
>> but for some ll-drivers this is not correct. E.g. usb_hid_driver
>> instantiated hid devices have their parent set to the usb-interface
>> to which the usb_hid_driver is bound, but the power/wakeup* sysfs
>> attributes are part of the usb-device, which is the usb-interface's
>> parent.
> 
> I never spent enough time in suspend/resume. But isn't the big consumer of wakeup sources be USB? Is there a point having a generic return path when returning false earlier will keep the same code path for all other transport layers (I2C and bluetooth)?

I can see why you primarily associate wakeup-sources with USB, but
pretty much any device can be a wakeup-source, e.g. embedded-controllers
typically are wakeup sources, network-cards can be wakeup-sources, etc.

One relevant HID example would be an I2C-HID attached keyboard which is
configured to wake the system from suspend on a keypress.

At least the Toshiba Click Mini L9W-B is using an I2C-HID keyboard and
I'm sure there are others.

So it seems best here to not make any assumptions and in cases where
the device which is expected to have the power/wakeup* sysfs attributes
is simply the direct parent of the hid-device call device_may_wakeup()
on hdev->dev.parent. Note that in many cases this will indeed simply
return false, which is fine. But in e.g. the i2c-hid attached keyboard
it might return true.

Regards,

Hans



> Other than those two questions, I like the series and the approach to not break the existing:
> 
> For the series:
> Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> 
> Cheers,
> Benjamin
> 
>>
>> For these special cases a new may_wakeup callback is added to
>> hid_ll_driver, so that ll-drivers can override the default behavior.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   include/linux/hid.h | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/include/linux/hid.h b/include/linux/hid.h
>> index 271021e20a3f..4d2b2212f079 100644
>> --- a/include/linux/hid.h
>> +++ b/include/linux/hid.h
>> @@ -800,6 +800,7 @@ struct hid_driver {
>>    * @raw_request: send raw report request to device (e.g. feature report)
>>    * @output_report: send output report to device
>>    * @idle: send idle request to device
>> + * @may_wakeup: return if device may act as a wakeup source during system-suspend
>>    */
>>   struct hid_ll_driver {
>>       int (*start)(struct hid_device *hdev);
>> @@ -824,6 +825,7 @@ struct hid_ll_driver {
>>       int (*output_report) (struct hid_device *hdev, __u8 *buf, size_t len);
>>         int (*idle)(struct hid_device *hdev, int report, int idle, int reqtype);
>> +    bool (*may_wakeup)(struct hid_device *hdev);
>>   };
>>     extern struct hid_ll_driver i2c_hid_ll_driver;
>> @@ -1149,6 +1151,22 @@ static inline int hid_hw_idle(struct hid_device *hdev, int report, int idle,
>>       return 0;
>>   }
>>   +/**
>> + * hid_may_wakeup - return if the hid device may act as a wakeup source during system-suspend
>> + *
>> + * @hdev: hid device
>> + */
>> +static inline bool hid_hw_may_wakeup(struct hid_device *hdev)
>> +{
>> +    if (hdev->ll_driver->may_wakeup)
>> +        return hdev->ll_driver->may_wakeup(hdev);
>> +
>> +    if (hdev->dev.parent)
>> +        return device_may_wakeup(hdev->dev.parent);
>> +
>> +    return false;
>> +}
>> +
>>   /**
>>    * hid_hw_wait - wait for buffered io to complete
>>    *
>>
> 

