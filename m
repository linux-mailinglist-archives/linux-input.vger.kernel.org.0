Return-Path: <linux-input+bounces-17084-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE30CD1CE50
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 08:42:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A3CB30213DF
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 07:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493C837B3FE;
	Wed, 14 Jan 2026 07:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RA+CUDD1"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE12E2877D4;
	Wed, 14 Jan 2026 07:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768376250; cv=none; b=tLuN8cyla+usQW0XqYckXmUoEqVD6Rw1/wI1SDZiunlHl3++0hbpZ0AjUozR/z4MxLwSNE9j02kmfBPt4V6s0KtgPpYDCCiLoJNV4plEzVjjoyCB0s2gd6pxyhkPCDoAtUfJk5bFwFuF7pp7puDgLC9PqtJxvVZqd6KuN0BMbdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768376250; c=relaxed/simple;
	bh=T1qGwg1e15H4J6pk8+5ahBXAF+J+4bn3Uo3je5pF8vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thUw+Ee6Zz4J1rKEIS7sohnCmZqIOWmqjk2xkiATNEzM+gGHKN+a9IoVQC3vgkyXm9BaqN0HcPX374BSlYuGdLTeUa1ZTN09Q7Kxnd/JG2pgga097ZshK1eMd/6NXOob55rQcYTOQ5VzQJ5+7u+++AVxykZ8B5vQlzTwJ9gcUGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RA+CUDD1; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768376247; x=1799912247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T1qGwg1e15H4J6pk8+5ahBXAF+J+4bn3Uo3je5pF8vk=;
  b=RA+CUDD1fqn0cDF3bcl9UpQjLKqmKYDRpoHwCd+w2Xsv3+sTmkkQNSgz
   o3JGzZq7OxQtp4qIoGD3Gv4xuGMjMM++plXVjHfGE43N/VPor4q46taQI
   yF/AwHUen1ALFRN3tONnoXvPmh5SewmG4I6MV+0NQeJ4pg4IkBhR1YgG+
   FFA1kaUEh12Nd3NMt50ja8HGFg99nDDFV/KE5BwRWFg9PioHvS7+af/YR
   7ddf2f7kTS6NXcrJrcNg6NjYbpwgi2mINpdRuq4X1Jqtpj0AnkDBM04p3
   xoxyUcxrLeZUGKTWUJgbgACTMP/n8sxlsHMjbryYdr6oIE4mNdDibQMBK
   w==;
X-CSE-ConnectionGUID: gNbCkjNUQBSGL2EAZlB4Iw==
X-CSE-MsgGUID: lNeJ2jOxTE2y8hrsv7ieGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="68877195"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="68877195"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 23:37:24 -0800
X-CSE-ConnectionGUID: WLcomsBXQYGZR3V1Q0rfHQ==
X-CSE-MsgGUID: KZjA/qrDT0a3CQ37n4EWmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="242141008"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 13 Jan 2026 23:37:23 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 332F798; Wed, 14 Jan 2026 08:37:21 +0100 (CET)
Date: Wed, 14 Jan 2026 08:37:21 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] input: byd: use %*ph for Z packet dump
Message-ID: <aWdHsalXcjFKmDDK@black.igk.intel.com>
References: <20251202033120.2264474-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202033120.2264474-1-vivek.balachandhar@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Dec 02, 2025 at 03:31:20AM +0000, Vivek BalachandharTN wrote:
> Replace the hand-rolled %02x formatting of the Z packet warning in the
> BYD driver with the %*ph format specifier. %*ph is the preferred helper
> for printing a buffer in hexadecimal and makes the logging clearer and
> more consistent.

You probably took one of the oldest examples of such a conversion done in
the input subsystem.

> +			     "Unrecognized Z: pkt = %*ph\n",
> +			     4, psmouse->packet);

The (not-so-critical) problem here is the stack consumption and additional work
for the printf() to parse '*'. To optimise that, static field widths may be
embedded in the format strings

			     "Unrecognized Z: pkt = %4ph\n",
			     psmouse->packet);

-- 
With Best Regards,
Andy Shevchenko



