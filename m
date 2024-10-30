Return-Path: <linux-input+bounces-7768-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BF29B6568
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2024 15:14:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E51F282862
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2024 14:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A37E1EF0AB;
	Wed, 30 Oct 2024 14:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FPjSa31H"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1D01F426B;
	Wed, 30 Oct 2024 14:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730297668; cv=none; b=uobH/TsVClA2Wysy3CkJOYwjJ+vdGycKFlVQRJbe5w/frmC9RlRDR9BuRDtumfK/2JY3rzCVNTeYCYrIIZFPPVfLiuzy7/82YUDQU8+wdIUZ7rmtNXIYBR0wdCgkZrpm1qcEXel8NB6J94y0OV6fQKV+jy4Y/C7oW1AKvgTvvZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730297668; c=relaxed/simple;
	bh=6v75jJwn1usL0U/z2NWIu7iTTkCo+bQoG4AhWCrAXsc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WD0eK83vq5IFWhjobToJwCCynx5cW/JnrTCj1s5owhygH3x9PtTiBpKyytCvLJSi63yrHtfRs3UGWPo6WzN19sm3pPenScTFpULq4PjtrOJ4JnAtgMgSzfzKCyJzDgWt6q050QVITUmtM/s97ez7sQO2zGSsrtJv7NXbjvX0jU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FPjSa31H; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730297666; x=1761833666;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6v75jJwn1usL0U/z2NWIu7iTTkCo+bQoG4AhWCrAXsc=;
  b=FPjSa31Hy6w9NMkz9PQ8BO8WZFz35LjLqCPf0TNH38q/r/6l/aHQhlyL
   XOieSnKTkz9wSpqas/LQ64IDeym2dpMr/rH/Qgov2Xx0w1n6mIIXvzne/
   gSEk+NirUq6wzZGCG3MR1EfZhsSmP5KbXJT66FfHzW8aU5aetr48V4xOc
   jAByYfGrxBBEv41mmP7ch6Xr4pFtjZmjrCtIyv1GIfSqq3hQFe/Ho91P8
   9va0MM/KETckNl2BRcrkrWXlkcpbENhN7tdxFxeDu/58YtGLCgKiE9Vqq
   qQ1KVIvkaox4eBvL1nFtXIJE58LByV+CC17dgz2bjuD83AUjw/SOYi63b
   w==;
X-CSE-ConnectionGUID: hTqjNE2zTk2JMgzdBsabLA==
X-CSE-MsgGUID: cpkgU1yZSn+YeWRCi26EVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41101012"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41101012"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 07:14:26 -0700
X-CSE-ConnectionGUID: ECyDvW95SBKYn6Ar5jXJEQ==
X-CSE-MsgGUID: bd/VU3EXQW6oyY/1LRxOrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="87472530"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.22])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 07:14:23 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 30 Oct 2024 16:14:20 +0200 (EET)
To: Luke Jones <luke@ljones.dev>
cc: LKML <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org, 
    Jiri Kosina <jikos@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hdegoede@redhat.com>, corentin.chary@gmail.com, 
    Mario Limonciello <superm1@kernel.org>, 
    Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v6 8/9] platform/x86: asus-armoury: add core count
 control
In-Reply-To: <46cd22c7-e63a-4dde-aa97-f76ac9bb6b8e@app.fastmail.com>
Message-ID: <cb374d84-c29b-de0d-21d8-c711ccf3ea80@linux.intel.com>
References: <20240930000046.51388-1-luke@ljones.dev> <20240930000046.51388-9-luke@ljones.dev> <33f4f13f-c5ed-ac89-9243-4356976cc042@linux.intel.com> <46cd22c7-e63a-4dde-aa97-f76ac9bb6b8e@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1690526318-1730297660=:1102"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1690526318-1730297660=:1102
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 30 Oct 2024, Luke Jones wrote:

> Hello,
>=20
> On Thu, 17 Oct 2024, at 4:41 PM, Ilpo J=C3=A4rvinen wrote:
> > On Mon, 30 Sep 2024, Luke D. Jones wrote:
> >
> >> Implement Intel core enablement under the asus-armoury module using th=
e
> >> fw_attributes class.
> >>=20
> >> This allows users to enable or disable preformance or efficiency cores
> >> depending on their requirements. After change a reboot is required.
> >>=20
> >> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> >> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> >> ---
> >>  drivers/platform/x86/asus-armoury.c        | 227 ++++++++++++++++++++=
+
> >>  drivers/platform/x86/asus-armoury.h        |  28 +++
> >>  include/linux/platform_data/x86/asus-wmi.h |   4 +
> >>  3 files changed, 259 insertions(+)
> >>=20
> >> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x8=
6/asus-armoury.c
> >> index 09e0cbf24f25..caaa55219946 100644
> >> --- a/drivers/platform/x86/asus-armoury.c
> >> +++ b/drivers/platform/x86/asus-armoury.c
> >> @@ -40,6 +40,24 @@
> >>  #define ASUS_MINI_LED_2024_STRONG 0x01
> >>  #define ASUS_MINI_LED_2024_OFF 0x02
> >> =20
> >> +#define ASUS_POWER_CORE_MASK GENMASK(15, 8)
> >> +#define ASUS_PERF_CORE_MASK GENMASK(7, 0)
> >
> > Align GENMASK()s.
>=20
> That is how clang-format put them using the .clang-format in the repo.=20
> I'm not keen on maintaining style manually as it inevitably develops=20
> inconsistency.=20

Hi Luke,

Then you simply create your own clang-format and put=20
AlignConsecutiveMacros into it.

I'm not buying using a kernel-wide .clang-format as an argument because=20
there are per subsystem variations in various coding style aspects a=20
single file is never going to capture. It also has ColumnLimit: 80 which
is explicitly stated by Linus to not be a rigid rule so that alone proves=
=20
your argument is on very shallow grounds.

The commit that introduced the file states: "Like most tools, it is not=20
perfect nor covers every single case, but it is good enough to be=20
helpful." It's a big set from "being helpful" to "I want to strictly=20
follow what it outputs". I believe that file is there to help you out if=20
you want to get started with the style but it does not guaranteed its=20
output is accepted as is, you will have to tweak its configuration to get=
=20
the desired output here and there if you want to use on daily basis.

--=20
 i.

--8323328-1690526318-1730297660=:1102--

