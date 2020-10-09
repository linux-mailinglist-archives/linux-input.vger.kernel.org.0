Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E197E2889E6
	for <lists+linux-input@lfdr.de>; Fri,  9 Oct 2020 15:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731698AbgJINh3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Oct 2020 09:37:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29625 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726357AbgJINh3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 9 Oct 2020 09:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602250645;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=x1qsye1PzZJmVZ4NeMP08Jte5iTc9p8avnaZ06vt4hA=;
        b=SLRHN8EBfcb4hEUg8w/g53FbJTUwmEyABFE0x1u8KeY6mRaJXrGTcVnciQbV9fSFJh6BWZ
        rDrmSs29UPyv5W7grhk7lCluLS18YlIyBjdPiHs3G/Wg5SqUHqBRYiBRM9qQK9nZ4J5E7g
        VAzMGV5ksbuRQeg9aocfJlWqgVLRr7E=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-g9mvNxC9P36p6vYuZ3F5VA-1; Fri, 09 Oct 2020 09:37:23 -0400
X-MC-Unique: g9mvNxC9P36p6vYuZ3F5VA-1
Received: by mail-ej1-f71.google.com with SMTP id t1so3611628ejb.21
        for <linux-input@vger.kernel.org>; Fri, 09 Oct 2020 06:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x1qsye1PzZJmVZ4NeMP08Jte5iTc9p8avnaZ06vt4hA=;
        b=AXQZc5xc2/wVpGU7NtdDXfNbdJJ1A7iwzYqMzb7Vre0hOtN+uQgKsEO09+2bChYlPZ
         7z9wxVqJmOkEd9eFFXWB0sj0Hq1sv8ND47jMSQcZHbxBigFk14ZBtstUSfPLiSj5IsZm
         UzYJttR/R1RzLX0kkZiHV8Dgvbo3uyCrImN8mci6XAhCXbpc/CPsehJZfqVD+5AW9Op7
         hPYpALoL/gWqnFw/icDna9ecMDEiryLhaKVR13wMDkqdEHETEK6lr1uFbQhbCPlx8p0L
         EGBtE/YgWYc9TSz+4O3Vnf5U0OrLvyc5jTZixP6dXiT+fPcYKvMiiqUxpxn1oNTZF0y2
         FzyA==
X-Gm-Message-State: AOAM531It09hCFnAVJJLERLDBq9LdJpCyJsLs4PqD1Sl7OWOLvnS/1xJ
        +3QnJCRYvUMfpe8QFtwXNQMbGeoCMBjKsENdx0bacUSwbjq6V3upmnOBkxlmT8lc5vKrKBYf3e8
        N1/yIExq9DO6q7QImFuo530s=
X-Received: by 2002:a17:907:1042:: with SMTP id oy2mr13804211ejb.64.1602250642196;
        Fri, 09 Oct 2020 06:37:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjDRASl1SrPHlItgzc579TQKOKrfxm53XFwA9vXZ7WeJVfCVMdKa3NAHVVi+JadU/McrwRPw==
X-Received: by 2002:a17:907:1042:: with SMTP id oy2mr13804186ejb.64.1602250641942;
        Fri, 09 Oct 2020 06:37:21 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id cz11sm6138649edb.62.2020.10.09.06.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2020 06:37:21 -0700 (PDT)
Subject: Re: [PATCH V6 RESEND] HID: ASUS: Add support for ASUS N-Key keyboard
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Mark Gross <mgross@linux.intel.com>
Cc:     Luke D Jones <luke@ljones.dev>, benjamin.tissoires@redhat.com,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
References: <20200923215633.209724-1-luke@ljones.dev>
 <nycvar.YFH.7.76.2010091137510.3336@cbobk.fhfr.pm>
 <20201009131435.GF4077@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <46e870fa-ff64-73ca-9979-32c8a1b5b12a@redhat.com>
Date:   Fri, 9 Oct 2020 15:37:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201009131435.GF4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 10/9/20 3:14 PM, Andy Shevchenko wrote:
> On Fri, Oct 09, 2020 at 11:38:55AM +0200, Jiri Kosina wrote:
>> On Thu, 24 Sep 2020, Luke D Jones wrote:
>>
>>> The ASUS N-Key keyboard uses the productId of 0x1866 and is used in
>>> almost all modern ASUS gaming laptops with slight changes to the
>>> firmware. This patch enables: Fn+key hotkeys, keyboard backlight
>>> brightness control, and notify asus-wmi to toggle "fan-mode".
>>>
>>> The keyboard has many of the same key outputs as the existing G752
>>> keyboard including a few extras, and varies a little between laptop
>>> models. The key-sets have been split and sub-grouped so that there
>>> will not be conflict between key event codes used.
>>>
>>> An existing key event used across some keyboards for "Mic Toggle"
>>> has been changed to emit "F20" as this is what all the main
>>> desktop environments are using.
>>>
>>> Additionally this keyboard requires the LED interface to be
>>> intitialised before such things as keyboard backlight control work.
>>>
>>> Misc changes in scope: update some hardcoded comparisons to use an
>>> available define.
>>>
>>> Signed-off-by: Luke D Jones <luke@ljones.dev>
>>
>> Thanks for the patch. Looks good to me in general, one small nit before
>> this can be merged as a whole ...
>>
>>> ---
>>>   drivers/hid/hid-asus.c                     | 188 ++++++++++++++++++---
>>>   drivers/hid/hid-ids.h                      |   1 +
>>>   include/linux/platform_data/x86/asus-wmi.h |   2 +
>>
>> ... I'd like to get Ack from Andy (CCing) on the addition below to
>> asus-wmi.h.
> 
> There is a new sheriff in town (Hans and Mark).
> My personal opinion it is good to go.
> 
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I'm afraid that a quick review by me has found multiple issues with
this patch. I'm going to take a quick break now, I'll email a
detailed review after that.

Regards,

Hans


> 
>> [ ... snip ... ]
>>> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
>>> index 897b8332a39f..05253cfe786c 100644
>>> --- a/include/linux/platform_data/x86/asus-wmi.h
>>> +++ b/include/linux/platform_data/x86/asus-wmi.h
>>> @@ -27,6 +27,8 @@
>>>   #define ASUS_WMI_METHODID_INIT		0x54494E49 /* INITialize */
>>>   #define ASUS_WMI_METHODID_HKEY		0x59454B48 /* Hot KEY ?? */
>>>
>>> +#define ASUS_WMI_METHODID_NOTIF		0x00100021 /* Notify method ?? */
>>> +
>>>   #define ASUS_WMI_UNSUPPORTED_METHOD	0xFFFFFFFE
>>>
>>>   /* Wireless */
> 

