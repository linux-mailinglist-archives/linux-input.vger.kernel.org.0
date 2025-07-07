Return-Path: <linux-input+bounces-13403-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC27AAFB8B8
	for <lists+linux-input@lfdr.de>; Mon,  7 Jul 2025 18:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51E591AA0D1F
	for <lists+linux-input@lfdr.de>; Mon,  7 Jul 2025 16:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCD9221F1F;
	Mon,  7 Jul 2025 16:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sjohal.net header.i=@sjohal.net header.b="DMQlz5CP"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-190f.mail.infomaniak.ch (smtp-190f.mail.infomaniak.ch [185.125.25.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43913155A25
	for <linux-input@vger.kernel.org>; Mon,  7 Jul 2025 16:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751906137; cv=none; b=qiMfwNk1PSH4i14jH40J7ovSXuDXHm5Dl8nozz9/Bb5I5ixdgewFkLj87yx3cQpocDpHAZAlw0H3gf8PWeBdq7KDTGfh7e4yn6neODAdmEnyGRaPsgl3aHXWiUEsV0OI+mVa/DL0xAgYPppgg7yX2QUOPT8VEl9OcTWti/yH4Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751906137; c=relaxed/simple;
	bh=m1m99lJ/laGK+xF8SdlA/A0XDAa3r6buLplzFHO1fHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q3mo+IAe7uT6bIAcNKSLe34E35WifhLGAPZIDD1SFJpzh7Hsn0GuoOLxHD2EvWBJ7AOg03QQb8cl59kT0NXBX9KYogYIrHe51xVDN8cvC5d7Bb4FPjuKt7Yzzz+9OqXvipIzaMxm1Y1rm8dmJ75rDLEUuJNEy3x5otXctuyq2tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sjohal.net; spf=pass smtp.mailfrom=sjohal.net; dkim=pass (2048-bit key) header.d=sjohal.net header.i=@sjohal.net header.b=DMQlz5CP; arc=none smtp.client-ip=185.125.25.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sjohal.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sjohal.net
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bbSfW682FzctR;
	Mon,  7 Jul 2025 17:22:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sjohal.net;
	s=20250422; t=1751901763;
	bh=yiHrsxu2dnstvcoXCQ81yiQO1f2+FQwt0RKeJ4jqLsE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DMQlz5CPYv1VKK9PjVinzOj1Tsi40da8PbEjQCuhUqj1YYgWlh+1+uRyVA2ogPHym
	 CrLm8fSM8xKxkZykBBmPvsbBtLwQXWnL2DmrinqOPectQqidSRc0U410JuJK4LSUbS
	 tAXc3QGtyrYsDcDD/ncW+wP/CT45OZmoXNdQ3/lBiGQzn3sMR14oCeOMYtz8FUDdpf
	 BDWa+2EOnEd6QWTG7AsOWSWBV9UvM95ha2a9t1iPN5lrLAYjtjapyh1xchcwto5s2M
	 lkin2UZ/Hcym2BT6ibbP4gj/SxoXLh/0IRDDXFvenUMIT8v1+RG8xH76WzirqOwqN3
	 d9S7KSk1I8Vyg==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4bbSfV53ByzKwT;
	Mon,  7 Jul 2025 17:22:42 +0200 (CEST)
From: Saihaj Johal <personal@sjohal.net>
To: Aditya Garg <gargaditya08@live.com>, linux-input@vger.kernel.org,
 linux@emily.st
Cc: "Daniel J. Ogorchock" <djogorchock@gmail.com>,
 Nadia Holmquist Pedersen <nadia@nhp.sh>,
 Ryan McClelland <rymcclel@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: hid_nintendo Switch 2 Pro Controller support - where to start?
Date: Mon, 07 Jul 2025 16:22:42 +0100
Message-ID: <2753963.lGaqSPkdTl@saihaj-mainpc>
In-Reply-To: <0bc102b6-cdd0-4f1f-910d-db752c52eb85@app.fastmail.com>
References:
 <3642543.dWV9SEqChM@saihaj-mainpc>
 <PN3PR01MB95979E06C65B4BE4051BF9B7B84CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <0bc102b6-cdd0-4f1f-910d-db752c52eb85@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-Infomaniak-Routing: alpha

On Sunday, 6 July 2025 22:48:43 British Summer Time linux@emily.st wrote:
> On Sat, Jul 5, 2025, at 23:27, Aditya Garg wrote:
> > On 06-07-2025 12:18 am, Saihaj Johal wrote:
> >> Hello,
> >> I recently got a Nintendo Switch 2 Pro Controller that is not currently
> >> directly supported by the kernel like how the Switch 1 controllers are.
> >> Looking in "hid-ids.h", there is no product ID for the new controller
> >> (got
> >> 0x2069 from "lsusb -v"). The device class shows as miscellaneous device,
> >> and the controller does not show the player LEDs to show it is active
> >> (it only charges over USB, alongside showing in "lsusb" as well as
> >> showing as a USB audio device for the headphone jack on the bottom).
> >> However, I have managed to get it to work as a HID device using this
> >> website (https://
> >> handheldlegend.github.io/procon2tool/) which uses WebUSB to send the
> >> right
> >> commands to make the controller turn on fully. After enabling, this setup
> >> seemingly works with the existing evdev system, although with some
> >> bizarre
> >> changes like the left stick's up and down being reversed (at least in
> >> KDE's
> >> game controller settings). The first step would likely be to add the
> >> device ID to "hid-ids.h", but from there where should I go in order to
> >> perhaps work on full support? I assume anything would work on the things
> >> discovered already by the WebUSB enabler tool, however I am very new to
> >> C and kernel development in general.
> > 
> > Simply mailing the mailing list won't get you replies. You should also
> > email relevant maintainers.
> > 
> > Ccing them
> 
> Hi, in 2022 I spent some time customizing the existing `hid_nintendo` driver
> to add support for a few more first-party Nintendo controllers made for the
> Nintendo Switch. I no longer work on this, since my day job keeps me very
> busy, but I can try to share a little bit about the obstacles I
> encountered.
> 
> When I first encountered the `hid_nintendo` driver, it was written very
> specifically to handle the original first-party Nintendo Switch
> controllers, most specifically the Joy-Cons. Part of what I did was to
> attempt to generalize the driver somewhat to make it easier to add support
> for other kinds of controllers. I did **not** succeed in completing this
> work, but I did make enough progress to succeed in my goal of supporting
> the N64 and Genesis controllers. And I know that some people were
> successful in using the driver that I forked.
> 
> Although I was not directly involved in incorporating this code into the
> Linux kernel again, I am gratified that people found it useful enough to
> incorporate.
> 
> I don't really know to what extent it's going to be necessary to rework the
> existing driver, or whether it's appropriate to create a new driver for the
> second generation of the Nintendo Switch input peripherals. Since this is a
> new generation of hardware device, there may be some differences in how it
> communicates over USB or Bluetooth. That is a bit beyond my knowledge, and
> I don't know if that information has been fully reverse engineered yet. It
> probably should not be taken for granted that what worked with the original
> Nintendo Switch controllers will work with the second generation as well. I
> would defer to the experts on this list.
> 
> Assuming that you want to experiment simply with trying to adapt the current
> driver to handle the newer peripherals, you will first need to modify the
> device IDs, as you've already discovered, in `hid-ids.h`. You will also
> need to modify the driver slightly to "claim" those peripherals (to tell
> the input subsystem which driver handles those device inputs). If you are
> successful in allowing the existing driver to talk to the new Switch 2
> controllers, then you must determine the numerical codes the controller
> emits when certain inputs are used and to map those to the actual buttons
> being used. Specifically, you must find a way to intercept the numerical
> codes that are coming from the controller, determine which inputs those
> control codes map to, and then calling the API of the kernel to create the
> correct inputs. I recall that when I did this, I think I read the codes out
> of the raw input device exposed by the kernel (somewhere in /dev/input, I
> think?), and then wrote down on paper which codes I saw when I pressed
> which buttons. Then I followed the existing pattern of how the kernel
> driver mapped those input codes to the existing kernel inputs. The current
> driver has many good examples of this in action.
> 
> **Take all this with a grain of salt.** I did this work years ago. I was
> never really a Linux kernel developer, and I am very rusty on how the
> driver worked. I can only remember the generalities, and I would again
> defer to the experts on this list to correct any mistakes I've
> inadvertently added here. I hope this helps since I was doing a very
> similar thing to what you're doing now. Best of luck.
Hi,
Thank you for the advice on trying to make the driver work. I have now 
attempted adding the IDs to the existing hid_nintendo driver, however to no 
avail. The driver definitely was doing something, considering the WebUSB 
enabler stopped working when that changed driver was in use, but not enough. 
It seems it would likely be best for the Switch 2 peripherals to be part of a 
new driver, as they seem to communicate in an entirely different way. From what 
I can gather from the documentation of the developer of the WebUSB enabler 
tool (https://docs.handheldlegend.com/s/link-zone/doc/usb-initialization-fisHohwe4m) the Switch 2 controllers, at least over USB, send a HID command to 
enable the controller, also containing the console's MAC address (guess we 
could use all zeroes for the kernel driver?) probably to pair the controller 
to the console. Then, another HID command sets the player LED to make the 
controller fully functional. After that, however, it seems like it would 
function like a generic HID controller based on the behaviour with the enabler 
(so not much driver work needed there), although we would need to configure the 
inputs in this new driver to send the right buttons to the rest of the system.  
The documentation says some of the HID commands needed to make it work, but 
either there is more needed that the enabler does or I'm struggling with 
sending HID commands properly to the controller (trying hidapitester as well 
as just echo to /dev/hidraw6) , so I've hit a dead end, as the controller does 
nothing without those commands being sent. This would likely be something to 
pick up for someone who has the experience in working with raw HID commands. 
Thank you for your assistance,
Saihaj



