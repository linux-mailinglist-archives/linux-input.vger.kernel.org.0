Return-Path: <linux-input+bounces-16353-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C3769C8AA83
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 16:32:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0A312356FC1
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 15:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F6B3321BE;
	Wed, 26 Nov 2025 15:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="j+PNqp41"
X-Original-To: linux-input@vger.kernel.org
Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A86331A75
	for <linux-input@vger.kernel.org>; Wed, 26 Nov 2025 15:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764171008; cv=none; b=uNacv9xJBQ1fuOvRBW9UGi25oSGkV8LYRGJ6oa0IK+BW5xPNGQJ2wHB0zdzeEagqCD++wxK5Z24rUOsi7dx/2bHoTHWmFekaku46pLWPtIVL9oHICvEMyHMUDEu6k4G3Rt7YTI5bbgFc9O27Z3mFZxSlUxPITh0B1tQAYu4uqa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764171008; c=relaxed/simple;
	bh=wrjwWof8EjM/Wy19RtVMGu7Ml65mWBTRSMbQglOgxTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OxFzGWea55ET69Qj7uRhCKlaZTLX9gn1Jayi7vIm3uADhEWgMxRp4QGFRF/IMMDYWyd7KUiM/hfeaYpNEJ5rC76n1yOYS4JVFpPQA7Zv1fme/7SSUiLEJ/Z/M7uBuc2347eqemD4xg8rHkcxtqmKmqD3HIihvDLELpAcfMZbd18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=j+PNqp41; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 0A0425E542
	for <linux-input@vger.kernel.org>; Wed, 26 Nov 2025 17:29:56 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id C8A955E4EA
	for <linux-input@vger.kernel.org>; Wed, 26 Nov 2025 17:29:53 +0200 (EET)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 15951200E15
	for <linux-input@vger.kernel.org>; Wed, 26 Nov 2025 17:29:52 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1764170992;
	bh=n32UAKj3wy5oa+EwSg+eXdyTu/k2bYPY7mnjytoda+g=;
	h=Received:From:Subject:To;
	b=j+PNqp41/b3pPUAGwRqkrpi/nmLTmuvVlEdF1tEYyCkz+afUaOyz1aIV0qdr6BUUB
	 HSRc6rD0JXBrX2JWxMl+14JDxNv1Ni626yjJ0Tvgp+6rD8lcdVd1Abx/kRVt2pL+Ou
	 3ACRP+hLEF6IzIKx+yxIRIZFFL0yp+VL6hpi0snS/cPq77i4TPKt1v0PwNI7huY3B+
	 UorJ1fLOK60DQnzlrP6lZYLDKfRLBGQe4KItmHIMNsauaLFv7xCfGEIyQ5nt7axvZD
	 iMumJ86EzCKH2fw3tNkXCAHTE7wU01PdGf6F/KHbXEbICuco9neT5sIjJ7TL00S3hF
	 +Rs2/s2ageEUw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.169) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f169.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-37a875e3418so41553981fa.1
        for <linux-input@vger.kernel.org>;
 Wed, 26 Nov 2025 07:29:52 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVFpFwwLN0RIOnHBMHXww7R9mrhrieI1n1bHSL6vaLFN1mIj9yBed5pfGHGXlO5nqHX0XWX31n8JfSPBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YylZYNXJe0QIpsoOHl2Zk35yENZYQPEfDOeONFo5+ENPUITsMoP
	m+23SOS4pa31fAknB5nMglY4X67GHebCco4UcWaPBdQ13FLp2AEEBE+QLLzNK5gs4t8SNiVL+/l
	6Wc3uZIlL/Nq9SQZgtVL2ZPNOUZLHS48=
X-Google-Smtp-Source: 
 AGHT+IEBy3PD/IuB9gVQCAMYlRPG4jP5tS62d6daA13fOsqFUztN4ASYCws2j2w8O555JBt95MfWdNNrYR2swrKFtM8=
X-Received: by 2002:a05:651c:3251:b0:37a:382a:abc5 with SMTP id
 38308e7fff4ca-37d0775f1e7mr22130131fa.3.1764170991509; Wed, 26 Nov 2025
 07:29:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122110032.4274-1-lkml@antheas.dev>
 <CAGwozwGwkBH_03JvPQrevQiszwDZ5R4uDBnzWVeVXLo8xRmeug@mail.gmail.com>
 <b91fa2c8-e342-9e46-f401-8c3d0590cd38@linux.intel.com>
 <CAGwozwGWL4Vr1XfVZBQoGCq7tKE4mBcPYS2n-p_GAt-V8LeKgg@mail.gmail.com>
In-Reply-To: 
 <CAGwozwGWL4Vr1XfVZBQoGCq7tKE4mBcPYS2n-p_GAt-V8LeKgg@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 26 Nov 2025 16:29:39 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwHZrLcCAzH1m-AEKLJTZ2BE2fL1w0RY7-mF8Ck_yko8eA@mail.gmail.com>
X-Gm-Features: AWmQ_bmEi0vtliRpoutZSogXUdySDVmAfQynMB6N9Z1Vz9ylxBF_WXoeckZtCbU
Message-ID: 
 <CAGwozwHZrLcCAzH1m-AEKLJTZ2BE2fL1w0RY7-mF8Ck_yko8eA@mail.gmail.com>
Subject: Re: [PATCH v10 00/11] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
	Denis Benato <benato.denis96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176417099235.2413255.6025113210756558405@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 26 Nov 2025 at 16:28, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> On Wed, 26 Nov 2025 at 16:24, Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > On Wed, 26 Nov 2025, Antheas Kapenekakis wrote:
> >
> > > On Sat, 22 Nov 2025 at 12:01, Antheas Kapenekakis <lkml@antheas.dev> =
wrote:
> > > >
> > > > This is a two part series which does the following:
> > > >   - Clean-up init sequence
> > > >   - Unify backlight handling to happen under asus-wmi so that all A=
ura
> > > >     devices have synced brightness controls and the backlight butto=
n works
> > > >     properly when it is on a USB laptop keyboard instead of one w/ =
WMI.
> > > >
> > > > For more context, see cover letter of V1. Since V5, I removed some =
patches
> > > > to make this easier to merge.
> > >
> > > Slight bump on this. It addresses both of the remarks Denis made in
> > > the previous version.
> > >
> > > I begrudgingly argued a bit for those because I did not want to resen=
d
> > > the series and they were not functional changes, so sorry about that.
> > > But they are fixed in this version incl. with the conflict with the
> > > armoury patchset. Denis, you omitted a rby on "platform/x86: asus-wmi=
:
> > > Add support for multiple kbd led handlers" even though I addressed
> > > your comment, so you may want to add that.
> >
> > FYI, there's no direct relation that mandates a person to give a rev-by
> > even if all his/her comments were addressed.
>
> True, this is just a reminder because I did not hear from him and
> since he added a rev-by on the kfree patch. There's no obligation from
> my side.
>
> > But generally yes, it would be useful to hear whether Denis is fine wit=
h
> > v10, especially those patches that had contention earlier but you've
> > modified post-v8.
> >
> > > As for "HID: asus: early return for ROG devices" changing the name of
> > > the devices of this driver, I will veto backporting it if it happens,
> > > so inputplumber will have the two full months to remove the name
> > > match. This is not a breaking change in the sense that software canno=
t
> > > be made to work on both previous and latter versions and there is no
> > > other software to my knowledge relying on name matches for Asus
> > > keyboards.
> >
> > Did Hans give some opinion about this rename earlier, at least I don't
> > remember nor could find from lore archives?
>
> Hans jumped in on the ayaneo controller patch. I don't think I saw
> activity on this series

Hans had some feedback around half a year ago for the latter part of
this series that binds the devices together

> Antheas
>
> > --
> >  i.
> >
> > > Moreover, an early exit is needed to prevent ejecting HID
> > > endpoints without an ->input parameter so it is a needed fix anyway.
> > > Postponing it will prevent Xbox Ally users from having RGB control
> > > through userspace on a stock kernel but it is also not worth arguing
> > > about
> > >
> > > It is also fine for me for this series to merge for 6.20, but I'd
> > > rather we handle it now since there will be some turbulence for asus
> > > users due to armoury merging so it makes sense to have this transitio=
n
> > > once.
> > >
> > > > ---
> > > > V9: https://lore.kernel.org/all/20251120094617.11672-1-lkml@antheas=
.dev/
> > > > V8: https://lore.kernel.org/all/20251101104712.8011-1-lkml@antheas.=
dev/
> > > > V7: https://lore.kernel.org/all/20251018101759.4089-1-lkml@antheas.=
dev/
> > > > V6: https://lore.kernel.org/all/20251013201535.6737-1-lkml@antheas.=
dev/
> > > > V5: https://lore.kernel.org/all/20250325184601.10990-1-lkml@antheas=
.dev/
> > > > V4: https://lore.kernel.org/lkml/20250324210151.6042-1-lkml@antheas=
.dev/
> > > > V3: https://lore.kernel.org/lkml/20250322102804.418000-1-lkml@anthe=
as.dev/
> > > > V2: https://lore.kernel.org/all/20250320220924.5023-1-lkml@antheas.=
dev/
> > > > V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas=
.dev/
> > > >
> > > > Changes since V9:
> > > >   - No functional changes
> > > >   - Rebase to review-ilpo-next
> > > >   - Fix armoury series conflict by removing the file asus-wmi-leds-=
ids on
> > > >     "remove unused keyboard backlight quirk" + imports
> > > >     Dismiss Luke's review as this patch diverged
> > > >   - Reword paragraph in "Add support for multiple kbd led handlers"=
 to be
> > > >     more verbose
> > > >   - Use kfree in fortify patch
> > > >   - Fix minor style quirks from --nonstict checkpatch run
> > > >
> > > > Changes since V8:
> > > >   - No functional changes
> > > >   - Move legacy init patch to second, modify first patch so that th=
eir
> > > >     diff is minimized
> > > >   - Split "prevent binding to all HID devices on ROG" into two patc=
hes:
> > > >     - moving backlight initialization into probe
> > > >     - early exit to skip ->init check and rename
> > > >     - Remove skipping vendor fixups for non-vendor devices. It is n=
ot possible
> > > >       to read usages before the report fixups are applied, so it di=
d not work
> > > >   - In that patch, reword a comment to be single line and make is_v=
endor a bool
> > > >   - Dismiss Luke's tags from "Add support for multiple kbd led hand=
lers" as it
> > > >     has drifted too far since he reviewed/tested it.
> > > >
> > > > Changes since V7:
> > > >   - Readd legacy init quirk for Dennis
> > > >   - Remove HID_QUIRK_INPUT_PER_APP as a courtesy to asusctl
> > > >   - Fix warning due to enum_backlight receiving negative values
> > > >
> > > > Changes since V6:
> > > >   - Split initialization refactor into three patches, update commit=
 text
> > > >     to be clearer in what it does
> > > >   - Replace spinlock accesses with guard and scoped guard in all pa=
tches
> > > >   - Add missing includes mentioned by Ilpo
> > > >   - Reflow, tweak comment in prevent binding to all HID devices on =
ROG
> > > >   - Replace asus_ref.asus with local reference in all patches
> > > >   - Add missing kernel doc comments
> > > >   - Other minor nits from Ilpo
> > > >   - User reported warning due to scheduling work while holding a sp=
inlock.
> > > >     Restructure patch for multiple handlers to limit when spinlock =
is held to
> > > >     variable access only. In parallel, setup a workqueue to handle =
registration
> > > >     of led device and setting brightness. This is required as regis=
tering the
> > > >     led device triggers kbd_led_get which needs to hold the spinloc=
k to
> > > >     protect the led_wk value. The workqueue is also required for th=
e hid
> > > >     event passthrough to avoid scheduling work while holding the sp=
inlock.
> > > >     Apply the workqueue to wmi brightness buttons as well, as that =
was
> > > >     omitted before this series and WMI access was performed.
> > > >   - On "HID: asus: prevent binding to all HID devices on ROG", rena=
me
> > > >     quirk HANDLE_GENERIC to SKIP_REPORT_FIXUP and only skip report =
fixup.
> > > >     This allows other quirks to apply (applies quirk that fixes key=
board
> > > >     being named as a pointer device).
> > > >
> > > > Changes since V5:
> > > >   - It's been a long time
> > > >   - Remove addition of RGB as that had some comments I need to work=
 on
> > > >   - Remove folio patch (already merged)
> > > >   - Remove legacy fix patch 11 from V4. There is a small chance tha=
t
> > > >     without this patch, some old NKEY keyboards might not respond t=
o
> > > >     RGB commands according to Luke, but the kernel driver does not =
do
> > > >     RGB currently. The 0x5d init is done by Armoury crate software =
in
> > > >     Windows. If an issue is found, we can re-add it or just remove =
patches
> > > >     1/2 before merging. However, init could use the cleanup.
> > > >
> > > > Changes since V4:
> > > >   - Fix KConfig (reported by kernel robot)
> > > >   - Fix Ilpo's nits, if I missed anything lmk
> > > >
> > > > Changes since V3:
> > > >   - Add initializer for 0x5d for old NKEY keyboards until it is ver=
ified
> > > >     that it is not needed for their media keys to function.
> > > >   - Cover init in asus-wmi with spinlock as per Hans
> > > >   - If asus-wmi registers WMI handler with brightness, init the bri=
ghtness
> > > >     in USB Asus keyboards, per Hans.
> > > >   - Change hid handler name to asus-UNIQ:rgb:peripheral to match le=
d class
> > > >   - Fix oops when unregistering asus-wmi by moving unregister outsi=
de of
> > > >     the spin lock (but after the asus reference is set to null)
> > > >
> > > > Changes since V2:
> > > >   - Check lazy init succeds in asus-wmi before setting register var=
iable
> > > >   - make explicit check in asus_hid_register_listener for listener =
existing
> > > >     to avoid re-init
> > > >   - rename asus_brt to asus_hid in most places and harmonize everyt=
hing
> > > >   - switch to a spinlock instead of a mutex to avoid kernel ooops
> > > >   - fixup hid device quirks to avoid multiple RGB devices while sti=
ll exposing
> > > >     all input vendor devices. This includes moving rgb init to prob=
e
> > > >     instead of the input_configured callbacks.
> > > >   - Remove fan key (during retest it appears to be 0xae that is alr=
eady
> > > >     supported by hid-asus)
> > > >   - Never unregister asus::kbd_backlight while asus-wmi is active, =
as that
> > > >   - removes fds from userspace and breaks backlight functionality. =
All
> > > >   - current mainline drivers do not support backlight hotplugging, =
so most
> > > >     userspace software (e.g., KDE, UPower) is built with that assum=
ption.
> > > >     For the Ally, since it disconnects its controller during sleep,=
 this
> > > >     caused the backlight slider to not work in KDE.
> > > >
> > > > Changes since V1:
> > > >   - Add basic RGB support on hid-asus, (Z13/Ally) tested in KDE/Z13
> > > >   - Fix ifdef else having an invalid signature (reported by kernel =
robot)
> > > >   - Restore input arguments to init and keyboard function so they c=
an
> > > >     be re-used for RGB controls.
> > > >   - Remove Z13 delay (it did not work to fix the touchpad) and repl=
ace it
> > > >     with a HID_GROUP_GENERIC quirk to allow hid-multitouch to load.=
 Squash
> > > >     keyboard rename into it.
> > > >   - Unregister brightness listener before removing work queue to av=
oid
> > > >     a race condition causing corruption
> > > >   - Remove spurious mutex unlock in asus_brt_event
> > > >   - Place mutex lock in kbd_led_set after LED_UNREGISTERING check t=
o avoid
> > > >     relocking the mutex and causing a deadlock when unregistering l=
eds
> > > >   - Add extra check during unregistering to avoid calling unregiste=
r when
> > > >     no led device is registered.
> > > >   - Temporarily HID_QUIRK_INPUT_PER_APP from the ROG endpoint as it=
 causes
> > > >     the driver to create 4 RGB handlers per device. I also suspect =
some
> > > >     extra events sneak through (KDE had the @@@@@@).
> > > >
> > > > Antheas Kapenekakis (11):
> > > >   HID: asus: simplify RGB init sequence
> > > >   HID: asus: initialize additional endpoints only for legacy device=
s
> > > >   HID: asus: use same report_id in response
> > > >   HID: asus: fortify keyboard handshake
> > > >   HID: asus: move vendor initialization to probe
> > > >   HID: asus: early return for ROG devices
> > > >   platform/x86: asus-wmi: Add support for multiple kbd led handlers
> > > >   HID: asus: listen to the asus-wmi brightness device instead of
> > > >     creating one
> > > >   platform/x86: asus-wmi: remove unused keyboard backlight quirk
> > > >   platform/x86: asus-wmi: add keyboard brightness event handler
> > > >   HID: asus: add support for the asus-wmi brightness handler
> > > >
> > > >  drivers/hid/hid-asus.c                        | 205 ++++++++------=
--
> > > >  drivers/platform/x86/asus-wmi.c               | 223 ++++++++++++++=
+---
> > > >  .../platform_data/x86/asus-wmi-leds-ids.h     |  50 ----
> > > >  include/linux/platform_data/x86/asus-wmi.h    |  28 +++
> > > >  4 files changed, 322 insertions(+), 184 deletions(-)
> > > >  delete mode 100644 include/linux/platform_data/x86/asus-wmi-leds-i=
ds.h
> > > >
> > > >
> > > > base-commit: 2643187ccb8628144246ee9d44da5e3ac428f9c3
> > > > --
> > > > 2.52.0
> > > >
> > > >
> > >
> >


