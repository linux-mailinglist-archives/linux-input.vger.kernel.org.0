Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0CEC2AEF39
	for <lists+linux-input@lfdr.de>; Wed, 11 Nov 2020 12:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbgKKLKU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Nov 2020 06:10:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58810 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726166AbgKKLKQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Nov 2020 06:10:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605093014;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nB/8PtxCFjq/6L3Buun52o3IdFGex7Y7MyTLoEB5RKc=;
        b=JxoNvVT5sLcoUFP01VTlz3zjAOXT6ybfNt6YryMtMCA1kPrrKLjIPRUtdU0PDDYue9RGE8
        VD8rXty2uk8YeGeKH34Uw7R56kHGeAxfM8RQf5OrpcyPW3Y8l1N7EJ09xv5e3tr+cXrq5R
        fGiNDgQnW3lzz5H4jEmVTHCD1ur7G7c=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-pIkQVldvNqayZ1Z8gfBP_w-1; Wed, 11 Nov 2020 06:10:13 -0500
X-MC-Unique: pIkQVldvNqayZ1Z8gfBP_w-1
Received: by mail-ej1-f71.google.com with SMTP id f21so576317ejf.11
        for <linux-input@vger.kernel.org>; Wed, 11 Nov 2020 03:10:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nB/8PtxCFjq/6L3Buun52o3IdFGex7Y7MyTLoEB5RKc=;
        b=aXAu3vgCC8iOBE7v8+ekqj9zDhHJvRVnFGvnC6oa6RNbH9yko1iK+YS4Iux3TOsjdf
         7lfyqNVgpDQUmxSj/bdgRoyYzGHCwkKsZVXVelKJkqjFTgDKXv0VNAquzwbX8ZhAjF4V
         ZL+pwffCoQ7JGIiY5yhcem4p13PwO6CrN+q0wsMkWcnScPlL0ncmKYpdzwXx958IiB8Q
         n519Sj6pv3t8GCqibkUMCWTKM5YADIZtsFx0glpqtNjhHFdrmtMFdiIdoPZfjsJB9jBV
         AUGupXYtqDTDJ8/Om4CxGuvnRsCHuWIr7WH9zBE/6xoPKfSUGbz3mqdkM0CNfl3F/1XA
         RJbg==
X-Gm-Message-State: AOAM5317aJr4wYgJGNoW8nAhn3r1GMk2SDLTKC5nMGe6KBxPpKWmnVWz
        MwvXQ4F/9R59R8FZbDoMYDSlO49u6HM0GNNROX5YuLwEsQbDnAf7m1j57AmabH7PgePIUDRjLhZ
        bwcyH8TaWmD309dlSmFP0fhU=
X-Received: by 2002:a17:906:c18c:: with SMTP id g12mr24338183ejz.334.1605093011757;
        Wed, 11 Nov 2020 03:10:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBdq5GZK41HrhsHP4TdbrW/eQUWPlUxyNamO2Sw75ZgKxmUhBCLFdiLJa4T5gVT6eTucPACg==
X-Received: by 2002:a17:906:c18c:: with SMTP id g12mr24338138ejz.334.1605093011368;
        Wed, 11 Nov 2020 03:10:11 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id d23sm744805edy.57.2020.11.11.03.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2020 03:10:10 -0800 (PST)
Subject: Re: [PATCH v5 1/4] HID: i2c-hid: Reorganize so ACPI and OF are
 separate modules
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Doug Anderson <dianders@chromium.org>
Cc:     Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andrea Borgia <andrea@borgia.bo.it>,
        Jiri Kosina <jikos@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Pavel Balan <admin@kryma.net>,
        Xiaofei Tan <tanxiaofei@huawei.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        LKML <linux-kernel@vger.kernel.org>
References: <20201109213636.1267536-1-dianders@chromium.org>
 <20201109133526.v5.1.Ied4ce10d229cd7c69abf13a0361ba0b8d82eb9c4@changeid>
 <d51318d1-5d26-f840-2651-42a1134d407b@redhat.com>
 <CAD=FV=WL7C_OPOQqJY_9nDP4Riz6c4XMHXBBj7FkzMJPBVo9Nw@mail.gmail.com>
 <20201111000458.GW1003057@dtor-ws>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <52296c00-07ae-29ad-6e93-0e80430da3e9@redhat.com>
Date:   Wed, 11 Nov 2020 12:10:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201111000458.GW1003057@dtor-ws>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 11/11/20 1:04 AM, Dmitry Torokhov wrote:
> On Tue, Nov 10, 2020 at 02:17:27PM -0800, Doug Anderson wrote:
>> Hi,
>>
>> On Tue, Nov 10, 2020 at 1:01 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>> Hi,
>>>
>>> On 11/9/20 10:36 PM, Douglas Anderson wrote:
>>>> This patch rejiggers the i2c-hid code so that the OF (Open Firmware
>>>> aka Device Tree) and ACPI support is separated out a bit.  The OF and
>>>> ACPI drivers are now separate modules that wrap the core module.
>>>>
>>>> Essentially, what we're doing here:
>>>> * Make "power up" and "power down" a function that can be (optionally)
>>>>   implemented by a given user of the i2c-hid core.
>>>> * The OF and ACPI modules are drivers on their own, so they implement
>>>>   probe / remove / suspend / resume / shutdown.  The core code
>>>>   provides implementations that OF and ACPI can call into.
>>>>
>>>> We'll organize this so that we now have 3 modules: the old i2c-hid
>>>> module becomes the "core" module and two new modules will depend on
>>>> it, handling probing the specific device.
>>>>
>>>> As part of this work, we'll remove the i2c-hid "platform data"
>>>> concept since it's not needed.
>>>>
>>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>>> ---
>>>>
>>>> Changes in v5:
>>>> - Add shutdown_tail op and use it in ACPI.
>>>> - i2chid_subclass_data => i2chid_ops.
>>>> - power_up_device => power_up (same with power_down).
>>>> - subclass => ops.
>>>>
>>>
>>> Thanks this looks good to now, 2 small remarks below (since you are
>>> going to do a v6 anyways). Feel free to ignore these remarks if
>>> you prefer to keep things as is.
>>>
>>> And feel free to add my reviewed-by to v6 of this patch:
>>>
>>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> Thanks!
>>
>>
>>>> +static const struct i2c_device_id i2c_hid_acpi_id_table[] = {
>>>> +     { "hid", 0 },
>>>> +     { "hid-over-i2c", 0 },
>>>> +     { },
>>>> +};
>>>> +MODULE_DEVICE_TABLE(i2c, i2c_hid_acpi_id_table);
>>>
>>> Hmm, I do not think these old-style i2c-ids are necessarry at
>>> all in this driver. I expect all use-cases to use either
>>> of or acpi matches.
>>>
>>> This was already present in the code before though, so
>>> please ignore this remark. This is just something which
>>> I noticed and thought was worth while pointing out as
>>> a future cleanup.
>>
>> Yeah, I wasn't sure if there was anyone using them.
>>
>> Hrm.  Thinking about it, though, is it really OK for two drivers to
>> both have the same table listed?  I'm not sure how that would work.
>> Do you know?
>>
>> I don't know a ton about ACPI, but for device tree I know i2c has a
>> fallback mode.  Specifically having this table means that we'll match
>> compatible strings such as:
>>
>>   "zipzapzing,hid"
>>   "kapowzers,hid-over-i2c"
>>
>> In other words it'll ignore the vendor part and just match on the
>> second half.  Just to make sure I wasn't remembering that from a dream
>> I tried it and it worked.  I don't see any mainline device trees that
>> look like that, though.  I could delete it, though it doesn't really
>> take up much space and it seems nice to keep it working in case anyone
>> was relying on it?
>>
>> For ACPI is there a similar fallback?  If not then it seems like it'd
>> be easy to remove it from there...
> 
> Just a random thought - will all this still be working with ACPI PRP0001
> and DT-style compatible string and properties in _DSD?

That should keep working. Unless someone mixes a DT-style compatible string
with the PNP0C50 ACPI HID specific DSM for getting the hid_descriptor_address
(instead of a DT style property). But that would be a really weird mix to
use and obviously would go against both the PNP0C50 and the PRP0001 specs.

Regards,

Hans



