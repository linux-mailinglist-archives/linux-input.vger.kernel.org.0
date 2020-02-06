Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EDC6154A72
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2020 18:45:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727607AbgBFRpj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Feb 2020 12:45:39 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23213 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727479AbgBFRpj (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Feb 2020 12:45:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581011136;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AZRZR3qZ7xqt+JQWQdLjUZCfVx+chHZS387jG5604A4=;
        b=AQ8aA0gVU59Bj5NnJmoDZQKPFQUSlX1aONrcHT0hv3UgSCqSr11Ww88cbhu1K9JSdJ4ZpQ
        5diWxAevpMATL5XGXVn19w40SDX1rMNWTOdRAPuJXbNzw0ihn0Zm71Fjq4BoMoKMBB6kNl
        Ff3dfigOeKDroNH4LzJzZLGSl5+ONjY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-6FmHdrU4PjOJW9csR3ovsQ-1; Thu, 06 Feb 2020 12:45:17 -0500
X-MC-Unique: 6FmHdrU4PjOJW9csR3ovsQ-1
Received: by mail-wm1-f71.google.com with SMTP id o193so371426wme.8
        for <linux-input@vger.kernel.org>; Thu, 06 Feb 2020 09:45:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AZRZR3qZ7xqt+JQWQdLjUZCfVx+chHZS387jG5604A4=;
        b=Fpv6rvNGM9ccQSZ9+CUsQGNjOykzMUYZLmh7//cauQ4QToX0NCcP+hu7jwhffGziZ6
         l1rn1r6n6//JAQNcDXzuIup5o2aAggqE1s8NLKgzEQmdFP88Kdcdw8RgjlNhhWnqf04M
         p6lt0+zwGzQRfRv1oA+gQtX2/H3rxNZPsgD2MvEDXBcALSUxWALDiCCGwTunGZs8KCVN
         NzMsCWU44q+PrvymrNgw0Yjqh9oNqRmaADn0QRV39noMrDIlxUzSNeyq14Y42rvrnPUl
         4aFdUP0iUxsTpv6w0rNyDgH6dJI5buQ85yca4TODQocIDlc3TmwJ8WUoR4KC6vVxdQlF
         R0Ew==
X-Gm-Message-State: APjAAAWxxTxE6q0aZb5MNQFrhlgb1MkE5s08dpoqu/dMz4exC0nkyAXL
        qG4/mx6J/L0DS5kO2SmqliIZiqCmqYwiuoPYFNcm/8s71b+Ms/9mMgKDqtqWQpFokJfOHDD04hE
        nhcOnAYH9Foed5VPtlOQ/vow=
X-Received: by 2002:a05:600c:251:: with SMTP id 17mr5714619wmj.59.1581011116252;
        Thu, 06 Feb 2020 09:45:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqwoDDLcMgJ+p4jYD2MS511smJntZGwc0Elip4lYgY1HgYNH8pp/oik4lmsP9UVuMz25F5IlFg==
X-Received: by 2002:a05:600c:251:: with SMTP id 17mr5714580wmj.59.1581011115735;
        Thu, 06 Feb 2020 09:45:15 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id w26sm284453wmi.8.2020.02.06.09.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2020 09:45:15 -0800 (PST)
Subject: Re: Make the hid-logitech-dj driver remove the HID++ nodes when the
 device disconnects
To:     Benjamin Tissoires <btissoir@redhat.com>,
        =?UTF-8?Q?Filipe_La=c3=adns?= <lains@archlinux.org>
Cc:     linux-input <linux-input@vger.kernel.org>,
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
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <80aaf01d-fd9f-49fe-44cf-67710a0d136c@redhat.com>
Date:   Thu, 6 Feb 2020 18:45:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAO-hwJLKrY6vJ-95+A-w3BdGXLVQDsX73VkgqjGCFOztTVRa9w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 2/6/20 6:01 PM, Benjamin Tissoires wrote:
> On Thu, Feb 6, 2020 at 4:42 PM Filipe Laíns <lains@archlinux.org> wrote:
>>
>> On Thu, 2020-02-06 at 13:13 +0100, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 2/6/20 12:51 PM, Filipe Laíns wrote:
>>>> On Thu, 2020-02-06 at 12:30 +0100, Hans de Goede wrote:
>>>>> HI,
>>>>>
>>>>> On 2/6/20 12:14 PM, Filipe Laíns wrote:
>>>>>> Hello,
>>>>>>
>>>>>> Right now the hid-logitech-dj driver will export one node for each
>>>>>> connected device, even when the device is not connected. That causes
>>>>>> some trouble because in userspace we don't have have any way to know if
>>>>>> the device is connected or not, so when we try to communicate, if the
>>>>>> device is disconnected it will fail.
>>>>>
>>>>> I'm a bit reluctant to make significant changes to how the
>>>>> hid-logitech-dj driver works. We have seen a number of regressions
>>>>> when it was changed to handle the non unifying receivers and I would
>>>>> like to avoid more regressions.
>>>>>
>>>>> Some questions:
>>>>> 1. What is the specific use case where you are hitting this?
>>>>
>>>> For example, in libratbag we enumerate the devices and then probe them.
>>>> Currently if the device is not connected, the communication fails. To
>>>> get the device to show up we need to replug it, so it it triggers udev,
>>>> or restart the daemon.
>>>
>>> Thanks, that is exactly the sort of context to your suggested changes
>>> which I need.
>>>
>>>>> 2. Can't the userspace tools involved by modified to handle the errors
>>>>> they are getting gracefully?
>>>>
>>>> They can, but the approaches I see are not optimal:
>>>>     - Wait for HID events coming from the device, which could never
>>>> happen.
>>>>     - Poll the device until it wakes up.
>>>
>>> I guess we do get some (other or repeated?) event when the device does
>>> actually connect, otherwise your suggested changes would not be possible.
>>
>> No, I was thinking to just send the HID++ version identification
>> routine and see if the device replies.
> 
> Hmm, to continue on these questions:
> - yes, the current approach is to have the users of the HID++ device
> try to contact the device, get an error from the receiver, then keep
> the hidraw node open until we get something out of it, and then we can
> start talking to it
> - to your question Hans, when a device connects, it emits a HID++
> notification, which we should be relaying in the hidraw node. If not,
> well then starting to receive a key or abs event on the input node is
> a pretty good hint that the device connected.
> 
> So at any time, the kernel knows which devices are connected among
> those that are paired, so the kernel knows a lot more than user space.

Ack.

> The main problem Filipe is facing here is that we specifically
> designed libratbag to *not* keep the device nodes opened, and to not
> poll on the input events. The reason being... we do not want libratbag
> to be considered as a keylogger.

Ack.

>>> So how about if we trigger a udev change event on the hid device instead
>>> when this happens ? That seems like a less invasive change on the kernel
>>> side and then libratbag could listen for these change events?
>>
>> Yes, that is a good idea :) I did not know this was possible but it
>> seems like a better approach.
> 
> Not a big fan of that idea personally. This will add yet an other
> kernel API that we have to maintain.
> On Filipe's side, the hotplug support is something that has been
> around for quite a long time now, so we can safely expect applications
> to handle it properly.

The suggested udev event change would just require a small change
to the existing hotplug handling, currently it responds to udev
"add" and "remove" events. With my suggested change in the "add"
path it will get an error because the device is not connected and
then stop adding the device. Combine this with treating "change"
events as "add" events and that is all that has to change on the
libratbag side.

This assumes that duplicate add events are already filtered out,
which one has to do anyways to avoid coldplug enumeration vs
hotplug races.

As for yet another kernel API to maintain, udev change events
already are an existing kernel API, what would be new is the hidpp
driver; and just the hidpp driver emitting them.

All that is needed on the kernel side for this is to make the following
call when we detect a device moves from the paired to the connected state:

	kobject_uevent(&hdev->dev.kobj, KOBJ_CHANGE);

And there even seems to be a precedent for this, drivers/hid/hid-wiimote-core.c
already does this for what seems to be similar reasons.


>>>>> 3. Is there a bugreport open about this somewhere?
>>>>
>>>> Yes, https://github.com/libratbag/libratbag/issues/785
>>>>
>>>>>> The reason we do this is because otherwise we would loose the first
>>>>>> packets when the device is turned on by key press. When a device is
>>>>>> turned on we would have to create the device node, and the packets
>>>>>> received while we are creating the device node would be lost.
>>>>>
>>>>> I don't believe that this is the reason, we only create hid child
>>>>> devices for devices reported by the receiver, but some of the non
>>>>> unifying hid receiver send a list of all devices paired, rather
>>>>> then the ones which are actually connected at that time.
>>>>
>>>> IIRC from my chats with Benjamin and Peter this is the reason, but
>>>> please correct me if I'm wrong.
> 
> Filipe is correct here.
> 
> For unifying devices, we can have up to 6 devices paired to a
> receiver, 3 can be used at the same time (connected).
> For the cheap receivers, we can enumerate 2 paired devices, but they
> are not necessarily connected too.
> 
> Historically, when I first wrote the hid-logitech-hidpp driver, I
> wanted to not export a non connected device. But as mentioned by
> Filipe, this was posing issues mainly for keyboards, because generally
> the first thing you type on a keyboard is your password, and you don't
> necessarily have the feedback to see which keys you typed.
> 
> So we (Nestor and I) decided to almost always create the input nodes
> when the device was not connected. The exceptions are when we need
> some device communication to set up the input node: so just for the
> touchpads.

Ok.


>>> Could be that we can distinguish between "paired" and "connected"
>>> and that we are enumerating "paired" but not (yet) "connected"
>>> devices already because of what you say, I've not touched this
>>> code in a while.
> 
> That is correct. Paired doesn't mean connected.
> 
>>
>> We create nodes for all paired devices, no matter if they are connected
>> or not.
>>
>>>>>> This could solved by buffering those packets, but that is a bad solution as
>>>>>> it would mess up the timings.
>>>>>>
>>>>>> At the moment the created node includes both normal HID and vendor
>>>>>> usages. To solve this problem, I propose that instead of creating a
>>>>>> single device node that contains all usages, we create one for normal
>>>>>> HID, which would exist all the time, and one for the vendor usage,
>>>>>> which would go away when the device disconnects. >
>>>>>> This slight behavior change will affect userspace. Two hidraw nodes
>>>>>> would be created instead of one. We need to make sure the current
>>>>>> userspace stacks interfacing with this would be able to properly handle
>>>>>> such changes.
>>>>>>
>>>>>> What do you think of this approach? Anyone has a better idea?
>>>>>
>>>>> The suggested approach sounds fragile and like it adds complexity to
>>>>> an already not simple driver.
> 
> OTOH, this is what we have been trying to do in the kernel for years
> now: have one single node per application/usage, so we can rely on
> some valid data from the user space.
> 
> I don't think the complexity of the driver should be a problem here.
> Yes, it's a complex one, but introducing a new API for that is a no
> from me.

udev change events are not "adding a new API" there are a well known
API using e.g. for monitor plug/unplug in the drm subsys, etc. Yes
using them in the HID subsys this way is somewhat new.

>>>> I understand, that is totally reasonable. I am working on a CI for the
>>>> driver if that helps.
>>>>
>>>>> It would be helpful to first describe the actual problem you are trying
>>>>> to fix (rather then suggesting a solution without clearly defining the
>>>>> problem) and then we can see from there.
>>>>
>>>> I though I described it good enough in the first paragraph but I guess
>>>> not, sorry. You should be able to get it from my comments above, if not
>>>> please let me know :)
>>>
>>> No problem, I have enough context now. I personally like my udev change
>>> event idea, which seems more KISS. But ultimately this is Benjamin's call.
>>
>> Yes, I don't know about the application details (I'll have to find out
>> :P) but it makes more sense to me. It avoids breaking the userspace
>> behavior.
> 
> The udev change doesn't "break" userspace, but it is a new API. And
> that means nightmare from the application point of view:
> How do they know that the new API will be used? There is a high chance
> they won't, so for backward compatibility they will start listening to
> the hidraw node to match the current kernel behavior, and then we
> would just have added a new API for nothing.

I agree that finding out if the udev change events are supported
is a bit of a challenge from userspace.

But if I understood you correctly, then libratbag currently does
not keep listening to detect the connect, but rather atm this just
does not work, in which case it does not need to know if the new API
is there it can just assume; and even if it does need to know it
check the kernel-version number for that. Not pretty but that is
e.g. what libusb does to detect if certain "undetectable" features
are there, which admittedly is not ideal.

>> Benjamin, what do you think?
> 
> My point of view is:
> - don't add a new kernel API

Again I believe calling udev change events "a new kernel API"
is exaggerating things a bit.

> - rely on existing and supported user space behavior
> - ultimately, teach user space how to deal with the current situation
> 
> So right now I think Filipe's proposal is the best bad solution. I
> would rank the udev event as worse than Filipe's solution because that
> involves both userspace and kernel space changes.

The udev solution might require changes on both sides, but they
are very small easily reviewable changes. Anyways as I said this
is your call.

> However, the proposal to add/remove the HID++ hidraw node on
> connect/disconnect really doesn't appeal to me because I am pretty
> sure we will have the same kind of issues that we are facing with
> keyboards. There might be an application that listens to the connect
> HID++ notification and turns the light on in the room whenever the
> mouse reconnects (and turns it off when the mouse disconnects because
> that means you left the room).
> 
> So right now, as I am writing this, I think we should split the HID++
> node into its own hidraw node. This will allow application to listen
> to this node without being a keylogger as we will be filtering the key
> events in the actual input and the other hidraw nodes.

It took my a while to wrap my head around this, what you mean here
is that each paired device gets 2 nodes:

1) A full hidraw node which gets send all events from that paired device
2) A special HID++ node which only gets forwarded HID++ events

And that second node is only present when the device is connected?

Oh, I guess not, I guess you want them both to always be present, but
now apps can safely keep the HID++ one open because that would not
make the app a keylogger.

> But then, applications will have to learn how to listen to the HID++
> node, especially given that they are talking HID++ in the first place.

So this:
1. Would still require changes to both the kernel and userspace side
2. Would require some magic way for the app to detect which hidraw node is which
3. Would require some magic way for the app to detect that the kernel is new
    enough to support the new spearate HID++ node to avoid waiting for it to show
    up indefinitely
4. Would use existing kernel API in a new way in the form of a special type of
    hidraw node which we did not have before.

IOW AFAICT this has all the disadvantages of my udev change proposal.

I guess the etxra hidraw node proposal does have the advantage that it would give
us a fd which is safe(r) (*) to pass around for doing HID++ things and with some
filtering we might even make it completely safe, that would be a good reason to
go that route.

*) safer, not entirely safe as HID++ can send at least the media keys through HID++
instead of the normal input reports, see e.g. the CONSUMER_VENDOR_KEYS handling
in hid-logitech-hidpp.c and if IIRC it might even be possible to request the
normal keys to be send through HID++.

Regards,

Hans

