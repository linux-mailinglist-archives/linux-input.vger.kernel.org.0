Return-Path: <linux-input+bounces-16204-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C8EC6C377
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 02:14:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 60EB0356DE4
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 01:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9F4224AE8;
	Wed, 19 Nov 2025 01:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="VSOGQ/91"
X-Original-To: linux-input@vger.kernel.org
Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153A41FE47C
	for <linux-input@vger.kernel.org>; Wed, 19 Nov 2025 01:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763514735; cv=none; b=rUwfSA2jaKEUV8rkyBnzDesKz4/QgY4sGXsUZVXGPo/n4wmXEhosU8+jdHLKsXAqIGBaXFjLYaCj+aAgYJLNMw4jFtZvPxvajXI44+kv/Mu4Zrh78GguZVRoVW3PLNm8eeiKN9Txx/dMk+LDrK8C9EVszfiuL1bcg6SYBd8ceXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763514735; c=relaxed/simple;
	bh=NVP8tQmMfKXXvY6jFIlb37jrcM+HWc/rkqqyuU14WEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G1i/yvXDgr5fqCkXmdgdE67NHG6E6OoN7uwS0kGplrtjRA2qvS9KLj1wiwiYnKB78BSlVL6mH2Oc9Xo2310YCcj0fTdtDccTl2j7+U5eM5hbvEjvUmUImGx5tgj6lLMXvBrF3c73uCBKIvadDarMcap+7X2eaMSLqjMH4KjMRX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=VSOGQ/91; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 2DE94C0E4C
	for <linux-input@vger.kernel.org>; Wed, 19 Nov 2025 03:12:08 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 8485FC0E38
	for <linux-input@vger.kernel.org>; Wed, 19 Nov 2025 03:12:07 +0200 (EET)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id EC716201E94
	for <linux-input@vger.kernel.org>; Wed, 19 Nov 2025 03:12:06 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763514727;
	bh=tgnvRLL7c+cxSNLhApXWaNPqaLEzjvcoAiQnfpM97Kk=;
	h=Received:From:Subject:To;
	b=VSOGQ/91SvN3OD3o4tYYz7PcuJ7eNDNHRF/mzXjTxozZN/kA7o3Dx4DUHctbYf9kN
	 ELaIYhu5xYrZjfIfc52Qynlzk5X69PHfauLSEfPng9BhUefrmW7SXVZwtyszWdYKTn
	 Q1bT4ot2da+icxMWnFxcrf/KnFgae6QNh+UOWAYRpXH7oKy9gExdJCc1dqzuZqVoBL
	 cUwuQyBJ+Y4O9VXdbzpist55AmSArSPYU6u31EA5/FftCojvEOUpIcUrCjvEZorqDt
	 /h5O1TgllFBvAgIR0hWqxGsr/aR3/Z7NB9xdXvxW1GaOCvVcrGVGKQ1ChajVB/0ckH
	 JcsSxjS19062Q==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.180) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f180.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-37b9728a353so62872471fa.0
        for <linux-input@vger.kernel.org>;
 Tue, 18 Nov 2025 17:12:06 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUKlkMh4/9YncebATb7zJ6rvaYLWB1wyltIKpDh4Cev7h6WD5WV+9c+TEoanEEhYGr8zgcbdwr96hFKbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUdGmYnYZXST5+eHed5IZApxfS1W812XWk0aYWsOvDD57AWUdh
	SCbIutSur5X3qtG6S9rIZHBxjsiSS/hyax+x5WkStgCnQ7Ryqqj+x1RD2knavgkXoySvfy3Z84O
	uQslTwxf04ayXWMwFkMueRJlpSuf8u5o=
X-Google-Smtp-Source: 
 AGHT+IF6aWVaBDkHYcJaltCmtyAu3QpufBTnLc92AwUTT25p1yq807jvFv5RbxmVsXG+eQBQWRxOaixnVd5yj5jFe0s=
X-Received: by 2002:a05:651c:2450:10b0:37b:9110:21c4 with SMTP id
 38308e7fff4ca-37babd5cbb8mr41179211fa.31.1763514726279; Tue, 18 Nov 2025
 17:12:06 -0800 (PST)
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
In-Reply-To: <b505ffca-63a1-4c52-b940-cdfc507813fc@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 19 Nov 2025 02:11:55 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEF8bhbhgYe9cyg0JgcKsXstNZubPV9HCapwxMvw_2OhQ@mail.gmail.com>
X-Gm-Features: AWmQ_blWb6Z5qMEQsNm7Qyr_Yx00ZupCjj716sIVdbrn45609Zi8GMcdAwuu52k
Message-ID: 
 <CAGwozwEF8bhbhgYe9cyg0JgcKsXstNZubPV9HCapwxMvw_2OhQ@mail.gmail.com>
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
 <176351472719.1842869.2970337764652967866@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 19 Nov 2025 at 01:54, Denis Benato <benato.denis96@gmail.com> wrote=
:
>
>
> On 11/18/25 13:10, Ilpo J=C3=A4rvinen wrote:
> > On Sat, 1 Nov 2025, Antheas Kapenekakis wrote:
> >
> >> These keyboards have always had initialization in the kernel for 0x5d.
> >> At this point, it is hard to verify again and we risk regressions by
> >> removing this. Therefore, initialize with 0x5d as well.
> See patch 1: unless I missed something you can retain the two
> FEATURE_KBD_LED_REPORT_IDx behind the same exact quirk:
> why are we adding a quirk to replace a quirk that was removed
> in patch 1?
>
> You are basically doing the pretty-much-but-not-quite
> equivalent of what the driver was doing before.
> >> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >> ---
> >>  drivers/hid/hid-asus.c | 15 +++++++++++++--
> >>  1 file changed, 13 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> >> index 726f5d8e22d1..221c7195e885 100644
> >> --- a/drivers/hid/hid-asus.c
> >> +++ b/drivers/hid/hid-asus.c
> >> @@ -91,6 +91,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad")=
;
> >>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
> >>  #define QUIRK_ROG_ALLY_XPAD         BIT(13)
> >>  #define QUIRK_SKIP_REPORT_FIXUP             BIT(14)
> >> +#define QUIRK_ROG_NKEY_LEGACY               BIT(15)
> >>
> >>  #define I2C_KEYBOARD_QUIRKS                 (QUIRK_FIX_NOTEBOOK_REPOR=
T | \
> >>                                               QUIRK_NO_INIT_REPORTS | =
\
> >> @@ -669,6 +670,16 @@ static int asus_kbd_register_leds(struct hid_devi=
ce *hdev)
> >>      if (ret < 0)
> >>              return ret;
> >>
> >> +    if (drvdata->quirks & QUIRK_ROG_NKEY_LEGACY) {
> >> +            /*
> >> +             * These keyboards might need 0x5d for shortcuts to work.
> >> +             * As it has been more than 5 years, it is hard to verify=
.
> >> +             */
> >> +            ret =3D asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> >> +            if (ret < 0)
> >> +                    return ret;
> >> +    }
> >> +
> >>      /* Get keyboard functions */
> >>      ret =3D asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPOR=
T_ID);
> >>      if (ret < 0)
> >> @@ -1409,10 +1420,10 @@ static const struct hid_device_id asus_devices=
[] =3D {
> >>        QUIRK_USE_KBD_BACKLIGHT },
> >>      { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>          USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
> >> -      QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >> +      QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_N=
KEY_LEGACY },
> >>      { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>          USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
> >> -      QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >> +      QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_N=
KEY_LEGACY },
> >>      { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>          USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
> >>        QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> > You should do FEATURE_KBD_LED_REPORT_ID1 refactoring together, not remo=
ve
> > + add back in different patches.
> Granted I still have no idea why that was removed in the first place?
> Then re-added but losing FEATURE_KBD_LED_REPORT_ID1 ?
>
> What's the problem with FEATURE_KBD_LED_REPORT_ID1?
>
> > I suppose the cleanest would be to add a new patch as first which moves
> > asus_kbd_init() outside of if/else so you can make this refactoring of
> > FEATURE_KBD_LED_REPORT_ID1 in the 2nd patch.
> Again I am missing the point in moving these...
> > I note there's still contention with this series overall.
> >
> There are a few things that have pretty much the potential of making
> some laptops act funny due to tinkering with initializations commands.
>
> The rename will break some tools, but other than that, granted I have yet
> to check the rest of the patchset, looks reasonable to me.
>
> Perhaps I am not entirely happy with how things are worded in
> a few instances, but it's a minor issue.

Hi Denis,
please refrain from repeating yourself, in the same email and across
emails, and repeating comments that are already addressed by Ilpo. As
that makes it hard to track and respond to your comments.

As noted in this chain, the plan for the next version is to include
ID2 in this quirk and instead of removing it in the simplify patch,
use a gate by the ROG quirk that is then replaced by a gate from this
quirk.

This completely addresses your comment. The legacy quirk only applies
to a subset of devices, so it is not the same with this series
applied.

Antheas


