Return-Path: <linux-input+bounces-17086-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC9AD1D47F
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 09:55:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 52C2E3024387
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 08:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0CF389E16;
	Wed, 14 Jan 2026 08:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hXCy4DnL"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F7E389E13;
	Wed, 14 Jan 2026 08:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768380796; cv=none; b=THL7T1AQmwCag7siwypVY9Z9l3gnOVP9bB9qSxFPdr5WzbXa2BKhPRsHEnKXOl9ZO/KXOSHAWKAKvYSU9GtBzPBJVoAyXY8CbmX84O0vWGwcBv2o2nhMOjSGSzsZtYxT6kjnA/lFFzUzfvAfG5uEjM9ac5Jq/+A6+WgZFPmhLl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768380796; c=relaxed/simple;
	bh=7ZnBknn2TQjfaT+ftwpz/BrJWjgtDpy1OIG5dPmGBv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dSJrSSaSyPJl+xX/lWIqZBm+FwzeEVSdwygBTdmnuZBCPwtM5vEv/ZmngOfPeWMNUY8PBkMHlJg+bhpsTA/f/Wf3EHzlW10uN0CL4Jv2oQYQSEsc0uUJ8iLwwKLNYfwDOXKELqlh4UmPIJ6CYrVrbWqM7vvigXUFXWEptlNoS/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hXCy4DnL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768380793; x=1799916793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7ZnBknn2TQjfaT+ftwpz/BrJWjgtDpy1OIG5dPmGBv8=;
  b=hXCy4DnLpR+tsgvfauATKQWUGtL8XKZrwQSkw42m8k2MAJyZ1ZWfND88
   2otINySD1+xIDRvUugdbNMFWRh8gB7/N8KSIGuCdb/6WzGtii8cJMFE7v
   ZCnsFd1SeBHjWPS7NXBwmBBMm4Dw0JSCsR66S3cu0vxsgsp2ZzExNqu2i
   67oYtrAdhXmk1ZrMazjSYryrSrXlI//a6ZWo43AZWIlliIAi32DA3qoZR
   aelJahkxBtx+uVTHHOaOjMA9kJhZsqgMI9sLGuUcaOHl2P4Susvh1wIOr
   SocBpGvxtekG111s9FxR95FxnVr9MH9q7bZzAyu8yofCGyXc1QJxjFjMs
   A==;
X-CSE-ConnectionGUID: yX8nLRxCQLClAHEYfht3HQ==
X-CSE-MsgGUID: 5BjRtwlSSUOgqsCo2G3zjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="81039740"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="81039740"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 00:53:10 -0800
X-CSE-ConnectionGUID: o22Nl+IsTJuVGrz+z4tRlQ==
X-CSE-MsgGUID: IunLqo01SRqr9/9PJ6b2BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="208775033"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 00:53:08 -0800
Date: Wed, 14 Jan 2026 10:53:05 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] input: byd: use %*ph for Z packet dump
Message-ID: <aWdZcba5pK99Pfvu@smile.fi.intel.com>
References: <20251202033120.2264474-1-vivek.balachandhar@gmail.com>
 <aWdHsalXcjFKmDDK@black.igk.intel.com>
 <f846343a-49ac-443f-bef3-04e3e08ee20c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f846343a-49ac-443f-bef3-04e3e08ee20c@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jan 14, 2026 at 04:49:32AM -0400, Vivek BalachandharTN wrote:
> Thanks Andy — good point. Packet length is fixed here, so |%4ph| is better.
> I’ll follow this pattern in future patches (and can send a small follow-up
> to adjust this one if desired).

You can find all such places in input subsystem and convert them all
(1 patch per subfolder probably, 1 for keyboard/*, 1 for mouse/*, ...).

P.S. And do not top-post!

-- 
With Best Regards,
Andy Shevchenko



