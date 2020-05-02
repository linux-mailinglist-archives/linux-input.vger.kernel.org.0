Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E786F1C2582
	for <lists+linux-input@lfdr.de>; Sat,  2 May 2020 14:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727925AbgEBM7t (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 2 May 2020 08:59:49 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23992 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727867AbgEBM7s (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 2 May 2020 08:59:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588424384;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Fa01d1hCvakaTwD6dZ8jCxqpQEibkQQffOxXBAzJOpM=;
        b=M5hCaB99dc4x8rqWLsz+BBsnZgBdlAPz62M2Hj5vpJHmhSyBSfTvP8A+Z7O0z7yhPVTzMx
        d8HkDi10aHe3EOamNdjj3y1F5o0099Od5ti2WrwrWJIFB6/AMAvyBLgDmixL3vrt4JPBDo
        FKH/rtB1qEH7QSRU3WzbwbpBZ674R+Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-Q9askbnhNW6QhXalKraMyw-1; Sat, 02 May 2020 08:59:43 -0400
X-MC-Unique: Q9askbnhNW6QhXalKraMyw-1
Received: by mail-wr1-f72.google.com with SMTP id y12so4815570wrl.14
        for <linux-input@vger.kernel.org>; Sat, 02 May 2020 05:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Fa01d1hCvakaTwD6dZ8jCxqpQEibkQQffOxXBAzJOpM=;
        b=Uyv3+uw+nN0IckPtwaXZAu1/h0cIfYVj00U+Js6E9TKn2t+gMiHXDsVV/sSi6z/SVF
         xc0ZYRFJ1NaAzbv/2Oml//zUc3len8C08Azmev17Lp1vB4bk2IqNWrE/dvQ8Oan+d5nI
         3UXaCNoOZEuY40bBx4teuQP5KATE55QCszd7FlvCOQBYcVFKVimRJTWN9lD/GVL9vEHI
         YimTzMdHeB3pFx5VCDD7IcYyadPbu04aWrldrfYM5GcvadT9KAQIHPwn3NAx7X1HUxWU
         H/znNM4ax5pZ1apobmWNOC07JM0Tas5Ybw+SruaTW/djh0Y5UbA2sG3K/F15m+78uUTv
         JIjQ==
X-Gm-Message-State: AGi0Pua3ddcpAJHmcre554cGkNFNMI3kkSZtUbd42n7Z0T0EXLcojwlE
        MX6mrrEQfzal+/q1ZJumkhE3Hu05taZshA9VAiBzGMtT4aJX7S8F83OD40jM9WQVGlNdVEdLzMW
        wmlHj9hcEgz41USSP3IhJc8Y=
X-Received: by 2002:a5d:65cb:: with SMTP id e11mr9078461wrw.402.1588424381815;
        Sat, 02 May 2020 05:59:41 -0700 (PDT)
X-Google-Smtp-Source: APiQypKsmxiuNNUBB46MzQOQ7lj0Tc2Htq6a3XyLcvbt42fWc+g4nZr0QO0BLAvstD2rN2Gn0SaAOA==
X-Received: by 2002:a5d:65cb:: with SMTP id e11mr9078446wrw.402.1588424381579;
        Sat, 02 May 2020 05:59:41 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id x16sm2318123wrn.76.2020.05.02.05.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2020 05:59:40 -0700 (PDT)
Subject: Re: [PATCH] HID: multitouch: Add MT_QUIRK_FORCE_GET_FEATURE to
 MT_CLS_WIN_8 quirks
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org
References: <20200501095624.121744-1-hdegoede@redhat.com>
 <d9d0bc3f-1975-ee05-f41f-a0d4480f667a@redhat.com>
Message-ID: <2b014a28-630b-aab6-df91-320d0b3447b7@redhat.com>
Date:   Sat, 2 May 2020 14:59:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <d9d0bc3f-1975-ee05-f41f-a0d4480f667a@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 5/1/20 8:20 PM, Hans de Goede wrote:
> Hi,
> 
> On 5/1/20 11:56 AM, Hans de Goede wrote:
>> The touchpad on the Dell Venue 11 Pro 7130's keyboard-dock is multi-touch
>> capable, using HID_GROUP_MULTITOUCH_WIN_8 and the hid-multitouch driver
>> correctly binds to it.
>>
>> But instead of getting multi-touch HID input reports we still get mouse
>> input reports and corresponding linux input (evdev) node events.
>>
>> Unloading and reloading the hid-multitouch driver works around this.
>>
>> Adding the MT_QUIRK_FORCE_GET_FEATURE quirk to the MT_CLS_WIN_8 quirks
>> makes the driver work correctly the first time it is loaded.
>>
>> I've chosen to add this quirk to the generic MT_CLS_WIN_8 quirks
>> because it seems unlikely that this quirk will causes problems for
>> other MT_CLS_WIN_8 devices and if this device needs it other Win 8
>> compatible devices might need it too.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Self nack for now, there are more issues with this detachable keyboard,
> it sometimes does not work after being unplugged and replugged again
> USB_QUIRK_DELAY_INIT seems to help a bit, but is not a total solution...
> 
> Dell has some firmware updates for the kbd. So I'll install Windows and
> then update the firmware and we'll see from there.

So after installing Windows it turns out that the kbd-dock firmware was
already fully up2date, what fun.

So it took me quite a long time to get to the bottom of this.

The problem is that the Dell K12A kbd-dock needs a HID_QUIRK_NO_INIT_REPORTS
quirk; or maybe both of HID_QUIRK_NO_INIT_REPORTS|HID_QUIRK_NOGET I've tested
with the later version and that fixes both the touchpad initially being
stuck in mouse emulation and the dock misbehaving after a hot unplug + replug.

I suspect I really only need HID_QUIRK_NO_INIT_REPORTS, I will retest with
that and submit a new patch replacing this one.

Somewhat related: to make space for the Windows install I nuked the old
Fedora 27 install which was on the machine and after installing Windows
I did a fresh Fedora 32 install in the space which I left free when
installing Windows.

This causes an interesting new problem. The touchpad worked fine
(with the quirk) in gdm, but it would stop working when I logged into
a user GNOME-session.  It took me a while to get to the bottom of
this. The problem is that the usersession ends up dbus activating
fwupd (probably through gnome-software) and fwupd does some probe
of the touchpad which puts it in a mode where it no longer generates
any events.

sudo rpm -e fwupd gnome-software

Works around this, so not a HID bug, but definitely something to keep
an eye out for if we get similar bug reports on other devices.

I will mail the fwupd maintainer about this with you in the Cc.
Note this is an unrelated issue really, but I thought you
should be aware of this.

Regards,

Hans



>> ---
>>   drivers/hid/hid-multitouch.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
>> index 362805ddf377..f9c0429e7348 100644
>> --- a/drivers/hid/hid-multitouch.c
>> +++ b/drivers/hid/hid-multitouch.c
>> @@ -265,6 +265,7 @@ static const struct mt_class mt_classes[] = {
>>               MT_QUIRK_IGNORE_DUPLICATES |
>>               MT_QUIRK_HOVERING |
>>               MT_QUIRK_CONTACT_CNT_ACCURATE |
>> +            MT_QUIRK_FORCE_GET_FEATURE |
>>               MT_QUIRK_STICKY_FINGERS |
>>               MT_QUIRK_WIN8_PTP_BUTTONS,
>>           .export_all_inputs = true },
>>

