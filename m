Return-Path: <linux-input+bounces-15960-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9701C4420F
	for <lists+linux-input@lfdr.de>; Sun, 09 Nov 2025 17:13:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ED953ABA1C
	for <lists+linux-input@lfdr.de>; Sun,  9 Nov 2025 16:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E13F53009C8;
	Sun,  9 Nov 2025 16:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kOEZxO6C"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770812F617B;
	Sun,  9 Nov 2025 16:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762704826; cv=none; b=mdu1ITetSY+dG58NMH/I8EfFtzTRY3P92Y0FeZVdnomxiTpmeW4HuvPa7sXsquo22sRt9uqAaWY+fJjGSS/BvEQz5ZTZQKbaTDfasZhoThL5ZxF2/6aBrcsJQAlR4ghWskG0Ni4Q3DCFmVOz4py6fWbCIQ6lKOMutO07RSya2SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762704826; c=relaxed/simple;
	bh=HlAawmje/6kO+lJDdfaN4Nvp64DgyW7C68TFJMZ22Iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gX/uFBph6/t9MLHv4ETExy3RvkJrvhPQE6cKVIn4mMYb7xlcL5+0ZZU3Hr3J21v3oTIJNjMU4trZm4Xu1M9p7HBxHRtqbiPNy0k0BzFcr3AdSt6C/2M41SJIiekqnQgsZOInKYuykYFR/eP2qH9GmgpEkTkzKa9wA8Cy3odESmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kOEZxO6C; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762704825; x=1794240825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HlAawmje/6kO+lJDdfaN4Nvp64DgyW7C68TFJMZ22Iw=;
  b=kOEZxO6CZK0c7d8fTUCMI1AKNoCmHvS38Dviq6qcPQ6pgNCGr1Njnp/p
   Yy5RaTWRSQCuhkT5w/r3g6jmfUTmcvC2q4Gk1TtKdY5vf4O1TmJJluAx5
   Raq2wQ10cD14uMAeqU2CXTAeMWKzZ2YHHXnUshlr6JDzVmjtqLR+OOsa7
   ntRPkz7DuucOOaulqheyUBn1WRfdmjz4pZQ81wETEskt5xZtWEYO+cxDV
   DbekP61LebrMD+yKp8fw3CEoqAT3odEEDCknJznP/LisY2dTbdF6Lr2cA
   ++VH2YVuy6IsW1z8awPzS/x48PKu8QcOPT1r5bK0/9XUTD1mWDaAsJeS+
   A==;
X-CSE-ConnectionGUID: d50Ub1OeR7ecUG386mkCfg==
X-CSE-MsgGUID: lKRXcNAwS6GOMWQo6f5+iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="68621293"
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="68621293"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 08:13:44 -0800
X-CSE-ConnectionGUID: NM0pyYurRACHM1Sts7daIQ==
X-CSE-MsgGUID: kWBUeZNtRSyxg1OeGCp6jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="188431108"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.185])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 08:13:42 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vI82s-000000073xF-26wf;
	Sun, 09 Nov 2025 18:13:38 +0200
Date: Sun, 9 Nov 2025 18:13:38 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmitry.torokhov@gmail.com, kuba@kernel.org,
	alexander.deucher@amd.com, pali@kernel.org,
	hverkuil+cisco@kernel.org, akpm@linux-foundation.org,
	tglx@linutronix.de, mingo@kernel.org, Jonathan.Cameron@huawei.com
Subject: Re: [PATCH 0/2] Input: alps/psmouse: Fix UAF bugs and improve
 workqueue synchronization
Message-ID: <aRC9spWVq43qJWRj@smile.fi.intel.com>
References: <cover.1762604516.git.duoming@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1762604516.git.duoming@zju.edu.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Nov 08, 2025 at 08:40:03PM +0800, Duoming Zhou wrote:
> This patch series addresses use-after-free bugs in the ALPS
> touchpad driver and enhances workqueue handling efficiency
> in the psmouse subsystem.
> 
> The first patch fixes a critical use-after-free race condition
> in the ALPS driver where dev3_register_work could be scheduled
> after the alps_data structure was already freed. This was caused
> by insufficient synchronization during device disconnection,
> where flush_workqueue() couldn't prevent subsequent work item
> submissions.
> 
> The second patch optimizes the psmouse disconnect path by replacing
> flush_workqueue() with disable_delayed_work_sync() for better
> efficiency and robustness.

You forgot two things:
1) make it v2 (run `git format-patch -v<X> ...` where <X> is the version);
2) changelog.

No need to resend (unless requested by the maintainer), just reply with the
missed changelog for now.

-- 
With Best Regards,
Andy Shevchenko



