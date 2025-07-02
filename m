Return-Path: <linux-input+bounces-13333-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A48AF0E96
	for <lists+linux-input@lfdr.de>; Wed,  2 Jul 2025 10:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8DE11C26413
	for <lists+linux-input@lfdr.de>; Wed,  2 Jul 2025 08:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567A223C8A1;
	Wed,  2 Jul 2025 08:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bzODRhrK"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDD61EDA12;
	Wed,  2 Jul 2025 08:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751446671; cv=none; b=G1hJ5ZEuRt6ysMnIGh/Y6rsJMxSenyFamUYbsy4BpaHyoQhMIGrZqnzTIH0cnfrM6aI7pZAbJdKoQRMWrJHivJpadJJmp33Kz9SINTtay4F4GPKQZIi94wrQQ2te/rGyN/URgZdoIENdZcE33agqK+IVxsXE+ECpGgkpRB8AN6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751446671; c=relaxed/simple;
	bh=ohQnaJqAbPxNdMBqJxUtCfGtmagAFDuPLn6d1144XZQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=I29ku8wMY1i0TTEAPCS3YqHnFzpnjb7QKG3cPCV9du0+eS5NDfloFtEBEDYVi7xbi62ksIvvNbXSj9m20TYh+mPSBVqnqZd065Cl59wLISHCrP2O4wGdluZAFVOi9sz2XXjE4zocpZI9kV3RY/IgdQSmgwgCSqSTBQRxYMXPGmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bzODRhrK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751446670; x=1782982670;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ohQnaJqAbPxNdMBqJxUtCfGtmagAFDuPLn6d1144XZQ=;
  b=bzODRhrKE/HpNcRKqkv8MrjSUJNkdY66TqhXSnACYWdNq/5FQ9YPT/YG
   IPOPVwJkeegzzYRnPrMNmxl3zG+scIY8ZaeYGXo2dsZGd5NuNUleZgp47
   WYEWzxLqm5JTMcvH4Q30oddaZ0J1ulUilD5YGaYHTaphg+p15xWu9zY+6
   NK10okXsFIW/X2j3qyumBO+2YC35pTCY4eTjTu1RgRx3WYY0tfD4C4w4g
   iG3wpIbQXQlmagv6Xv45Z4KopKDIKlrl5n2fyazYvAJMwibFfEvM8op7/
   ateZCQb0YSz7daMA2ImA6gU7Lw9p+3jTzjHELyLUP7OyJtVTrSp4G1q+g
   A==;
X-CSE-ConnectionGUID: 0mf7HjxCSkiqgTCKOTXiyw==
X-CSE-MsgGUID: kHRQTbXoSSSGJXc4agYB7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="71161017"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="71161017"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 01:57:49 -0700
X-CSE-ConnectionGUID: 6TDflI0gTYCyz+W8dwSDiQ==
X-CSE-MsgGUID: t5A2l6Z+Qq60mB5+4i/J7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154566630"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.228])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 01:57:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 2 Jul 2025 11:57:39 +0300 (EEST)
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: Vishnu Sankar <vishnuocv@gmail.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, pali@kernel.org, 
    Henrique de Moraes Holschuh <hmh@hmh.eng.br>, hansg@kernel.org, 
    tglx@linutronix.de, mingo@kernel.org, jon_xie@pixart.com, 
    jay_lee@pixart.com, zhoubinbin@loongson.cn, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, ibm-acpi-devel@lists.sourceforge.net, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    Vishnu Sankar <vsankar@lenovo.com>
Subject: Re: [PATCH] x86/Mouse: thinkpad_acpi/Trackpoint: Trackpoint Doubletap
 handling
In-Reply-To: <u6exrggeh7wcs76bbecpwc7egixyvsp4q6xi6xxrzvqhdbwdsg@jecmkl5wzeqs>
Message-ID: <a85c0207-880c-53a4-3c52-6c1e13cb1232@linux.intel.com>
References: <20250620004209.28250-1-vishnuocv@gmail.com> <5jgix7znkfrkopmwnmwkxx35dj2ovvdpplhadcozbpejm32o2j@yxnbfvmealtl> <4ad6e1e1-aca8-4774-aa4a-60edccaa6d0e@app.fastmail.com> <bviu4igchqy6bvu54fw6afts7ooctlmmcutdq6tc4rutzhjvfs@o56kezrit6un>
 <CABxCQKvJzf1G3XLWmqngpy-Ou9U+a7Lzt6gjwZoEcU-+WL6Apw@mail.gmail.com> <u6exrggeh7wcs76bbecpwc7egixyvsp4q6xi6xxrzvqhdbwdsg@jecmkl5wzeqs>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-440591755-1751446659=:939"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-440591755-1751446659=:939
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 30 Jun 2025, Dmitry Torokhov wrote:
> On Mon, Jun 30, 2025 at 08:50:27PM +0900, Vishnu Sankar wrote:
> > On Mon, Jun 30, 2025 at 2:20=E2=80=AFPM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > > On Mon, Jun 30, 2025 at 05:42:45AM +0900, Mark Pearson wrote:
> > > > On Fri, Jun 27, 2025, at 2:14 PM, Dmitry Torokhov wrote:
> > > > > On Fri, Jun 20, 2025 at 09:42:08AM +0900, Vishnu Sankar wrote:
> > > > >> Newer ThinkPads have a doubletap feature that needs to be turned
> > > > >> ON/OFF via the trackpoint registers.
> > > > >> Systems released from 2023 have doubletap disabled by default an=
d
> > > > >> need the feature enabling to be useful.
> > > > >>
> > > > >> This patch introduces support for exposing and controlling the
> > > > >> trackpoint doubletap feature via a sysfs attribute.
> > > > >> /sys/devices/platform/thinkpad_acpi/tp_doubletap
> > > > >> This can be toggled by an "enable" or a "disable".
> > > > >>
> > > > >> With this implemented we can remove the masking of events, and r=
ely on
> > > > >> HW control instead, when the feature is disabled.
> > > > >>
> > > > >> Note - Early Thinkpads (pre 2015) used the same register for hys=
teris
> > > > >> control, Check the FW IDs to make sure these are not affected.
> > > > >>
> > > > >> trackpoint.h is moved to linux/input/.
> > > > >
> > > > > No, please keep everything private to trackpoint.c and do not inv=
olve
> > > > > thinkpad_acpi driver. By doing so you are introducing unwanted
> > > > > dependencies (for both module loading, driver initialization, and
> > > > > operation) and unsafe use of non-owned pointers/dangling pointers=
, etc.
> > > > >
> > > >
> > > > Do you have recommendations on how to handle this case then?
> > > >
> > > > This is a Thinkpad specific feature and hence the logic for involvi=
ng
> > > > thinkpad_acpi. There are Thinkpad hotkeys that will enable/disable =
the
> > > > trackpoint doubletap feature - so there is some linkage. I'm not su=
re
> > > > how to avoid that.
> > > >
> > > > Is there a cleaner way to do this that you'd recommend we look at
> > > > using? It's a feature (albeit a minor one) on the laptops that we'd
> > > > like to make available to Linux users.
> > >
> > > I believe if you define the doubletap as an attribute (see
> > > TRACKPOINT_INT_ATTR or TRACKPOINT_BIT_ATTR in
> > > drivers/input/mouse/trackpoint.c) then whatever process is handling t=
he
> > > hot keys switching this function on or off should be able to toggle t=
he
> > > behavior. The difference is that it will have to locate trackpoint no=
de
> > > in /sys/bus/serio/devices/* (or maybe scan
> > > /sys/devices/platform/i8042/serio*) instead of expecting the attribut=
es
> > > be atached to thinkpad_acpi instance.
> > >
> > > You just don't want to have one driver directly peeking into another,
> > > because then it starts breaking if you unbind or force use of a
> > > different protocol, etc.
> > >
> > > Thanks.
> > >
> > > --
> > > Dmitry
> >=20
> > Thanks for the suggestion. I understand the concern about avoiding
> > direct driver-to-driver calls and unwanted dependencies.
> >=20
> > Just to clarify: if we move the sysfs attribute to the trackpoint
> > driver itself (under /sys/bus/serio/devices/...), then thinkpad_acpi
> > would no longer be able to directly enable/disable the doubletap
> > feature in response to the Fn+G hotkey press. Don't we need userspace
> > to listen for the hotkey event, find the trackpoint sysfs node, and
> > toggle the attribute there?
>=20
> Yes.
>=20
> > That's possible, of course, but it means the feature won't work
> > out-of-the-box without extra userspace integration. For example, there
> > would be no automatic linkage between pressing Fn+G and toggling the
> > feature unless a udev rule or userspace daemon is configured to do it.
> > Or is there an approach you'd recommend to preserve the automatic
> > hotkey integration while avoiding the direct dependency between
> > thinkpad_acpi and trackpoint?
> > Sorry, I missed something.
>=20
> Well, I guess you can look into interacting with sysfs file from
> thinkpad_acpi.c... There is kernel_read_file_from_path() and others, you
> will need to implement write counterpart of it. Pretty ugly but safer
> than following pointers that may go away.

Could device links be used here to ensure the correct shutdown order?

--=20
 i.

--8323328-440591755-1751446659=:939--

