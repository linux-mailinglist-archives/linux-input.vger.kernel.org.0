Return-Path: <linux-input+bounces-16502-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FEFCAF6C2
	for <lists+linux-input@lfdr.de>; Tue, 09 Dec 2025 10:17:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF88B304ACAA
	for <lists+linux-input@lfdr.de>; Tue,  9 Dec 2025 09:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D8723B609;
	Tue,  9 Dec 2025 09:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iHvLjRab"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799F21991CB;
	Tue,  9 Dec 2025 09:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765271836; cv=none; b=DR1soLGEs8aKSKaRsW6SSggycirl0fHxiqwnr+5TbI8Zjimc/O9lW83ZNZ79ZrNZXRL52R7VmaLdb/uIhRFxzND6bzfpqv7++k8VtJBalUHT3xFKtExlMHhqMz0obROSjBJOTTomWgsVKj3Lgera+8eBxpq5nZg8AYKB/PjIpR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765271836; c=relaxed/simple;
	bh=Uj8O/+xlsKd9IZAvIlLtZ8OCdQlvdG9JRVMT54CeGBw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=K6Uqlek8M6Dx2D527CEFKzxIHNSjKnLJWYPOjlZHKDqJbMZMwQiltPB8AlbCpv11fk8I6FtUt50nfDl69XY0TCko9MhouM6h+YykTMjYCiKdvcl7d9KPYERj3oQgFfEM0kFUG4iqRaeMU/sxWi38t5iOrlnjLPe9C+krnnwtCOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iHvLjRab; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765271834; x=1796807834;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Uj8O/+xlsKd9IZAvIlLtZ8OCdQlvdG9JRVMT54CeGBw=;
  b=iHvLjRab9aQmAF1FQvVeekAGMrMUyB4B6irugwEJdhK9V3Rv+eSYFKzl
   lsQr5bYNEUq65bN+BxLcX286infRJj2n/1gploeiLBxkNs3FnzaOcraHy
   i5eRqlDiu1yxTL1KZ8W+Ib3PM1m8qLYxM6k/310U3FKkNqWm0VvxrBG6x
   gpDzw85CfnfuBdQuBykaevN5gIuWBIR7dguA8gtic4PLHojnfki9Vlvys
   2DSS5n2+sVxveVPK7Ax0Ja6Bk37/lqfQ9cNVdMpg5hp3zljn5YF99eqnc
   qF8wzNh0zeGM3jQOEM7nkW91uOFXiklnavpDDjv2ui51C8lvdDhn4gPv5
   A==;
X-CSE-ConnectionGUID: rGg85rRuSoC6RxqH3bt5Rg==
X-CSE-MsgGUID: xQ3MeEXcTs2vQhIbjhmGuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="84633387"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="84633387"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 01:17:13 -0800
X-CSE-ConnectionGUID: lEPrX0g1TbWfms9YBg7BxQ==
X-CSE-MsgGUID: qEgUfoobQhi6iAhlrcoNIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="195781335"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.139])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 01:17:09 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 9 Dec 2025 11:17:06 +0200 (EET)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: Kelsios <K3lsios@proton.me>, platform-driver-x86@vger.kernel.org, 
    linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>, 
    Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v10 00/11] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
In-Reply-To: <CAGwozwEud1-6GT=JHoG64f3NUXJ1-wFmWpotNK4s6b=m+1styw@mail.gmail.com>
Message-ID: <1adcffd1-2381-654d-b9b5-966306758509@linux.intel.com>
References: <3ec43b6f-a284-4af7-bcae-8aee11929abb@proton.me> <CAGwozwEeZ5KKZWvhC1i-jS5Yike5gVeFK0yyu56L2-e5JvmsPQ@mail.gmail.com> <CAGwozwEud1-6GT=JHoG64f3NUXJ1-wFmWpotNK4s6b=m+1styw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 6 Dec 2025, Antheas Kapenekakis wrote:

> On Sat, 6 Dec 2025 at 00:03, Antheas Kapenekakis <lkml@antheas.dev> wrote:
> >
> > On Fri, 5 Dec 2025 at 23:13, Kelsios <K3lsios@proton.me> wrote:
> > >
> > > Hello,
> > >
> > > I would like to report a regression affecting keyboard backlight brightness control on my ASUS ROG Zephyrus G16 (model GU605CW).
> > >
> > > Using kernel 6.17.9-arch1-1.1-g14 with the latest HID ASUS patchset v10, keyboard *color* control works correctly, but *brightness* control no longer responds at all. The issue is reproducible on every boot. This problem is not present when using patchset v8, where both color and brightness work as expected.
> > >
> > > Important detail: the issue occurs even **without** asusctl installed, so it must be within the kernel HID/WMI handling and is unrelated to userspace tools.
> > >
> > > Output of dmesg is available here [1], please let me know if any additional information is required.
> > >
> > > Thank you for your time and work on supporting these ASUS laptops.
> > >
> > > Best regards,
> > > Kelsios
> > >
> > > [1] https://pastebin.com/ZFC13Scf
> >
> > [ 1.035986] asus 0003:0B05:19B6.0001: Asus failed to receive handshake ack: -32
> >
> > Oh yeah, asus_kbd_init no longer works with spurious inits so it broke
> > devices marked with QUIRK_ROG_NKEY_LEGACY
> >
> > There are three ways to approach this. One is to ignore the error...
> > second is to drop the quirk... third is to check for the usages for ID1, ID2...
> >
> > I would tend towards dropping the ID2 init and ignoring the error for
> > ID1... Unless an EPIPE would cause the device to close
> 
> Benjamin correctly caught the deviation

BTW, we want to record this knowledge also into the changelog so that the 
next person who'd want to make the check stricter does not need to guess 
whether it was based on a real observed problem or mere guessing there 
could be a problem.

-- 
 i.


