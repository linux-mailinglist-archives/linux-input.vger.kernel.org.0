Return-Path: <linux-input+bounces-7495-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A25099A0B97
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 15:36:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68A3C284A15
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 13:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5FCA209687;
	Wed, 16 Oct 2024 13:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H+aG+yGk"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0FC208D90;
	Wed, 16 Oct 2024 13:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729085776; cv=none; b=oYIjN7cwDr6d7jHcYPBC5llx02/21/0uEEXzEZqefAziCk2RgZ7ycLhN43m37xBta+Ni3mA9h6P2I8umzL4DTEiiubR9TKfkUHx2j9XtQj7U566T6m172FKOeGohbN51Eg2Cyp6yupMuXwunz30MsiZ3kEmnmF3FMgXmf7pkCIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729085776; c=relaxed/simple;
	bh=rR6IpmpJR2hYPl+Sz7LXG5Quja+oS8PBbrmHcgriooQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBONSCdKz015sGC60WHTPuTciPoFL8QF+lV5E1rY+5kgTQJa1vNRSD9zdzsGtNOuptulXKSVPYosruuKnmwUWH6ETrT0gc4i868p6NzW6ajRn/m5bgQSkSS2nYkx+p3V4Sl9wXXQIhhZD55PW3EXzxkPWE/a+bMgASNGwj9Cur0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H+aG+yGk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729085775; x=1760621775;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rR6IpmpJR2hYPl+Sz7LXG5Quja+oS8PBbrmHcgriooQ=;
  b=H+aG+yGkjrQnHo3oHz5mSHGPs2/rorccP/b3HWskTP5WEqcKC2kfo0Gv
   zx6QKNLpPr+Xh0WF22QmWq5Hc+kzIEkmFh7FXuirB6NccAFkuAMb69mPx
   D2Uw3j5MSc1oWcBSbfFe7uUeaIvQwhneYaXBmIBmhDDLsGPLHaLggBeLn
   eHcQf/E/woBCX8bVmgNr4RNhDVyqR06QIxxk0z/kJLuG7I6lpTzUtjiej
   IlKbiFJKtEWr7eE1hC22d6JvfCcj2HAJ3akfiXSBCsHTD3GnV0NZa8wBj
   9XBh23RHGtCKsgbm0vEWIZaZtV80ORy3jo7lrtV4SP2HRJKZSY8Q+sl2V
   w==;
X-CSE-ConnectionGUID: smRjM8/3QQm+v3iQESqWlg==
X-CSE-MsgGUID: WjDygS9NRq+IfwSFwkQ2tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="16152835"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="16152835"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 06:36:15 -0700
X-CSE-ConnectionGUID: GbQmjdefSuaD3UhFg4hVHQ==
X-CSE-MsgGUID: KAZrQ2luTYO7HPfgityxLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="83308332"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 06:36:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t14C9-00000003m9b-1v1Q;
	Wed, 16 Oct 2024 16:36:09 +0300
Date: Wed, 16 Oct 2024 16:36:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jiri Kosina <jikos@kernel.org>
Cc: Thomas Kuehne <thomas.kuehne@gmx.li>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Benjamin Tissoires <bentiss@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] HID: debug: Remove duplicates from 'keys'
Message-ID: <Zw_BSeDEZpTQTf6J@smile.fi.intel.com>
References: <20240905184351.311858-1-andriy.shevchenko@linux.intel.com>
 <nycvar.YFH.7.76.2410151419110.20286@cbobk.fhfr.pm>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2410151419110.20286@cbobk.fhfr.pm>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Oct 15, 2024 at 02:20:19PM +0200, Jiri Kosina wrote:
> On Thu, 5 Sep 2024, Andy Shevchenko wrote:

...

> > drivers/hid/hid-debug.c:3443:18: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
> >  3443 |         [KEY_HANGEUL] = "HanGeul",              [KEY_HANGUP_PHONE] = "HangUpPhone",
> >       |                         ^~~~~~~~~
> > drivers/hid/hid-debug.c:3217:18: note: previous initialization is here
> >  3217 |         [KEY_HANGUEL] = "Hangeul",              [KEY_HANJA] = "Hanja",
> >       |                         ^~~~~~~~~
> > 
> > Fix this by removing them.
> > 
> > The logic of removal is that, remove...
> > 1) if there is a constant that uses another defined constant, OR
> > 2) the one that appears later in the list.

...

> > -	[KEY_HANGUEL] = "Hangeul",		[KEY_HANJA] = "Hanja",
> 
> The problem specifically with this one is really there to fix a typo 
> someone did at some point in the past. See b9ab58dd8e771d ("Input: fix 
> misspelling of Hangeul key").
> 
> So I think we should preserve it somehow.

Right, I fixed that in v2 that has been just sent out.

-- 
With Best Regards,
Andy Shevchenko



