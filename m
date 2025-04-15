Return-Path: <linux-input+bounces-11760-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D590A8941A
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 08:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C16F93B7251
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 06:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D11D2557A;
	Tue, 15 Apr 2025 06:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GI11/ETv"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E8AF4ED;
	Tue, 15 Apr 2025 06:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744699569; cv=none; b=QUEiPY/Bc4M94Q/8z2TUbJ9lOsoNTmHdI79PJo3Cpw7GyNswvKu10kMd0sblBclxpbEBiNkG8BzJell6qKEWCUPgqpWGZd8HZPjzcO9IMKlUbYI+spxQnghzNvWYlCCZStEPw9xqE6u1WZFwJzwO6gt+YRmlIzMohvQKxFycabs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744699569; c=relaxed/simple;
	bh=SBEr8CwCyXVE2U80w9UyF6A35EP/6o196oB1OA0kh/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tW/Dtv7aHYsGlQDvqTBshgLZ/57laotlG1s1P2Z7Kr8pUK6e7OpN0drV9QTg/MA6SoV7sFw8UHm5ulvbr8PaTqoel/4hUrDaoVec5dRYa+Ux7WKiQuVFoZtVBvkc26kKZnczFc6G5ZXnI92I6ZfRR/sKwzZ5NaO79zs7xxXBJ+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GI11/ETv; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744699564; x=1776235564;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SBEr8CwCyXVE2U80w9UyF6A35EP/6o196oB1OA0kh/U=;
  b=GI11/ETvM6V1F9zFlCdfgVWdUFB+aFslHs8M+tOIFaXjZkQIfLhIp7Ln
   vMX2H4wjaFWgnVWSMQTnRkVs6yupz8zGe6riia5TL282b7ip6MbNzrz+9
   ALWH67bsSH8pOQtdRcMwZnB4fMPL0Oc5CUhFLf08oTqmixv2R35fPHBL7
   POZwr1kHT3unpMqWVXMyf5w1L0bFAjyErX31p3ltnin0I9PYud1UzO68+
   1K05/EwJlm2hvScy68Yw+hHQR8gcW9Kvhbqi+4kKObPny7KkBSQX/haD2
   1Y6QQCNSdIGiBfCXG5LjM7oVigiiAAvHrmwTdwdSnTwFf8MzqGOykoOIC
   w==;
X-CSE-ConnectionGUID: VZUrCidmTHWW3lVIRQwu8w==
X-CSE-MsgGUID: 48JXxhLHSA64rE0uwBLu6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="57182746"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="57182746"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 23:46:04 -0700
X-CSE-ConnectionGUID: K63iAaCpTzqDWGS1VbWsYw==
X-CSE-MsgGUID: JTqxjqWGR7Gt9XIYIB8RqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="130567637"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 23:46:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1u4a3T-0000000CSsu-0IkC;
	Tue, 15 Apr 2025 09:45:59 +0300
Date: Tue, 15 Apr 2025 09:45:58 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] HID: simplify code in fetch_item()
Message-ID: <Z_4ApoWzgWSovgRi@smile.fi.intel.com>
References: <ZvwYbESMZ667QZqY@google.com>
 <20241010222451.GA3571761@thelio-3990X>
 <Z_yrjPBO_CPS8WX1@black.fi.intel.com>
 <20250415003326.GA4164044@ax162>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415003326.GA4164044@ax162>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 14, 2025 at 05:33:26PM -0700, Nathan Chancellor wrote:
> On Mon, Apr 14, 2025 at 09:30:36AM +0300, Andy Shevchenko wrote:
> > On Thu, Oct 10, 2024 at 03:24:51PM -0700, Nathan Chancellor wrote:
> > > On Tue, Oct 01, 2024 at 08:42:36AM -0700, Dmitry Torokhov wrote:

...

> > > Getting rid of the unreachable() in some way resolves the issue. I
> > > tested using BUG() in lieu of unreachable() like the second change I
> > > mentioned above, which resolves the issue cleanly, as the default case
> > > clearly cannot happen. ...
> > 
> > As Dmitry pointed out to this old discussion, I have a question about the above
> > test. Have you tried to use BUG() while CONFIG_BUG=n? Does it _also_ solve the
> > issue?
> 
> Yes because x86 appears to always emit ud2 for BUG() regardless of
> whether CONFIG_BUG is set or not since HAVE_ARCH_BUG is always
> respected.

Thank you for the reply. But do you know if this is guaranteed on the rest of
supported architectures? I.o.w. may we assume that BUG() in lieu of unreachable()
will always fix the issue?

-- 
With Best Regards,
Andy Shevchenko



