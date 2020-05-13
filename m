Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6DB1D12DC
	for <lists+linux-input@lfdr.de>; Wed, 13 May 2020 14:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730062AbgEMMg7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 May 2020 08:36:59 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:44544 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729975AbgEMMg6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 May 2020 08:36:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589373417;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8ipjHTWubfFbZgWXhy6QwWssjmLjxMtg142ZeQzoAJk=;
        b=K/797TgQUVyHrQEbuRoofRAbZjmw7v+1DBA2QDndJM0EJXO7Bi0l3tcr+lZj091kbICLcS
        Z556dUpetNRes4f3lxJm8/0np4G8skpFOoBIIvjfa3NlkFbnJmARk0vpgtB/JmBwGqQ39U
        bvuXmhGuVvhdqVWE17WQ2/CFTz83bKY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-o8tpfEduONqW2PkgZJtkfw-1; Wed, 13 May 2020 08:36:55 -0400
X-MC-Unique: o8tpfEduONqW2PkgZJtkfw-1
Received: by mail-wm1-f69.google.com with SMTP id x11so2250709wmc.9
        for <linux-input@vger.kernel.org>; Wed, 13 May 2020 05:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8ipjHTWubfFbZgWXhy6QwWssjmLjxMtg142ZeQzoAJk=;
        b=KkUqFb19ZNwhRrfd+gkv+C7tOxjY5basmuhOnAjb/bXe/PsURDPgLusZ3+mjwkA3d+
         C3EIDKDIwNLmZ3cyD2O0EoMXnPsQBFHrMvt8axVmpW/LswZNt3FiRW9KsDJcwrie6rAm
         7mZ2X6YuPAzUo3wFZSvIZxIYvHelASNdeKPAZ9CCBdkdkEFCzVf5uZNukArlEKZ1Lq8p
         MeE0e/6z9UI1A8gFW7WOpDPhrqfUQx4sC3/5zCrwte3JDDcunI4PLuXUNFrxePPwpESw
         EGwhoBNPcI2GGb02ia/rbhqexHS5NuPZ4c0WR+ISYzxBsJJFGzk++2UEvgRJFv447p9P
         8wRg==
X-Gm-Message-State: AGi0PuZnZkjUvb/ip0iBe4/Chx5EigF2CxczWW8faLZTqXTyUMrGNL6V
        obo5GbSLouZBNLY4qaqlQZyo/47ro4dAzvbwSRZn0nlEkawD4jUbd6iSgX2qpt64Zt+gks7s4fh
        uGskGV0O6mGLaL3GTl3Mpoj8=
X-Received: by 2002:a1c:7e82:: with SMTP id z124mr34929530wmc.53.1589373413957;
        Wed, 13 May 2020 05:36:53 -0700 (PDT)
X-Google-Smtp-Source: APiQypKiHMCdFeSJqjJnzrBs1mDn1hj+PuufjFOzmcO9rg1O63NIZW8Iqat6kqoQQt9FHWDJSE/afA==
X-Received: by 2002:a1c:7e82:: with SMTP id z124mr34929509wmc.53.1589373413676;
        Wed, 13 May 2020 05:36:53 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id s15sm1590055wro.80.2020.05.13.05.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2020 05:36:52 -0700 (PDT)
Subject: Re: [PATCH] HID: multitouch: Add MT_QUIRK_FORCE_GET_FEATURE to
 MT_CLS_WIN_8 quirks
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Peter Hutterer <peter.hutterer@who-t.net>
References: <20200501095624.121744-1-hdegoede@redhat.com>
 <d9d0bc3f-1975-ee05-f41f-a0d4480f667a@redhat.com>
 <2b014a28-630b-aab6-df91-320d0b3447b7@redhat.com>
 <CAO-hwJKnG2gxz62psgzhq3MFUAqd=rrzQEU9KbawY7GXs4We=w@mail.gmail.com>
 <cfc5669b-cf0c-0bb7-6762-def84dedb11f@redhat.com>
 <ad3830a6-56e3-9b3e-17b4-e1905c35e266@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <96ddb8f2-e3e6-c0c3-6484-c4c4126920f2@redhat.com>
Date:   Wed, 13 May 2020 14:36:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <ad3830a6-56e3-9b3e-17b4-e1905c35e266@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 5/13/20 10:00 AM, Benjamin Tissoires wrote:
> Hi Hans,
> 
> [sorry for the delay, I am knee deep in fdo admin stuffs]
> 
> On Mon, May 4, 2020 at 11:31 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 5/4/20 9:39 AM, Benjamin Tissoires wrote:
>>> Hi Hans,
>>>
>>> On Sat, May 2, 2020 at 2:59 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 5/1/20 8:20 PM, Hans de Goede wrote:
>>>>> Hi,
>>>>>
>>>>> On 5/1/20 11:56 AM, Hans de Goede wrote:
>>>>>> The touchpad on the Dell Venue 11 Pro 7130's keyboard-dock is multi-touch
>>>>>> capable, using HID_GROUP_MULTITOUCH_WIN_8 and the hid-multitouch driver
>>>>>> correctly binds to it.
>>>>>>
>>>>>> But instead of getting multi-touch HID input reports we still get mouse
>>>>>> input reports and corresponding linux input (evdev) node events.
>>>>>>
>>>>>> Unloading and reloading the hid-multitouch driver works around this.
>>>>>>
>>>>>> Adding the MT_QUIRK_FORCE_GET_FEATURE quirk to the MT_CLS_WIN_8 quirks
>>>>>> makes the driver work correctly the first time it is loaded.
>>>>>>
>>>>>> I've chosen to add this quirk to the generic MT_CLS_WIN_8 quirks
>>>>>> because it seems unlikely that this quirk will causes problems for
>>>>>> other MT_CLS_WIN_8 devices and if this device needs it other Win 8
>>>>>> compatible devices might need it too.
>>>>>>
>>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>>
>>>>> Self nack for now, there are more issues with this detachable keyboard,
>>>>> it sometimes does not work after being unplugged and replugged again
>>>>> USB_QUIRK_DELAY_INIT seems to help a bit, but is not a total solution...
>>>>>
>>>>> Dell has some firmware updates for the kbd. So I'll install Windows and
>>>>> then update the firmware and we'll see from there.
>>>>
>>>> So after installing Windows it turns out that the kbd-dock firmware was
>>>> already fully up2date, what fun.
>>>>
>>>> So it took me quite a long time to get to the bottom of this.
>>>>
>>>> The problem is that the Dell K12A kbd-dock needs a HID_QUIRK_NO_INIT_REPORTS
>>>> quirk; or maybe both of HID_QUIRK_NO_INIT_REPORTS|HID_QUIRK_NOGET I've tested
>>>
>>> I think this is a regression introduced by the high res scrolling
>>> patch. I have been notified that the new code actually does fetch all
>>> features on connect, which many devices do not support.
>>>
>>> I don't think I received the patch related to that, but basically the
>>> problematic code is at
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/hid/hid-input.c#n1558
>>>
>>> The issue is that we should only fetch the current report if the
>>> HID_GD_RESOLUTION_MULTIPLIER is present. Or we break things.
>>
>> I don't think that this is related to the high-res scrolling stuff.
> 
> Well, it is in the way that the high-res scrolling changed the way we talked to HID device. Before that, I carefully ensured that hid-generic would never issue a get_feature or get_input, and after, it does.
> 
>>
>> The errors I'm seeing on a bad hotplug are coming from
>> drivers/hid/hid-multitouch.c: mt_get_feature()
> 
> It might be that the device doesn't like to be polled too often on one feature and gets in a stuck mode.

I don't think so. I believe the reason why I did not notice this before
is because I simply did not really test it before.

As I mentioned at the start of the thread, I noticed this while working
on SW_TABLET_MODE support, and thus doing a lot of attaching / detaching
of the keyboard. I believe that this issue has existed since we stopped
setting HID_QUIRK_NO_INIT_REPORTS in the hid-multitouch code.

Anyways the proof is in the pudding, see below.

>> Also quite a few other multi-touch devices have a HID_QUIRK_NO_INIT_REPORTS
>> quirk, at least a bunch of surface keyboards do; and if I'm reading the
>> git log correctly then at one point in time we used to have a
>> HID_QUIRK_NO_INIT_REPORTS for at least some of the multi-touch classes
>> inside hid-multitouch.c. At least there is a commit titled:
>>
>> "HID: multitouch: do not set HID_QUIRK_NO_INIT_REPORTS"
>>
>> Which suggests that one point we did set it inside the multi-touch
>> driver; and I'm wondering since a bunch of surface keyboards need this
>> if setting this inside the multi-touch driver would not get us closer
>> to windows behavior.
> 
> This quirk is legacy, and should have stayed that way (well, it doesn't
> hurt anyway). As mentioned, in the past, the hid core stack used to fetch
> all input and feature reports on plug in. This was known to break many
> devices, and we had to use the no-init-report quirk for them. Then, we
> realized that it was not correct to do that way, and I removed this
> behavior. However, I couldn't remove the quirk entirely because of hiddev
> IIRC. In the hiddev case, userspace expects the device to have known values
> for the features, but that is not 100% working. So to not break userspace,
> I had to keep that quirk around for this use case.
> 
>>
>> Anyways if you have an alternative fix you want me to test, let me know.
> 
> Peter has a patch, we were waiting for the reporter to test it, but it's
> been crickets since last week.
> 
> Here it is:
> 
>
> Subject: [DRAFT PATCH] HID: input: do not run GET_REPORT unless there's a Resolution Multiplier

Ok, so I've given this a try with the HID_QUIRK_NO_INIT_REPORTS patch
I did reverted and the kbd and touchpad failed to send events after
the first detach + re-attach.

With the HID_QUIRK_NO_INIT_REPORTS patch in place detach + re-attach is
no problem.

Regards,

Hans

