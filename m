Return-Path: <linux-input+bounces-16206-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 88706C6C3F0
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 02:27:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DE1FE35C0B9
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 01:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A1823D2A1;
	Wed, 19 Nov 2025 01:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="iys8v1Z+"
X-Original-To: linux-input@vger.kernel.org
Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4878422FDEA
	for <linux-input@vger.kernel.org>; Wed, 19 Nov 2025 01:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763515658; cv=none; b=KRrOFG3HgeLtPSfhnppR2M1UkkKsJ2GuJltQxbQQ8Co8ZwzpkB2d9T6ktzq+uxh7Ib4BRQEyP87qHcFcE/3L0ZfEfH9S2re7m1g8usEGrHA1NhVktgGENzoN+kLFJVI7L4H5pd4tIZXZ+SB49Gdjz/u7rdoTmjIqL9P9NuyNrhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763515658; c=relaxed/simple;
	bh=PMZOok+VcOo8D9n9ew5+Li5Pbb+R5oTPvQTzrpPoUg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zghn6DtW626YktDR9XKMuB7R74mrcEtsDLsonoeusiMI/RD8aHy9pKLLhGeyMevZqgn1xAMppXKBEjK0Wp0gUydez9a6BYm70W7DwnOdgmKB+xsZWLfwiZpNFm8VUJrBxZsCLKqLwGdiT6AjByu475Ok7YzfHf3Y2MK3uPWXMZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=iys8v1Z+; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id A0F83C0FB6
	for <linux-input@vger.kernel.org>; Wed, 19 Nov 2025 03:27:34 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id E6763C0EF6
	for <linux-input@vger.kernel.org>; Wed, 19 Nov 2025 03:27:33 +0200 (EET)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 5EB0F201E91
	for <linux-input@vger.kernel.org>; Wed, 19 Nov 2025 03:27:33 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763515653;
	bh=ItLu7LjpRF+kzYt4fpX6R24BsGYzFu0iYZ0d7xzbwOQ=;
	h=Received:From:Subject:To;
	b=iys8v1Z+M8595CeqTSyVKEGuHy5JX2Hu13maD8vUpU/5JTFChMoA350Od0QojdVbp
	 YO8C7VrzkmEcu48ttQpAQmznOxqQHWH6v094DwIki8BFxwAACEsQDK9c9wLVi8p/pp
	 Bctx0xwoeDuzejY0o7lJrcPMrnfRbd1mDDoDojX7Wo2B5h3WNvv+BcO1t4n+JSqAkB
	 E9N5VOOwl3LYNxDeNSHXN1s6bzbgm2TRAaoLy58iM995vGW+tTNz07a7AV7PueWVBv
	 dorEBrT6k9wvFA0yhS89TKQP0LCqlmapW3LhLz4qtThpbMiubLwk0qd7KbAUoXGhJ+
	 +U86zcGVWkiLw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.173) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f173.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-37a33f49018so51376751fa.2
        for <linux-input@vger.kernel.org>;
 Tue, 18 Nov 2025 17:27:33 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWiWN+wk/Y7q24BzhzRFNOdUfanzeIflLdgKxll+gyqk/x9u+WhLSk/xXBR8O7UACc/3q3PgcExGBtENA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Af3TSgo+nQnxKMAeQOmcSYRn+/IdkfvZG0SJyUZYl84zzdSb
	NJrjchPeoD451Cuu3fOxXehw4rfOPYjM6Vf8roPjUuNMHt5c0ld8dhPYwps4Qucx6z8ugaNc0QF
	/PqjYZPO37kk8veeM+5uAd3cOAaU33XQ=
X-Google-Smtp-Source: 
 AGHT+IElaU1PWTy7lFk4T+o16u2D0cF/WkNj0Es1ysPLnPCAVNNZV7pwcgRb76X1wLkm6QPPPlipGtzx/EsgFU8Anrc=
X-Received: by 2002:a2e:be09:0:b0:37b:969c:16f9 with SMTP id
 38308e7fff4ca-37babd35e57mr54383201fa.25.1763515652643; Tue, 18 Nov 2025
 17:27:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101104712.8011-1-lkml@antheas.dev>
 <20251101104712.8011-6-lkml@antheas.dev>
 <2fc1e683-0234-20b6-7448-bd0213c9bb37@linux.intel.com>
 <b505ffca-63a1-4c52-b940-cdfc507813fc@gmail.com>
 <CAGwozwEF8bhbhgYe9cyg0JgcKsXstNZubPV9HCapwxMvw_2OhQ@mail.gmail.com>
 <e204d129-0ac8-48fb-a178-12466350079e@gmail.com>
In-Reply-To: <e204d129-0ac8-48fb-a178-12466350079e@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 19 Nov 2025 02:27:21 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEV36Bc0-UgysTv5g7OfrB1=rNfy4XKE7gXOhOvZ1e_6g@mail.gmail.com>
X-Gm-Features: AWmQ_bmtTyyr_jaD02XjZboDdIEY3e84oQRrpgpkZrirLw30f3RUJx883X0En0Y
Message-ID: 
 <CAGwozwEV36Bc0-UgysTv5g7OfrB1=rNfy4XKE7gXOhOvZ1e_6g@mail.gmail.com>
Subject: Re: [PATCH v8 05/10] HID: asus: initialize LED endpoint early for old
 NKEY keyboards
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
 <176351565355.1887777.17486740477096418874@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 19 Nov 2025 at 02:21, Denis Benato <benato.denis96@gmail.com> wrote=
:
>
>
> On 11/19/25 02:11, Antheas Kapenekakis wrote:
> > On Wed, 19 Nov 2025 at 01:54, Denis Benato <benato.denis96@gmail.com> w=
rote:
> >>
> >> On 11/18/25 13:10, Ilpo J=C3=A4rvinen wrote:
> >>> On Sat, 1 Nov 2025, Antheas Kapenekakis wrote:
> >>>
> >>>> These keyboards have always had initialization in the kernel for 0x5=
d.
> >>>> At this point, it is hard to verify again and we risk regressions by
> >>>> removing this. Therefore, initialize with 0x5d as well.
> >> See patch 1: unless I missed something you can retain the two
> >> FEATURE_KBD_LED_REPORT_IDx behind the same exact quirk:
> >> why are we adding a quirk to replace a quirk that was removed
> >> in patch 1?
> >>
> >> You are basically doing the pretty-much-but-not-quite
> >> equivalent of what the driver was doing before.
> >>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>>> ---
> >>>>  drivers/hid/hid-asus.c | 15 +++++++++++++--
> >>>>  1 file changed, 13 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> >>>> index 726f5d8e22d1..221c7195e885 100644
> >>>> --- a/drivers/hid/hid-asus.c
> >>>> +++ b/drivers/hid/hid-asus.c
> >>>> @@ -91,6 +91,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad=
");
> >>>>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
> >>>>  #define QUIRK_ROG_ALLY_XPAD         BIT(13)
> >>>>  #define QUIRK_SKIP_REPORT_FIXUP             BIT(14)
> >>>> +#define QUIRK_ROG_NKEY_LEGACY               BIT(15)
> >>>>
> >>>>  #define I2C_KEYBOARD_QUIRKS                 (QUIRK_FIX_NOTEBOOK_REP=
ORT | \
> >>>>                                               QUIRK_NO_INIT_REPORTS =
| \
> >>>> @@ -669,6 +670,16 @@ static int asus_kbd_register_leds(struct hid_de=
vice *hdev)
> >>>>      if (ret < 0)
> >>>>              return ret;
> >>>>
> >>>> +    if (drvdata->quirks & QUIRK_ROG_NKEY_LEGACY) {
> >>>> +            /*
> >>>> +             * These keyboards might need 0x5d for shortcuts to wor=
k.
> >>>> +             * As it has been more than 5 years, it is hard to veri=
fy.
> >>>> +             */
> >>>> +            ret =3D asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1)=
;
> >>>> +            if (ret < 0)
> >>>> +                    return ret;
> >>>> +    }
> >>>> +
> >>>>      /* Get keyboard functions */
> >>>>      ret =3D asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REP=
ORT_ID);
> >>>>      if (ret < 0)
> >>>> @@ -1409,10 +1420,10 @@ static const struct hid_device_id asus_devic=
es[] =3D {
> >>>>        QUIRK_USE_KBD_BACKLIGHT },
> >>>>      { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>>>          USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
> >>>> -      QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >>>> +      QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG=
_NKEY_LEGACY },
> >>>>      { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>>>          USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
> >>>> -      QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >>>> +      QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG=
_NKEY_LEGACY },
> >>>>      { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>>>          USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
> >>>>        QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >>> You should do FEATURE_KBD_LED_REPORT_ID1 refactoring together, not re=
move
> >>> + add back in different patches.
> >> Granted I still have no idea why that was removed in the first place?
> >> Then re-added but losing FEATURE_KBD_LED_REPORT_ID1 ?
> >>
> >> What's the problem with FEATURE_KBD_LED_REPORT_ID1?
> >>
> >>> I suppose the cleanest would be to add a new patch as first which mov=
es
> >>> asus_kbd_init() outside of if/else so you can make this refactoring o=
f
> >>> FEATURE_KBD_LED_REPORT_ID1 in the 2nd patch.
> >> Again I am missing the point in moving these...
> >>> I note there's still contention with this series overall.
> >>>
> >> There are a few things that have pretty much the potential of making
> >> some laptops act funny due to tinkering with initializations commands.
> >>
> >> The rename will break some tools, but other than that, granted I have =
yet
> >> to check the rest of the patchset, looks reasonable to me.
> >>
> >> Perhaps I am not entirely happy with how things are worded in
> >> a few instances, but it's a minor issue.
> > Hi Denis,
> > please refrain from repeating yourself, in the same email and across
> > emails, and repeating comments that are already addressed by Ilpo. As
> > that makes it hard to track and respond to your comments.
> My repetitions are due to confusion with different aspects of what
> you are doing, but I'll try to be less repetitive.
>
> Also I don't think I have said the very same exact things as
> Ilpo, unless I misunderstood something.
> > As noted in this chain, the plan for the next version is to include
> > ID2 in this quirk and instead of removing it in the simplify patch,
> > use a gate by the ROG quirk that is then replaced by a gate from this
> > quirk.
> Yeah but I also asked (perhaps too many times?) what's up with _ID1
> and the whole reasoning behind this because as it stands now
> you are replacing X with Y, only to do Z without making clear to me
> the reason of Y, therefore Z also suffers from the same problem.
> > This completely addresses your comment. The legacy quirk only applies
> > to a subset of devices, so it is not the same with this series
> > applied.
> And the reason for this difference is exactly what I am asking for.
>
> I have been trying to suggest things to describe and actions
> to take/specific code changes to ensure we agree...

New devices do not need the 0x5d/0x5e inits. This is especially true
for those that do not have those endpoints. Specifically, devices
without Anime/an S? (I do not recall the name currently) animation
feature do not have a 0x5e endpoint, and devices without RGB do not
have a 0x5d endpoint. But they currently get sent these inits anyway.

For some old devices, they might need 0x5d to init the keyboard
shortcuts, but that is not certain. It is too late by this point to
verify though, so the legacy patch will keep those for the next revision.

Antheas

> > Antheas
> >
>


