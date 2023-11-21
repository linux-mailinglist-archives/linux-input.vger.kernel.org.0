Return-Path: <linux-input+bounces-166-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6B87F2C7B
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 13:03:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E123B20F96
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 12:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C61C4642D;
	Tue, 21 Nov 2023 12:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UOXeWSF3"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58807122;
	Tue, 21 Nov 2023 04:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700568180; x=1732104180;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=qB2VK/LgbHjxH/7OIGkKCnelQVjm7bxsSfMewaJJDuI=;
  b=UOXeWSF33Anbze3YR8lW7kWRBqU/UoL7RWrkK2UELal4KNqVpnDsZOjj
   vXfYPIEfPJzY8hV+TrHt+MRFJMTkZWuweFS0634OU/v8Ftl6sf5MhfRr6
   PtZJHGoiXIGMEymUWAOpIooSueClevbCi/c9JGzHRGxpCvpIJqmJRp+T6
   GkjOPkLrut0ii9YEDEeUtAUCIj6hkiqeD0RtzXJh3u/682ogcmhJZigIZ
   7CmqfQIOYQEmSRPxl268VNM+5dIqVZzMFna7/pB4nUzzxKpGoa2fXwkzp
   xMejoReoNWylJPmg2+G/XqlsriS3435L8QdImr6wjM1dokn4XX3uNuLnQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="422921936"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="422921936"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 04:02:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="716514204"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="716514204"
Received: from sbouradx-mobl.ger.corp.intel.com ([10.252.58.80])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 04:02:56 -0800
Date: Tue, 21 Nov 2023 14:02:53 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org, 
    basavaraj.natikar@amd.com, jikos@kernel.org, benjamin.tissoires@redhat.com, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, 
    platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v5 06/17] platform/x86/amd/pmf: Add support to get inputs
 from other subsystems
In-Reply-To: <20231117080747.3643990-7-Shyam-sundar.S-k@amd.com>
Message-ID: <ae5cec34-ca52-ad32-4f90-bed2ad15dd4@linux.intel.com>
References: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com> <20231117080747.3643990-7-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-471844286-1700568178=:1688"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-471844286-1700568178=:1688
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Fri, 17 Nov 2023, Shyam Sundar S K wrote:

> PMF driver sends changing inputs from each subystem to TA for evaluating
> the conditions in the policy binary.
> 
> Add initial support of plumbing in the PMF driver for Smart PC to get
> information from other subsystems in the kernel.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---

> +static int amd_pmf_get_battery_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> +{
> +	int val;
> +
> +	val = amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_PRESENT);
> +	if (val >= 0 && val != 1)
> +		return -ENODEV;

This no longer handles errors and was not what I suggested. With 
splitting the check into two I meant this:

	val = amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_PRESENT);
	if (val < 0)
		return val;
	if (val != 1)
		return -NODEV;

After fixing this, please add:

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

> +	in->ev_info.bat_percentage = amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_CAPACITY);
> +	/* all values in mWh metrics */
> +	in->ev_info.bat_design = amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_ENERGY_FULL_DESIGN) /
> +		MILLIWATT_PER_WATT;
> +	in->ev_info.full_charge_capacity = amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_ENERGY_FULL) /
> +		MILLIWATT_PER_WATT;
> +	in->ev_info.drain_rate = amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_POWER_NOW) /
> +		MILLIWATT_PER_WATT;
> +
> +	return 0;
> +}

-- 
 i.

--8323329-471844286-1700568178=:1688--

