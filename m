Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0818F6DE052
	for <lists+linux-input@lfdr.de>; Tue, 11 Apr 2023 18:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbjDKQCS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Apr 2023 12:02:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjDKQBt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Apr 2023 12:01:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9830D5598
        for <linux-input@vger.kernel.org>; Tue, 11 Apr 2023 09:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681228835;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DIz95DWfuWVWieuNpWMo1Cw7FlHwUdZxflZkaM9dGnM=;
        b=XOWehopp0HoAigvRFH5wAzdlcFnIqzSAszH5ybbJntuGyvCIGPL5e8qLirQIDKWdwvjBhB
        QWqTuYmI2U2SCLTCWyzTlm9u4l8n29zOgbEllUIytpUx7tMrmrA4dzhW/ExGuuchThnN41
        BFKPFmDZ0Icbb2+BKAI+vk+KkEQsg+8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-vaAZ85GUOuSb7gsI6T-ehw-1; Tue, 11 Apr 2023 12:00:33 -0400
X-MC-Unique: vaAZ85GUOuSb7gsI6T-ehw-1
Received: by mail-ej1-f71.google.com with SMTP id ue7-20020a170907c68700b009339c9c32ffso2886150ejc.5
        for <linux-input@vger.kernel.org>; Tue, 11 Apr 2023 09:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681228832; x=1683820832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DIz95DWfuWVWieuNpWMo1Cw7FlHwUdZxflZkaM9dGnM=;
        b=I+f6loi5qb55PZZaVaHg1aIqQImWgmgDAe0ydDjy3g/m02E3uq9jSw62ZvpBOIO/Ro
         ZigGDid1X5t2+QA0rV9BZdQnAurMUlUCpO33phzZ3Li987e8XTj5lnd1TX3rEg4etnhp
         SlLXb9m05GkyZzBYJH9iqGSr5nmbDZta3HdldtLTwtFycnuuu3rlVW5lHZ9u+Zl3pfs3
         FoKasJnnnzFhw1apH0MYnP0fFkfFy8CMzwSIU5J1xeReqoCVFwbl7H6tv0i6kKgD6MGU
         9Nhzqyim7VoK2JqKa9OtdRNMbuG1gy4P+Vtha2vvpNiU7c6+xfcljdGlacONDDm4vgXh
         3mag==
X-Gm-Message-State: AAQBX9dKvh3OyC7e+8xDDblftdL4mXNkX7CraTgzAfLq4RsxyZrOfbVH
        0C1FkRE9hpXxiwoswXGSlsDGwlsuR9VtK17Y1JnK1QlTmAyh8TbiS1DDj22fAsyOrTg8kc2z/MX
        A9YwIrkD/7QuDU+KNpvMY7As=
X-Received: by 2002:a17:906:da8e:b0:94a:6953:602d with SMTP id xh14-20020a170906da8e00b0094a6953602dmr7928978ejb.37.1681228832734;
        Tue, 11 Apr 2023 09:00:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350YifCQS3Xdtt9JAr4wUTf8YRLx1nfvZIfthJ4Q/mH743yMkxn784JsKLTHVISuxggmcljCUag==
X-Received: by 2002:a17:906:da8e:b0:94a:6953:602d with SMTP id xh14-20020a170906da8e00b0094a6953602dmr7928956ejb.37.1681228832420;
        Tue, 11 Apr 2023 09:00:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z24-20020a170906271800b0093f822321fesm6254488ejc.137.2023.04.11.09.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 09:00:31 -0700 (PDT)
Message-ID: <eafe8744-49d4-31e3-2329-ddd452358915@redhat.com>
Date:   Tue, 11 Apr 2023 18:00:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/6] HID: i2c-hid-of: Allow using i2c-hid-of on non OF
 platforms + remove specialized drivers
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-input@vger.kernel.org
References: <20230409144243.25360-1-hdegoede@redhat.com>
 <20230411090209.gartwrkq56syerwk@mail.corp.redhat.com>
 <c3e08839-b621-3e57-0d6b-f4cd14c897b9@redhat.com>
 <20230411125036.3ojjdrjzxhasu5du@mail.corp.redhat.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230411125036.3ojjdrjzxhasu5du@mail.corp.redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

On 4/11/23 14:50, Benjamin Tissoires wrote:
> On Apr 11 2023, Hans de Goede wrote:
>> Hi Benjamin,
>>
>> On 4/11/23 11:02, Benjamin Tissoires wrote:
>>> Hi Hans,
>>>
>>> On Apr 09 2023, Hans de Goede wrote:
>>>> Hi All,
>>>>
>>>> This series consist of 2 parts:
>>>>
>>>> 1. Patches 1-3. Allow using i2c-hid-of on non OF platforms to allow I2C-HID
>>>>    devices which are not enumerated by ACPI to work on ACPI platforms
>>>>    (by manual i2c_client instantiation using i2c_client_id matching).
>>>
>>> Patches 1 and 2 are looking good, but I wonder if you can not achieve the
>>> same result by relying on an ACPI SSDT override. I got something similar
>>> working on this thread[0].
>>
>> Yes this could be made to work with an ACPI override. But the goal is
>> to make things work OOTB for end users when they install Linux and
>> ACPI overrides are very far from something which works OOTB.
> 
> Fair enough.
> 
>>
>>> I understand the "post-reset-deassert-delay-ms" might be something hard
>>> to express with an SSDT, but we should already have all the bits in
>>> place, no?
>>
>> Actually if an ACPI override is used then the setting of the GPIO
>> can be done in _PS0 and _PS3 (power on / off) methods and those
>> can simply include a sleep after setting the GPIO.
> 
> Though this is all conditional if we can make ACPI SSDT override
> something that can be shipped while installing the device...
> 
>>
>>> Also, the problem of "post-reset-deassert-delay-ms" is that you are not
>>> documenting it, because the OF folks do not want this in device tree,
>>> and I tend to agree with them. So this basically creates a brand new
>>> undocumented property, which is less than ideal.
>>
>> I'm merely not documenting it because there are no devicetree users yet.
> 
> AFAIU, the non devicetree properties should also be documented through
> DT bindings, no? So not documenting feels very much like "I want to slip
> this one in without having to deal with DT maintainers" (and before you
> take it personaly, I know this is definitively not the intent). So I'd
> rather much having a public API documented, even if there are no users.

Right, so as a hobby I have a tendency to work on these somewhat niche/weird
x86 devices, like x86 tablets which use Android as factory OS :)

As such I have encountered the need for device-properties to pass info
from drivers/platform/x86 code to more generic drivers a number of
times before.

Each time this happens, if I try to add them to bindings I get
asked for some example devicetree code, I then respond that these
are *device*-properties not of-properties and that there are no
current devicetree users after which the DT maintainers tell me
to then NOT document them in the DT bindings, at least not until
actually DT users show up. I fully expect any attempt do add
this to the DT bindings to go the same way.

And now I have you telling me you really want to see this
documented at the same time as it getting implemented. Which
I fully understand, but does leads to a bit of a catch 22.

Anyways lets just go with the alternative of treating this
similar as the existing specialized drivers, see below.

<snip>

>> Note if just the existence of the property is the main stumbling
>> block I can go the match_data route for the wacom digitizer on
>> the Yoga Book 1 too and add an extra i2c_device_id with match-data
>> setting the delay. This could then either be its own specialized
>> driver, or we could still go with the current patch-set
>> (minus the property) and add an i2c_device_id with match-data
>> to i2c-hid-of.c .
> 
> I'd much rather have a i2c-hid-of.c internal API, yes. Whether it's a
> function call, a callback or a match-data (or a driver-data), this is
> something we are in control and we can change.

Ok.

So I see 2 options here:

1. Take the approach from patches 1-4 here, but drop the property and
   use match data on a new "wacom0169" i2c_device_id instead.
   This would also pave the way to merging patches 5 + 6 once tested
   by google to reduce some code duplication. Although you write below
   you would prefer to keep these around as example code for other
   specialized drivers...

2. Add a new specialized i2c-hid-of-wacom driver for this.
   Question: Since this will be using i2c_device_id binding not
   DT/OF binding the -of- in the name is technically incorrect,
   but it would be consistent with the other specialized drivers
   and could be seen as preparation (avoiding a rename/confusion)
   for when any DT enumerated devices which need special handling
   show up (note only relevant if you prefer this approach).

Either way is fine with me really. So you get to chose. If you
let me know which route you prefer, I'll go and prepare either
a v2 of this series, or a whole new patch for the new specialized
driver.

Regards,

Hans


