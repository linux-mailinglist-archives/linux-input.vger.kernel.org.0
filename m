Return-Path: <linux-input+bounces-13082-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7FAAEA254
	for <lists+linux-input@lfdr.de>; Thu, 26 Jun 2025 17:21:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AD781C6036D
	for <lists+linux-input@lfdr.de>; Thu, 26 Jun 2025 15:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5A72E7179;
	Thu, 26 Jun 2025 15:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qj+e1gkG"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53279220F33;
	Thu, 26 Jun 2025 15:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750950599; cv=none; b=uzFJShQWI0SBrxv33uzE/UV1JzGdISKI6dErZNHe/FlJlXcGsNl6mq5srwrwRqgY44jVe3jlR5hnWNHJipCu1hqCnvYTPnk8dAWwRlegS2b5PoED4ej4ufM7NbZq68ppqBHDoPCS+DHgebkmejxIzePuXbjNfFdQbmacg340xdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750950599; c=relaxed/simple;
	bh=ibkcbBAraX/32XHGMwiGxsntrqwdX2jVUQ/RDkpILXA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=owmwgRO7rfikCAx0xD//1RGl7JFACC7jg7de1aqFvaodPomBCcbDeQ6uiG/LipsfaBxshY0af/gygkIOl51Mqb33dYDI8TeG8/eBfKXFIy79LAzRSf4vCza334+kn8Hx0PNYrhr6KT3Z8wq818AT0TSNMKFB99Oaer9OGXnynDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qj+e1gkG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750950597; x=1782486597;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ibkcbBAraX/32XHGMwiGxsntrqwdX2jVUQ/RDkpILXA=;
  b=Qj+e1gkG17GsWXfkHoKX+jSuZuuXnw2i7AtPsNX/fQgRFV15/m+v284r
   sy6KGUXifrcSOMpI5/oIQ/6MV0zJG0ShgAWRKM67OwmvzPjnhkYvepAG7
   PtTDJ/ej5JqFVV+JKjIjnEEsJMU/NuSocq2I1JMK1+NSm++UOWsLW8hHI
   7ByDD/HRwJ/8ZRHrgVTK7OKvhOUQS3nk/tWxvUehLvgHl8ChmNALW/dj3
   nzmNDZb7cLsO63aXtHr9mVY8LnQKobDQ3nei+skIebbksTRiETEPD7AUY
   2rk2gV4o+ytP+VKKYiyeUtNfU5tA3ZCAVsV9a8Aky/ZePF5X+GrhNfw+j
   Q==;
X-CSE-ConnectionGUID: i3T1mV+nRYemzCG+hI0ExA==
X-CSE-MsgGUID: Ty+goWmtQ8+K5dAQDiakow==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53218675"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53218675"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:09:57 -0700
X-CSE-ConnectionGUID: wYlx/oohTlu31DKXkzNtaQ==
X-CSE-MsgGUID: HbH4oal5QNGh89nMRmRT1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="176208306"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.144])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:09:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 26 Jun 2025 18:09:47 +0300 (EEST)
To: Vishnu Sankar <vishnuocv@gmail.com>
cc: pali@kernel.org, dmitry.torokhov@gmail.com, hmh@hmh.eng.br, 
    hansg@kernel.org, tglx@linutronix.de, mingo@kernel.org, jon_xie@pixart.com, 
    jay_lee@pixart.com, zhoubinbin@loongson.cn, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, ibm-acpi-devel@lists.sourceforge.net, 
    platform-driver-x86@vger.kernel.org, vsankar@lenovo.com, 
    Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH] x86/Mouse: thinkpad_acpi/Trackpoint: Trackpoint Doubletap
 handling
In-Reply-To: <CABxCQKvt+vreQN1+BWr-XBu+pF81n5fh9Fa59UBsV_hLgpvh3A@mail.gmail.com>
Message-ID: <4e846cf1-e7c7-3bb9-d8b3-d266b9dfbc4e@linux.intel.com>
References: <20250620004209.28250-1-vishnuocv@gmail.com> <c7eb2d82-a487-1baa-dd89-4276551974ec@linux.intel.com> <CABxCQKvt+vreQN1+BWr-XBu+pF81n5fh9Fa59UBsV_hLgpvh3A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-700605289-1750950587=:930"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-700605289-1750950587=:930
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 26 Jun 2025, Vishnu Sankar wrote:

> Hi Ilpo,
>=20
> Thanks a lot for the comments and guidance.
> Please find my comments inline below.
>=20
> On Wed, Jun 25, 2025 at 9:07 PM Ilpo J=C3=A4rvinen < ilpo.jarvinen@linux.=
intel.com >
> wrote:
>       On Fri, 20 Jun 2025, Vishnu Sankar wrote:
>=20
>       I don't like the shortlog prefixes (in the subject), please don't m=
ake
>       confusing prefixes up like that.
>=20
> Got it.
> I will correct this in V2 (as a patch series).=C2=A0
>=20
>       > Newer ThinkPads have a doubletap feature that needs to be turned
>       > ON/OFF via the trackpoint registers.
>=20
>       Don't leave lines short mid-paragraph. Either reflow the paragraph =
or add
>       an empty line in between paragraphs.
>=20
> Acked.
> Will correct this in V2.=C2=A0=C2=A0
>=20
>       > Systems released from 2023 have doubletap disabled by default and
>       > need the feature enabling to be useful.
>       >
>       > This patch introduces support for exposing and controlling the
>       > trackpoint doubletap feature via a sysfs attribute.
>       > /sys/devices/platform/thinkpad_acpi/tp_doubletap
>       > This can be toggled by an "enable" or a "disable".
>=20
>       This too has too short lines.
>=20
> Sorry!=C2=A0
> Will do the needful in v2.
>=20
>       >
>       > With this implemented we can remove the masking of events, and re=
ly on
>=20
>       "With this implemented" is way too vague wording.
>=20
> Sorry for this!
> I will make this better.=C2=A0
>=20
>       > HW control instead, when the feature is disabled.
>       >
>       > Note - Early Thinkpads (pre 2015) used the same register for hyst=
eris
>=20
>       hysteresis ?
>=20
> Sorry for not being clear.
> It's the trackpoint drag hysteris=C2=A0functionality. Pre-2015 ThinkPads =
used to have a
> user-configurable drag hysterisis=C2=A0register (0x58).
> Drag hysterisis is not user configurable now.
>=20
>       > control, Check the FW IDs to make sure these are not affected.
>=20
>       This Note feels very much disconnected from the rest. Should be pro=
perly
>       described and perhaps in own patch (I don't know)?
>=20
> my bad, it's=C2=A0not FW ID, but PnP ID.=C2=A0
> The older ThinkPad's trackpoint controllers use the same register (0x58) =
to control
> the drag hysteresis, which is obsolete now.
> Now (on newer systems from 2023) the same register (0x58) is remapped as
> doubletap=C2=A0register.=C2=A0=C2=A0
> Just to exclude those older systems (with drag hysterisis control), we ch=
eck the PnP
> ID's.
>
> I will give a better commit message in V2.
>
>       > trackpoint.h is moved to linux/input/.
>=20
>       This patch doesn't look minimal and seems to be combining many chan=
ges
>       into one. Please make a patch series out of changes that can be sep=
arated
>       instead of putting all together.
>=20
> Understood.
> Will make a patch series on V2
> 0001: Move trackpoint.h=C2=A0to include/linux/input
> 0002: Add new doubletap set/status/capable logics to trackpoint.c
> 0003: Add new trackpoint api's and trackpoint sysfs in thinkpad_acpi.c

Okay, sounds better.

>       > +/* List of known incapable device PNP IDs */
>       > +static const char * const dt_incompatible_devices[] =3D {
>       > +=C2=A0 =C2=A0 =C2=A0"LEN0304",
>       > +=C2=A0 =C2=A0 =C2=A0"LEN0306",
>       > +=C2=A0 =C2=A0 =C2=A0"LEN0317",
>       > +=C2=A0 =C2=A0 =C2=A0"LEN031A",
>       > +=C2=A0 =C2=A0 =C2=A0"LEN031B",
>       > +=C2=A0 =C2=A0 =C2=A0"LEN031C",
>       > +=C2=A0 =C2=A0 =C2=A0"LEN031D",
>       > +};
>       > +
>       > +/*
>       > + * checks if it=E2=80=99s a doubletap capable device
>       > + * The PNP ID format eg: is "PNP: LEN030d PNP0f13".
>       > + */
>       > +bool is_trackpoint_dt_capable(const char *pnp_id)
>       > +{
>       > +=C2=A0 =C2=A0 =C2=A0char id[16];
>       > +
>       > +=C2=A0 =C2=A0 =C2=A0/* Make sure string starts with "PNP: " */
>       > +=C2=A0 =C2=A0 =C2=A0if (strncmp(pnp_id, "PNP: LEN03", 10) !=3D 0=
)
>=20
>       We seem to have strstarts().
>=20
> Thanks a lot for the suggestion.
> Will make use of this.=C2=A0
>=20
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;
>       > +
>       > +=C2=A0 =C2=A0 =C2=A0/* Extract the first word after "PNP: " */
>       > +=C2=A0 =C2=A0 =C2=A0if (sscanf(pnp_id + 5, "%15s", id) !=3D 1)
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;
>       > +
>       > +=C2=A0 =C2=A0 =C2=A0/* Check if it's blacklisted */
>       > +=C2=A0 =C2=A0 =C2=A0for (size_t i =3D 0; i < ARRAY_SIZE(dt_incom=
patible_devices); ++i)
>       {
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (strcmp(pnp_i=
d, dt_incompatible_devices[i]) =3D=3D 0)
>=20
>       Isn't this buggy wrt. the PNP: prefix??
>=20
>       Perhaps it would have been better to just do pnp_id +=3D 5 before s=
scanf()
>       as you don't care about the prefix after that.
>=20
>=20
> Understood.
> Shall we have something like the following:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strstarts(pnp_id, "PNP: LEN03"))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;
>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 id =3D pnp_id + 5;
>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (size_t i =3D 0; i < ARRAY_SIZE(dt_incomp=
atible_devices); ++i) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (strncmp(id, dt_incompatible_devices[i],
> strlen(dt_incompatible_devices[i])) =3D=3D 0)

Why did you change to strncmp()?


>       > +=C2=A0 =C2=A0 =C2=A0return sysfs_emit(buf, "%s\n", status ? "ena=
bled" : "disabled");
>=20
>       I'm sure there's an existing helper for this bool -> "enabled"/"dis=
abled"
>       conversion (make sure you add the #include if not yet there when yo=
u use
>       the helper).
>=20
> Is "bool_to_enabled_disabled(status)" the one that you are referring to?

Please see linux/string_choices.h, but after you change the attribute=20
name, this won't be required as you can use normal boolean style with 0/1.

>       > +}
>       > +
>       > +static ssize_t tp_doubletap_store(struct device *dev, struct
>       device_attribute *attr, const char *buf, size_t count)
>       > +{
>       > +=C2=A0 =C2=A0 =C2=A0if (sysfs_streq(buf, "enable")) {
>=20
>       Hmm, should this attribute be named doubletap_enabled and follow th=
e
>       usual
>       boolean convention instead?
>=20
> Will change the attribute name as suggested.=C2=A0

Please also use kstrtobool() then to convert the value.

>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* enabling the =
doubletap here */
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!trackpoint_=
set_doubletap(true))
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0tp_features.trackpoint_doubletap_state =3D true;
>       > +=C2=A0 =C2=A0 =C2=A0} else if (sysfs_streq(buf, "disable")) {
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* disabling the=
 doubletap here */
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!trackpoint_=
set_doubletap(false))
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0tp_features.trackpoint_doubletap_state =3D false;
>       > +=C2=A0 =C2=A0 =C2=A0} else {
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err("ThinkPad=
 ACPI: thinkpad_acpi: Invalid value '%s'
>       for tp_doubletap\n", buf);
>=20
>       No, sysfs store function should not spam log like this, returning -=
EINVAL
>       tells the very same thing already.
>=20
> Acked.
> will be removing the log.=C2=A0
>=20
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;
>       > +=C2=A0 =C2=A0 =C2=A0}
>       > +
>       > +=C2=A0 =C2=A0 =C2=A0return count;
>       > +}


--=20
 i.

--8323328-700605289-1750950587=:930--

