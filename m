Return-Path: <linux-input+bounces-167-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5F37F2C87
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 13:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1C48B211D0
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 12:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666B534565;
	Tue, 21 Nov 2023 12:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jjFo8eO+"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE8BBC;
	Tue, 21 Nov 2023 04:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700568404; x=1732104404;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=/PLSyUgcJmx6KNPzQF5PLuRohFCj61urNAYAY17yEIc=;
  b=jjFo8eO+KX6dqfPEBZcsdJ/x4IHgD0RL37J7bnl9SPmVXSmgz/Tmzneb
   yyqDiHcWtsN1T3ByQF27C6t7X4o7gft6aeY7jtOQoazWfOHKOoVOEA1rZ
   e5T/XrF82PIyDezNU9A9opVS1zEQDfLo4N9nfTFfiz396FOv0EOozu9FV
   K7Xg6ikfHvWCATZrSdPmuUGI5ELwWUGnBM0L6nPlzRttfQx3NiFWDly2P
   sMCoMXDJ2RdTEBoNml0L4GQ9gOz0kBaYUmi/1ic88ccEYQk4g2tPA4KL+
   XKIAVZLV5H+mfC/YHfGxDdj6b/MgT1k5OTNt5dj4fyS8/j1KjttRlACQq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="13369104"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="13369104"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 04:06:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="884185320"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="884185320"
Received: from sbouradx-mobl.ger.corp.intel.com ([10.252.58.80])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 04:06:41 -0800
Date: Tue, 21 Nov 2023 14:06:39 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org, 
    basavaraj.natikar@amd.com, jikos@kernel.org, benjamin.tissoires@redhat.com, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, 
    platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v5 10/17] platform/x86/amd/pmf: Add facility to dump TA
 inputs
In-Reply-To: <20231117080747.3643990-11-Shyam-sundar.S-k@amd.com>
Message-ID: <42ef7a80-32fc-aba5-29fe-1884aea65346@linux.intel.com>
References: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com> <20231117080747.3643990-11-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-854194535-1700568403=:1688"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-854194535-1700568403=:1688
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Fri, 17 Nov 2023, Shyam Sundar S K wrote:

> PMF driver sends constant inputs to TA which its gets via the other
> subsystems in the kernel. To debug certain TA issues knowing what inputs
> being sent to TA becomes critical. Add debug facility to the driver which
> can isolate Smart PC and TA related issues.
> 
> Also, make source_as_str() as non-static function as this helper is
> required outside of sps.c file.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-854194535-1700568403=:1688--

