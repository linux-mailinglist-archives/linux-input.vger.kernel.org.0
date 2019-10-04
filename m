Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFB33CB9CC
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2019 14:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729714AbfJDMFB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Oct 2019 08:05:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46268 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729259AbfJDMFA (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 4 Oct 2019 08:05:00 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 5F521C00A167
        for <linux-input@vger.kernel.org>; Fri,  4 Oct 2019 12:05:00 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id y18so491152wrw.8
        for <linux-input@vger.kernel.org>; Fri, 04 Oct 2019 05:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6bggkKxqmMoit9chu7ZQXRtPJSbRjO0Jtild1gVtSGQ=;
        b=Ksj/qZl5UIjTy2pqWMuQbDI4YkrcseTEgqFXdgRKBAErLsgDR9JgfhWReM9ozl8Qpg
         3FodeajgqsrQxar88rYL/Y2XR6xY5xtdeThrZWKkwTYOJwkl4KJ9RWOuWyaR3Rg3ue+7
         SQJ7OB1JKyyNXF2BZfAi1sHLMJjix8XKbRGUcoLL4vyNgedED6gTdovQ28hO/5rfDWGQ
         hyFbaSpXaJZGPjKUyn6RhUttpqyXL19lX3bubcIGFwfiuq3WDDimzTn2/N01OzrWHkmU
         MVY8zQWIJwVy/52phZnbx03gSmkTxLU1Mc+Ny1Xiuvqp0qJVGEOyCcBZe0HbMBE1ddT2
         3kSg==
X-Gm-Message-State: APjAAAUWJC0Iu7cxDOYLagLINjcy6AUWkifeW/5pQL0gPhJmLKySL7Vh
        FCxoxHWxjgY6Pc6LWRBDLOsQpLzFy0Pj4tCvLsWD5OxsGVyNOMoo2oAE1Fy8ijpqLn7pESZd2Zv
        pla4RkWGkmas6u8sCdHFLQKM=
X-Received: by 2002:a1c:f602:: with SMTP id w2mr10296315wmc.145.1570190699115;
        Fri, 04 Oct 2019 05:04:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzjvS6UvM3Q+SHEg3+BABK4ijskuno+7NeL38pG/bUHHIoTfQQ3qvotlnSp3XFmPlVgRem8Ww==
X-Received: by 2002:a1c:f602:: with SMTP id w2mr10296301wmc.145.1570190698928;
        Fri, 04 Oct 2019 05:04:58 -0700 (PDT)
Received: from dhcp-44-196.space.revspace.nl ([2a0e:5700:4:11:6eb:1143:b8be:2b8])
        by smtp.gmail.com with ESMTPSA id g1sm6018969wrv.68.2019.10.04.05.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2019 05:04:58 -0700 (PDT)
Subject: Re: [PATCH] HID: logitech: Add depends on LEDS_CLASS to Logitech
 Kconfig entry
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>
References: <20191004073715.6075-1-hdegoede@redhat.com>
 <CAO-hwJ+kGmQSJZTO=PHKO6kTpwV6GwkbCkCMTtYV4=LabkUTNQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a4342ade-f5c6-f981-3957-8820937f89f2@redhat.com>
Date:   Fri, 4 Oct 2019 14:04:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAO-hwJ+kGmQSJZTO=PHKO6kTpwV6GwkbCkCMTtYV4=LabkUTNQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 10/4/19 1:30 PM, Benjamin Tissoires wrote:
> Hi Hans,
> 
> On Fri, Oct 4, 2019 at 3:37 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Commit 97b741aba918 ("HID: lg-g15: Add keyboard and LCD backlight control")
>> makes the hid-lg15 kernel module, which gets configured through config
>> HID_LOGITECH depends on symbols from the led class. Add a depends on
>> LEDS_CLASS to HID_LOGITECH to avoid undefined reference errors on the
>> led class symbols.
>>
>> Fixes: 97b741aba918 ("HID: lg-g15: Add keyboard and LCD backlight control")
>> Reported-by: kbuild test robot <lkp@intel.com>
>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/hid/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
>> index 1ecb5124421c..494a39e74939 100644
>> --- a/drivers/hid/Kconfig
>> +++ b/drivers/hid/Kconfig
>> @@ -525,6 +525,7 @@ config HID_LENOVO
>>   config HID_LOGITECH
>>          tristate "Logitech devices"
>>          depends on HID
>> +       depends on LEDS_CLASS
> 
> My CI failed with this patch. It seems this creates a loop in the
> dependencies and I can not create the config file. Also, it seems
> weird to have a depends on LEDS_CLASS when you surely wants to enable
> it. How about using SELECT instead?

That is weird, there is a whole bunch of other HID_FOO config
symbols in drivers/hid/Kconfig which also have a depends on LEDS_CLASS,
so if this is a problem then it should be a problem for those other ones
too.

I do see that there are others which use select instead of depends
(yeah consistency) so I guess that changing to select is fine here...

Please let me know how you want to proceed with this.

Regards,

Hans

