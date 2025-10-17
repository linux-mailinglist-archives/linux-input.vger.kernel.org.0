Return-Path: <linux-input+bounces-15573-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D833FBE84A5
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 13:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BA5FF4E3FAC
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 11:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44441346A1F;
	Fri, 17 Oct 2025 11:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="FWSuxZeC"
X-Original-To: linux-input@vger.kernel.org
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EE8343D6D
	for <linux-input@vger.kernel.org>; Fri, 17 Oct 2025 11:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760700117; cv=none; b=LChWTwM06U+9kAPrmDdPmjwjyXkO4fGb5RUURq9J3LFXV9qObPrAapUNVz8CHcFraOwfNvIVWcDhuveUKMRvYZviXhgB0oSFTWZNqgwzHfLOxKOwlmgktxtAz/neyURFSnqsECK/D1SAdFnt5o1qgG8p1sGPcisOMf58v5Gpxdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760700117; c=relaxed/simple;
	bh=PY0v4I6UbCVDXlWhyzjgiyJXMDDVNdSx/FAH4eVQKgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJxdnz6ENH3VAdQU96oNT+DDMEZeOzcCC+Ytgjm+GJRuejLAC0beRh6bt/BRhZhZia4mCNAGh9G2Ra8Y+K0WA6SjhpYqt7wfdUzeP2vz9ilWfJgt0It4FcriNPOAAQbawErCQGmmX24lkpdo735oV19rwRFrAuCA+NHEKiNlPl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=FWSuxZeC; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 5800B422A0
	for <linux-input@vger.kernel.org>; Fri, 17 Oct 2025 14:21:52 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id BEAE642042
	for <linux-input@vger.kernel.org>; Fri, 17 Oct 2025 14:21:50 +0300 (EEST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id DCF7B1FE33B
	for <linux-input@vger.kernel.org>; Fri, 17 Oct 2025 14:21:49 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1760700110;
	bh=cn8g6xB2kr+CArypl4cEECGObqOKVNP8SV64zOlkT3M=;
	h=Received:From:Subject:To;
	b=FWSuxZeCO40fTh00e19IY892PzFGcT3n5xQrkF2BECfdQfYgI/IH6kBY3REN/VkEM
	 qGFP639KLOk1v4UCb3pYG1yoPGgLr1CcRdxe9edtcYrBTLYOvV/gmzWIXG54+84CYD
	 TmC8n3QBQyq4OP5KCafrosU9oytq7tgFd+m/Kj73FwLw/Wr5xfBvfNNLRi11BeiiOf
	 ZL7lpMssd1afzOnm71qn/yZgokkT2dcrnXQlDD/lr9Foq7pKk19lAJGVeHkZ4p/mRW
	 b9MSx3FphmMQW6qidLmYeeuDqixNzXZ0UIp/Bkcw/6FJhfZFSyyb93XzJk5ySFRQfv
	 kakOOaq/OUAdg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.167.43) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lf1-f43.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-57f1b88354eso2091077e87.1
        for <linux-input@vger.kernel.org>;
 Fri, 17 Oct 2025 04:21:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVgz3vnLNNtKN6EV4MTRZo7tz0GfI8UP1Al6wzP7r17cVIyezH5CvY1NA+h0S6WBRQMB8YPNa0Tzxg0zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwB/IfK5G5m7Xme+ShZlrdHsCLItGC68iFwxAK0XOCxubCS/mY
	1qla1TGhP8jgefdEVAi35g3Dvh/boI/Ag+ANMr6yp1E8ctqEcBqo0yBho+wMC8g7sZJwsc7DTzV
	RBvxJh/zY5v5Lbw5TmmHTyrqk0SYxIS4=
X-Google-Smtp-Source: 
 AGHT+IEY5VTOXsn5xRuwyw70t7bIqP0xjiNtgyG+B79U1ommmghK275ohNLsgP1j9bYnp6ylksECHlCBTlKbmfsNFp8=
X-Received: by 2002:a05:651c:1516:b0:373:a515:3a29 with SMTP id
 38308e7fff4ca-377978d7932mr12773911fa.16.1760700109331; Fri, 17 Oct 2025
 04:21:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013201535.6737-1-lkml@antheas.dev>
 <160c3adf-9333-4486-ba4c-d3359ea73337@gmail.com>
 <CAGwozwGzOQ-LCk6B202-CuKq=gepn6Mt4LitJJZ7dfMLaDVs7Q@mail.gmail.com>
 <c075a9f4-8103-dbcc-a1e7-4eaec5e90597@linux.intel.com>
 <CAGwozwH3VnTsx8p5N6S1yp4Z9mFfPUdZ4frrnPAveLH2a00K6g@mail.gmail.com>
 <CAGwozwGqZ_yuNQ+TgtW4R79g4JWxZg-Q-vA7thKy_vSdpbY_yA@mail.gmail.com>
 <b74b6d4a-7c9a-47a9-bf65-73bcae525bc0@gmail.com>
In-Reply-To: <b74b6d4a-7c9a-47a9-bf65-73bcae525bc0@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Fri, 17 Oct 2025 13:21:38 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwF_eWE+yQ9DReO58NruLAnaM_PDEdNYOzt4-UgOcdKWTg@mail.gmail.com>
X-Gm-Features: AS18NWBQ9A_-2hLAEjF-b1LvFD06GjIc4Jod-Njl1Py5d2oEckUi0TeqM_eBJkg
Message-ID: 
 <CAGwozwF_eWE+yQ9DReO58NruLAnaM_PDEdNYOzt4-UgOcdKWTg@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
To: Denis Benato <benato.denis96@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176070011015.208257.8138668318539772476@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Fri, 17 Oct 2025 at 13:00, Denis Benato <benato.denis96@gmail.com> wrote=
:
>
>
> On 10/17/25 09:54, Antheas Kapenekakis wrote:
> > On Thu, 16 Oct 2025 at 18:16, Antheas Kapenekakis <lkml@antheas.dev> wr=
ote:
> >> On Thu, 16 Oct 2025 at 17:09, Ilpo J=C3=A4rvinen
> >> <ilpo.jarvinen@linux.intel.com> wrote:
> >>> On Thu, 16 Oct 2025, Antheas Kapenekakis wrote:
> >>>> On Thu, 16 Oct 2025 at 13:57, Denis Benato <benato.denis96@gmail.com=
> wrote:
> >>>>> On 10/13/25 22:15, Antheas Kapenekakis wrote:
> >>>>>> This is a two part series which does the following:
> >>>>>>   - Clean-up init sequence
> >>>>>>   - Unify backlight handling to happen under asus-wmi so that all =
Aura
> >>>>>>     devices have synced brightness controls and the backlight butt=
on works
> >>>>>>     properly when it is on a USB laptop keyboard instead of one w/=
 WMI.
> >>>>>>
> >>>>>> For more context, see cover letter of V1. Since V5, I removed some=
 patches
> >>>>>> to make this easier to merge.
> >>>>>>
> >>>>>> All comments with these patches had been addressed since V4.
> >>>>> I have loaded this patchset for users of asus-linux project to try =
out.
> >>>>>
> >>>>> One of them opened a bug report about a kernel bug that happens
> >>>>> consistently when closing the lid of his laptop [1].
> >>>>>
> >>>>> He also sent another piece of kernel log, but didn't specify anythi=
ng more
> >>>>> about this [2].
> >>>>>
> >>>>> [1] https://pastebin.com/akZx1w10
> >>>>> [2] https://pastebin.com/sKdczPgf
> >>>> Can you provide a link to the bug report? [2] seems unrelated.
> >>>>
> >>>> As for [1], it looks like a trace that stems from a sysfs write to
> >>>> brightness stemming from userspace that follows the same chain it
> >>>> would on a stock kernel and times out. Is it present on a stock
> >>>> kernel?
> >>>>
> >>>> Ilpo should know more about this, could the spinlock be interfering?
> >>> [1] certainly seems to do schedule() from do_kbd_led_set() so it's no=
t
> >>> possible to use spinlock there.
> >>>
> >>> So we're back to what requires the spinlock? And what the spinlock
> >>> protects?
> >> For that invocation, since it is coming from the cdev device owned by
> >> asus_wmi, it protects asus_ref.listeners under do_kbd_led_set.
> >> asus_wmi is protected by the fact it is owned by that device. Spinlock
> >> is not required in this invocation due to not being an IRQ.
> >>
> >> Under asus_hid_event (second to last patch), which is called from an
> >> IRQ, a spinlock is required for protecting both listeners and the
> >> asus_ref.asus, and I suspect that scheduling from an IRQ is not
> >> allowed either. Is that correct?
> > So it is a bit tricky here. When the IRQ fires, it needs to know
> > whether asus-wmi will handle the keyboard brightness event so that it
> > falls back to emitting it.
> >
> > If we want it to know for sure, it needs to access asus_wmi, so it
> > needs a spinlock or an IRQ friendly lock. This way, currently,
> > asus_hid_event will return -EBUSY if there is no led device so the
> > event propagates through hid.
> >
> > If we say that it is good enough to know that it was compiled with
> > IS_REACHABLE(CONFIG_ASUS_WMI), ie the actual implementation of
> > asus_hid_event in asus-wmi will never return an error, then,
> > asus_hid_event can schedule a task to fire the event without a lock,
> > and that task can use a normal locking primitive.
> >
> > If the task needs to be assigned to a device or have a handle,
> > asus_hid_listener can be provided to asus_hid_event, so that it is
> > owned by the calling device.
> >
> > What would the appropriate locking primitive be in this case?
> The right place to look into appears to be Documentation/kernel-hacking/l=
ocking.rst
>
> I see mutex being used in various irq handlers, even bmi323-imu but that =
page has
> many alternatives for irq.
>
> There is rwlock_t but it appears to be using spinlock on certain configur=
ations.
>
> Absolute worst-case scenario you might resort implementing an rwlock with=
 mutexes only.
>
> I would avoid taking decisions based solely on the configuration because =
ASUS
> makes keyboards and reuses designs across various products, so it is very=
 likely
> at least one model of those keyboards can be confused with a laptop one.
>
> Beside I am sure there must be at the very least one appropriate synchron=
ization primitive,
> so I would discard the configure option.

The bug is not due to the spinlock. Its due to accessing WMI through
an IRQ. A work queue should be used. Using a spinlock is a result of
that omission.

asus-wmi already has workqueues for the other leds but not for the
keyboard one so we can add one.

If we want the IRQ that handles brightness events through
asus_hid_event to know whether a brightness handler is registered
before choosing whether to forward the event, then we will need to use
a spinlock. Since the spinlock protects objects that are setup during
asus-wmi init and removal, this spinlock needs to be in asus-wmi since
hid-asus has a child relationship.

Now, if we assume that hid-asus should be able to handle cases where
asus-wmi is not loaded with proper brightness control and in parallel
support cases where asus-wmi is loaded in a unified manner, then
that's a different class of problem because a device needs to own the
led handler and currently that would be the platform device.

> >> Antheas
> >>> Not related to this particular email in this thread, if the users are
> >>> testing something with different kernels, it's also important to make=
 sure
> >>> that the lockdep configs are enabled in both. As it could be that in =
one
> >>> kernel lockdep is not enabled and thus it won't do the splat.
> >>>
> >>> --
> >>>  i.
> >>>
> >>>
> >>>> My testing on devices that have WMI led controls is a bit limited
> >>>> unfortunately. However, most of our asus users have been happy with
> >>>> this series for around half a year now.
> >>>>
> >>>>>> ---
> >>>>>> V5: https://lore.kernel.org/all/20250325184601.10990-1-lkml@anthea=
s.dev/
> >>>>>> V4: https://lore.kernel.org/lkml/20250324210151.6042-1-lkml@anthea=
s.dev/
> >>>>>> V3: https://lore.kernel.org/lkml/20250322102804.418000-1-lkml@anth=
eas.dev/
> >>>>>> V2: https://lore.kernel.org/all/20250320220924.5023-1-lkml@antheas=
.dev/
> >>>>>> V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@anthea=
s.dev/
> >>>>>>
> >>>>>> Changes since V5:
> >>>>>>   - It's been a long time
> >>>>>>   - Remove addition of RGB as that had some comments I need to wor=
k on
> >>>>>>   - Remove folio patch (already merged)
> >>>>>>   - Remove legacy fix patch 11 from V4. There is a small chance th=
at
> >>>>>>     without this patch, some old NKEY keyboards might not respond =
to
> >>>>>>     RGB commands according to Luke, but the kernel driver does not=
 do
> >>>>>>     RGB currently. The 0x5d init is done by Armoury crate software=
 in
> >>>>>>     Windows. If an issue is found, we can re-add it or just remove=
 patches
> >>>>>>     1/2 before merging. However, init could use the cleanup.
> >>>>>>
> >>>>>> Changes since V4:
> >>>>>>   - Fix KConfig (reported by kernel robot)
> >>>>>>   - Fix Ilpo's nits, if I missed anything lmk
> >>>>>>
> >>>>>> Changes since V3:
> >>>>>>   - Add initializer for 0x5d for old NKEY keyboards until it is ve=
rified
> >>>>>>     that it is not needed for their media keys to function.
> >>>>>>   - Cover init in asus-wmi with spinlock as per Hans
> >>>>>>   - If asus-wmi registers WMI handler with brightness, init the br=
ightness
> >>>>>>     in USB Asus keyboards, per Hans.
> >>>>>>   - Change hid handler name to asus-UNIQ:rgb:peripheral to match l=
ed class
> >>>>>>   - Fix oops when unregistering asus-wmi by moving unregister outs=
ide of
> >>>>>>     the spin lock (but after the asus reference is set to null)
> >>>>>>
> >>>>>> Changes since V2:
> >>>>>>   - Check lazy init succeds in asus-wmi before setting register va=
riable
> >>>>>>   - make explicit check in asus_hid_register_listener for listener=
 existing
> >>>>>>     to avoid re-init
> >>>>>>   - rename asus_brt to asus_hid in most places and harmonize every=
thing
> >>>>>>   - switch to a spinlock instead of a mutex to avoid kernel ooops
> >>>>>>   - fixup hid device quirks to avoid multiple RGB devices while st=
ill exposing
> >>>>>>     all input vendor devices. This includes moving rgb init to pro=
be
> >>>>>>     instead of the input_configured callbacks.
> >>>>>>   - Remove fan key (during retest it appears to be 0xae that is al=
ready
> >>>>>>     supported by hid-asus)
> >>>>>>   - Never unregister asus::kbd_backlight while asus-wmi is active,=
 as that
> >>>>>>   - removes fds from userspace and breaks backlight functionality.=
 All
> >>>>>>   - current mainline drivers do not support backlight hotplugging,=
 so most
> >>>>>>     userspace software (e.g., KDE, UPower) is built with that assu=
mption.
> >>>>>>     For the Ally, since it disconnects its controller during sleep=
, this
> >>>>>>     caused the backlight slider to not work in KDE.
> >>>>>>
> >>>>>> Changes since V1:
> >>>>>>   - Add basic RGB support on hid-asus, (Z13/Ally) tested in KDE/Z1=
3
> >>>>>>   - Fix ifdef else having an invalid signature (reported by kernel=
 robot)
> >>>>>>   - Restore input arguments to init and keyboard function so they =
can
> >>>>>>     be re-used for RGB controls.
> >>>>>>   - Remove Z13 delay (it did not work to fix the touchpad) and rep=
lace it
> >>>>>>     with a HID_GROUP_GENERIC quirk to allow hid-multitouch to load=
. Squash
> >>>>>>     keyboard rename into it.
> >>>>>>   - Unregister brightness listener before removing work queue to a=
void
> >>>>>>     a race condition causing corruption
> >>>>>>   - Remove spurious mutex unlock in asus_brt_event
> >>>>>>   - Place mutex lock in kbd_led_set after LED_UNREGISTERING check =
to avoid
> >>>>>>     relocking the mutex and causing a deadlock when unregistering =
leds
> >>>>>>   - Add extra check during unregistering to avoid calling unregist=
er when
> >>>>>>     no led device is registered.
> >>>>>>   - Temporarily HID_QUIRK_INPUT_PER_APP from the ROG endpoint as i=
t causes
> >>>>>>     the driver to create 4 RGB handlers per device. I also suspect=
 some
> >>>>>>     extra events sneak through (KDE had the @@@@@@).
> >>>>>>
> >>>>>> Antheas Kapenekakis (7):
> >>>>>>   HID: asus: refactor init sequence per spec
> >>>>>>   HID: asus: prevent binding to all HID devices on ROG
> >>>>>>   platform/x86: asus-wmi: Add support for multiple kbd RGB handler=
s
> >>>>>>   HID: asus: listen to the asus-wmi brightness device instead of
> >>>>>>     creating one
> >>>>>>   platform/x86: asus-wmi: remove unused keyboard backlight quirk
> >>>>>>   platform/x86: asus-wmi: add keyboard brightness event handler
> >>>>>>   HID: asus: add support for the asus-wmi brightness handler
> >>>>>>
> >>>>>>  drivers/hid/hid-asus.c                     | 235 +++++++++++-----=
-----
> >>>>>>  drivers/platform/x86/asus-wmi.c            | 157 ++++++++++++--
> >>>>>>  include/linux/platform_data/x86/asus-wmi.h |  69 +++---
> >>>>>>  3 files changed, 291 insertions(+), 170 deletions(-)
> >>>>>>
> >>>>>>
> >>>>>> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> >>>
>


