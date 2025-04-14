Return-Path: <linux-input+bounces-11746-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4FFA877E3
	for <lists+linux-input@lfdr.de>; Mon, 14 Apr 2025 08:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 178333AF78E
	for <lists+linux-input@lfdr.de>; Mon, 14 Apr 2025 06:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F2219FA92;
	Mon, 14 Apr 2025 06:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cjWxvZen"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E9718DB05;
	Mon, 14 Apr 2025 06:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744612242; cv=none; b=nVsSGxeQSCbnZAilH6XVt3CUllOZua1Tht8CMe1LvcdFpllIOuw+gfuQ6KEKakyAXkVuf1f6JEiVPIqH9VMC3R1BUymNnK9u56izeDKYXb9zwPaHTAbDm7wzHGXQlcRI4eXwAlJlxDawD4anTMrUHQUxjAEPoObdQtxB1E3sSHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744612242; c=relaxed/simple;
	bh=aT/4donNVn5uBD8KT5k0h2cbp19I4j5BAlV0bafHIz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRovb6d+FkaESN5rD3+Xm6bAAJK6MoOmmCfLC36LnZjzE2M5AmH38kZDmLxc21dJrTM4K1qGlMlgo6run/cX4CEn/8tIeYKRUnyk+LoMOGDBdH8JR598pK5qiVNMEePgX0A6ua56QQ1L7DEI2T2rblJgR+sgYRdrLlq47u+LY0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cjWxvZen; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744612241; x=1776148241;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aT/4donNVn5uBD8KT5k0h2cbp19I4j5BAlV0bafHIz4=;
  b=cjWxvZenA33FwonlXrwmpiy2zaYWTr5QmqW80DloFUP1iX385I1djUil
   pp+86rmjACW/3JNpsKJmNBuB1fuBswZ4Xh/WaI35wceit4bkpaLkx2IN5
   dy23UQhRiQLKAVnpBGYOFTVBDmg4x86kNwUWm+7pqUTjonc3SEhW/Pb7K
   yQsdw0/iHutVzmECTOoiEu38fvvOONX+yEa/44FjFmWgo9IBAKNeVoDcW
   1GlgjVVrZww1xta7RzBmJTqmbdv9GMhC0fEDYlwOeHTS6AfEU0LGZ+TPl
   eZgdBcrYufA0ckt0EB+h+bvIT5AchLItsgFGPak7AYx8l4+X7t57WT49w
   w==;
X-CSE-ConnectionGUID: xS5fruHOSDOkXrS+qEqQKQ==
X-CSE-MsgGUID: +psypVrdTbK51puxXVydag==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="56726956"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="56726956"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:30:40 -0700
X-CSE-ConnectionGUID: 7c22gHSsSn2UTlaAa6MZLw==
X-CSE-MsgGUID: rN+ehYh0SdWYEq/ncs4XTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="129694190"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 13 Apr 2025 23:30:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 073F6214; Mon, 14 Apr 2025 09:30:36 +0300 (EEST)
Date: Mon, 14 Apr 2025 09:30:36 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] HID: simplify code in fetch_item()
Message-ID: <Z_yrjPBO_CPS8WX1@black.fi.intel.com>
References: <ZvwYbESMZ667QZqY@google.com>
 <20241010222451.GA3571761@thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010222451.GA3571761@thelio-3990X>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 10, 2024 at 03:24:51PM -0700, Nathan Chancellor wrote:
> On Tue, Oct 01, 2024 at 08:42:36AM -0700, Dmitry Torokhov wrote:

...

> Getting rid of the unreachable() in some way resolves the issue. I
> tested using BUG() in lieu of unreachable() like the second change I
> mentioned above, which resolves the issue cleanly, as the default case
> clearly cannot happen. ...

As Dmitry pointed out to this old discussion, I have a question about the above
test. Have you tried to use BUG() while CONFIG_BUG=n? Does it _also_ solve the
issue?

-- 
With Best Regards,
Andy Shevchenko



