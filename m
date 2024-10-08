Return-Path: <linux-input+bounces-7160-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78519995766
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 21:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 677BC1F262FE
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 19:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF4B2212EF2;
	Tue,  8 Oct 2024 19:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdH8a/U5"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFAE21265B;
	Tue,  8 Oct 2024 19:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728414415; cv=none; b=IdFXVJCjBzBUid2GFQ4m0XPTiXTEOZngNfJRGd/E0E7ql15Lhu/eis83rXt4EDwgd8tL9a0EPX3xdivY8rddn3OtQWpWWQX7h95BSPPjlvlsc+o9WdetpS1bjfB3Fi5ZMW2hG4M3b5iJPcIJV9yAgNV22oXPBiLqaVcuJO+LnC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728414415; c=relaxed/simple;
	bh=la0Kwo1f4XfXE3oy1Lf402r4Bos2s1NoBdmV/Vr/sFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N78/4XuyIBf6dfbugapjDKBXt++u9KJb28rSIsPe4qznBIKcPCaW6K2XjX8btEOgw4bDDNyX4IBlLZayYckyFqWkCwp685lgf7Gn5PvW8CI6kkCVFzGdUw96OAkMjQu3C7zXk26Gcyo6FcQMTKUqNlYVeJgV7paXFibUih7C7jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdH8a/U5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728414414; x=1759950414;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=la0Kwo1f4XfXE3oy1Lf402r4Bos2s1NoBdmV/Vr/sFc=;
  b=gdH8a/U515LkU0eFNwtQMkfxKl5NeKAXEsO9x7OWr5ms3y/VyeZZeKhH
   mh4PItejQCKyS/WyaJTUHFvWy0R8bcObW9MzaNnfnMS3MgEQSJ+K4wtNS
   o4/grbZkAiarNmS2XbdLLITxBm4dmJKU1mJyZWS8Xuuj9JRxiSSKdG6jU
   G+qBgQFe20Whjd+4gfX+3ilIbl8ETH3M5XFjQGqK3X9XcBiDQwNGVgS9q
   mILLvn1ghu9X7/8iuN3txpVZRTxgIo0W9xbCPhtHUDRzoppRBNpRHLEHL
   6eNWMOW276Pm/vih7uJR+vDFZYSOW/yD1QYq1mOypsiMUpBu2zriTK2YG
   g==;
X-CSE-ConnectionGUID: EQIXP9SyQCOVEvlDsHpG4w==
X-CSE-MsgGUID: Hhr9JhPpTp2RLgKn+yFv2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27527192"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="27527192"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 12:06:54 -0700
X-CSE-ConnectionGUID: SYRsucHTSRi0zH2umojr3g==
X-CSE-MsgGUID: kf5YP1SORoiV/1TUleL2yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="75527485"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 12:06:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1syFXl-00000000pEm-1Eaz;
	Tue, 08 Oct 2024 22:06:49 +0300
Date: Tue, 8 Oct 2024 22:06:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Kuehne <thomas.kuehne@gmx.li>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] HID: debug: Remove duplicates from 'keys'
Message-ID: <ZwWCydOAugOSZrFA@smile.fi.intel.com>
References: <20240905184351.311858-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905184351.311858-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 05, 2024 at 09:43:50PM +0300, Andy Shevchenko wrote:
> Duplicates in 'keys prevents kernel builds with clang, `make W=1` and
> CONFIG_WERROR=y, for example:
> 
> drivers/hid/hid-debug.c:3443:18: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
>  3443 |         [KEY_HANGEUL] = "HanGeul",              [KEY_HANGUP_PHONE] = "HangUpPhone",
>       |                         ^~~~~~~~~
> drivers/hid/hid-debug.c:3217:18: note: previous initialization is here
>  3217 |         [KEY_HANGUEL] = "Hangeul",              [KEY_HANJA] = "Hanja",
>       |                         ^~~~~~~~~
> 
> Fix this by removing them.
> 
> The logic of removal is that, remove...
> 1) if there is a constant that uses another defined constant, OR
> 2) the one that appears later in the list.

Can this be applied or is there another approach?

-- 
With Best Regards,
Andy Shevchenko



