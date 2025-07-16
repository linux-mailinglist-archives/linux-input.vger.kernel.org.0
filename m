Return-Path: <linux-input+bounces-13572-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95797B08134
	for <lists+linux-input@lfdr.de>; Thu, 17 Jul 2025 02:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8490581A04
	for <lists+linux-input@lfdr.de>; Thu, 17 Jul 2025 00:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A9DB635;
	Thu, 17 Jul 2025 00:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="df8De5A5"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06D6191
	for <linux-input@vger.kernel.org>; Thu, 17 Jul 2025 00:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752710495; cv=none; b=YNVeGwXqhCyvrdKmxQoJpzJE8b+XVBpu6ATvKe2PJaJEfeVRowwFoc+HoxJNfWqKgifjW80IUTZP7Jgo0l6ui3bb+RE1OOGe0x3Csgy+Qic1C0TG4jG/pbJH1ar2LQ9R+++Dor1+sUUwlO1kDEgG6TarH79xe1xGFDe7kbj0p3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752710495; c=relaxed/simple;
	bh=l1o88ZqB9JTsIVRXD80f3MMJ9PpEiItQXIrHzel0F5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ek0LNNV4/Opzf6KhX0m0OdJM1iRVoG11BNf48YoADGfcXU2/7P3BitNzWKpeenDMQZ91XfFoc99aqhoVykPMuWHdM7lnyk0l1fuhwYfmFSln1crPV/Aq/tX2i3foUQRtl48p26V6tuzja27WRywBhRask5U/fZ0LMe7uUtB18Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=df8De5A5; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1752710052; bh=l1o88ZqB9JTsIVRXD80f3MMJ9PpEiItQXIrHzel0F5o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=df8De5A5ulZbXofD+qdnS8CJr7BudA/RkgFKwYKGhWjF5T9l+gMoGQIjLK3JIVuIU
	 a/0sigG5IS2zYYE+njPz+SgT+CQ4Mx560vplVoFBZaV7WXE7XcB7Auh85PkVQqbQbP
	 Ffr47O13Ku7oQ//khi3jyP+v5FbWbwsJNK36tTQA6cP61AbLldaRP2dRUj56S4glLa
	 Azlii1OyjO8xblY0XUQmjb/nYjaeKN3gEFOaJHGutZHgKmaZ5cH3lcRpiHlo83S0+T
	 glo6SD7R+yilgeXq7WEjNE/KVQ5duilOhNUVAadbrDH9ZaE3HDFsAFQgu5suqRa+k1
	 mzf65cw599ogg==
Received: from [192.168.0.22] (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id C2FB8A053;
	Wed, 16 Jul 2025 16:54:11 -0700 (PDT)
Message-ID: <e1706a80-8788-47ac-98df-00ec03904df6@endrift.com>
Date: Wed, 16 Jul 2025 16:54:11 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hid_nintendo Switch 2 Pro Controller support - where to start?
To: Saihaj Johal <personal@sjohal.net>, Aditya Garg <gargaditya08@live.com>,
 linux-input@vger.kernel.org, linux@emily.st
Cc: "Daniel J. Ogorchock" <djogorchock@gmail.com>,
 Nadia Holmquist Pedersen <nadia@nhp.sh>, Ryan McClelland
 <rymcclel@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
References: <3642543.dWV9SEqChM@saihaj-mainpc>
 <PN3PR01MB95979E06C65B4BE4051BF9B7B84CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <0bc102b6-cdd0-4f1f-910d-db752c52eb85@app.fastmail.com>
 <2753963.lGaqSPkdTl@saihaj-mainpc>
Content-Language: en-US
From: Vicki Pfau <vi@endrift.com>
In-Reply-To: <2753963.lGaqSPkdTl@saihaj-mainpc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

On 7/7/25 8:22 AM, Saihaj Johal wrote:
> On Sunday, 6 July 2025 22:48:43 British Summer Time linux@emily.st wrote:
>> On Sat, Jul 5, 2025, at 23:27, Aditya Garg wrote:
>>> On 06-07-2025 12:18 am, Saihaj Johal wrote:
>>>> Hello,
>>>> I recently got a Nintendo Switch 2 Pro Controller that is not currently
>>>> directly supported by the kernel like how the Switch 1 controllers are.
>>>> Looking in "hid-ids.h", there is no product ID for the new controller
>>>> (got
>>>> 0x2069 from "lsusb -v"). The device class shows as miscellaneous device,
>>>> and the controller does not show the player LEDs to show it is active
>>>> (it only charges over USB, alongside showing in "lsusb" as well as
>>>> showing as a USB audio device for the headphone jack on the bottom).
>>>> However, I have managed to get it to work as a HID device using this
>>>> website (https://
>>>> handheldlegend.github.io/procon2tool/) which uses WebUSB to send the
>>>> right
>>>> commands to make the controller turn on fully. After enabling, this setup
>>>> seemingly works with the existing evdev system, although with some
>>>> bizarre
>>>> changes like the left stick's up and down being reversed (at least in
>>>> KDE's
>>>> game controller settings). The first step would likely be to add the
>>>> device ID to "hid-ids.h", but from there where should I go in order to
>>>> perhaps work on full support? I assume anything would work on the things
>>>> discovered already by the WebUSB enabler tool, however I am very new to
>>>> C and kernel development in general.
>>>
>>> Simply mailing the mailing list won't get you replies. You should also
>>> email relevant maintainers.
>>>
>>> Ccing them
>>
>> Hi, in 2022 I spent some time customizing the existing `hid_nintendo` driver
>> to add support for a few more first-party Nintendo controllers made for the
>> Nintendo Switch. I no longer work on this, since my day job keeps me very
>> busy, but I can try to share a little bit about the obstacles I
>> encountered.
>>
>> When I first encountered the `hid_nintendo` driver, it was written very
>> specifically to handle the original first-party Nintendo Switch
>> controllers, most specifically the Joy-Cons. Part of what I did was to
>> attempt to generalize the driver somewhat to make it easier to add support
>> for other kinds of controllers. I did **not** succeed in completing this
>> work, but I did make enough progress to succeed in my goal of supporting
>> the N64 and Genesis controllers. And I know that some people were
>> successful in using the driver that I forked.
>>
>> Although I was not directly involved in incorporating this code into the
>> Linux kernel again, I am gratified that people found it useful enough to
>> incorporate.
>>
>> I don't really know to what extent it's going to be necessary to rework the
>> existing driver, or whether it's appropriate to create a new driver for the
>> second generation of the Nintendo Switch input peripherals. Since this is a
>> new generation of hardware device, there may be some differences in how it
>> communicates over USB or Bluetooth. That is a bit beyond my knowledge, and
>> I don't know if that information has been fully reverse engineered yet. It
>> probably should not be taken for granted that what worked with the original
>> Nintendo Switch controllers will work with the second generation as well. I
>> would defer to the experts on this list.
>>
>> Assuming that you want to experiment simply with trying to adapt the current
>> driver to handle the newer peripherals, you will first need to modify the
>> device IDs, as you've already discovered, in `hid-ids.h`. You will also
>> need to modify the driver slightly to "claim" those peripherals (to tell
>> the input subsystem which driver handles those device inputs). If you are
>> successful in allowing the existing driver to talk to the new Switch 2
>> controllers, then you must determine the numerical codes the controller
>> emits when certain inputs are used and to map those to the actual buttons
>> being used. Specifically, you must find a way to intercept the numerical
>> codes that are coming from the controller, determine which inputs those
>> control codes map to, and then calling the API of the kernel to create the
>> correct inputs. I recall that when I did this, I think I read the codes out
>> of the raw input device exposed by the kernel (somewhere in /dev/input, I
>> think?), and then wrote down on paper which codes I saw when I pressed
>> which buttons. Then I followed the existing pattern of how the kernel
>> driver mapped those input codes to the existing kernel inputs. The current
>> driver has many good examples of this in action.
>>
>> **Take all this with a grain of salt.** I did this work years ago. I was
>> never really a Linux kernel developer, and I am very rusty on how the
>> driver worked. I can only remember the generalities, and I would again
>> defer to the experts on this list to correct any mistakes I've
>> inadvertently added here. I hope this helps since I was doing a very
>> similar thing to what you're doing now. Best of luck.
> Hi,
> Thank you for the advice on trying to make the driver work. I have now 
> attempted adding the IDs to the existing hid_nintendo driver, however to no 
> avail. The driver definitely was doing something, considering the WebUSB 
> enabler stopped working when that changed driver was in use, but not enough. 
> It seems it would likely be best for the Switch 2 peripherals to be part of a 
> new driver, as they seem to communicate in an entirely different way. From what 
> I can gather from the documentation of the developer of the WebUSB enabler 
> tool (https://docs.handheldlegend.com/s/link-zone/doc/usb-initialization-fisHohwe4m) the Switch 2 controllers, at least over USB, send a HID command to 
> enable the controller, also containing the console's MAC address (guess we 
> could use all zeroes for the kernel driver?) probably to pair the controller 
> to the console. Then, another HID command sets the player LED to make the 
> controller fully functional. After that, however, it seems like it would 
> function like a generic HID controller based on the behaviour with the enabler 
> (so not much driver work needed there), although we would need to configure the 
> inputs in this new driver to send the right buttons to the rest of the system.  
> The documentation says some of the HID commands needed to make it work, but 
> either there is more needed that the enabler does or I'm struggling with 
> sending HID commands properly to the controller (trying hidapitester as well 
> as just echo to /dev/hidraw6) , so I've hit a dead end, as the controller does 
> nothing without those commands being sent. This would likely be something to 
> pick up for someone who has the experience in working with raw HID commands. 
> Thank you for your assistance,
> Saihaj
> 

I have obtained various controllers--including the Pro Controller, GameCube adapter, Joy-Cons, and Charging Grip. Adding kernel support is on my todo list, though I want to bring up the SDL driver first for faster iteration and testing. Once that's working well enough, I plan to add support to the kernel. There's ongoing reverse engineering on a Discord I'm on, and it's different enough from the NS1 controllers that it's not going to be a simple process.

Vicki

