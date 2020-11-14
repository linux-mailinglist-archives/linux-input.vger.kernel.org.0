Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEBE12B2DB1
	for <lists+linux-input@lfdr.de>; Sat, 14 Nov 2020 15:45:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbgKNOp2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 Nov 2020 09:45:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58616 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726522AbgKNOp2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 Nov 2020 09:45:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605365126;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GBuPSkrosmVR925XO/35Jf0UMukhiXuRRc0kOG5DnKg=;
        b=N5bF58xCQHo89R04ju5wDdjtbh9P6zEUOr5l5SPKNanFJVdHaxCcxYGsQKOCKcvTRJGvme
        TsBzwlA1nEZSGgdIyv2+JPdlw2+/sFrn99jXlQhHHTDuomJ40nb4SMrwP1WHkzdtJPIocl
        hUKBAPLCe0QtgELKo/yrT3qKGRONZ0Y=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-XCjcX-QlNN69o_lpJRqDng-1; Sat, 14 Nov 2020 09:45:24 -0500
X-MC-Unique: XCjcX-QlNN69o_lpJRqDng-1
Received: by mail-ed1-f72.google.com with SMTP id d3so1261638eds.3
        for <linux-input@vger.kernel.org>; Sat, 14 Nov 2020 06:45:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GBuPSkrosmVR925XO/35Jf0UMukhiXuRRc0kOG5DnKg=;
        b=NCaef5ZEk3AScg+m3Fhge+XZCRF8k8ElCKCaCOaocQ8tFXXZ67U0T6hN/E7Mc5iXOw
         lwJghQ70d1Q4jLIFfU8p2opNiI0T5otDy3ziib2eSVQnwp8DR8rz9kKZo9lkAjHOUHIw
         YpQ5ZZelNcu7+tJe38DHhW49dDpM78gtBuGxF9HAZfxwx5pK5Hv/23uem0xev8T5jCTD
         2tvinKzcM9oI4yDBf3hC+fMPvks+0DWAfG93j+QO2QhR8MDlFQqhmnDpG1Mfp6jerQuP
         lNrTT3EiIt8goFcDtUxWgrcBqngm3cBgWtXvL357bH/4QfsGMR/rH5fwG9g9lPyEziX0
         kF8w==
X-Gm-Message-State: AOAM531fyLNw4hmZF+n9vtf2R3LaSxulByucwSmQl3gGySZ8TGVyzRkJ
        LEs170oIvk9kk69bd6Dsy8BAtCAyb+0kIDbBal8jNNg4YrGHwYrmkDYjYQrVp6r2MsypVZSJXem
        O9iFDbj/R/+778BepvI/cq4Y=
X-Received: by 2002:a05:6402:716:: with SMTP id w22mr7789362edx.214.1605365123300;
        Sat, 14 Nov 2020 06:45:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtn2PIDl5615s5aur49mEsQVpUrlr6W5s/wbMPHAZHNQWTGzuOiR7dakWIRG2dBIeLqmNCsQ==
X-Received: by 2002:a05:6402:716:: with SMTP id w22mr7789342edx.214.1605365123055;
        Sat, 14 Nov 2020 06:45:23 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id l8sm6727595ejr.106.2020.11.14.06.45.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2020 06:45:22 -0800 (PST)
Subject: Re: [PATCH 1/3] HID: logitech-dj: Handle quad/bluetooth keyboards
 with a builtin trackpad
From:   Hans de Goede <hdegoede@redhat.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        "3.8+" <stable@vger.kernel.org>
References: <20201102133658.4410-1-hdegoede@redhat.com>
 <e3817ab8-906e-cb98-91db-ffb4cc821788@redhat.com>
 <ab1788a1-1f23-45bd-72e8-fadcea82514f@redhat.com>
 <07280208-7a52-954e-4795-9022fe498294@redhat.com>
 <CAO-hwJ+u5=rFN8vkV7FJUrYv4geNmfTD3g=vdkBf3P9BMCdmxw@mail.gmail.com>
 <135188fc-fd13-7539-4ed9-50ac3557de6c@redhat.com>
Message-ID: <e0616b08-41c1-5507-e1e7-44e39ac03fa6@redhat.com>
Date:   Sat, 14 Nov 2020 15:45:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <135188fc-fd13-7539-4ed9-50ac3557de6c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 11/14/20 12:03 PM, Hans de Goede wrote:
> Hi,
> 
> On 11/12/20 4:49 PM, Benjamin Tissoires wrote:
>> On Wed, Nov 11, 2020 at 12:07 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> <snip>
> 
>>>> If so, I can try to push it later today or tomorrow.
>>>
>>> Sounds good, thank you.
>>
>> I have now applied the 3 patches to the for-5.10/upstream-fixes branch.
>> I also added the Fixes tag to the first commit only.
> 
> Great thank you.
> 
> <snip>
> 
>>>> Yeah, the Dinovo Mini will come later.
> 
> So I've been working on this today and I hope to have a patch for you
> ready to test soon. So no need for you to spend time on this now,
> that would just be us doing double work.
> 
> <snip>
> 
>>> Do the original HID descriptors of the receiver perhaps have both a report 2 and
>>> a report 5 and we should add both ?
>>
>> No, I think it only has report ID 5.
> 
> So I checked and there are actually both INPUT(2) and INPUT(5) descriptors
> on the mouse USB-device's HID intf.
> 
> And looking at the USB ids again, this is not new vs old. This is Dinovo
> vs non Dinovo. It seems that even though the air protocol is the same,
> the Dinovo receivers have some special handling for the kbd touchpad where
> as the non Dinovo receivers just send the same HID reports as for the normal
> mouse.
> 
> I paired both the Dinovo Edge + a BT mouse (you can pair any BT mouse,
> just press the pair button on the receiver and then on the mouse) with:
> 
> 1. The MX5000 receiver as the RH bugzilla reporter is doing
> 
> In this case both the kbd-touchpad and the actual mouse send INPUT(2)
> reports (there is no INPUT(5) in the descriptors).
> 
> 2. The Dinovo Edge receiver. In this case the kbd-touchpad sends
> INPUT(5) reports where as the actual mouse sends INPUT(2) reports.

p.s.

There being 2 mouse reports on the mouse intf. also explains why
the hid-logitech-lg.c code needs the special LG_DUPLICATE_USAGES
for the Dinovo receivers. We won't have this issue in the logitech-dj
code since there (with the patch I'm working on) the INPUT(5) reports
will be send to the keyboard hidpp-device where as the INPUT(2) reports
will keep being send to the mouse hidpp-device as usual. So there will
not be a single hidpp device which receives both mouse-reports and
thus no need for something like the LG_DUPLICATE_USAGES quirk.

Regards,

Hans

