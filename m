Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD2DD360FAA
	for <lists+linux-input@lfdr.de>; Thu, 15 Apr 2021 18:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233595AbhDOQDW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Apr 2021 12:03:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47210 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231726AbhDOQDW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Apr 2021 12:03:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618502578;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EfCozkwyIWvJddLESawO0YU5kVEsVTwb+OeiUk8uftI=;
        b=aURJaU/oEs4hSGqq16UvzfNWJn101fZcyZdTWhFxHpIriWXU2Xjjf4IQAZ3ceen5RpukO+
        0ZHl4ncDKFFZqckc2E0Kxza2mEEz/Z6SNlEclRt9KsUWDQquhsDI9ubMs3C0h3yD8PBwVF
        w0OzfWv1GACsjJKsbflqa43VodahYE8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-WwIPBvHhPoWlJYxrqgpv_Q-1; Thu, 15 Apr 2021 12:02:57 -0400
X-MC-Unique: WwIPBvHhPoWlJYxrqgpv_Q-1
Received: by mail-ej1-f69.google.com with SMTP id lf6-20020a1709071746b029037cee5e31c4so1107820ejc.13
        for <linux-input@vger.kernel.org>; Thu, 15 Apr 2021 09:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EfCozkwyIWvJddLESawO0YU5kVEsVTwb+OeiUk8uftI=;
        b=HKJJDerhkVDYTiSJv88vfjcuD8OXKEqrTU6mnDyZOfR21RevzIUpSEBLokPOldSgR5
         QAejmea8kIFi8X3y6t9nCoiJugxWFVxrtWfW+p9OpxJ7NpuSHVCC3EkyIf5vpNSKPxcm
         GO2YmD8MDh+70ClwP3LMEgxxM/Yy04A8NwCoqxPyAqxbwrtXUOFmu+MGJwrKALKdYmko
         WptpxYOc68ZhrHudL552s+gpMt3WAfuV5tHlwURRb3ITnVD5AzxT1uNfLNOOVeZw0FKs
         cntritplz5XZIaV/UZrJ4mh+hx4+it406DAqfCatK/eYFH0BkCbuEGpB7JEvZsr58jns
         pPRQ==
X-Gm-Message-State: AOAM530Yent5SfZtU8lLc+9uRPhOAe0BGLvT7zL7jAz2XxhOLX6ZvQTZ
        /wt0qgK1N48z1poCVfw8NVs1gOC0nJBqrF1Nfz+oelQ3PZhLPTgfZci06xpXvjELwU4pTnvGFjH
        sHuSmWuYPuIJsCw8FTI9Sf34=
X-Received: by 2002:a17:907:2151:: with SMTP id rk17mr4150525ejb.203.1618502575970;
        Thu, 15 Apr 2021 09:02:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLCR5qQ2TGg2zhvSUreJqB6jvAfSoBoQ6g9OhaGquDmyM2yASPIx9UychAokWVuK3wDnx5kg==
X-Received: by 2002:a17:907:2151:: with SMTP id rk17mr4150502ejb.203.1618502575768;
        Thu, 15 Apr 2021 09:02:55 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id c12sm3119104edx.54.2021.04.15.09.02.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Apr 2021 09:02:55 -0700 (PDT)
Subject: Re: UPD: hid-multitouch: goodix: hovering works as touch
To:     Vitaly Minko <vitaly@minko.me>,
        Dmitry Mastykin <dmastykin@astralinux.ru>,
        linux-input@vger.kernel.org
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Daniele Gobbetti <daniele@gobbetti.name>
References: <ab5ad25b-d39c-83fe-4a88-eebed7f8b23a@minko.me>
 <7b7af64e-8e70-3a9c-eee9-010574adc241@astralinux.ru>
 <8e25e7c4-53bd-98d5-35da-cb596f84e9c4@minko.me>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <62b7301b-a3a1-d49c-2a60-5640984a404a@redhat.com>
Date:   Thu, 15 Apr 2021 18:02:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8e25e7c4-53bd-98d5-35da-cb596f84e9c4@minko.me>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 4/15/21 3:33 PM, Vitaly Minko wrote:
> Hello Dmitry,
> 
> 
> I have tested your patches on the kernel version 5.10.27. I had to add one define for I2C_DEVICE_ID_GOODIX_0113. Everything else was applied successfully.
> 
> The digitizer works fine now. So the original issue is solved. Both pen buttons also work as expected (right and middle mouse buttons).
> 
> All tests performed on One-Netbook A1.
> 
> Thanks a lot for your efforts. Could you please send me a private email with your credentials for sending a tip (I would like to buy you a coffee).

Although it is nice that these patches fix things for you, I wonder if there
is any plan to get the fixes for this upstream, so that once distros jump
to a newer kernel this will just work out of the box for all Linux users ?

Regards,

Hans




> 15.04.2021 10:13, Dmitry Mastykin wrote:
>> Hi Vitaly,
>>
>> Yes, we made a quirk for separate non-multitouch processing of the HID_DG_PEN application for Goodix gt7385p (I2C_DEVICE_ID_GOODIX_0113 == 0x0113). It works well, BTN_TOOL_PEN and BTN_TOUCH events have right order.
>> I attach patches for kernel 5.4
>> Buttons support was very tricky, because the panel tries to imitate eraser usage with combination of tip's and eraser's bits off and on, seems that Windows driver needs this. In second patch we add state-machines for pen buttons to simulate right and middle click. It works also well with this panel/pen, but I'm not sure if it works with other devices.
>>
>> Kind regards,
>> Dmitry Mastykin
>>
>>
>> On 4/14/21 6:35 PM, Vitaly Minko wrote:
>>> Hello Dmitry,
>>>
>>>
>>> I have faced with exactly the same problem. Have you managed to solve the issue?
>>>
>>> If yes, could you please share the patch?
>>>
>>> Thanks in advance!
>>>
>>>
>>> Best regards,
>>>
>>> Vitaly
>>>
> 

