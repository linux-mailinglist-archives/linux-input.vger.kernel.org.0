Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA2B154B8C
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2020 20:02:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727698AbgBFTCi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Feb 2020 14:02:38 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42106 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726990AbgBFTCi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Feb 2020 14:02:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581015757;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=F0DAc0z1SZVfBa0IPrmdPF/Nm1ZYbwJj0YjFxU4JvCI=;
        b=Nt45fNSD28dsyjo4lTcraAs8zz09q19OerOEwLBZn5clwVgOsfIV3AGYLp7YFC7E8Uh8eK
        JFrxVMnoILoYcPaF6WMX5ckoVaNb+ZihdTPkjt4aK8e5GYi7mcV7znndxgHNSA2rH8ym5x
        Yi3JYG97HciHHFfDq0hab1JcR3F3E50=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-k0rSOrcTP8W9ZC9WgnJWJg-1; Thu, 06 Feb 2020 14:02:29 -0500
X-MC-Unique: k0rSOrcTP8W9ZC9WgnJWJg-1
Received: by mail-wr1-f70.google.com with SMTP id t6so3995395wru.3
        for <linux-input@vger.kernel.org>; Thu, 06 Feb 2020 11:02:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F0DAc0z1SZVfBa0IPrmdPF/Nm1ZYbwJj0YjFxU4JvCI=;
        b=k7uvGaQFsdVMvj4/FlTEXu6b5FYPU0ttAlsOv7E+T5esXPRL+deFel4ZLtD/LdI7g2
         WLPIPMfGT7iZr5hqk8D3SGjTWhGFdWokQlOxGOYje/7MsZlPpffXtNWHukyMY5ZumSNQ
         mwihqdSpjurBaXEpkUVmDzsAwr8ExInX+qFRvowkG4dqBWEjsVLdHJdDdKTGHxFjl/R4
         NegGLsYPhyBqKUOIVwG7D5VLn/eq024S0EPCzN0WC7JjbLJmbEH2og+aykSGiRl7DC7+
         7i5yDeFtmaycs4SB2KyyZnPdDtu9SqcGza4uJdjF1XEY6FVj7Y1nxzGlUx5JmNz+khlD
         IBoQ==
X-Gm-Message-State: APjAAAUYG+cB98YgolRW/M4fY7KQG3FzDAUYCTaimaG/iDfiolSkekPt
        J4am2j1C/OAvQMlifjp7sgk+A1Fl++0/AumoQwqgRH7sKZhPTeeWnMgoZUxdoss1rD9VP2XZrwL
        oh2URbui2iVtKpY3jnBW/Fy4=
X-Received: by 2002:a1c:6085:: with SMTP id u127mr6036238wmb.144.1581015748116;
        Thu, 06 Feb 2020 11:02:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqyRMOHAmpZpZe+FfOi8RXdd5gkBNMR7NB1n3xwjT7TRl9hI8GjrNFfCmTefr8B4Wxml+qn1Ig==
X-Received: by 2002:a1c:6085:: with SMTP id u127mr6036118wmb.144.1581015746701;
        Thu, 06 Feb 2020 11:02:26 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id c15sm284206wrt.1.2020.02.06.11.02.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2020 11:02:26 -0800 (PST)
Subject: Re: Make the hid-logitech-dj driver remove the HID++ nodes when the
 device disconnects
To:     =?UTF-8?Q?Filipe_La=c3=adns?= <lains@archlinux.org>,
        Benjamin Tissoires <btissoir@redhat.com>
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
 <80aaf01d-fd9f-49fe-44cf-67710a0d136c@redhat.com>
 <c92b913816366b8744ebcb3d067d968431cfffb2.camel@archlinux.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <28244ac8-9b8d-2950-b282-4db5cf7bf9b2@redhat.com>
Date:   Thu, 6 Feb 2020 20:02:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <c92b913816366b8744ebcb3d067d968431cfffb2.camel@archlinux.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 2/6/20 7:43 PM, Filipe Laíns wrote:
> On Thu, 2020-02-06 at 18:45 +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 2/6/20 6:01 PM, Benjamin Tissoires wrote:
>>> On Thu, Feb 6, 2020 at 4:42 PM Filipe Laíns <lains@archlinux.org> wrote:
>>>> On Thu, 2020-02-06 at 13:13 +0100, Hans de Goede wrote:
>>>>> Hi,
>>>>>
>>>>> On 2/6/20 12:51 PM, Filipe Laíns wrote:
>>>>>> On Thu, 2020-02-06 at 12:30 +0100, Hans de Goede wrote:
>>>>>>> HI,
>>>>>>>
>>>>>>> On 2/6/20 12:14 PM, Filipe Laíns wrote:
>>>>>>>> Hello,
>>>>>>>>
>>>>>>>> Right now the hid-logitech-dj driver will export one node for each
>>>>>>>> connected device, even when the device is not connected. That causes
>>>>>>>> some trouble because in userspace we don't have have any way to know if
>>>>>>>> the device is connected or not, so when we try to communicate, if the
>>>>>>>> device is disconnected it will fail.
>>>>>>>
>>>>>>> I'm a bit reluctant to make significant changes to how the
>>>>>>> hid-logitech-dj driver works. We have seen a number of regressions
>>>>>>> when it was changed to handle the non unifying receivers and I would
>>>>>>> like to avoid more regressions.
>>>>>>>
>>>>>>> Some questions:
>>>>>>> 1. What is the specific use case where you are hitting this?
>>>>>>
>>>>>> For example, in libratbag we enumerate the devices and then probe them.
>>>>>> Currently if the device is not connected, the communication fails. To
>>>>>> get the device to show up we need to replug it, so it it triggers udev,
>>>>>> or restart the daemon.
>>>>>
>>>>> Thanks, that is exactly the sort of context to your suggested changes
>>>>> which I need.
>>>>>
>>>>>>> 2. Can't the userspace tools involved by modified to handle the errors
>>>>>>> they are getting gracefully?
>>>>>>
>>>>>> They can, but the approaches I see are not optimal:
>>>>>>      - Wait for HID events coming from the device, which could never
>>>>>> happen.
>>>>>>      - Poll the device until it wakes up.
>>>>>
>>>>> I guess we do get some (other or repeated?) event when the device does
>>>>> actually connect, otherwise your suggested changes would not be possible.
>>>>
>>>> No, I was thinking to just send the HID++ version identification
>>>> routine and see if the device replies.
>>>
>>> Hmm, to continue on these questions:
>>> - yes, the current approach is to have the users of the HID++ device
>>> try to contact the device, get an error from the receiver, then keep
>>> the hidraw node open until we get something out of it, and then we can
>>> start talking to it
>>> - to your question Hans, when a device connects, it emits a HID++
>>> notification, which we should be relaying in the hidraw node. If not,
>>> well then starting to receive a key or abs event on the input node is
>>> a pretty good hint that the device connected.
>>>
>>> So at any time, the kernel knows which devices are connected among
>>> those that are paired, so the kernel knows a lot more than user space.
>>
>> Ack.
>>
>>> The main problem Filipe is facing here is that we specifically
>>> designed libratbag to *not* keep the device nodes opened, and to not
>>> poll on the input events. The reason being... we do not want libratbag
>>> to be considered as a keylogger.
>>
>> Ack.
>>
>>>>> So how about if we trigger a udev change event on the hid device instead
>>>>> when this happens ? That seems like a less invasive change on the kernel
>>>>> side and then libratbag could listen for these change events?
>>>>
>>>> Yes, that is a good idea :) I did not know this was possible but it
>>>> seems like a better approach.
>>>
>>> Not a big fan of that idea personally. This will add yet an other
>>> kernel API that we have to maintain.
>>> On Filipe's side, the hotplug support is something that has been
>>> around for quite a long time now, so we can safely expect applications
>>> to handle it properly.
>>
>> The suggested udev event change would just require a small change
>> to the existing hotplug handling, currently it responds to udev
>> "add" and "remove" events. With my suggested change in the "add"
>> path it will get an error because the device is not connected and
>> then stop adding the device. Combine this with treating "change"
>> events as "add" events and that is all that has to change on the
>> libratbag side.
>>
>> This assumes that duplicate add events are already filtered out,
>> which one has to do anyways to avoid coldplug enumeration vs
>> hotplug races.
>>
>> As for yet another kernel API to maintain, udev change events
>> already are an existing kernel API, what would be new is the hidpp
>> driver; and just the hidpp driver emitting them.
>>
>> All that is needed on the kernel side for this is to make the following
>> call when we detect a device moves from the paired to the connected state:
>>
>> 	kobject_uevent(&hdev->dev.kobj, KOBJ_CHANGE);
>>
>> And there even seems to be a precedent for this, drivers/hid/hid-wiimote-core.c
>> already does this for what seems to be similar reasons.
>>
>>
>>>>>>> 3. Is there a bugreport open about this somewhere?
>>>>>>
>>>>>> Yes, https://github.com/libratbag/libratbag/issues/785
>>>>>>
>>>>>>>> The reason we do this is because otherwise we would loose the first
>>>>>>>> packets when the device is turned on by key press. When a device is
>>>>>>>> turned on we would have to create the device node, and the packets
>>>>>>>> received while we are creating the device node would be lost.
>>>>>>>
>>>>>>> I don't believe that this is the reason, we only create hid child
>>>>>>> devices for devices reported by the receiver, but some of the non
>>>>>>> unifying hid receiver send a list of all devices paired, rather
>>>>>>> then the ones which are actually connected at that time.
>>>>>>
>>>>>> IIRC from my chats with Benjamin and Peter this is the reason, but
>>>>>> please correct me if I'm wrong.
>>>
>>> Filipe is correct here.
>>>
>>> For unifying devices, we can have up to 6 devices paired to a
>>> receiver, 3 can be used at the same time (connected).
>>> For the cheap receivers, we can enumerate 2 paired devices, but they
>>> are not necessarily connected too.
>>>
>>> Historically, when I first wrote the hid-logitech-hidpp driver, I
>>> wanted to not export a non connected device. But as mentioned by
>>> Filipe, this was posing issues mainly for keyboards, because generally
>>> the first thing you type on a keyboard is your password, and you don't
>>> necessarily have the feedback to see which keys you typed.
>>>
>>> So we (Nestor and I) decided to almost always create the input nodes
>>> when the device was not connected. The exceptions are when we need
>>> some device communication to set up the input node: so just for the
>>> touchpads.
>>
>> Ok.
>>
>>
>>>>> Could be that we can distinguish between "paired" and "connected"
>>>>> and that we are enumerating "paired" but not (yet) "connected"
>>>>> devices already because of what you say, I've not touched this
>>>>> code in a while.
>>>
>>> That is correct. Paired doesn't mean connected.
>>>
>>>> We create nodes for all paired devices, no matter if they are connected
>>>> or not.
>>>>
>>>>>>>> This could solved by buffering those packets, but that is a bad solution as
>>>>>>>> it would mess up the timings.
>>>>>>>>
>>>>>>>> At the moment the created node includes both normal HID and vendor
>>>>>>>> usages. To solve this problem, I propose that instead of creating a
>>>>>>>> single device node that contains all usages, we create one for normal
>>>>>>>> HID, which would exist all the time, and one for the vendor usage,
>>>>>>>> which would go away when the device disconnects. >
>>>>>>>> This slight behavior change will affect userspace. Two hidraw nodes
>>>>>>>> would be created instead of one. We need to make sure the current
>>>>>>>> userspace stacks interfacing with this would be able to properly handle
>>>>>>>> such changes.
>>>>>>>>
>>>>>>>> What do you think of this approach? Anyone has a better idea?
>>>>>>>
>>>>>>> The suggested approach sounds fragile and like it adds complexity to
>>>>>>> an already not simple driver.
>>>
>>> OTOH, this is what we have been trying to do in the kernel for years
>>> now: have one single node per application/usage, so we can rely on
>>> some valid data from the user space.
>>>
>>> I don't think the complexity of the driver should be a problem here.
>>> Yes, it's a complex one, but introducing a new API for that is a no
>>> from me.
>>
>> udev change events are not "adding a new API" there are a well known
>> API using e.g. for monitor plug/unplug in the drm subsys, etc. Yes
>> using them in the HID subsys this way is somewhat new.
>>
>>>>>> I understand, that is totally reasonable. I am working on a CI for the
>>>>>> driver if that helps.
>>>>>>
>>>>>>> It would be helpful to first describe the actual problem you are trying
>>>>>>> to fix (rather then suggesting a solution without clearly defining the
>>>>>>> problem) and then we can see from there.
>>>>>>
>>>>>> I though I described it good enough in the first paragraph but I guess
>>>>>> not, sorry. You should be able to get it from my comments above, if not
>>>>>> please let me know :)
>>>>>
>>>>> No problem, I have enough context now. I personally like my udev change
>>>>> event idea, which seems more KISS. But ultimately this is Benjamin's call.
>>>>
>>>> Yes, I don't know about the application details (I'll have to find out
>>>> :P) but it makes more sense to me. It avoids breaking the userspace
>>>> behavior.
>>>
>>> The udev change doesn't "break" userspace, but it is a new API. And
>>> that means nightmare from the application point of view:
>>> How do they know that the new API will be used? There is a high chance
>>> they won't, so for backward compatibility they will start listening to
>>> the hidraw node to match the current kernel behavior, and then we
>>> would just have added a new API for nothing.
>>
>> I agree that finding out if the udev change events are supported
>> is a bit of a challenge from userspace.
>>
>> But if I understood you correctly, then libratbag currently does
>> not keep listening to detect the connect, but rather atm this just
>> does not work, in which case it does not need to know if the new API
>> is there it can just assume; and even if it does need to know it
>> check the kernel-version number for that. Not pretty but that is
>> e.g. what libusb does to detect if certain "undetectable" features
>> are there, which admittedly is not ideal.
> 
> Actually, since the latest release, libratbag would not require any
> changes. Please note that the proposal is to split the current hidraw
> node in two, one with just normal HID events, and one with just HID++.
> In 26c534cc742dfdbb14a889287f7771063be834cc (libratbag) we started
> parsing the report descriptors to find out the supported report IDs,
> the node with the normal HID events will fail on hidpp20_device_new
> because it won't support any HID++ reports.
> 
>>>> Benjamin, what do you think?
>>>
>>> My point of view is:
>>> - don't add a new kernel API
>>
>> Again I believe calling udev change events "a new kernel API"
>> is exaggerating things a bit.
>>
>>> - rely on existing and supported user space behavior
>>> - ultimately, teach user space how to deal with the current situation
>>>
>>> So right now I think Filipe's proposal is the best bad solution. I
>>> would rank the udev event as worse than Filipe's solution because that
>>> involves both userspace and kernel space changes.
>>
>> The udev solution might require changes on both sides, but they
>> are very small easily reviewable changes. Anyways as I said this
>> is your call.
>>
>>> However, the proposal to add/remove the HID++ hidraw node on
>>> connect/disconnect really doesn't appeal to me because I am pretty
>>> sure we will have the same kind of issues that we are facing with
>>> keyboards. There might be an application that listens to the connect
>>> HID++ notification and turns the light on in the room whenever the
>>> mouse reconnects (and turns it off when the mouse disconnects because
>>> that means you left the room).
>>>
>>> So right now, as I am writing this, I think we should split the HID++
>>> node into its own hidraw node. This will allow application to listen
>>> to this node without being a keylogger as we will be filtering the key
>>> events in the actual input and the other hidraw nodes.
> 
> Do we pass the HID connection notification to userspace? That is a
> receiver notification, and I though the driver was only passing the
> device packets.
> 
> I don't understand why hotplugging is an issue? For me it's a feature.
> The userspace stack should definitely be able to handle it, that's how
> the corded devices work. By creating/removing the device node on device
> connect/disconnect we get the same behavior as when plugging/unplugging
> the mouse with a cable.
> 
> Am I missing something here?
> 
>> It took my a while to wrap my head around this, what you mean here
>> is that each paired device gets 2 nodes:
>>
>> 1) A full hidraw node which gets send all events from that paired device
> 
> Like I said above, we want to split the node in two. One for the
> standard HID events (mouse movement, key press, etc.) and one just for
> HID++. From my understanding, this is also what Benjamin means.

I see, so how would this work at the kernel level? AFAICT with the
current kernel code this would require logitech-dj to create 2 devices
under /sys/bus/hid/devices one for the HID++ descriptors + events
and one for the rest. But how is the drivers/hid/hid-logitech-hidpp.c
driver then supposed to work, AFAICT that needs access to both at
the same time.

Or is the plan to modify the hidraw driver for this somehow?

I guess how this will work on the kernel side is mostly a question for Benjamin.

I do see how this nicely solves the problem for userspace though,
it is a bit weird to have hidraw devices with fake descriptors and
which do not get all events, but we already have that with the
hidraw devices created for the devices behind the receiver, so I see
no harm in splitting these "fake" hidraw devices into 2 fake devices
each.

If someone wants to e.g. capture the full stream for debugging they
can use the hidraw of the receiver for that. So I guess that this is
an elegant solution to the problem.

Regards,

Hans

