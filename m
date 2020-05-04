Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DABF41C35C9
	for <lists+linux-input@lfdr.de>; Mon,  4 May 2020 11:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728377AbgEDJbJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 May 2020 05:31:09 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37159 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728374AbgEDJbJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 4 May 2020 05:31:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588584666;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HTAtb8yLmRD8ZjfKDyCTgD33hci8JOjpe+S01atLbvM=;
        b=hOOoPlIstZ11QscE3UrW4GVvX87Da2HcKxIw6hh+ljExvtA2Z9groBg6CqAz2XzBdDfpiF
        Va+wc0Zp+zX1eQ0XOvOVCv7bK61jCPS+dfMvX4Li6F8ewBO7jHWfamfGJ+psYsqQyupAXk
        Oqnev1LcYB9xbedj4R/jst9hXX54geM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-RIfmoQ44NGu-sfW_rK5JOQ-1; Mon, 04 May 2020 05:31:02 -0400
X-MC-Unique: RIfmoQ44NGu-sfW_rK5JOQ-1
Received: by mail-wm1-f69.google.com with SMTP id u11so3195784wmc.7
        for <linux-input@vger.kernel.org>; Mon, 04 May 2020 02:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HTAtb8yLmRD8ZjfKDyCTgD33hci8JOjpe+S01atLbvM=;
        b=WHY8uCbN+riyqV3t2TFseOdLpoq6pGaYXwAMY8NLWUyW6aKD+Pgv8WLtajbki0q92g
         PhK9i7RKFr5VjYBz5pehxN/tkq6FfT4XK+2ZKXdcd9VG5f+OuP2IzVAXfRYZY+BkrpO4
         ZY+zFw4087zaCgcnLyKaWPJ1tlG1KY6ebCW/TPUHMNb/2+CVymj3vETHk6nP3Ibl2d9Z
         DuRWUGRprGZ3McgUR4slFW8MA0fb755K9oZahgpVAcwwV6AREpzb+7GUWr/qmd/OC2/s
         5eT2H6UX+tB10oD+uQx4mm6omI+DKIznvUqtGIwgKY5jaKgM0vOCi0fkKwPybuOfvOun
         GHwQ==
X-Gm-Message-State: AGi0PualOQ5bZWB/CLxohlkpz7ZsPhNle9X4QoIUgfmxm6ldbVgsn4UF
        aqw41qmSxx0FTNe40Tjj8yGLkMaYvR1LEqZPSzTFY2TG46kGEmFRLsC6gfAtzETanTg5YZBhmOz
        Vq4vw87CzleHIBrpdjTykCzQ=
X-Received: by 2002:a1c:3281:: with SMTP id y123mr13635514wmy.30.1588584660657;
        Mon, 04 May 2020 02:31:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypKQLdKb2mSiMefm2W7iNMancvqhmv34+crKLqSZGX483WsnfqYZCmN2Qx/40+o7N2jtr4KhCg==
X-Received: by 2002:a1c:3281:: with SMTP id y123mr13635484wmy.30.1588584660335;
        Mon, 04 May 2020 02:31:00 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id z15sm16860357wrs.47.2020.05.04.02.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2020 02:30:59 -0700 (PDT)
Subject: Re: [PATCH] HID: multitouch: Add MT_QUIRK_FORCE_GET_FEATURE to
 MT_CLS_WIN_8 quirks
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
References: <20200501095624.121744-1-hdegoede@redhat.com>
 <d9d0bc3f-1975-ee05-f41f-a0d4480f667a@redhat.com>
 <2b014a28-630b-aab6-df91-320d0b3447b7@redhat.com>
 <CAO-hwJKnG2gxz62psgzhq3MFUAqd=rrzQEU9KbawY7GXs4We=w@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <cfc5669b-cf0c-0bb7-6762-def84dedb11f@redhat.com>
Date:   Mon, 4 May 2020 11:30:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAO-hwJKnG2gxz62psgzhq3MFUAqd=rrzQEU9KbawY7GXs4We=w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 5/4/20 9:39 AM, Benjamin Tissoires wrote:
> Hi Hans,
> 
> On Sat, May 2, 2020 at 2:59 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 5/1/20 8:20 PM, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 5/1/20 11:56 AM, Hans de Goede wrote:
>>>> The touchpad on the Dell Venue 11 Pro 7130's keyboard-dock is multi-touch
>>>> capable, using HID_GROUP_MULTITOUCH_WIN_8 and the hid-multitouch driver
>>>> correctly binds to it.
>>>>
>>>> But instead of getting multi-touch HID input reports we still get mouse
>>>> input reports and corresponding linux input (evdev) node events.
>>>>
>>>> Unloading and reloading the hid-multitouch driver works around this.
>>>>
>>>> Adding the MT_QUIRK_FORCE_GET_FEATURE quirk to the MT_CLS_WIN_8 quirks
>>>> makes the driver work correctly the first time it is loaded.
>>>>
>>>> I've chosen to add this quirk to the generic MT_CLS_WIN_8 quirks
>>>> because it seems unlikely that this quirk will causes problems for
>>>> other MT_CLS_WIN_8 devices and if this device needs it other Win 8
>>>> compatible devices might need it too.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>
>>> Self nack for now, there are more issues with this detachable keyboard,
>>> it sometimes does not work after being unplugged and replugged again
>>> USB_QUIRK_DELAY_INIT seems to help a bit, but is not a total solution...
>>>
>>> Dell has some firmware updates for the kbd. So I'll install Windows and
>>> then update the firmware and we'll see from there.
>>
>> So after installing Windows it turns out that the kbd-dock firmware was
>> already fully up2date, what fun.
>>
>> So it took me quite a long time to get to the bottom of this.
>>
>> The problem is that the Dell K12A kbd-dock needs a HID_QUIRK_NO_INIT_REPORTS
>> quirk; or maybe both of HID_QUIRK_NO_INIT_REPORTS|HID_QUIRK_NOGET I've tested
> 
> I think this is a regression introduced by the high res scrolling
> patch. I have been notified that the new code actually does fetch all
> features on connect, which many devices do not support.
> 
> I don't think I received the patch related to that, but basically the
> problematic code is at
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/hid/hid-input.c#n1558
> 
> The issue is that we should only fetch the current report if the
> HID_GD_RESOLUTION_MULTIPLIER is present. Or we break things.

I don't think that this is related to the high-res scrolling stuff.

The errors I'm seeing on a bad hotplug are coming from
drivers/hid/hid-multitouch.c: mt_get_feature()

Also quite a few other multi-touch devices have a HID_QUIRK_NO_INIT_REPORTS
quirk, at least a bunch of surface keyboards do; and if I'm reading the
git log correctly then at one point in time we used to have a
HID_QUIRK_NO_INIT_REPORTS for at least some of the multi-touch classes
inside hid-multitouch.c. At least there is a commit titled:

"HID: multitouch: do not set HID_QUIRK_NO_INIT_REPORTS"

Which suggests that one point we did set it inside the multi-touch
driver; and I'm wondering since a bunch of surface keyboards need this
if setting this inside the multi-touch driver would not get us closer
to windows behavior.

Anyways if you have an alternative fix you want me to test, let me know.

Regards,

Hans




> 
> Cheers,
> Benjamin
> 
>> with the later version and that fixes both the touchpad initially being
>> stuck in mouse emulation and the dock misbehaving after a hot unplug + replug.
>>
>> I suspect I really only need HID_QUIRK_NO_INIT_REPORTS, I will retest with
>> that and submit a new patch replacing this one.
>>
>> Somewhat related: to make space for the Windows install I nuked the old
>> Fedora 27 install which was on the machine and after installing Windows
>> I did a fresh Fedora 32 install in the space which I left free when
>> installing Windows.
>>
>> This causes an interesting new problem. The touchpad worked fine
>> (with the quirk) in gdm, but it would stop working when I logged into
>> a user GNOME-session.  It took me a while to get to the bottom of
>> this. The problem is that the usersession ends up dbus activating
>> fwupd (probably through gnome-software) and fwupd does some probe
>> of the touchpad which puts it in a mode where it no longer generates
>> any events.
>>
>> sudo rpm -e fwupd gnome-software
>>
>> Works around this, so not a HID bug, but definitely something to keep
>> an eye out for if we get similar bug reports on other devices.
>>
>> I will mail the fwupd maintainer about this with you in the Cc.
>> Note this is an unrelated issue really, but I thought you
>> should be aware of this.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>>> ---
>>>>    drivers/hid/hid-multitouch.c | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
>>>> index 362805ddf377..f9c0429e7348 100644
>>>> --- a/drivers/hid/hid-multitouch.c
>>>> +++ b/drivers/hid/hid-multitouch.c
>>>> @@ -265,6 +265,7 @@ static const struct mt_class mt_classes[] = {
>>>>                MT_QUIRK_IGNORE_DUPLICATES |
>>>>                MT_QUIRK_HOVERING |
>>>>                MT_QUIRK_CONTACT_CNT_ACCURATE |
>>>> +            MT_QUIRK_FORCE_GET_FEATURE |
>>>>                MT_QUIRK_STICKY_FINGERS |
>>>>                MT_QUIRK_WIN8_PTP_BUTTONS,
>>>>            .export_all_inputs = true },
>>>>
>>
> 

