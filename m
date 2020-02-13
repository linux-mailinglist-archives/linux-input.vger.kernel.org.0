Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D063C15C4FF
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2020 16:54:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387571AbgBMPw1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Feb 2020 10:52:27 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:56335 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388059AbgBMPw0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Feb 2020 10:52:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581609145;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=j117JhCfb+ifZwAFpTZEAEvyQH0kC6JyN1RvcAMrf0I=;
        b=XkF8Y0CLBblX5DP4C2/J4v5z3ETTbQthMIS/lg+d/VRVJjIqgbsQ5hRClF1MK3v71OZUzO
        AdGOeDGmHrpDWL9DBSKJjNppYjdfaJYB73n45Htuz77+SX+0TT+thNP1U0fTY8aQpNpyXY
        TMZT2HbG+fuv9d+qV6Upcj8JfIgHTAw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-L8KU5yTiNOe3AiSJICcs5Q-1; Thu, 13 Feb 2020 10:52:22 -0500
X-MC-Unique: L8KU5yTiNOe3AiSJICcs5Q-1
Received: by mail-wr1-f70.google.com with SMTP id r1so2494469wrc.15
        for <linux-input@vger.kernel.org>; Thu, 13 Feb 2020 07:52:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j117JhCfb+ifZwAFpTZEAEvyQH0kC6JyN1RvcAMrf0I=;
        b=cLnVRxOLF1aTMeLbZJnNp6sjzkxMqUryepTQY/GbuptpKklyes2PYyW78rcOQt3mvB
         57kLSLAnj3iwhm3IhrNa6FTAu5wQ0HTKJKI2Qw2ewBsK3Xq9OQCZyh9Qu7X0MbULZu2J
         tBsU6FnkAdhSkd74leMrtqH6pniDpBNSe7NWZgcuGjPz2bRvw2MCspHYTK08d1LdmILq
         ddIu0D7zwPai4bAXVIUE2cPQdBl3k6Ithbnj70RN/0vhok4vTONnaBuofp5C2FmoO/Nz
         vlZhnF9vQ9G9VRlfeXze5av4P+/Vs2+S6qlUcVlUq8rmo6UgOx0Py99lECpXm/c8WmZ3
         E6GQ==
X-Gm-Message-State: APjAAAVqvXZD3NyQ7jvkGdQHPG3kb1mrjFD2VlTJYD62CQUhhX1RpX8K
        Ur2L9wrG0yJttXIbm6IhwwU6ZPaJlPqK4d3kGkqzD0K9sxsWIVropR/bspmyMFi0Ox+61jhBXAE
        NDQQDWjjSFePsX8ljEzbFb1o=
X-Received: by 2002:a7b:c416:: with SMTP id k22mr6828750wmi.10.1581609140678;
        Thu, 13 Feb 2020 07:52:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqzX8u6AaWkpTAMKlfX1n2DYBMXd+2/tBP9UahOmYCe3qWmOhrLff+0NrQBFYqDZxm/DDUV51w==
X-Received: by 2002:a7b:c416:: with SMTP id k22mr6828711wmi.10.1581609140116;
        Thu, 13 Feb 2020 07:52:20 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id z19sm3222123wmi.35.2020.02.13.07.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2020 07:52:19 -0800 (PST)
Subject: Re: Make the hid-logitech-dj driver remove the HID++ nodes when the
 device disconnects
To:     Benjamin Tissoires <btissoir@redhat.com>
Cc:     =?UTF-8?Q?Filipe_La=c3=adns?= <lains@archlinux.org>,
        linux-input <linux-input@vger.kernel.org>,
        Peter Hutterer <peter.hutterer@redhat.com>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>,
        Jiri Kosina <jikos@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Julien Hartmann <juli1.hartmann@gmail.com>
References: <451e552444483c52a038d3d14391611f897582f4.camel@archlinux.org>
 <f2997fc7-1f34-79d3-f0aa-8367ed09f473@redhat.com>
 <ac804c20c692aa5a65e78ba6c8e22e4f328f1667.camel@archlinux.org>
 <4168f943-5ffe-10aa-b15f-21799ca99c0d@redhat.com>
 <7bf597e43c38518692dee5fdc2c03e21f78f61a1.camel@archlinux.org>
 <CAO-hwJLKrY6vJ-95+A-w3BdGXLVQDsX73VkgqjGCFOztTVRa9w@mail.gmail.com>
 <80aaf01d-fd9f-49fe-44cf-67710a0d136c@redhat.com>
 <c92b913816366b8744ebcb3d067d968431cfffb2.camel@archlinux.org>
 <28244ac8-9b8d-2950-b282-4db5cf7bf9b2@redhat.com>
 <CAO-hwJJ3uLgwUGqEUJ7eUFvf+AfebOD4vRxvhUJkxS3+QBoXmQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1acb46f0-b818-6c5f-0ca6-5b196a722cb8@redhat.com>
Date:   Thu, 13 Feb 2020 16:52:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAO-hwJJ3uLgwUGqEUJ7eUFvf+AfebOD4vRxvhUJkxS3+QBoXmQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 2/13/20 4:07 PM, Benjamin Tissoires wrote:
> [almost forgot about this thread]
> 
> On Thu, Feb 6, 2020 at 8:02 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 2/6/20 7:43 PM, Filipe Laíns wrote:
>>> On Thu, 2020-02-06 at 18:45 +0100, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 2/6/20 6:01 PM, Benjamin Tissoires wrote:
>>>>> On Thu, Feb 6, 2020 at 4:42 PM Filipe Laíns <lains@archlinux.org> wrote:
>>>>>> On Thu, 2020-02-06 at 13:13 +0100, Hans de Goede wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 2/6/20 12:51 PM, Filipe Laíns wrote:
>>>>>>>> On Thu, 2020-02-06 at 12:30 +0100, Hans de Goede wrote:
>>>>>>>>> HI,
>>>>>>>>>
>>>>>>>>> On 2/6/20 12:14 PM, Filipe Laíns wrote:
>>>>>>>>>> Hello,
>>>>>>>>>>
>>>>>>>>>> Right now the hid-logitech-dj driver will export one node for each
>>>>>>>>>> connected device, even when the device is not connected. That causes
>>>>>>>>>> some trouble because in userspace we don't have have any way to know if
>>>>>>>>>> the device is connected or not, so when we try to communicate, if the
>>>>>>>>>> device is disconnected it will fail.
>>>>>>>>>
>>>>>>>>> I'm a bit reluctant to make significant changes to how the
>>>>>>>>> hid-logitech-dj driver works. We have seen a number of regressions
>>>>>>>>> when it was changed to handle the non unifying receivers and I would
>>>>>>>>> like to avoid more regressions.
>>>>>>>>>
>>>>>>>>> Some questions:
>>>>>>>>> 1. What is the specific use case where you are hitting this?
>>>>>>>>
>>>>>>>> For example, in libratbag we enumerate the devices and then probe them.
>>>>>>>> Currently if the device is not connected, the communication fails. To
>>>>>>>> get the device to show up we need to replug it, so it it triggers udev,
>>>>>>>> or restart the daemon.
>>>>>>>
>>>>>>> Thanks, that is exactly the sort of context to your suggested changes
>>>>>>> which I need.
>>>>>>>
>>>>>>>>> 2. Can't the userspace tools involved by modified to handle the errors
>>>>>>>>> they are getting gracefully?
>>>>>>>>
>>>>>>>> They can, but the approaches I see are not optimal:
>>>>>>>>       - Wait for HID events coming from the device, which could never
>>>>>>>> happen.
>>>>>>>>       - Poll the device until it wakes up.
>>>>>>>
>>>>>>> I guess we do get some (other or repeated?) event when the device does
>>>>>>> actually connect, otherwise your suggested changes would not be possible.
>>>>>>
>>>>>> No, I was thinking to just send the HID++ version identification
>>>>>> routine and see if the device replies.
>>>>>
>>>>> Hmm, to continue on these questions:
>>>>> - yes, the current approach is to have the users of the HID++ device
>>>>> try to contact the device, get an error from the receiver, then keep
>>>>> the hidraw node open until we get something out of it, and then we can
>>>>> start talking to it
>>>>> - to your question Hans, when a device connects, it emits a HID++
>>>>> notification, which we should be relaying in the hidraw node. If not,
>>>>> well then starting to receive a key or abs event on the input node is
>>>>> a pretty good hint that the device connected.
>>>>>
>>>>> So at any time, the kernel knows which devices are connected among
>>>>> those that are paired, so the kernel knows a lot more than user space.
>>>>
>>>> Ack.
>>>>
>>>>> The main problem Filipe is facing here is that we specifically
>>>>> designed libratbag to *not* keep the device nodes opened, and to not
>>>>> poll on the input events. The reason being... we do not want libratbag
>>>>> to be considered as a keylogger.
>>>>
>>>> Ack.
>>>>
>>>>>>> So how about if we trigger a udev change event on the hid device instead
>>>>>>> when this happens ? That seems like a less invasive change on the kernel
>>>>>>> side and then libratbag could listen for these change events?
>>>>>>
>>>>>> Yes, that is a good idea :) I did not know this was possible but it
>>>>>> seems like a better approach.
>>>>>
>>>>> Not a big fan of that idea personally. This will add yet an other
>>>>> kernel API that we have to maintain.
>>>>> On Filipe's side, the hotplug support is something that has been
>>>>> around for quite a long time now, so we can safely expect applications
>>>>> to handle it properly.
>>>>
>>>> The suggested udev event change would just require a small change
>>>> to the existing hotplug handling, currently it responds to udev
>>>> "add" and "remove" events. With my suggested change in the "add"
>>>> path it will get an error because the device is not connected and
>>>> then stop adding the device. Combine this with treating "change"
>>>> events as "add" events and that is all that has to change on the
>>>> libratbag side.
>>>>
>>>> This assumes that duplicate add events are already filtered out,
>>>> which one has to do anyways to avoid coldplug enumeration vs
>>>> hotplug races.
>>>>
>>>> As for yet another kernel API to maintain, udev change events
>>>> already are an existing kernel API, what would be new is the hidpp
>>>> driver; and just the hidpp driver emitting them.
>>>>
>>>> All that is needed on the kernel side for this is to make the following
>>>> call when we detect a device moves from the paired to the connected state:
>>>>
>>>>       kobject_uevent(&hdev->dev.kobj, KOBJ_CHANGE);
>>>>
>>>> And there even seems to be a precedent for this, drivers/hid/hid-wiimote-core.c
>>>> already does this for what seems to be similar reasons.
> 
> Oooh, so yes, that would be an elegant way of solving this. We don't
> use KOBJ_CHANGE in the input stack, so there should be no harm in
> using it for that purpose.
> 
>>>>
>>>>
>>>>>>>>> 3. Is there a bugreport open about this somewhere?
>>>>>>>>
>>>>>>>> Yes, https://github.com/libratbag/libratbag/issues/785
>>>>>>>>
>>>>>>>>>> The reason we do this is because otherwise we would loose the first
>>>>>>>>>> packets when the device is turned on by key press. When a device is
>>>>>>>>>> turned on we would have to create the device node, and the packets
>>>>>>>>>> received while we are creating the device node would be lost.
>>>>>>>>>
>>>>>>>>> I don't believe that this is the reason, we only create hid child
>>>>>>>>> devices for devices reported by the receiver, but some of the non
>>>>>>>>> unifying hid receiver send a list of all devices paired, rather
>>>>>>>>> then the ones which are actually connected at that time.
>>>>>>>>
>>>>>>>> IIRC from my chats with Benjamin and Peter this is the reason, but
>>>>>>>> please correct me if I'm wrong.
>>>>>
>>>>> Filipe is correct here.
>>>>>
>>>>> For unifying devices, we can have up to 6 devices paired to a
>>>>> receiver, 3 can be used at the same time (connected).
>>>>> For the cheap receivers, we can enumerate 2 paired devices, but they
>>>>> are not necessarily connected too.
>>>>>
>>>>> Historically, when I first wrote the hid-logitech-hidpp driver, I
>>>>> wanted to not export a non connected device. But as mentioned by
>>>>> Filipe, this was posing issues mainly for keyboards, because generally
>>>>> the first thing you type on a keyboard is your password, and you don't
>>>>> necessarily have the feedback to see which keys you typed.
>>>>>
>>>>> So we (Nestor and I) decided to almost always create the input nodes
>>>>> when the device was not connected. The exceptions are when we need
>>>>> some device communication to set up the input node: so just for the
>>>>> touchpads.
>>>>
>>>> Ok.
>>>>
>>>>
>>>>>>> Could be that we can distinguish between "paired" and "connected"
>>>>>>> and that we are enumerating "paired" but not (yet) "connected"
>>>>>>> devices already because of what you say, I've not touched this
>>>>>>> code in a while.
>>>>>
>>>>> That is correct. Paired doesn't mean connected.
>>>>>
>>>>>> We create nodes for all paired devices, no matter if they are connected
>>>>>> or not.
>>>>>>
>>>>>>>>>> This could solved by buffering those packets, but that is a bad solution as
>>>>>>>>>> it would mess up the timings.
>>>>>>>>>>
>>>>>>>>>> At the moment the created node includes both normal HID and vendor
>>>>>>>>>> usages. To solve this problem, I propose that instead of creating a
>>>>>>>>>> single device node that contains all usages, we create one for normal
>>>>>>>>>> HID, which would exist all the time, and one for the vendor usage,
>>>>>>>>>> which would go away when the device disconnects. >
>>>>>>>>>> This slight behavior change will affect userspace. Two hidraw nodes
>>>>>>>>>> would be created instead of one. We need to make sure the current
>>>>>>>>>> userspace stacks interfacing with this would be able to properly handle
>>>>>>>>>> such changes.
>>>>>>>>>>
>>>>>>>>>> What do you think of this approach? Anyone has a better idea?
>>>>>>>>>
>>>>>>>>> The suggested approach sounds fragile and like it adds complexity to
>>>>>>>>> an already not simple driver.
>>>>>
>>>>> OTOH, this is what we have been trying to do in the kernel for years
>>>>> now: have one single node per application/usage, so we can rely on
>>>>> some valid data from the user space.
>>>>>
>>>>> I don't think the complexity of the driver should be a problem here.
>>>>> Yes, it's a complex one, but introducing a new API for that is a no
>>>>> from me.
>>>>
>>>> udev change events are not "adding a new API" there are a well known
>>>> API using e.g. for monitor plug/unplug in the drm subsys, etc. Yes
>>>> using them in the HID subsys this way is somewhat new.
> 
> OK. Would be using the KOBJ_CHANGE for "the device connected"
> something in line with what is done in the drm  subsystem?

Yes, the drm subsys uses this for example for monitor plug/unplug (later more
detailed separate udev events were added which also indicate which connector
changes, but the KOBJ_CHANGE event is still there for userspace which uses
it rather then the detailed events).

>>>>>>>> I understand, that is totally reasonable. I am working on a CI for the
>>>>>>>> driver if that helps.
>>>>>>>>
>>>>>>>>> It would be helpful to first describe the actual problem you are trying
>>>>>>>>> to fix (rather then suggesting a solution without clearly defining the
>>>>>>>>> problem) and then we can see from there.
>>>>>>>>
>>>>>>>> I though I described it good enough in the first paragraph but I guess
>>>>>>>> not, sorry. You should be able to get it from my comments above, if not
>>>>>>>> please let me know :)
>>>>>>>
>>>>>>> No problem, I have enough context now. I personally like my udev change
>>>>>>> event idea, which seems more KISS. But ultimately this is Benjamin's call.
>>>>>>
>>>>>> Yes, I don't know about the application details (I'll have to find out
>>>>>> :P) but it makes more sense to me. It avoids breaking the userspace
>>>>>> behavior.
>>>>>
>>>>> The udev change doesn't "break" userspace, but it is a new API. And
>>>>> that means nightmare from the application point of view:
>>>>> How do they know that the new API will be used? There is a high chance
>>>>> they won't, so for backward compatibility they will start listening to
>>>>> the hidraw node to match the current kernel behavior, and then we
>>>>> would just have added a new API for nothing.
>>>>
>>>> I agree that finding out if the udev change events are supported
>>>> is a bit of a challenge from userspace.
>>>>
>>>> But if I understood you correctly, then libratbag currently does
>>>> not keep listening to detect the connect, but rather atm this just
>>>> does not work, in which case it does not need to know if the new API
>>>> is there it can just assume; and even if it does need to know it
>>>> check the kernel-version number for that. Not pretty but that is
>>>> e.g. what libusb does to detect if certain "undetectable" features
>>>> are there, which admittedly is not ideal.
>>>
>>> Actually, since the latest release, libratbag would not require any
>>> changes. Please note that the proposal is to split the current hidraw
>>> node in two, one with just normal HID events, and one with just HID++.
>>> In 26c534cc742dfdbb14a889287f7771063be834cc (libratbag) we started
>>> parsing the report descriptors to find out the supported report IDs,
>>> the node with the normal HID events will fail on hidpp20_device_new
>>> because it won't support any HID++ reports.
>>>
>>>>>> Benjamin, what do you think?
>>>>>
>>>>> My point of view is:
>>>>> - don't add a new kernel API
>>>>
>>>> Again I believe calling udev change events "a new kernel API"
>>>> is exaggerating things a bit.
>>>>
>>>>> - rely on existing and supported user space behavior
>>>>> - ultimately, teach user space how to deal with the current situation
>>>>>
>>>>> So right now I think Filipe's proposal is the best bad solution. I
>>>>> would rank the udev event as worse than Filipe's solution because that
>>>>> involves both userspace and kernel space changes.
>>>>
>>>> The udev solution might require changes on both sides, but they
>>>> are very small easily reviewable changes. Anyways as I said this
>>>> is your call.
>>>>
>>>>> However, the proposal to add/remove the HID++ hidraw node on
>>>>> connect/disconnect really doesn't appeal to me because I am pretty
>>>>> sure we will have the same kind of issues that we are facing with
>>>>> keyboards. There might be an application that listens to the connect
>>>>> HID++ notification and turns the light on in the room whenever the
>>>>> mouse reconnects (and turns it off when the mouse disconnects because
>>>>> that means you left the room).
>>>>>
>>>>> So right now, as I am writing this, I think we should split the HID++
>>>>> node into its own hidraw node. This will allow application to listen
>>>>> to this node without being a keylogger as we will be filtering the key
>>>>> events in the actual input and the other hidraw nodes.
>>>
>>> Do we pass the HID connection notification to userspace? That is a
>>> receiver notification, and I though the driver was only passing the
>>> device packets.
>>>
>>> I don't understand why hotplugging is an issue? For me it's a feature.
>>> The userspace stack should definitely be able to handle it, that's how
>>> the corded devices work. By creating/removing the device node on device
>>> connect/disconnect we get the same behavior as when plugging/unplugging
>>> the mouse with a cable.
>>>
>>> Am I missing something here?
>>>
>>>> It took my a while to wrap my head around this, what you mean here
>>>> is that each paired device gets 2 nodes:
>>>>
>>>> 1) A full hidraw node which gets send all events from that paired device
>>>
>>> Like I said above, we want to split the node in two. One for the
>>> standard HID events (mouse movement, key press, etc.) and one just for
>>> HID++. From my understanding, this is also what Benjamin means.
>>
>> I see, so how would this work at the kernel level? AFAICT with the
>> current kernel code this would require logitech-dj to create 2 devices
>> under /sys/bus/hid/devices one for the HID++ descriptors + events
>> and one for the rest. But how is the drivers/hid/hid-logitech-hidpp.c
>> driver then supposed to work, AFAICT that needs access to both at
>> the same time.
> 
> Hmm, this is yet to be decided, yes. But hid-logitech-hidpp already
> deals with more than one hid device for a physical peripheral, because
> in the corded case, we might have 2 or 3 HID endpoints for one device.
> 
>>
>> Or is the plan to modify the hidraw driver for this somehow?
> 
> Nope, no changes in hidraw.

Ok.

>> I guess how this will work on the kernel side is mostly a question for Benjamin.
>>
>> I do see how this nicely solves the problem for userspace though,
>> it is a bit weird to have hidraw devices with fake descriptors and
>> which do not get all events, but we already have that with the
>> hidraw devices created for the devices behind the receiver, so I see
>> no harm in splitting these "fake" hidraw devices into 2 fake devices
>> each.
> 
> Yeah, the idea is to have a clean userspace implementation. OTOH, if
> the udev change is sufficient, we might never implement this split
> until the next need.

I think we should be able to make things work with just the KOBJ_CHANGE
event on the kernel side, but that will require some small changes to
the existing userspace code (e.g. to libratbag).

Regards,

Hans

