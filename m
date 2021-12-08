Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6E0246D925
	for <lists+linux-input@lfdr.de>; Wed,  8 Dec 2021 18:02:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237490AbhLHRGK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Dec 2021 12:06:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21880 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237475AbhLHRGJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 8 Dec 2021 12:06:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638982956;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9lVwmqtKRie2Iep4VqFyYKx2/FXXLfsLDgXUVPbyLlo=;
        b=MSM5ZeJ8tgnUqgZ8N/cRDrsNNgWq8x6nCqOz4cWqI1rfu5UAiaZF/5Kx/6JwSAEJFrKQyN
        CLrYoW5CcWA4Z3tDfFBQiqlGefaMX0UaUoXYSJGDRTglLubKypk6lWX8oF8w8oNlBNmc6s
        HiQe6GSMuj/vAr+z48W8J7RSl67NuH0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-uoe24duzML2N9R2xLzaD4A-1; Wed, 08 Dec 2021 12:02:35 -0500
X-MC-Unique: uoe24duzML2N9R2xLzaD4A-1
Received: by mail-ed1-f69.google.com with SMTP id v22-20020a50a456000000b003e7cbfe3dfeso2662096edb.11
        for <linux-input@vger.kernel.org>; Wed, 08 Dec 2021 09:02:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9lVwmqtKRie2Iep4VqFyYKx2/FXXLfsLDgXUVPbyLlo=;
        b=u/rKnBcqk/BwudhdJMrYIa/CBwzZem/kiY+saf8JDAi4/KZkt0+rdARLSu5ypAbrNX
         TkWag8BmsdHUIzBuKvDaZR4G9Lkmj3VfIZabHHINQJPGYlHVcd+zI5iYRnMe9Eo/WEAx
         L1shDaB4RmWA4ZI3BidN9NqZpFpYViY0fP3x+YV4INtu8vi3qGKxdeXRzz25Mq78eUWX
         5xLfhtP89IsRx1DEhBxKnAa4nKyDRj1sjT0mM7qUDxgxI8IoViET/Ss05lPJ8l3JcWp1
         EL5ObOJYOS1Zl2b3jqrP8jjEVnBWwsd20q77QUs4Z9DqAAO0+mFCGyY3TvcfwvYassu3
         Vjtg==
X-Gm-Message-State: AOAM530R+nc0z8bE5bNnRlvkgHSnVsEPF/HmvcBj32G018idRbr2nYRu
        myE7rFmsRARIDyM5fty3hx4vLbVZLjN4voOkLL2yi0z4EmNPfUWnZ+ayEKC2a5vDBfo2L36tSyV
        1OSafs/KoqYwSy+lKn5XJAFk=
X-Received: by 2002:a17:906:489b:: with SMTP id v27mr8635444ejq.567.1638982954067;
        Wed, 08 Dec 2021 09:02:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPQPvMLVF9KROx2+cHR5ueViilv2D7VjA3s50pScw3QQ6pT6I3kYM/HVib8pncEP+RzY7PIg==
X-Received: by 2002:a17:906:489b:: with SMTP id v27mr8635345ejq.567.1638982953357;
        Wed, 08 Dec 2021 09:02:33 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id r11sm2404642edd.70.2021.12.08.09.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Dec 2021 09:02:32 -0800 (PST)
Message-ID: <5d5b1910-8231-f1be-40e2-1964ab825fc5@redhat.com>
Date:   Wed, 8 Dec 2021 18:02:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 4/4] Input: goodix - Add pen support
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bastien Nocera <hadess@hadess.net>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
References: <20211206164747.197309-1-hdegoede@redhat.com>
 <20211206164747.197309-5-hdegoede@redhat.com> <Ya+e5+TLgyLeTnhp@google.com>
 <aa558a20-37d0-dbf0-740f-2813609fe3b5@redhat.com>
 <CAKdAkRTHa1oRJ1VpoFxfsKjUW7KStCXkYZ2AdB1jVCHa=pjZAA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAKdAkRTHa1oRJ1VpoFxfsKjUW7KStCXkYZ2AdB1jVCHa=pjZAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On 12/8/21 09:51, Dmitry Torokhov wrote:
> On Wed, Dec 8, 2021 at 12:37 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Dmitry,
>>
>> Thank you for the review.
>>
>> On 12/7/21 18:50, Dmitry Torokhov wrote:
>>> On Mon, Dec 06, 2021 at 05:47:47PM +0100, Hans de Goede wrote:
>>>> Some Goodix touchscreens have support for a (Goodix) active pen, add
>>>> support for this. The info on how to detect when a pen is down and to
>>>> detect when the stylus buttons are pressed was lifted from the out
>>>> of tree Goodix driver with pen support written by Adya:
>>>> https://gitlab.com/AdyaAdya/goodix-touchscreen-linux-driver/
>>>>
>>>> Since there is no way to tell if pen support is present, the registering
>>>> of the pen input_dev is delayed till the first pen event is detected.
>>>>
>>>> This has been tested on a Trekstor Surftab duo W1, a Chuwi Hi13 and
>>>> a Cyberbook T116 tablet.
>>>>
>>>> Link: https://gitlab.com/AdyaAdya/goodix-touchscreen-linux-driver/
>>>> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=202161
>>>> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=204513
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>>  drivers/input/touchscreen/goodix.c | 122 ++++++++++++++++++++++++++++-
>>>>  drivers/input/touchscreen/goodix.h |   1 +
>>>>  2 files changed, 121 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
>>>> index 2d38a941e7e4..691e4505cf4a 100644
>>>> --- a/drivers/input/touchscreen/goodix.c
>>>> +++ b/drivers/input/touchscreen/goodix.c
>>>> @@ -298,6 +298,107 @@ static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
>>>>      return -ENOMSG;
>>>>  }
>>>>
>>>> +static struct input_dev *goodix_create_pen_input(struct goodix_ts_data *ts)
>>>> +{
>>>> +    struct device *dev = &ts->client->dev;
>>>> +    struct input_dev *input;
>>>> +
>>>> +    input = devm_input_allocate_device(dev);
>>>> +    if (!input)
>>>> +            return NULL;
>>>> +
>>>> +    input_alloc_absinfo(input);
>>>> +    if (!input->absinfo) {
>>>> +            input_free_device(input);
>>>> +            return NULL;
>>>> +    }
>>>
>>> Please drop this as input_abs_set_max() will do allocation and
>>> input_register_device() will reject device with ABS_* events without
>>> absinfo allocated.
>>>
>>>> +
>>>> +    input->absinfo[ABS_X] = ts->input_dev->absinfo[ABS_MT_POSITION_X];
>>>
>>>       input_abs_set_max(input, ABS_X,
>>>               input_abs_get_max(input, ABS_MT_POSITION_X);
>>>
>>> or even maybe
>>>
>>>       input_set_abs_params(input, ABS_X,
>>>               0, input_abs_get_max(input, ABS_MT_POSITION_X), 0, 0);
>>
>> The reason why I'm just copying the entire absinfo struct
>> (and thus need the NULL check above) is because this driver uses
>> touchscreen_parse_properties(), so the min and fuzz values
>> might (theoretically) also be set through device-properties and
>> I wanted to cover that.
>>
>> Since you don't like the above approach, I will go with the following
>> for the next version:
>>
>>         input_set_abs_params(input, ABS_X,
>>                              input_abs_get_min(ts->input_dev, ABS_MT_POSITION_X),
>>                              input_abs_get_max(ts->input_dev, ABS_MT_POSITION_X),
>>                              input_abs_get_fuzz(ts->input_dev, ABS_MT_POSITION_X),
>>                              input_abs_get_flat(ts->input_dev, ABS_MT_POSITION_X));
>>
>> (and the same for the Y axis).
> 
> Ah, sorry, I misread the code. It is fine as is then, or we could even
> consider adding input_copy_abs(input, axis, src) that would allocate
> absinfo if needed, set capability, and do the copy.

Oh, I think that adding an input_copy_abs() helper for this is actually
a good idea. I'll do that for the next version (in a separate patch of course).

Regards,

Hans

