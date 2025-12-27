Return-Path: <linux-input+bounces-16705-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4657CCDFEC9
	for <lists+linux-input@lfdr.de>; Sat, 27 Dec 2025 16:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89ECF3010A8E
	for <lists+linux-input@lfdr.de>; Sat, 27 Dec 2025 15:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29BC32C0277;
	Sat, 27 Dec 2025 15:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWgkpwXO"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBD229DB99;
	Sat, 27 Dec 2025 15:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766851103; cv=none; b=d2kix8Jh9R+SWuR6lz//d1TutxDz6fTh9YtVsR3xMbb4O3K2AklurqsrRiSKcZVBqQ2jh1h/dx/ahT95aNY9v3329xW5TA8NJ9Nn9IsmOI7AYJ8Jl6rPdaMmToTS10oVJnyoyhphWuPk9mUFeuT07C0CJOlxVYgSqbnUiDPD4eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766851103; c=relaxed/simple;
	bh=4v+8kOjqOjwRVC1yHiSkO5T4paSjMNiuDJsOEBQGduQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVs9PI9djt4fYlur/jIjgUjaRVSpxJcD2/9gLCAZunswv2L+WH0bOYX1JrH1bBa3RDSx5q7gx/I3Tyva47eRkk6chqX0F+JGQ5ZoW+T3N/KOfo6FVn23krMjUQdSJuW9tsUKcAZI4D/n245ulJaneJDRzzt3LdvYYieztN8/hbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWgkpwXO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766851100; x=1798387100;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4v+8kOjqOjwRVC1yHiSkO5T4paSjMNiuDJsOEBQGduQ=;
  b=aWgkpwXOBTHGtNYthyyPko1ZX8w0HowPj0rOs8CwGzGBUdygW+vkNEoD
   7mt6Yhj8tFCOlyXogOyDTFmCQVXS41t8/XzYZxXDAt4Xb3UpbEycaf7A7
   C4ZteZfbHHquRl7mdl3CgYJUm/gbFF79UZ0cJWbsUKF1ad8zusQ3Zy/y+
   JPLYWadg++QFGp4a34p/8Bz05lddWfgV2FsqPY3vQbR6nktNFSCn3gB4P
   ZOGxnvFvP0J5i0bqyW+gbpxNzDf+Hc5Lop5R2rWzDO2GHtnGJXy5SsApl
   MyiZX65jhuG8ctid51wK2CN69GfDtN8oZBxaN9zILShL3NdBbxEhGtMxD
   Q==;
X-CSE-ConnectionGUID: 7RySSBbvRI6lXH0k5+uyhw==
X-CSE-MsgGUID: za+9LaNpSEaaP986SgCMQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="79270749"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="79270749"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 07:58:12 -0800
X-CSE-ConnectionGUID: DaG8HSNHTKS8ZCCkORGaxg==
X-CSE-MsgGUID: qHM5uQIGQmKNbkWeCfCMnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="231230942"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.211])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 07:58:08 -0800
Date: Sat, 27 Dec 2025 17:58:05 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: duoming@zju.edu.cn
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	pali@kernel.org, kuba@kernel.org, alexander.deucher@amd.com,
	akpm@linux-foundation.org, johannes.berg@intel.com,
	pkshih@realtek.com, hverkuil+cisco@kernel.org, tglx@linutronix.de,
	mingo@kernel.org
Subject: Re: [PATCH v2 RESEND 2/2] Input: psmouse - Replace flush_workqueue()
 with disable_delayed_work_sync()
Message-ID: <aVACDawiYQDdQkhu@smile.fi.intel.com>
References: <cover.1765939397.git.duoming@zju.edu.cn>
 <6e40a46e5d9e6e3237702958b8f641263c28d2e4.1765939397.git.duoming@zju.edu.cn>
 <joqpa647tq7mh3lyl27zjv3wr4xbixuuvq7ifti3isifz3gfxg@p3ibbvrsuxud>
 <2e74b4a1.464cb.19b30013387.Coremail.duoming@zju.edu.cn>
 <ho33u6epmzsojiw5zvqksskpzo3f6z2lykvhgektf65stqj6sr@5hq6qd76ezxg>
 <67e94e29.46daa.19b31d9f861.Coremail.duoming@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67e94e29.46daa.19b31d9f861.Coremail.duoming@zju.edu.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Dec 18, 2025 at 10:25:27PM +0800, duoming@zju.edu.cn wrote:
> On Wed, 17 Dec 2025 22:58:33 -0800 Dmitry Torokhov wrote:

...

> > What do you mean? If you enable OLPC support the option to enable hgpk
> > protocol driver should become available, right?
> 
> The hgpk_init() function is never called by any other function in the
> kernel and is therefore dead code. Since the delayed work item recalib_wq
> is initialized within this function, it is consequently never scheduled
> during runtime.

Actually I confirm this as of v6.19-rc2. Perhaps some patch removed some
functionality in the past and we may remove more now?

-- 
With Best Regards,
Andy Shevchenko



