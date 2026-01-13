Return-Path: <linux-input+bounces-17031-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB90D176AA
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1A91A3003874
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 08:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69EB3128AE;
	Tue, 13 Jan 2026 08:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FvrBe+VI"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165A837FF64;
	Tue, 13 Jan 2026 08:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768294597; cv=none; b=LTjPNFNHdA2+n7CQjnl7X5KwHWdSHgCs6y+m5O1VSsJeFQV9i2ErOm3q8T6OgA37v2UeydDuUP6JwfWvnpsn0JuhiRW4hQ0b5+PKH0KAxu7N2zgmOWf4U2yLjPppmD+TeNIjashF1B+93wUsSqRHUNFRKGQIZjx6WEcN5enIOBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768294597; c=relaxed/simple;
	bh=6WJv5wOmbnGAdxnILkjXuLeOO9AOEkzFRA0Fj9fB3uM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0VAI3gUj2AO5ObuPOaJSbRQNhiH59JXpznK3B0nnDkJl7g9IZQ8NjAPcqYAIttsGcmlg9LnHTnLrJSruFwGL5HXKlDbWDwC07XsiQLSfQMnwEXqP59YbmP6mthldAy/CcKhmt6WBk9FNGLf+qYvoj30zvUDnrL3HLAYkQi9Sp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FvrBe+VI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768294597; x=1799830597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6WJv5wOmbnGAdxnILkjXuLeOO9AOEkzFRA0Fj9fB3uM=;
  b=FvrBe+VIoKdpUi/giBWIuDizvBurneTbaW9ab9JRg4NvQZTRfs9Imn3y
   HFFDhTqeR/tIwsh5hWOw/KGa5Qkx1KDONE2a4oVjn5coOZW+S4TO52lQY
   h2LFUQaW1pVXG6d6aDgnEKLEjiUUMEXZd53Zgu6AGW5mZL1IS730lkkq7
   T+fX7K3RVKN7CbnS2FUfUHf9wi4ToMOpFZ6c9j6p3xYupCw27DXP1zzZk
   RErcRx/Bvgg0d3+MAhA5KOq8uz6w3U3xSzW1iu8EEA/691UxEt74U7Gz7
   sgULR0eCLCApr1sQvIG1G/KV15L1FbUzqaEEVMr6VudvLQ4WnPp5rRw5G
   Q==;
X-CSE-ConnectionGUID: wquteVXJSmaAfkRpPvCg2Q==
X-CSE-MsgGUID: WcyTjVttSQGTbIei1J2F4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69496655"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69496655"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:56:35 -0800
X-CSE-ConnectionGUID: 9dRzuddcT9y8SNg/LO+vpg==
X-CSE-MsgGUID: F1arcZGoSxWx7EddxO4SPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203967782"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:56:33 -0800
Date: Tue, 13 Jan 2026 10:56:31 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2 0/5] Input: gpio_decoder - update driver to use modern
 APIs
Message-ID: <aWYIvwWcGLImkYUv@smile.fi.intel.com>
References: <20251113154616.3107676-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113154616.3107676-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 13, 2025 at 04:44:41PM +0100, Andy Shevchenko wrote:
> Update gpio_decoder driver to use modern in-kernel APIs.

Any news here? It was sent 2 month ago!

-- 
With Best Regards,
Andy Shevchenko



