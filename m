Return-Path: <linux-input+bounces-12273-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D740DAB323B
	for <lists+linux-input@lfdr.de>; Mon, 12 May 2025 10:50:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56E163BDCDC
	for <lists+linux-input@lfdr.de>; Mon, 12 May 2025 08:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2BD257AE4;
	Mon, 12 May 2025 08:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KtmMfrV6"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B61259C94;
	Mon, 12 May 2025 08:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747039823; cv=none; b=pjke1zeWa7+yEBdeCsf0/J8XPyx0WH4OWgrzK+0WH5AYxiS9EtEzgTIG059Q/6IHdLl0gxJke2HHkTpvsWPdM+pDbcl9GveQ7f6DQOE3JHL0JWA5W/NsKBVm5TtVm771U1Jb5KEvElmEN+ZkkeIWGcm5+lDEtteZuAMRYNVweb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747039823; c=relaxed/simple;
	bh=XCYjdngT1XLIf0TkErxHKjyCJ8hAiIo1AZDc5hJ8qT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4KRPa58mrXOuMgAO4pBHOjcptlAiPcQUG5L3bKz1bHdeAIY82PnBZpDk7E6Jzr7tsbZt0Ubqm/uvbb9IbfPQlYhbyMKoqB80AOb9BrXEiZ/N06guekzsS4UTBPI1+1yri9A+O6B6Y2nh4pZuby8oMZMMNe4l13Px4x2tuj5Koo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KtmMfrV6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747039821; x=1778575821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=XCYjdngT1XLIf0TkErxHKjyCJ8hAiIo1AZDc5hJ8qT8=;
  b=KtmMfrV6coSmrdABPVoLJT9XBGetktaZPTyzCIoHwql3T5QBwjZFYN6U
   zd3/1qr8YabSWiB5hE4Z6MAgtxoYVFB0sOWtDcOY5mDY7JKGw6XKIdOo7
   6ZPu6JgyXVYZOHk0APcwlpeLom4NFTYtqHAUU1X3k4QmerYKcuKqosTYC
   uum3dGyDbcNlgiTbX5R/daOre+K/A3Hl6KSf+GZ/t6lC3Eo1/AN9mLrjn
   5AwvOG79IwyNIVjbD1XDcguoNKF39QGyZOWJUTC5nmVL9twMmuxETzlgO
   3MuvJ2O+dmkPOTkCoF1XEA98fy7/cK775zSKSmR/Bd6CaQ/N6mnVlz9F/
   g==;
X-CSE-ConnectionGUID: WRYLeokeSQWO1KH2GH1OLA==
X-CSE-MsgGUID: UtHSi1KsRZ2GXxTRQpWYFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="74219686"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="74219686"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 01:50:20 -0700
X-CSE-ConnectionGUID: T0hDIVuvRgaczn9d+CKH2g==
X-CSE-MsgGUID: e7qCMwMlRvm7w98P/Qmyrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="142514433"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 01:50:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uEOrX-00000000rnG-3TQW;
	Mon, 12 May 2025 11:50:15 +0300
Date: Mon, 12 May 2025 11:50:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: lihua - <lihua@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, hdegoede@redhat.com,
	javier.carrasco.cruz@gmail.com, zack.rusin@broadcom.com,
	namcao@linutronix.de, tglx@linutronix.de,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: gpio-keys - Detect long press events in sleep mode
Message-ID: <aCG2Rx_99mP6JFi-@smile.fi.intel.com>
References: <20250506055847.15389-1-lihua@huaqin.corp-partner.google.com>
 <CAAkVrDM1TyM9VQ6rctF75EcLCRbimgJqbA2oH_RvJxC8ex6_vQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAkVrDM1TyM9VQ6rctF75EcLCRbimgJqbA2oH_RvJxC8ex6_vQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 12, 2025 at 03:57:17PM +0800, lihua - wrote:

First of all, do not top-post!

> Hello, All linux team members:
>       Could you please review this modification as soon as possible?

You even haven't waited for a full week...

If it's an (important) fix, made it look so (Fixes: tag, Cc: stable@, etc).

> On Tue, May 6, 2025 at 1:58 PM Hua Li
> <lihua@huaqin.corp-partner.google.com> wrote:
> >
> > Previously, long pressing the gpio key could only detect short press
> > events and could not report long press events in sleep mode, we need
> > to recognize long press events in sleep mode and fix this issue.

-- 
With Best Regards,
Andy Shevchenko



