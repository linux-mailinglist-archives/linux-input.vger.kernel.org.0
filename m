Return-Path: <linux-input+bounces-11003-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE53DA6A14E
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 09:27:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 419ED7A33D0
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 08:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C656620FA98;
	Thu, 20 Mar 2025 08:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="INUCbk5q"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0257920D519;
	Thu, 20 Mar 2025 08:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742459230; cv=none; b=ugCH1nPSf0GsOvCEIrTTozECq6uWIFrW9UxLRrbGqu3XIhbsiuDjftczWgJmjauvQrEriHkanfGcAwDBy+fnwR2vZt0cIvC4A/MQP02+Ri71igGb0B9c3GWlR97FWvM5SdhQS2Nh5HpD4a/wyZrXuJ1Y5Tbd687Gx+c1RrudZgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742459230; c=relaxed/simple;
	bh=UphgpuAPMf3tf7KQM2Boilb2G7jKlAXNIWMYx3DdvMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJBSGJmV/m2ZfGf/CGwRDMoH2RQYucZ7/lNAN1WFJVHUnHjQYFAJ43eoBmDoOJIJ3Tv0sq85xzvxCh/KAsBjpK5y6eQfKyj32+lgHF/EjLPbbe4k/skV5J/hdsn1HWEa/FJJGtAkatrFKHUgvwBglpPSqnteJORXBFGH65XFDZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=INUCbk5q; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 30ECD2E086E4;
	Thu, 20 Mar 2025 10:27:01 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742459223;
	bh=cGT8Npx0AQvi1FCK0MCkuVQ1ID1zQgypm7GeoNfZDgI=;
	h=Received:From:Subject:To;
	b=INUCbk5qzlJs4QgOMoKRR+7FwiRboPDHDHeMAGmLyU8fTkoe02rht/wwAPCLMxFAD
	 Ze6ZRbPuXLhPqL8HHfc3i/iUSVhZVnPqmLb2LQnWhl5mvQV4mKMQTvKob52wW3rusn
	 RTHYLd39RoxJ6wW6GIXC+B+cyffg+dfo+0+xLVYU=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.173) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f173.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-307c13298eeso6110181fa.0;
        Thu, 20 Mar 2025 01:27:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVcrjy0zHsROE85x3P0YH6JUnBx7kOLaWXH9mroUM+yhujwkEN6IHb4u4eXtZ6+S2HwOCScP0dpvPg9Ng==@vger.kernel.org,
 AJvYcCX0ao4ITCod0ffrsFsFpU4ThEH7fpFUtVe45XEuoRvpGadQHXr+pV8ojA8NEocIVA3VmjdYkJAyMBNJKzfd@vger.kernel.org
X-Gm-Message-State: AOJu0YxJOgL3r1e0y7ba9xlQJYiHkBaotYgCmgZlCna/L4EDr6A6InYi
	xh0KOajAJbjSoLffF3B0fWBwapkB5NB4ceF7bX/+f5//sZwoxtSqnZGZR6yDXZN7PJt4XozIj7Q
	2EFb5eN7uwuFap0KVaeS4PAL1myc=
X-Google-Smtp-Source: 
 AGHT+IFb6NXzWVly1BTXf5EamfZpu1xsr1fWnjr2cAli/V2e3+3qw/aVgKYYNiacfad7jo2065ylnm070JzKFec3PlQ=
X-Received: by 2002:a2e:b8cb:0:b0:30c:1aa6:5565 with SMTP id
 38308e7fff4ca-30d727d4064mr9007151fa.20.1742459220412; Thu, 20 Mar 2025
 01:27:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319191320.10092-1-lkml@antheas.dev>
 <bbc18a3d-fd01-420c-b616-4a1757d4e8ed@app.fastmail.com>
In-Reply-To: <bbc18a3d-fd01-420c-b616-4a1757d4e8ed@app.fastmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 20 Mar 2025 09:26:48 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwF1agMaBdxNjc8uox0GfH1D4wtiFPF6QiibMsTaeeYf_g@mail.gmail.com>
X-Gm-Features: AQ5f1Jpv3uklShMQoOBKUA46PXrDKs26BnmQHdtXh2sndA444q0vhOug4rTOans
Message-ID: 
 <CAGwozwF1agMaBdxNjc8uox0GfH1D4wtiFPF6QiibMsTaeeYf_g@mail.gmail.com>
Subject: Re: [PATCH 00/11] HID: asus: hid-asus and asus-wmi backlight
 unification, Z13 QOL improvements
To: Luke Jones <luke@ljones.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <174245922164.8458.8395070378525584835@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Thu, 20 Mar 2025 at 07:10, Luke Jones <luke@ljones.dev> wrote:
>
> Hi Antheas,
>
> On Thu, 20 Mar 2025, at 8:13 AM, Antheas Kapenekakis wrote:
> > This is a three part series that does the following: first, it cleans u=
p
> > the hid-asus driver initialization, preventing excess renames and dmesg
> > errors on ROG devices. Then, it adds support for the Z13 2025 keyboard,
> > by fixing its keyboard to not be stuck in BIOS mode and enabling its fa=
n
> > key. Finally, the bigger piece of this series is the unification of the
> > backlight controls between hid-asus and asus-wmi.
> >
> > This requires some context. First, some ROG devices expose both WMI and
> > HID controls for RGB. In addition, some ROG devices (such as the Z13)
> > have two AURA devices where both have backlight controls (lightbar and
> > keyboard). Under Windows, Armoury Crate exposes a single brightness con=
trol
> > for all Aura devices.
> >
> > However, currently in the linux kernel this is not the case, with asus-=
wmi
> > and hid-asus relying on a quirk system to figure out which should contr=
ol
> > the backlight. But what about the other one? There might be silent
> > regressions such as part of the RGB of the device not responding proper=
ly.
> >
> > In the Z13, this is the case, with a race condition causing the lightba=
r
> > to control the asus::kbd_backlight device most of the time, with the
> > keyboard being renamed to asus::kbd_backlight_1 and not doing anything
> > under KDE controls.
> >
> > Here, we should note that most backlight handlers are hardcoded to chec=
k
> > for backlight once, and for one backlight, during boot, so any other
> > solution would require a large rewrite of userspace.
>
> This makes me wish there was better standardization. Maybe filing some re=
ports upstream to those various projects could get the ball rolling?

I think KDE has some improvements for it for multi-device support. But
specifically for brightness, it seems that all currently supported
manufacturers work fine with this so it would be a lot of work just
for asus to do this through userspace.

> > Even when brightness controls are fixed, we still have the problem of t=
he
> > backlight key being on/off when controlled by KDE and 0/33/66/100 when
> > the device has a WMI keyboard. Ideally, we would like the 0/33/66/100 t=
o
> > be done under hid as well, regardless of whether the backlight of the
> > device is controlled by WMI or HID.
> >
> > Therefore, this is what the third part of this series does. It sets up
> > asus-wmi to expose accepting listeners for the asus::kbd_backlight devi=
ce
> > and being the one that sets it up. Then, it makes hid-asus devices
> > register a listener there, so that all of them are controlled by
> > asus::kbd_backlight. Finally, it adds an event handler for keyboard key=
s,
> > so that HID led controls are handled by the kernel instead of userspace=
.
> > This way, even when userspace is not active the key works, and we get t=
he
> > desired behavior of 0/33/66/100 across all Aura devices (currently, tha=
t
> > is keyboards, and embedded devices such as lightbars). This results
> > removing the quirk system as well, eliminating a point of failure.
>
> Nice, I'd been looking at doing something similar but unfortunately hadn'=
t the time for it, nor the device appropriate for testing (keyboard, detach=
able, lightbar). TBH I wish there was a much better way in kernel to handle=
 these sorts of lighting situations, especially given that we have laptops =
across vendors and models with different modes, zones, per-key, MCU mode vs=
 software mode etc etc. There is a *very* long thread on lkml bikeshedding =
it all too - see https://lore.kernel.org/lkml/20231011190017.1230898-1-wse@=
tuxedocomputers.com/
>
> The LampArray thing is out of scope for this, but I thought maybe worth m=
entioning in case you weren't aware. The major pitfall of it is that per-ke=
y devices update per-row and when you do a single key update to update a wh=
ole keyboard it sends N-Key amounts of packets..
>
> Off-topic though. But if you have some ideas please email me.

For me, I think when it comes to Asus, getting the brightness to work
is 90% of the way. Then, getting simple RGB that works with KDE but if
the KDE option is ticked off it defers to other userspace programs
such as your own is the other 10%.

And for that, I think having hid-asus create its own handlers in
addition to the one for backlight in WMI would be appropriate

> > I tested this on an Asus Z13 2025, and testing by other devices would b=
e
> > appreciated for sure. This series is designed to be transparent to
> > userspace behavior-wise compared previous kernels, with all existing
> > laptops either having the same behavior or being better.
>
> I have a handful of laptops I can test, including my old GA501, I'll get =
on it.
>
> > The Z13 keyboard folio RGB controls work beautifully, with KDE led
> > notifications working and doing 0/33/66/100 as expected. This also happ=
ens
> > with hotplugging, as the lightbar is always available and keeps the
> > endpoint alive from boot, even if the folio is not connected (a quirk
> > can be added later if there is a device where this is not the case).
>
> Very good. This will make a lot of folks happy, I suspect the Z13 is goin=
g to be a very popular device.
>
> > The first two parts of the series can also be merged independently of t=
he
> > third part, so we can iterate on that more. Perhaps there is a better w=
ay
> > to handle this cohesion,
>
> After a quick cursory look, this looks good so far. Perhaps after review =
and iteration you could submit as an independent series to get those parts =
in quicker - but hey we can cross that when we get to it.
>
> > Oh, by the way Luke, I developed this series with a variant of
> > your Armoury series merged, and only switched to 6.14-v7 for this
> > submission. You will be happy to know that there are no conflicts :)
> > (at least with that version from ~January). Also, please factcheck
> > my initialization sequence is correct in the 0x5d and 0x5e devices
> > you added when you made that refactor last year. Are those handshakes
> > needed?
>
> I would hope the armoury driver stays out of the way of most things, I tr=
ied to make it independent. The handshakes are needed for sure, depending o=
n device it may be partial or more, but it's always been the same ASCII rig=
ht back to when I first started on this with a 2018 laptop - we never bothe=
red with the response check though. I do forget what required the 0x5e init=
, I'll need to check through some old notes.
>
> I'll apologize in advance for the time it might take me to review - I'll =
attempt some now for the smaller patches, but hopefully I can get some time=
 in this weekend and we can work together to make asus stuff even better.
>
> Cheers,
> Luke.
>
> > Antheas Kapenekakis (11):
> >   HID: asus: refactor init sequence per spec
> >   HID: asus: cleanup keyboard backlight check
> >   HID: asus: prevent binding to all HID devices on ROG
> >   HID: asus: rename keyboard3 to Z13_FOLIO
> >   HID: asus: add Asus Z13 2025 Fan key
> >   HID: asus: introduce small delay on Asus Z13 RGB init
> >   platform/x86: asus-wmi: Add support for multiple kbd RGB handlers
> >   HID: asus: listen to the asus-wmi brightness device instead of
> >     creating one
> >   platform/x86: asus-wmi: remove unused keyboard backlight quirk
> >   platform/x86: asus-wmi: add keyboard brightness event handler
> >   HID: asus: add support for the asus-wmi brightness handler
> >
> >  drivers/hid/hid-asus.c                     | 220 ++++++++++++---------
> >  drivers/hid/hid-ids.h                      |   2 +-
> >  drivers/platform/x86/asus-wmi.c            | 137 +++++++++++--
> >  include/linux/platform_data/x86/asus-wmi.h |  66 +++----
> >  4 files changed, 279 insertions(+), 146 deletions(-)
> >
> >
> > base-commit: 4701f33a10702d5fc577c32434eb62adde0a1ae1
> > --
> > 2.48.1

