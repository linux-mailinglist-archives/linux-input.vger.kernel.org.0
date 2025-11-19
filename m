Return-Path: <linux-input+bounces-16212-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ECCC6D50E
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 09:10:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9369B4FC272
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 08:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB2C3043B9;
	Wed, 19 Nov 2025 07:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jmh5CyoK"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BC42E0415;
	Wed, 19 Nov 2025 07:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763538951; cv=none; b=KuSD5W1Yp/TjXatS/bNbs5M/DdCvPBKhHYXXEyxugObZlYRvl5ErPMo9szTj6CLIqhHscU7VGSXF0BhKTUazNRZzRagLpYWB7cO8koQ9o50SBRDS/ZYZJqhP19WvUpfmr2u2cmX/+S4ozXxpuh7LpDl/vecwNeHTvU5V2vP0UFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763538951; c=relaxed/simple;
	bh=ttHK/jdhJP7+B3ekd3LfKU5712mNEV0Po6OfTlme+0M=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GRZBP0n5ESoIhiIxttmkXk7Hroq6maIik7KFcV5RIFCOeVtidRzp9xlnsRV2vMVNni+x9A0fo2AMOlhGDSJGjtbaW39okjTeCz/+CjWMdOr8ctmQC4em0OOijt8spp7e41owtQwbaAL7MvlGHPCj/+c4YTqmdrxvkCga2YTtIEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jmh5CyoK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763538950; x=1795074950;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=ttHK/jdhJP7+B3ekd3LfKU5712mNEV0Po6OfTlme+0M=;
  b=Jmh5CyoKvNiBWuQMaHJ+jR6btz8qi8ENuSuliDp2saETiIIWJ3vkAzto
   IouvIO9Wnx3445Dwus0ZkgVnBPuBeSbDMoJj8T2zq+pXI2xtL2Rq6ziIq
   tT2YcZsqp7draXp5xcxydZOQ1Pd2n1U/9rgh05xdZkSVHjdtX6eNvLCAH
   rCqHO2C9HIXBekmALe24rokB2IZkmNZ6BR0Ayj5P/QVEUSqF+drOrlkwt
   19+B0fqSsSgOE1rpPJbf0mZSYbzwy4Yx5ibykb6CsBcChI9B2DjpBPajT
   7jP0buNRbJz3gcyU9+Te9Fy/kXSK7sTQ2wm8jLxDjYZn69AeMxeIeeW4/
   w==;
X-CSE-ConnectionGUID: Zo1QBBwLQIqUqQfE7oOcCw==
X-CSE-MsgGUID: 4o/lbCibRkmAtoPbwgnf+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="75898021"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="75898021"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 23:55:50 -0800
X-CSE-ConnectionGUID: 54g8AaScT4KbO2gBn3S98g==
X-CSE-MsgGUID: vB14jZciR1iowVsCCvsFQw==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.220])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 23:55:44 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 19 Nov 2025 09:55:41 +0200 (EET)
To: Denis Benato <benato.denis96@gmail.com>
cc: Antheas Kapenekakis <lkml@antheas.dev>, 
    platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v8 05/10] HID: asus: initialize LED endpoint early for
 old NKEY keyboards
In-Reply-To: <b505ffca-63a1-4c52-b940-cdfc507813fc@gmail.com>
Message-ID: <c9d41455-ae5f-9b3d-a936-0e386c6d2d03@linux.intel.com>
References: <20251101104712.8011-1-lkml@antheas.dev> <20251101104712.8011-6-lkml@antheas.dev> <2fc1e683-0234-20b6-7448-bd0213c9bb37@linux.intel.com> <b505ffca-63a1-4c52-b940-cdfc507813fc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-625612865-1763538216=:970"
Content-ID: <acda7151-292c-43f2-0157-47afb7e3ed60@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-625612865-1763538216=:970
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <19fb9886-69c5-899a-8cca-c7779c53d248@linux.intel.com>

On Wed, 19 Nov 2025, Denis Benato wrote:
> On 11/18/25 13:10, Ilpo J=E4rvinen wrote:
> > On Sat, 1 Nov 2025, Antheas Kapenekakis wrote:
> >
> >> These keyboards have always had initialization in the kernel for 0x5d.
> >> At this point, it is hard to verify again and we risk regressions by
> >> removing this. Therefore, initialize with 0x5d as well.
> See patch 1: unless I missed something you can retain the two=A0
> FEATURE_KBD_LED_REPORT_IDx behind the same exact quirk:
> why are we adding a quirk to replace a quirk that was removed
> in patch 1?
>=20
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
> >>  #define QUIRK_ROG_ALLY_XPAD=09=09BIT(13)
> >>  #define QUIRK_SKIP_REPORT_FIXUP=09=09BIT(14)
> >> +#define QUIRK_ROG_NKEY_LEGACY=09=09BIT(15)
> >> =20
> >>  #define I2C_KEYBOARD_QUIRKS=09=09=09(QUIRK_FIX_NOTEBOOK_REPORT | \
> >>  =09=09=09=09=09=09 QUIRK_NO_INIT_REPORTS | \
> >> @@ -669,6 +670,16 @@ static int asus_kbd_register_leds(struct hid_devi=
ce *hdev)
> >>  =09if (ret < 0)
> >>  =09=09return ret;
> >> =20
> >> +=09if (drvdata->quirks & QUIRK_ROG_NKEY_LEGACY) {
> >> +=09=09/*
> >> +=09=09 * These keyboards might need 0x5d for shortcuts to work.
> >> +=09=09 * As it has been more than 5 years, it is hard to verify.
> >> +=09=09 */
> >> +=09=09ret =3D asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> >> +=09=09if (ret < 0)
> >> +=09=09=09return ret;
> >> +=09}
> >> +
> >>  =09/* Get keyboard functions */
> >>  =09ret =3D asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT=
_ID);
> >>  =09if (ret < 0)
> >> @@ -1409,10 +1420,10 @@ static const struct hid_device_id asus_devices=
[] =3D {
> >>  =09  QUIRK_USE_KBD_BACKLIGHT },
> >>  =09{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>  =09    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
> >> -=09  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >> +=09  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NK=
EY_LEGACY },
> >>  =09{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>  =09    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
> >> -=09  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >> +=09  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NK=
EY_LEGACY },
> >>  =09{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>  =09    USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
> >>  =09  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> > You should do FEATURE_KBD_LED_REPORT_ID1 refactoring together, not remo=
ve=20
> > + add back in different patches.
> Granted I still have no idea why that was removed in the first place?
> Then re-added but losing FEATURE_KBD_LED_REPORT_ID1 ?

Did you mean losing ID2 not ID1 as I don't understand what you meant=20
otherwise?

And my suggestion was to not "remove [it] in the first place". In a reply=
=20
to patch 1, Antheas seemed to be agreeable to not remove it first and also
to not remove ID2 but instead introduce the quirk earlier in the series.

> What's the problem with FEATURE_KBD_LED_REPORT_ID1?
>=20
> > I suppose the cleanest would be to add a new patch as first which moves
> > asus_kbd_init() outside of if/else so you can make this refactoring of=
=20
> > FEATURE_KBD_LED_REPORT_ID1 in the 2nd patch.
>
> Again I am missing the point in moving these...

Antheas wants to consolidate the asus_kbd_register_leds() if/else=20
branches. That consolidation requires "moving" code one level up=20
indentation-wise. The series is just misordered currently (in v8 and=20
before) so that code is first removed and then reintroduced later,=20
whereas correct approach to order the series would ensure there are=20
no intermediate step within series that (can) result in lacking something.
My understanding is that this ordering problem is going to be corrected in=
=20
v9.

> > I note there's still contention with this series overall.
> >
> There are a few things that have pretty much the potential of making
> some laptops act funny due to tinkering with initializations commands.
>=20
> The rename will break some tools, but other than that, granted I have yet
> to check the rest of the patchset, looks reasonable to me.
>=20
> Perhaps I am not entirely happy with how things are worded in
> a few instances, but it's a minor issue.

I'd prefer we address nits as well.

--=20
 i.
--8323328-625612865-1763538216=:970--

