Return-Path: <linux-input+bounces-168-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1B27F2CF0
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 13:18:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 992A61C214A6
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 12:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB4949F7F;
	Tue, 21 Nov 2023 12:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TS1AQg/b"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81586183;
	Tue, 21 Nov 2023 04:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700569079; x=1732105079;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=wnnuzNNdLOIeEWvUOcIzsIsORKSmmKYc9vDtsELq71Y=;
  b=TS1AQg/boJ/143rUPLpyRfgVFwTHm7GCbUYu6pbmq+afIHNOHlP/vqtN
   PyMHNjqvuJb68zMdQSB9NHlpdMEPXDl+VxlVSHH1pVADV+3S/yyx4mrfe
   1KkAvPGpW5I0BU+oX5FsXbsB7f8FOyHt5rPo02ab699iijf8GdRe9Ekmn
   S6xLJaLW61gF2pppyI8sYGoykpBKEuK63m0syttcX20m6ILYMaFV7zv5w
   WB0UXSv4QpX1Fiz8Ip64qhKebbNcopzSjYVE0V0mvIs10JtNZIBwUIeHj
   lMq/Tvma8qXLHuUdVIct4JcrZSwNE4SWJivDNuH7m59+1Cfg+gBNzLU/s
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="458325614"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="458325614"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 04:17:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="14897973"
Received: from sbouradx-mobl.ger.corp.intel.com ([10.252.58.80])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 04:17:56 -0800
Date: Tue, 21 Nov 2023 14:17:53 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org, 
    basavaraj.natikar@amd.com, jikos@kernel.org, benjamin.tissoires@redhat.com, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, 
    platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v5 11/17] platform/x86/amd/pmf: Add capability to sideload
 of policy binary
In-Reply-To: <20231117080747.3643990-12-Shyam-sundar.S-k@amd.com>
Message-ID: <58ccd66-7229-4c83-fa86-ea7d7ff96068@linux.intel.com>
References: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com> <20231117080747.3643990-12-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 17 Nov 2023, Shyam Sundar S K wrote:

> A policy binary is OS agnostic, and the same policies are expected to work
> across the OSes.  At times it becomes difficult to debug when the policies
> inside the policy binaries starts to misbehave. Add a way to sideload such
> policies independently to debug them via a debugfs entry.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---

> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 5f10e5c6335e..f73663c629fe 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c

> +#ifdef CONFIG_AMD_PMF_DEBUG
> +static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
> +				   size_t length, loff_t *pos)
> +{
> +	struct amd_pmf_dev *dev = filp->private_data;
> +	int ret;
> +
> +	/* Policy binary size cannot exceed POLICY_BUF_MAX_SZ */
> +	if (length > POLICY_BUF_MAX_SZ || length == 0)
> +		return -EINVAL;
> +
> +	dev->policy_sz = length;
> +	if (copy_from_user(dev->policy_buf, buf, dev->policy_sz))
> +		return -EFAULT;
> +
> +	ret = amd_pmf_start_policy_engine(dev);

Is this call safe against concurrent invocations from two racing writes?

Other than that, this change looked fine.

> +	if (ret)
> +		return -EINVAL;
> +
> +	return length;
> +}


-- 
 i.


