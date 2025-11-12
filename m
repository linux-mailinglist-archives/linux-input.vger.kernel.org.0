Return-Path: <linux-input+bounces-16038-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF1FC5290E
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 14:54:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2A4E44F4DDB
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 13:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5AC32E15F;
	Wed, 12 Nov 2025 13:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="kyGx+E3j"
X-Original-To: linux-input@vger.kernel.org
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA65A328B73
	for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 13:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762955006; cv=none; b=Zxv5wA5r7AoID4qEl9FWK9J8QjE5mbwkYSmgM9v5rySBncMu87vUEE4XlExTyS5Kkx+AZxtrIhUCqf6hro9qJrpZyHYT+ny3WZuzDJR81Tpv++Pif8+urNu5wa06ergUDJdwp4Tc8f7jDVI1smXnrTwOJ1/uNNpq5S2+DkebYpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762955006; c=relaxed/simple;
	bh=snGukgKDd0ZOENnTPyMTpQjDKOicTO1gh58IoyeYJwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bsFw4dpfHmKEvZCfOz4m/3XpnSzCK7v06ms/p90mwaABXm7AbCjCPzbERtMNRdmx1TNnkAG4L1bYPyphgpFoWIC9YoVfawnbeS0r1lYQxUQA3x2hiXVJOiKi1IqV7KfJofivSw/PRBZsBcSAznq3yArMDOQHcEewjh36oSu4POg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=kyGx+E3j; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id E6CC83FB27
	for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 15:43:21 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id D844A3FBB8
	for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 15:41:39 +0200 (EET)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 463E5200BF8
	for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 15:41:39 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1762954899;
	bh=1urL3KViALhCHxxOQ0g8ur01mPq/PivXTD/CCgnDU7M=;
	h=Received:From:Subject:To;
	b=kyGx+E3j89tq7epxN62cFKTeBNWNf/9mSlIQB7ckqDLv+hBj8t/MDGbtr7zqIwe5y
	 k4HIoKUBpNo0HYWQEtrkateQ2FrRco6jeP7LeAtars7d1QnIiT6xO5l631F5tt75ty
	 02eRs9rt/QHY6WH38VwaQpTZ/662KsdTkoHqjjEOhll95BKueYQbuhiC/5M6hMPJnv
	 qfrgshey/tEqma/zL7RMeTNZeHcrqEXiXpNkKWQbuCwaY6bkQ3pJEGoT4tsEUUHZaf
	 F6RGfhU7swp+w9EZtkC73hDs9CGmBmuizLvz5wtnlMiTBENlGNTSD1I1LBTZ1bVJ9W
	 EDXH5pZZhDhDw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.171) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f171.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-37902f130e1so6602701fa.1
        for <linux-input@vger.kernel.org>;
 Wed, 12 Nov 2025 05:41:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUtPzt4oBFz++0ht7PrGFR37d63OpnAQK0cSwRUWtkCU971eSUtxMS7GLFGSPKtdiGv3LYneEzrpHDbJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxDVIUHGQru/WBNevvSm/ed4EAFBB0Ab2+KVr6jJjbz3UzP6v0
	xxhiHrrvyRgmpFwya4VaL7FiXmuiVbBuU0MolV/TgCb/jRm0eT57re9SHp2tEEOCM2wpsOtM2T9
	78RRkOS6X1K/eoHKEMZc2XcUZW61MG9I=
X-Google-Smtp-Source: 
 AGHT+IGlEAUb7k7LyJn76WoIhlrA+Fy8632uwlH8TSDHOW7/YRf7L3kX7nWEIvxlP9M5ctiO0I3g5M5s4aTacQ4ryTU=
X-Received: by 2002:a2e:3e02:0:b0:338:8:7275 with SMTP id
 38308e7fff4ca-37b8c3cd1aemr6844781fa.25.1762954898745;
 Wed, 12 Nov 2025 05:41:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101104712.8011-1-lkml@antheas.dev>
 <CAGwozwE+3vkm0-amRqnNJBzxTvXabgBF9h_G_vG_L7OJj91LBg@mail.gmail.com>
 <27a74ecc-bff7-f3ae-b23e-a8362ac3a6b3@linux.intel.com>
In-Reply-To: <27a74ecc-bff7-f3ae-b23e-a8362ac3a6b3@linux.intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 12 Nov 2025 14:41:27 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGpacR=wYXpf3vOiwWNxaV6pJ6CdE-E-G1gRRpO4VHVMg@mail.gmail.com>
X-Gm-Features: AWmQ_bkzitAgz3w0OWz9tzRJbZshqAZFNIHewQ7Z62l7u2mAnnRl0sokBmHXqGU
Message-ID: 
 <CAGwozwGpacR=wYXpf3vOiwWNxaV6pJ6CdE-E-G1gRRpO4VHVMg@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Denis Benato <benato.denis96@gmail.com>,
 platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
 "Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176295489946.1819167.3801680512652095096@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 12 Nov 2025 at 14:22, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Wed, 12 Nov 2025, Antheas Kapenekakis wrote:
>
> > On Sat, 1 Nov 2025 at 11:47, Antheas Kapenekakis <lkml@antheas.dev> wro=
te:
> > >
> > > This is a two part series which does the following:
> > >   - Clean-up init sequence
> > >   - Unify backlight handling to happen under asus-wmi so that all Aur=
a
> > >     devices have synced brightness controls and the backlight button =
works
> > >     properly when it is on a USB laptop keyboard instead of one w/ WM=
I.
> > >
> > > For more context, see cover letter of V1. Since V5, I removed some pa=
tches
> > > to make this easier to merge.
> >
> > Small bump for this.
>
> I looked at v8 earlier but then got an impression some of Denis' comments
> against v7 were not taken into account in v8, which implies there will be
> delay until I've time to delve into the details (I need to understand
> things pretty deeply in such a case, which does take lots of time).
>
> Alternatively, if Denis says v8 is acceptable, then I don't need to spend
> so much time on it, but somehow I've a feeling he isn't happy with v8
> but just hasn't voiced it again...
>
> Please do realize that ignoring reviewer feedback without a very very goo=
d
> reason always risks adding delay or friction into getting things
> upstreamed. Especially, when the review comes from a person who has been
> around for me to learn to trust their reviews or from a maintainer of the
> code in question.

Sure, sorry if it came out this way. Dennis had two comments on the V7
version of the series.

The first one was that asusctl has a hang bug, which he hasn't had
time to look into yet. This should have been fixed by dropping the
HID_QUIRK_INPUT_PER_APP. I retested the series and that QUIRK was a
bit of a NOOP that does not need to be added in the future.

The second is he is concerned with dropping the 0x5d/0x5e inits. Luke
said (back in March) that it is fine to drop 0x5e because it is only
used for ANIME displays. However, for 0x5d, it is hard to verify some
of the older laptops because they have only been tested with 0x5d and
we do not have the hardware in question to test.

For this series, I re-added "initialize LED endpoint early for old
NKEY keyboards" that re-adds 0x5d for the keyboards that cannot be
tested again so this comment should be resolved too. With that in
mind, we do end up with an additional quirk/command that may be
unneeded and will remain there forever, but since it was a point of
contention, it is not worth arguing over.

So both comments should be resolved

@Denis: can give an ack if this is the case?

As for Derek's comment, he has a PR for his project where he removes
the name match for Ally devices with ample time for it to be merged
until kernel 6.19 is released. In addition, that specific software for
full functionality relies on OOT drivers on the distros it ships with,
so it is minimally affected in either case.

Moreover, that specific commit is needed for Xbox Ally devices anyway,
as the kernel kicks one of the RGB endpoints because it does not
register an input device (the check skipped by early return) so
userspace becomes unable to control RGB on a stock kernel
(hidraw/hiddev nodes are gone). For more context here, this specific
endpoint implements the RGB Lamparray protocol for Windows dynamic
lighting, and I think in an attempt to make it work properly in
Windows, Asus made it so Windows has to first disable dynamic lighting
for armoury crate RGB commands to work (the 0x5a ones over the 0xff31
hid page).

Hopefully this clears things up

Antheas

> > Unrelated but I was b4ing this series on Ubuntu 24 and got BADSIG:
> > DKIM/antheas.dev. Is there a reference for fixing this on my host?
> > Perhaps it would help with spam
>
> I see BADSIG very often these days from b4 (thanks to gmail expiring
> things after 7 days or so, I recall hearing somewhere), I just ignore the=
m
> entirely.
>
> AFAIK, that has never caused any delay to any patch in pdx86 domain so if
> that is what you thought is happening here, it's not the case.
> If your patch does appear in the pdx86 patchwork, there's even less reaso=
n
> to worry as I mostly pick patches to process using patchwork's list.

Turns out I had to update my DNS records. It should be good now.

> --
>  i.
>
> >
> > Antheas
> >
> > > ---
> > > V7: https://lore.kernel.org/all/20251018101759.4089-1-lkml@antheas.de=
v/
> > > V6: https://lore.kernel.org/all/20251013201535.6737-1-lkml@antheas.de=
v/
> > > V5: https://lore.kernel.org/all/20250325184601.10990-1-lkml@antheas.d=
ev/
> > > V4: https://lore.kernel.org/lkml/20250324210151.6042-1-lkml@antheas.d=
ev/
> > > V3: https://lore.kernel.org/lkml/20250322102804.418000-1-lkml@antheas=
.dev/
> > > V2: https://lore.kernel.org/all/20250320220924.5023-1-lkml@antheas.de=
v/
> > > V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.d=
ev/
> > >
> > > Changes since V7:
> > >   - Readd legacy init quirk for Dennis
> > >   - Remove HID_QUIRK_INPUT_PER_APP as a courtesy to asusctl
> > >   - Fix warning due to enum_backlight receiving negative values
> > >
> > > Changes since V6:
> > >   - Split initialization refactor into three patches, update commit t=
ext
> > >     to be clearer in what it does
> > >   - Replace spinlock accesses with guard and scoped guard in all patc=
hes
> > >   - Add missing includes mentioned by Ilpo
> > >   - Reflow, tweak comment in prevent binding to all HID devices on RO=
G
> > >   - Replace asus_ref.asus with local reference in all patches
> > >   - Add missing kernel doc comments
> > >   - Other minor nits from Ilpo
> > >   - User reported warning due to scheduling work while holding a spin=
lock.
> > >     Restructure patch for multiple handlers to limit when spinlock is=
 held to
> > >     variable access only. In parallel, setup a workqueue to handle re=
gistration
> > >     of led device and setting brightness. This is required as registe=
ring the
> > >     led device triggers kbd_led_get which needs to hold the spinlock =
to
> > >     protect the led_wk value. The workqueue is also required for the =
hid
> > >     event passthrough to avoid scheduling work while holding the spin=
lock.
> > >     Apply the workqueue to wmi brightness buttons as well, as that wa=
s
> > >     omitted before this series and WMI access was performed.
> > >   - On "HID: asus: prevent binding to all HID devices on ROG", rename
> > >     quirk HANDLE_GENERIC to SKIP_REPORT_FIXUP and only skip report fi=
xup.
> > >     This allows other quirks to apply (applies quirk that fixes keybo=
ard
> > >     being named as a pointer device).
> > >
> > > Changes since V5:
> > >   - It's been a long time
> > >   - Remove addition of RGB as that had some comments I need to work o=
n
> > >   - Remove folio patch (already merged)
> > >   - Remove legacy fix patch 11 from V4. There is a small chance that
> > >     without this patch, some old NKEY keyboards might not respond to
> > >     RGB commands according to Luke, but the kernel driver does not do
> > >     RGB currently. The 0x5d init is done by Armoury crate software in
> > >     Windows. If an issue is found, we can re-add it or just remove pa=
tches
> > >     1/2 before merging. However, init could use the cleanup.
> > >
> > > Changes since V4:
> > >   - Fix KConfig (reported by kernel robot)
> > >   - Fix Ilpo's nits, if I missed anything lmk
> > >
> > > Changes since V3:
> > >   - Add initializer for 0x5d for old NKEY keyboards until it is verif=
ied
> > >     that it is not needed for their media keys to function.
> > >   - Cover init in asus-wmi with spinlock as per Hans
> > >   - If asus-wmi registers WMI handler with brightness, init the brigh=
tness
> > >     in USB Asus keyboards, per Hans.
> > >   - Change hid handler name to asus-UNIQ:rgb:peripheral to match led =
class
> > >   - Fix oops when unregistering asus-wmi by moving unregister outside=
 of
> > >     the spin lock (but after the asus reference is set to null)
> > >
> > > Changes since V2:
> > >   - Check lazy init succeds in asus-wmi before setting register varia=
ble
> > >   - make explicit check in asus_hid_register_listener for listener ex=
isting
> > >     to avoid re-init
> > >   - rename asus_brt to asus_hid in most places and harmonize everythi=
ng
> > >   - switch to a spinlock instead of a mutex to avoid kernel ooops
> > >   - fixup hid device quirks to avoid multiple RGB devices while still=
 exposing
> > >     all input vendor devices. This includes moving rgb init to probe
> > >     instead of the input_configured callbacks.
> > >   - Remove fan key (during retest it appears to be 0xae that is alrea=
dy
> > >     supported by hid-asus)
> > >   - Never unregister asus::kbd_backlight while asus-wmi is active, as=
 that
> > >   - removes fds from userspace and breaks backlight functionality. Al=
l
> > >   - current mainline drivers do not support backlight hotplugging, so=
 most
> > >     userspace software (e.g., KDE, UPower) is built with that assumpt=
ion.
> > >     For the Ally, since it disconnects its controller during sleep, t=
his
> > >     caused the backlight slider to not work in KDE.
> > >
> > > Changes since V1:
> > >   - Add basic RGB support on hid-asus, (Z13/Ally) tested in KDE/Z13
> > >   - Fix ifdef else having an invalid signature (reported by kernel ro=
bot)
> > >   - Restore input arguments to init and keyboard function so they can
> > >     be re-used for RGB controls.
> > >   - Remove Z13 delay (it did not work to fix the touchpad) and replac=
e it
> > >     with a HID_GROUP_GENERIC quirk to allow hid-multitouch to load. S=
quash
> > >     keyboard rename into it.
> > >   - Unregister brightness listener before removing work queue to avoi=
d
> > >     a race condition causing corruption
> > >   - Remove spurious mutex unlock in asus_brt_event
> > >   - Place mutex lock in kbd_led_set after LED_UNREGISTERING check to =
avoid
> > >     relocking the mutex and causing a deadlock when unregistering led=
s
> > >   - Add extra check during unregistering to avoid calling unregister =
when
> > >     no led device is registered.
> > >   - Temporarily HID_QUIRK_INPUT_PER_APP from the ROG endpoint as it c=
auses
> > >     the driver to create 4 RGB handlers per device. I also suspect so=
me
> > >     extra events sneak through (KDE had the @@@@@@).
> > >
> > > Antheas Kapenekakis (10):
> > >   HID: asus: simplify RGB init sequence
> > >   HID: asus: use same report_id in response
> > >   HID: asus: fortify keyboard handshake
> > >   HID: asus: prevent binding to all HID devices on ROG
> > >   HID: asus: initialize LED endpoint early for old NKEY keyboards
> > >   platform/x86: asus-wmi: Add support for multiple kbd led handlers
> > >   HID: asus: listen to the asus-wmi brightness device instead of
> > >     creating one
> > >   platform/x86: asus-wmi: remove unused keyboard backlight quirk
> > >   platform/x86: asus-wmi: add keyboard brightness event handler
> > >   HID: asus: add support for the asus-wmi brightness handler
> > >
> > >  drivers/hid/hid-asus.c                     | 222 +++++++++++--------=
--
> > >  drivers/platform/x86/asus-wmi.c            | 214 +++++++++++++++++--=
-
> > >  include/linux/platform_data/x86/asus-wmi.h |  70 +++----
> > >  3 files changed, 331 insertions(+), 175 deletions(-)
> > >
> > >
> > > base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
> > > --
> > > 2.51.2
> > >
> > >
> >
>


