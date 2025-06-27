Return-Path: <linux-input+bounces-13124-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A05AAEB00B
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 09:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E40991BC57A4
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 07:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78A3218E96;
	Fri, 27 Jun 2025 07:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PswP3KY8"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C4E1AB52D;
	Fri, 27 Jun 2025 07:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751009339; cv=none; b=hdyi9ZXxWABT75SghieaGoBbgb0KhjtPWz1xvl1Ro9uOpwO0b9W8wXBxgmuNwS//m5daxG/5YKShaEDxl9bP0S8necxhrDQFw3hZGx5ACt6ROBLBZeK7hnX6Wd4R3B2D1zfYTgUK/+E9IKng6HYAyCvZwv1YIjxLOqmQKQUz9DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751009339; c=relaxed/simple;
	bh=xAwbIpUOopjddcY11bRHkhx/0Ecpy5l/9bzYYgCRJlc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lem4IVTSyBxCRKY+1MGlUuRhjNMklrMdrdnwWyI6WitEa9K47qGixgO2JIONuR9ePGIPksY+8dNB5iojsMm1z1loikM3OORrYls2js3xqDn9K6/JzPynUO6laYcjg71BfVgvWWHKtxJ5a7MMpdCUowC5BB4T7NA+EIdbpkyS2p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PswP3KY8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751009338; x=1782545338;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=xAwbIpUOopjddcY11bRHkhx/0Ecpy5l/9bzYYgCRJlc=;
  b=PswP3KY8HdHJJj1ghEvswgsP+Tw0rMc/nMO6XHuPp3WCgxIcICvC+qh1
   NhSsv3myY4AfpKWT/9pLuBKTlhaXwQ/wxIzo9nhbK7udZv0fmSEKNFJXe
   hqckK/JSeCFB/ErhrQs+tIWHFRdLsGcJkKNlfSAH+uym2Jbvr2ErTl7w0
   iAA+oWIT34NLw1qKATfT+WD5ieWGuo2ypeKoQNXG4Ne6H3jwu7sYPN5GS
   ayGEFbEAFFSmKFZmqnhE0rE+dK39Rs0EDPrrIIo5C4MoKEHV1TPEJattD
   p8XlpgU00oNSb7rySuSmd76ZYI2ADaoeUh8XcmOc53IFuscbLZdimlbVB
   w==;
X-CSE-ConnectionGUID: WpXnum9nSuS88q/9z6Ixrw==
X-CSE-MsgGUID: QpH4bd7XR/eyY6TT3ntNwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53443068"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="53443068"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 00:28:57 -0700
X-CSE-ConnectionGUID: AJ8fxX0wTR6hNInBYm1AVg==
X-CSE-MsgGUID: 72VvaYj0TweVXyPOoIacrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="157288625"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 00:28:48 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 27 Jun 2025 10:28:44 +0300 (EEST)
To: Vishnu Sankar <vishnuocv@gmail.com>
cc: pali@kernel.org, dmitry.torokhov@gmail.com, hmh@hmh.eng.br, 
    hansg@kernel.org, tglx@linutronix.de, mingo@kernel.org, jon_xie@pixart.com, 
    jay_lee@pixart.com, zhoubinbin@loongson.cn, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, ibm-acpi-devel@lists.sourceforge.net, 
    platform-driver-x86@vger.kernel.org, vsankar@lenovo.com, 
    Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH] x86/Mouse: thinkpad_acpi/Trackpoint: Trackpoint Doubletap
 handling
In-Reply-To: <CABxCQKt7SjMhX33WGOTk8hdZf1Hvkp8YYFWJK5v1xcbQQm14nQ@mail.gmail.com>
Message-ID: <7ed97f5f-edb2-7f15-1d53-42b7b16a5ae6@linux.intel.com>
References: <20250620004209.28250-1-vishnuocv@gmail.com> <c7eb2d82-a487-1baa-dd89-4276551974ec@linux.intel.com> <CABxCQKvt+vreQN1+BWr-XBu+pF81n5fh9Fa59UBsV_hLgpvh3A@mail.gmail.com> <4e846cf1-e7c7-3bb9-d8b3-d266b9dfbc4e@linux.intel.com>
 <CABxCQKt7SjMhX33WGOTk8hdZf1Hvkp8YYFWJK5v1xcbQQm14nQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-509316558-1751009008=:1730"
Content-ID: <57cbe644-7d65-5a9a-b89c-516906ac4fc6@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-509316558-1751009008=:1730
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <c81ee0c8-a338-e07e-d289-a2db07ee615e@linux.intel.com>

On Fri, 27 Jun 2025, Vishnu Sankar wrote:

> Hi Ilpo,
>=20
> Thanks a lot for the review.
>=20
> On Fri, Jun 27, 2025 at 12:09=E2=80=AFAM Ilpo J=C3=A4rvinen <ilpo.jarvine=
n@linux.intel.com> wrote:
>       On Thu, 26 Jun 2025, Vishnu Sankar wrote:
>=20
>       > Hi Ilpo,
>       >
>       > Thanks a lot for the comments and guidance.
>       > Please find my comments inline below.
>       >
>       > On Wed, Jun 25, 2025 at 9:07 PM Ilpo J=C3=A4rvinen <
>       ilpo.jarvinen@linux.intel.com >
>       > wrote:
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0On Fri, 20 Jun 2025, Vishnu Sankar wrot=
e:
>       >
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0I don't like the shortlog prefixes (in =
the subject), please don't
>       make
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0confusing prefixes up like that.
>       >
>       > Got it.
>       > I will correct this in V2 (as a patch series).=C2=A0
>       >
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> Newer ThinkPads have a doubletap feat=
ure that needs to be
>       turned
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> ON/OFF via the trackpoint registers.
>       >
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0Don't leave lines short mid-paragraph. =
Either reflow the
>       paragraph or add
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0an empty line in between paragraphs.
>       >
>       > Acked.
>       > Will correct this in V2.=C2=A0=C2=A0
>       >
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> Systems released from 2023 have doubl=
etap disabled by default
>       and
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> need the feature enabling to be usefu=
l.
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0>
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> This patch introduces support for exp=
osing and controlling the
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> trackpoint doubletap feature via a sy=
sfs attribute.
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> /sys/devices/platform/thinkpad_acpi/t=
p_doubletap
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> This can be toggled by an "enable" or=
 a "disable".
>       >
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0This too has too short lines.
>       >
>       > Sorry!=C2=A0
>       > Will do the needful in v2.
>       >
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0>
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> With this implemented we can remove t=
he masking of events, and
>       rely on
>       >
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0"With this implemented" is way too vagu=
e wording.
>       >
>       > Sorry for this!
>       > I will make this better.=C2=A0
>       >
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> HW control instead, when the feature =
is disabled.
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0>
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> Note - Early Thinkpads (pre 2015) use=
d the same register for
>       hysteris
>       >
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0hysteresis ?
>       >
>       > Sorry for not being clear.
>       > It's the trackpoint drag hysteris=C2=A0functionality. Pre-2015 Th=
inkPads
>       used to have a
>       > user-configurable drag hysterisis=C2=A0register (0x58).
>       > Drag hysterisis is not user configurable now.
>       >
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> control, Check the FW IDs to make sur=
e these are not affected.
>       >
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0This Note feels very much disconnected =
from the rest. Should be
>       properly
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0described and perhaps in own patch (I d=
on't know)?
>       >
>       > my bad, it's=C2=A0not FW ID, but PnP ID.=C2=A0
>       > The older ThinkPad's trackpoint controllers use the same register
>       (0x58) to control
>       > the drag hysteresis, which is obsolete now.
>       > Now (on newer systems from 2023) the same register (0x58) is rema=
pped
>       as
>       > doubletap=C2=A0register.=C2=A0=C2=A0
>       > Just to exclude those older systems (with drag hysterisis control=
), we
>       check the PnP
>       > ID's.
>       >
>       > I will give a better commit message in V2.
>       >
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> trackpoint.h is moved to linux/input/=
=2E
>       >
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0This patch doesn't look minimal and see=
ms to be combining many
>       changes
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0into one. Please make a patch series ou=
t of changes that can be
>       separated
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0instead of putting all together.
>       >
>       > Understood.
>       > Will make a patch series on V2
>       > 0001: Move trackpoint.h=C2=A0to include/linux/input
>       > 0002: Add new doubletap set/status/capable logics to trackpoint.c
>       > 0003: Add new trackpoint api's and trackpoint sysfs in thinkpad_a=
cpi.c
>=20
>       Okay, sounds better.
>=20
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> +/* List of known incapable device PN=
P IDs */
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> +static const char * const dt_incompa=
tible_devices[] =3D {
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> +=C2=A0 =C2=A0 =C2=A0"LEN0304",
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> +=C2=A0 =C2=A0 =C2=A0"LEN0306",
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> +=C2=A0 =C2=A0 =C2=A0"LEN0317",
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> +=C2=A0 =C2=A0 =C2=A0"LEN031A",
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> +=C2=A0 =C2=A0 =C2=A0"LEN031B",
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> +=C2=A0 =C2=A0 =C2=A0"LEN031C",
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> +=C2=A0 =C2=A0 =C2=A0"LEN031D",
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> +};
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> +
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> +/*
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> + * checks if it=E2=80=99s a doubleta=
p capable device
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> + * The PNP ID format eg: is "PNP: LE=
N030d PNP0f13".

There's case difference between this comment and the list.

>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> + */
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> +bool is_trackpoint_dt_capable(const =
char *pnp_id)
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> +{
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> +=C2=A0 =C2=A0 =C2=A0char id[16];
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> +
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> +=C2=A0 =C2=A0 =C2=A0/* Make sure str=
ing starts with "PNP: " */
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> +=C2=A0 =C2=A0 =C2=A0if (strncmp(pnp_=
id, "PNP: LEN03", 10) !=3D 0)
>       >
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0We seem to have strstarts().
>       >
>       > Thanks a lot for the suggestion.
>       > Will make use of this.=C2=A0
>       >
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return false;
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> +
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> +=C2=A0 =C2=A0 =C2=A0/* Extract the f=
irst word after "PNP: " */
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> +=C2=A0 =C2=A0 =C2=A0if (sscanf(pnp_i=
d + 5, "%15s", id) !=3D 1)
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return false;
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> +
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> +=C2=A0 =C2=A0 =C2=A0/* Check if it's=
 blacklisted */
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> +=C2=A0 =C2=A0 =C2=A0for (size_t i =
=3D 0; i <
>       ARRAY_SIZE(dt_incompatible_devices); ++i)
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0{
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (strcmp(pnp_id, dt_incompatible_devices[i]) =3D=3D
>       0)
>       >
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0Isn't this buggy wrt. the PNP: prefix??
>       >
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0Perhaps it would have been better to ju=
st do pnp_id +=3D 5 before
>       sscanf()
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0as you don't care about the prefix afte=
r that.
>       >
>       >
>       > Understood.
>       > Shall we have something like the following:
>       > =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strstarts(pnp_id, "PNP: LEN03"))
>       > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;
>       >
>       > =C2=A0 =C2=A0 =C2=A0 =C2=A0 id =3D pnp_id + 5;
>       >
>       > =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (size_t i =3D 0; i < ARRAY_SIZE(d=
t_incompatible_devices);
>       ++i) {
>       > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if (strncmp(id, dt_incompatible_devices[i],
>       > strlen(dt_incompatible_devices[i])) =3D=3D 0)
>=20
>       Why did you change to strncmp()?
>=20
> I switched to strncmp() to allow matching just the known prefix part in
> dt_incompatible_devices, rather than requiring an exact full string match=
=2E
> Will keep the original "if (strcmp(id, dt_incompatible_devices[i]) =3D=3D=
 0) " logic as
> it serves the purpose.

I didn't mean to say the change is necessarily incorrect, I was just=20
asking for reasonale as it was different from the original.

If you think you it needs to be broader to the match to a prefix only,=20
I've no problem with that.

--=20
 i.
--8323328-509316558-1751009008=:1730--

