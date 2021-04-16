Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11EE5362311
	for <lists+linux-input@lfdr.de>; Fri, 16 Apr 2021 16:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244793AbhDPOo3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Apr 2021 10:44:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39223 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245340AbhDPOoO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Apr 2021 10:44:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618584229;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aCBYTwD52SEMmlTMfBQwz0O5jqFuOzdfNTfMfQJeZo0=;
        b=ek9Rh7TtdTBUvYELrRbUZq6OKGtdfQ82umymyjvfDkmo1ZUKHowWO8hWC8H+lLRKKNSzKr
        Zd51LJTZni/hBWth9D5VFeHPg0YLRsZSQ19GUx02/eCAqvCfa4tIT2sihsTxB8qjWROXqZ
        x/qawzFxLqjrabBN2oz1CR8MF+qKUM4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-AXlz3eJRPpaCrIwDOH-dlw-1; Fri, 16 Apr 2021 10:43:46 -0400
X-MC-Unique: AXlz3eJRPpaCrIwDOH-dlw-1
Received: by mail-ej1-f72.google.com with SMTP id i10-20020a1709067a4ab029037c5dba8400so2104294ejo.8
        for <linux-input@vger.kernel.org>; Fri, 16 Apr 2021 07:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aCBYTwD52SEMmlTMfBQwz0O5jqFuOzdfNTfMfQJeZo0=;
        b=lVpIPPn61M6NHH+27FYEvQ/co9k51iilXEZ087ebnS7p3URTGess/1O+MDOKZo435r
         sl/Fw0lPNJRv6R6wHiCDPuyXb+OgEd3DOoxB1Eal3J7qcx1PW31vaN7EXabVl/TGqAbc
         R6IvfzOeFdqFfeZrFfF75RHfSX8LK+nOSj6w4/WyLDrWKBjPtRXbipRMy+hUsl8LZ+d1
         HW+UV1Fp3yruk3Wzewiay4Z5K5uH5cOiX0KV6Zpf8zc94UGzw9LQfUi2zBPzl+w9QINh
         NXB13Ex7AOn8R3Wly8DD5nKbIeVKgoPoY7XpL03W7XpEl+cK8bvp/Q+JwEwUiXYsHSXY
         /doA==
X-Gm-Message-State: AOAM533+AyaKgU+T4RmQMtc10PKIKdsgdcnm83EOz0hDI9IETb72XWVe
        A6ey/T+6ApFfQ4QBe+SVQkwEIakw4NaZ5DxJ44MzSanJ/Ga9Ht7B2DZyqlE57L3nz6H0KkbK/EO
        PWgp94NjFpQKFLzVGcAzLz4c=
X-Received: by 2002:a05:6402:ca6:: with SMTP id cn6mr10248836edb.169.1618584224501;
        Fri, 16 Apr 2021 07:43:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymEwYTHnS+3DWOkQjgORXPnrRcsVTWoivqCg4lR/kmd5688d9QMIJ26lPxa57h4XoKkA++jQ==
X-Received: by 2002:a05:6402:ca6:: with SMTP id cn6mr10248826edb.169.1618584224357;
        Fri, 16 Apr 2021 07:43:44 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id t7sm5536926edq.42.2021.04.16.07.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Apr 2021 07:43:44 -0700 (PDT)
Subject: Re: UPD: hid-multitouch: goodix: hovering works as touch
To:     Dmitry Mastykin <dmastykin@astralinux.ru>,
        Vitaly Minko <vitaly@minko.me>, linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Daniele Gobbetti <daniele@gobbetti.name>
References: <ab5ad25b-d39c-83fe-4a88-eebed7f8b23a@minko.me>
 <7b7af64e-8e70-3a9c-eee9-010574adc241@astralinux.ru>
 <8e25e7c4-53bd-98d5-35da-cb596f84e9c4@minko.me>
 <62b7301b-a3a1-d49c-2a60-5640984a404a@redhat.com>
 <7b988eea-62b5-e799-ae5e-d7fa3ebcb9a1@astralinux.ru>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1d077483-1bd9-0bd8-3a7e-135ef7eb771b@redhat.com>
Date:   Fri, 16 Apr 2021 16:43:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7b988eea-62b5-e799-ae5e-d7fa3ebcb9a1@astralinux.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On 4/16/21 9:16 AM, Dmitry Mastykin wrote:
> Hi Hans,
> 
> Of course I would like to put a pen patch to upstream, and ready to work for that.
> Have you taken a look to it? It's seems to be like a workaround. And it's difficult to say if pen button part of the patch will work fine with all gt7385p firmwares (sequence of tip, barrel and eraser is very tricky, but is it stable from version to version?)
> Should I rebase my patch, provide with comments and send the series to linux-input? Do you have any wishes how I could improve it before?

I'm not sure I'm the best person to answer that. Benjamin Tissoires knows the
HID multi-touch code much better then I do.

Benjamin can you please take a look at the 2 out of tree patches for this
and give some hints what needs to be done to make these suitable for
the mainline kernel?

The patches where attached to another email in this thread, for your
convenience I've put them here:

Pen support (patch 1/2):
https://fedorapeople.org/~jwrdegoede/commit-b7ee3d7

Buttons on pen support (patch 2/2)
https://fedorapeople.org/~jwrdegoede/commit-530201a

Regards,

Hans



> On 4/15/21 7:02 PM, Hans de Goede wrote:
>> Hi,
>>
>> On 4/15/21 3:33 PM, Vitaly Minko wrote:
>>> Hello Dmitry,
>>>
>>>
>>> I have tested your patches on the kernel version 5.10.27. I had to add one define for I2C_DEVICE_ID_GOODIX_0113. Everything else was applied successfully.
>>>
>>> The digitizer works fine now. So the original issue is solved. Both pen buttons also work as expected (right and middle mouse buttons).
>>>
>>> All tests performed on One-Netbook A1.
>>>
>>> Thanks a lot for your efforts. Could you please send me a private email with your credentials for sending a tip (I would like to buy you a coffee).
>>
>> Although it is nice that these patches fix things for you, I wonder if there
>> is any plan to get the fixes for this upstream, so that once distros jump
>> to a newer kernel this will just work out of the box for all Linux users ?
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>> 15.04.2021 10:13, Dmitry Mastykin wrote:
>>>> Hi Vitaly,
>>>>
>>>> Yes, we made a quirk for separate non-multitouch processing of the HID_DG_PEN application for Goodix gt7385p (I2C_DEVICE_ID_GOODIX_0113 == 0x0113). It works well, BTN_TOOL_PEN and BTN_TOUCH events have right order.
>>>> I attach patches for kernel 5.4
>>>> Buttons support was very tricky, because the panel tries to imitate eraser usage with combination of tip's and eraser's bits off and on, seems that Windows driver needs this. In second patch we add state-machines for pen buttons to simulate right and middle click. It works also well with this panel/pen, but I'm not sure if it works with other devices.
>>>>
>>>> Kind regards,
>>>> Dmitry Mastykin
>>>>
>>>>
>>>> On 4/14/21 6:35 PM, Vitaly Minko wrote:
>>>>> Hello Dmitry,
>>>>>
>>>>>
>>>>> I have faced with exactly the same problem. Have you managed to solve the issue?
>>>>>
>>>>> If yes, could you please share the patch?
>>>>>
>>>>> Thanks in advance!
>>>>>
>>>>>
>>>>> Best regards,
>>>>>
>>>>> Vitaly
>>>>>
>>>
>>
> 

