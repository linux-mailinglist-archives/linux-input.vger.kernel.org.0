Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 764042E95DF
	for <lists+linux-input@lfdr.de>; Mon,  4 Jan 2021 14:26:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727186AbhADNZL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Jan 2021 08:25:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbhADNZL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Jan 2021 08:25:11 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73054C061793;
        Mon,  4 Jan 2021 05:24:30 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id y24so27272064edt.10;
        Mon, 04 Jan 2021 05:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dyYhaMx2QY8RKkbLrgIhsMLEDxIlWzZs2M+ta2Ih0Ms=;
        b=Cj/bHUiJaCb5SbZ3xJHAQlVyTy1iQ27cJLu6Oqjhp8mfES1ElV7POg+kPsKWG2O6MC
         ICWkW2GW7qQTomrLulQieinSHX/XaBYVr50Ir4sybf4GRN1N815O61u8wQjI4dBqU4wE
         nYiRkesbF9rK+QNZuA3r4qAq+4vMb/Uu+kfRE83r16yYLrpbMd9O4KHS+bfr7yCNSHFz
         B9VbXApPxbUrDGm2i0jMVauNH8A+3bTFlkro/GBWW+iOE+7osbz3pqHN7iU5vlD6DSQ/
         eqGHPfaF8b92xP8R5VqEygGkpTEtnIQ18sEBvkpI1nMkRCLmRFjbcLzg/AfiHSG/LHqa
         /zog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dyYhaMx2QY8RKkbLrgIhsMLEDxIlWzZs2M+ta2Ih0Ms=;
        b=VsKg9ABXnQTfDk1zZRiePdTwC8DbHfffw8E/8IISM9izlkAmPaI/ez/fJvUZY0lWUb
         IJ43ebuKTqP87eVkMozdRVKeK4a3WEqNvIYU+wYmJkqDe3artRaN5bfTeoCNU+nArXQf
         cic7OJZbIE1XmThLRMdZRNMoPupSW8xwfutmDilyLLMAyt39RMPv8eGYGY0rlj0huIs9
         Zn/WrKw2wzy+Bj6xiw0CQo7CFSX09NjBlbhvf/wpRVW86qyLpyLdi9oufKoSYb3AGQat
         /fN9DNkzYEzBLalWYO2wKj/QWSH+XKXsPOdackGbv9jYEqiPCUv2IiHEjfOn9w3eSbPG
         b2Bg==
X-Gm-Message-State: AOAM531/ivKCPBOM4OSFrbKLVTDB3atZT13wfn65anPyadbo2b4yA6Id
        7GEw2N2karyhJ5HAVkghfBU=
X-Google-Smtp-Source: ABdhPJxa9kOE89xiXcrp4wqBMjzz7JMpXtw+IklI80yRwM5+Mdov/YzLvg0/9yr0qfJ9UpG5GKMVCw==
X-Received: by 2002:a05:6402:1696:: with SMTP id a22mr71636184edv.385.1609766669232;
        Mon, 04 Jan 2021 05:24:29 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.googlemail.com with ESMTPSA id j9sm43386827eds.66.2021.01.04.05.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jan 2021 05:24:28 -0800 (PST)
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add swap-x-y quirk for
 Goodix touchscreen on Estar Beauty HD tablet
To:     Bastien Nocera <hadess@hadess.net>,
        Mark Gross <mgross@linux.intel.com>
Cc:     linux-input@vger.kernel.org, Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <20201224135158.10976-1-hdegoede@redhat.com>
 <99d3da8d-3319-3904-25d1-a9ff34be653f@redhat.com>
 <c7b47af9cc3bd1d38b6c3582f6e63d7876365ee9.camel@hadess.net>
From:   Hans de Goede <j.w.r.degoede@gmail.com>
Message-ID: <2ce7980e-e90f-f778-d349-44e35b3baf1d@gmail.com>
Date:   Mon, 4 Jan 2021 14:24:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <c7b47af9cc3bd1d38b6c3582f6e63d7876365ee9.camel@hadess.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 1/4/21 1:04 PM, Bastien Nocera wrote:
> On Mon, 2021-01-04 at 13:00 +0100, Hans de Goede wrote:
>> <
>> <snip>
>> Thank you for your patch, I've applied this patch to my review-hans 
>> branch:
>>  
>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>>
>> Note it will show up in my review-hans branch once I've pushed my
>> local branch there, which might take a while.
> 
> Do you plan on sending a patch to migrate the other quirks in goodix.c
> itself to touchscreen_dmi.c?

Ideally yes, but the code in touchscreen_dmi.c matches on the ACPI device-name
the device to know which i2c-device to attach the properties to and that
is based on the ACPI HID.

This is likely "GDIX1001" in most cases, but according to the git log the
"Teclast X98 Pro"
"Cube I15-TC"
"Teclast X89"

Quirks have been added after the "GDIX1002" HID was added, so in theory
they could be using that.

And also some DSTD-s have multiple GDIX1001 nodes with only 1 being
enabled (returning non 0 from _STA) in which case the device-name could
be e.g. "GDIX1001:01" instead of "GDIX1001:00".

So I've just checked if I can find dmesg output or an acpidump for all devices
with a quirk to ensure that I get the device-name right. I can confirm that the
ACPI device-name for the touchscreen is "GDIX1001:00" on the:

  "Teclast X98 Pro"
  "WinBook TW100"
  "WinBook TW700"

I could be either "GDIX1001:00" or "GDIX1001:01" on the "Teclast X89", but
I have that one myself, so I can check that myself.

That just leaves the "Cube I15-TC", for which I cannot find an acpidump
or dmesg output. I will mail the author of the patch adding the quirk for
that one with a patch moving the quirk asking him to test the patch
(and fix it if necessary).

###

Dmitry, once I have a patch ready to move the goodix rotated_screen
and inverted_x_screen DMI quirk tables to platform/drivers/x86/touchscreen_dmi.c
where all other (x86) touchscreen quirks have been gathered so far, the question
becomes how to merge that patch ?

I see 2 options:

1. Have 2 separate patches, one adding the quirks to
platform/drivers/x86/touchscreen_dmi.c and a second patch removing the
DMI tables (and the code handling them) from goodix.c. And then merge
them through the pdx86 resp. the input tree.

2. Have 1 big patch doing both.

The downside of 1. is that there might be a point in git history where
the coordinates of the touchscreens regress. Depending on which pull-req
lands first (if the pdx86 pull-req for 5.12-rc1 gets merged first there
is no issue). But only when git-bisecting so I think that 1. is best to
avoid any merge issues. At least platform/drivers/x86/touchscreen_dmi.c
sees a lot of activity every cycle. So another option would be to 
do 1 big patch and then merge that through the pdx86 tree (I can provide
an immutable branch for that).

Dmitry if you can let me know which way you would prefer to move forward
with this then I can prepare the 1 or 2 patches (once I hear back from the
"Cube I15-TC" quirk patch author).

Regards,

Hans
