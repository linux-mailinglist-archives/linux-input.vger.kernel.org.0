Return-Path: <linux-input+bounces-9106-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0A1A0717C
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 10:32:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F141161F54
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 09:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B39D21518F;
	Thu,  9 Jan 2025 09:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X9H0Xc/B"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD34B214A79;
	Thu,  9 Jan 2025 09:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736415128; cv=none; b=QRi02yLb5izu37lyLKg5I51YxmmmYWIu3kmQTze3nw2Weovtcx72nkQzoIJNn/jVkLzWm0/01Gxk/nzi2mqD3u2RSYj7P9vdgxax011mfpKH7Jii/rc1Qd4Iv3atVnGogtppKpFUSA0/nB48EzFB21af3czsnPwG9x1BJNpddYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736415128; c=relaxed/simple;
	bh=F8PfaF92hEGiPMHVAoH/OGJgfuAfo6TqZdANxZAKNy0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZAvqk1yJvS4Eyqwfm+NwiebD5oFXd1NedKO0WJXqHs2+/hsIU2pTcDzOCGE43OKDn2K1gZ2Xy1G0VcrwU5nrzNbluv5OU2q/UzTSS4RQZ851qcOAAFkFAoS2fzYdYoyIaSIw6ybT/lU+V4bXF47KKIrh4htPY3gModDsuAU0oVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X9H0Xc/B; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736415127; x=1767951127;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=F8PfaF92hEGiPMHVAoH/OGJgfuAfo6TqZdANxZAKNy0=;
  b=X9H0Xc/BioBcQ5Qg4o3uWsZPGQwdx8OCSI7Ree9nAm4Nl3Ls8y64WBaD
   NLwkaQozrOIvUpKpGykwALbDq8ENA2ecMIpsRav/yZDQ9LSr9CbzADNGm
   8T+f9w7r3CShKfWFclx8XFPSvqkwO92xvidkPjDy6NqkLYoZ2pRF3AGRF
   vuz8X/r6v1nOp9GlzPT/OAf/wbiIv6MdYj731fYpIMwEmeNPkpMcf4t+l
   H1cMvF27ykR53I7Xey4yImMWs6jPnsl0VBrgVJrQiXkkBWRCnfJb49R8r
   kHx4QCfWSWPpGhAY+pf0iHBGDNECi3FxOgfGnG6ie76uptF91V0P7IEyl
   Q==;
X-CSE-ConnectionGUID: YvMjvKNxR0qaAztVO1kSBg==
X-CSE-MsgGUID: 2FXs5QVzT3aMOoyyFgDOPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36688544"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="36688544"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 01:32:06 -0800
X-CSE-ConnectionGUID: LIg1fcz1SXe63ilGcG6YxQ==
X-CSE-MsgGUID: VpRORo2hTM2fjI2d1YOr4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="103166194"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.210])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 01:32:02 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 9 Jan 2025 11:31:58 +0200 (EET)
To: Jiri Kosina <jikos@kernel.org>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    Basavaraj Natikar <basavaraj.natikar@amd.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Akshata MukundShetty <akshata.mukundshetty@amd.com>, 
    Patil Rajesh Reddy <patreddy@amd.com>, platform-driver-x86@vger.kernel.org, 
    linux-input@vger.kernel.org, Patil Rajesh Reddy <Patil.Reddy@amd.com>
Subject: Re: [PATCH v2 2/2] platform/x86/amd/pmf: Get SRA sensor data from
 AMD SFH driver
In-Reply-To: <2937457n-6519-50p4-2696-oq391s2no1s7@xreary.bet>
Message-ID: <10e983eb-f82a-aac9-a92e-3dce659e7ffa@linux.intel.com>
References: <20241217151627.757477-1-Shyam-sundar.S-k@amd.com> <20241217151627.757477-3-Shyam-sundar.S-k@amd.com> <2937457n-6519-50p4-2696-oq391s2no1s7@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 9 Jan 2025, Jiri Kosina wrote:
> On Tue, 17 Dec 2024, Shyam Sundar S K wrote:
> 
> > The AMD SFH driver includes APIs to export SRA sensor data. This data is
> > utilized by the AMD PMF driver to transmit SRA data to the PMF TA,
> > enabling the AMD PMF driver to implement the output actions specified by
> > the PMF TA.
> > 
> > Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> > Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> > Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> > ---
> >  drivers/platform/x86/amd/pmf/pmf.h | 18 ++++++++++-
> >  drivers/platform/x86/amd/pmf/spc.c | 51 ++++++++++++++++++++++++++++++
> >  2 files changed, 68 insertions(+), 1 deletion(-)
> 
> Hans, can I please get your Acked-by: for these bits so that I could take 
> the whole lot via hid.git?

Hi Jiri,

I already merged those to pdx86 repo (the changes are only in my 
review-ilpo-next staging branch currently waiting for LKP's build check).
There will be conflict with other amd/pmf changes made in this cycle if 
you route this patch through your tree. So either I take both or you make 
an immutable branch out of the first patch, which way you want?

I figured as the amd-sfh-hid maintainer is among the submitters that 
counts some form ack (and amd-sfh-hid seems really low volume to begin 
with) but perhaps you'd have wanted me to wait yours as well?

-- 
 i.


