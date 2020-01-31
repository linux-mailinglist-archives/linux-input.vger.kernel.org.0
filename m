Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF1E14EE2E
	for <lists+linux-input@lfdr.de>; Fri, 31 Jan 2020 15:07:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728827AbgAaOHB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 31 Jan 2020 09:07:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35518 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728804AbgAaOHB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 31 Jan 2020 09:07:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580479619;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BOtRx/+NP5bPyI5lxHsciSb3K/NYAM0JQEMQrR+g3fg=;
        b=B149Soo+J7dsr8Ki9tQ5B8Fjvr82DLF6zlDdoOZ+SiN0madnslZ5e4WmCJCyzqRNiQi2Xj
        EKuXL+ZXQw8eRWayo6+mDFpJVHHaAUnQ37bc50rmi+sUnHcANMXUVu88hqwN9cJS6kAfdc
        w71ULdbmxXqWQBEL2+BxmGI6ZxtM5Tk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-BrDjsc2yM9K4KBXr-wJZHg-1; Fri, 31 Jan 2020 09:06:58 -0500
X-MC-Unique: BrDjsc2yM9K4KBXr-wJZHg-1
Received: by mail-wr1-f69.google.com with SMTP id h30so3403488wrh.5
        for <linux-input@vger.kernel.org>; Fri, 31 Jan 2020 06:06:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BOtRx/+NP5bPyI5lxHsciSb3K/NYAM0JQEMQrR+g3fg=;
        b=D1ZBJ6y8PRA7VvIq42booPOJiX6EUja0pME7Z1TJSweuq5LEyixWm85U8stCLSMQ97
         4iaYZI08DG7Z4ajyRzsz2PjWHaXd354KOOuZrz6elIGmehBRwrJbtqueoP6x7e0AwMmF
         HCn57z2sBZOTMzoSCRF4vEJqvNpyXjcD/7vCDDYSnq5S65fE2OVFaqrvpBUOZQ6gTZ5d
         5o+o7VuCPt9iC+XaTZv2cF3csdpD4EZ16V83lgfNUtAvdoULT7Ge0G/jZr7ScM7HWkwg
         /9qGCLAbAb0Rdb1tKr2/ZLkNs1oNhJ8gx5K5aB3DBXkqQtlZIBzIIS70QQNq4ZxCbv6Q
         Fi6Q==
X-Gm-Message-State: APjAAAV8EzYnZTEBRWQ85ODan6jluC+8K4W0muuo7oAGcwdRzXrvxkA2
        CtjwG3Hp41JGibMctG1O1HHgm3lKo2pRcB74mDWc27lyRL40flw1tSr5vRYideSJ35bQARaEje/
        TnL6SlmLBxKMgaNEFcMe3zCc=
X-Received: by 2002:adf:fd91:: with SMTP id d17mr13221622wrr.340.1580479616642;
        Fri, 31 Jan 2020 06:06:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqwFYEqaLoMFMaFPWNlaWV7R+sHLlHQ1YP9IeI58c0PtZiEzbqHIaVYT6G969BPskMb0I9Ucmw==
X-Received: by 2002:adf:fd91:: with SMTP id d17mr13221603wrr.340.1580479616388;
        Fri, 31 Jan 2020 06:06:56 -0800 (PST)
Received: from localhost.localdomain ([62.72.193.75])
        by smtp.gmail.com with ESMTPSA id i2sm11242880wmb.28.2020.01.31.06.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2020 06:06:55 -0800 (PST)
Subject: Re: [PATCH] HID: generic: Check other drivers match callback from
 __check_hid_generic
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
References: <20200131124615.27849-1-hdegoede@redhat.com>
 <CAO-hwJL_5JKGjoKFyybfpA=89eK4C3nJtZMb5_8oxnzf9EJGaQ@mail.gmail.com>
 <d90a5b8f-08fa-b358-900c-b579f64e8782@redhat.com>
 <CAO-hwJLW=40M0SvehBxYS=M-w2CAB8Ypco3bphQnqGnbk5F-wQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f75a44af-6192-26a1-f0b3-8beead36dda4@redhat.com>
Date:   Fri, 31 Jan 2020 15:06:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAO-hwJLW=40M0SvehBxYS=M-w2CAB8Ypco3bphQnqGnbk5F-wQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

HI,

On 1/31/20 3:00 PM, Benjamin Tissoires wrote:
> On Fri, Jan 31, 2020 at 2:49 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 1/31/20 2:39 PM, Benjamin Tissoires wrote:
>>> Hi Hans,
>>>
>>> On Fri, Jan 31, 2020 at 1:46 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> __check_hid_generic is used to check if there is a driver, other then
>>>> the hid-generic driver, which wants to handle the hid-device, in which
>>>> case hid_generic_match() will return false so that the other driver can
>>>> bind.
>>>>
>>>> But what if the other driver also has a match callback and that indicates
>>>> it does not want to handle the device? Then hid-generic should bind to it
>>>> and thus hid_generic_match() should NOT return false in that case.
>>>>
>>>> This commit makes __check_hid_generic check if a matching driver has
>>>> a match callback and if it does makes its check this, so that
>>>> hid-generic will bind to devices which have a matching other driver,
>>>> but that other driver's match callback rejects the device.
>>>
>>> I get that part, but I am not sure I'll remember this in 2 months time
>>> when/if we need to extend the .match() in another driver.
>>> I am especially worried about the potential circular calls where an
>>> other driver decides to check on all the other drivers having a match
>>> callback...
>>>
>>> Could you add a little blurb either in hid-generic.c explaining the
>>> logic, or (and) in hid.h where .match is defined?
>>>
>>> Because now, we have 2 callers for .match(): hid-core and hid-generic
>>> (and 2 is usually one too many :-/).
>>
>> Ok, how about the following:
>>
>> static int __check_hid_generic(struct device_driver *drv, void *data)
>> {
>>          struct hid_driver *hdrv = to_hid_driver(drv);
>>          struct hid_device *hdev = data;
>>
>>          if (hdrv == &hid_generic)
>>                  return 0;
>>
>>          if (!hid_match_device(hdev, hdrv))
>>                  return 0;
>>
>>          /*
>>           * The purpose of looping over all drivers to see if one is a match
>>           * for the hdev, is for hid-generic to NOT bind to any devices which
>>           * have another, specialized, driver registerd. But in some cases that
>>           * specialized driver might have a match callback itself, e.g. because
>>           * it only wants to bind to a single USB interface of a device with
>>           * multiple HID interfaces.
>>           * So if another driver defines a match callback and that match
>>           * callback returns false then hid-generic should still bind to the
>>           * device and we should thus keep looping over the registered drivers.
>>           */
>>          if (!hdrv->match)
>>                  return 1;
>>
>>          return hdrv->match(hdev, false);
>> }
>>
>> ?
>>
>> Let me know if you like this then I'll send a v2 with this.
> 
> Yep, sounds good.
> 
> Could you also add a blurb in the docs of struct hid_driver in
> include/linux/hid.h?
> 
> Something along the lines of:
> 
> match should return true if the driver wants the device, false
> otherwise. Note that hid-generic has a special handling of this in
> which it will also iterate over other .match() callbacks in other
> drivers. Please refrain from duplicating this behaviour in other
> drivers or dragons will come due to circular calls.

Ack, now that we are  likely not going to add a match callback to
the hid-ite driver (see its thread) do we still want to move ahead
with this patch? On one hand it still makes sense, OTOH if we never
add a match callback to another driver ...

Regards,

Hans

