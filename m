Return-Path: <linux-input+bounces-10576-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B717CA54B57
	for <lists+linux-input@lfdr.de>; Thu,  6 Mar 2025 13:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFAA9188A5A7
	for <lists+linux-input@lfdr.de>; Thu,  6 Mar 2025 12:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC33C2066E1;
	Thu,  6 Mar 2025 12:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btbjTowg"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F132208989;
	Thu,  6 Mar 2025 12:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741265941; cv=none; b=jUbl0noBHzNvnpzH3S9Ujbc9FDviA1Tr1L6rdilOjTU98JPd1/MvbTD02ve1VBtEyI7jJa4k2CtPPuFCM9UtsRp+B9uDjxq3JWdnlsU0tOtW0Z3nl8zyIZuk6HRDIgrDSl8Ue5bFsp08eDGvRfAbB9LhqFB86ufSwG5DTbaiSL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741265941; c=relaxed/simple;
	bh=02P0oorDl8YxmCQhswPJRMMGr3XNv4F0KrL94tG01oM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HPPiZjUHDJtzV72bPIV/+yhR2QrY8gPnwKQgNk1QKmg/dDc6TZ+Bgg8sdMxE1i//RxDxjmZwGNchnsrq0tYjLor6abE8lHKa/BqVK/aa4pU+JlUxefWTJ6CtAIZNPUutDRmyyCb9ZDNoMBc569980pQEyQ5vNQGXHvP1I43AC2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=btbjTowg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741265940; x=1772801940;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=02P0oorDl8YxmCQhswPJRMMGr3XNv4F0KrL94tG01oM=;
  b=btbjTowgptSISIlvf3nsnvXnEaNHGretxwu2x4DQ0o8l7kPMbLNASqtX
   /sx4GvxcdB7eJQHuYwTHjtXaOo2jU5pwBGx0HJYZWsvi/7dZVAd01i8Gd
   4YYQC3PjoGEDjjkA4A2Mmp2TGj2gyk57GnfyPBL/6YhKKMGjyJskk1MRL
   RmTf7cPvrD/Cmp8Em1DoUUe2/eZSJ3t/bFMdpPBIU9K+2uqygFDFYzZcW
   3fPp6ra2RG+RgsVN7gyqlgNsRue5qjETnOjJ3CyX4DAxIwRunuGcRXh9+
   3l8YbV5H+M45A1KpO8sypXVguwxH5MF8E+GxlUA1XmNqCZx5EJ7c1e1uC
   Q==;
X-CSE-ConnectionGUID: B8lWhlLIQGi9xYKBJQnddg==
X-CSE-MsgGUID: VEEJxqnWRdGaosBPvSCO3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53670346"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="53670346"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 04:58:59 -0800
X-CSE-ConnectionGUID: 8mhP/ByPQQmN5aTAEtapTg==
X-CSE-MsgGUID: zyJjpjZURWG7Ynn84HcfVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123175948"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.218])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 04:58:56 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 6 Mar 2025 14:58:53 +0200 (EET)
To: Jiri Kosina <jikos@kernel.org>
cc: Luke Jones <luke@ljones.dev>, LKML <linux-kernel@vger.kernel.org>, 
    Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    linux-input@vger.kernel.org, bentiss@kernel.org, mario.limonciello@amd.com
Subject: Re: [PATCH v3 0/2] hid-asus: asus-wmi: refactor Ally
 suspend/resume
In-Reply-To: <878o9n16-33p1-orpr-q957-91ns25pp4804@xreary.bet>
Message-ID: <bff655e3-e1f3-abd9-b476-f656b682a83a@linux.intel.com>
References: <20250227085817.1007697-1-luke@ljones.dev> <878o9n16-33p1-orpr-q957-91ns25pp4804@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 4 Mar 2025, Jiri Kosina wrote:
> On Thu, 27 Feb 2025, Luke Jones wrote:
> 
> > This short series refactors the Ally suspend/resume functionality in the
> > asus-wmi driver along with adding support for ROG Ally MCU version checking.
> > 
> > The version checking is then used to toggle the use of older CSEE call hacks
> > that were initially used to combat Ally suspend/wake issues arising from the MCU
> > not clearing a particular flag on resume. ASUS have since corrected this
> > especially for Linux in newer firmware versions.
> > 
> > - hid-asus requests the MCU version and displays a warning if the version is
> >   older than the one that fixes the issue.
> > - hid-asus awill also toggle the CSEE hack off, and mcu_powersave to on if the
> > version is high enough.
> > 
> > *Note: In review it was requested by Mario that I try strsep() for parsing
> > the version. I did try this and a few variations but the result was much
> > more code due to having to check more edge cases due to the input being
> > raw bytes. In the end the cleaned up while loop proved more robust.
> > 
> > - Changelog:
> >   + V2: https://lore.kernel.org/platform-driver-x86/20250226010129.32043-1-luke@ljones.dev/T/#t
> >     - Adjust warning message to explicitly mention suspend issues
> >     - Use switch/case block to set min_version
> >       - Set min_version to 0 by default and toggle hacks off
> >   + V3
> >     - Remove noise (excess pr_info)
> >     - Use kstrtoint, not kstrtolong
> >     - Use __free(kfree) for allocated mem and drop goto + logging
> >     - Use print_hex_dump() to show failed data after pr_err in mcu_request_version()
> >     - Use pr_debug in set_ally_mcu_hack() and set_ally_mcu_powersave() plus
> >       correct the message.
> > 
> > Luke D. Jones (2):
> >   hid-asus: check ROG Ally MCU version and warn
> >   platform/x86: asus-wmi: Refactor Ally suspend/resume
> > 
> >  drivers/hid/hid-asus.c                     | 111 +++++++++++++++++-
> >  drivers/platform/x86/asus-wmi.c            | 130 ++++++++++++++-------
> >  include/linux/platform_data/x86/asus-wmi.h |  15 +++
> >  3 files changed, 215 insertions(+), 41 deletions(-)
> 
> Hans, are you OK taking both patches through your tree?

Yes, I can take them both.

-- 
 i.


