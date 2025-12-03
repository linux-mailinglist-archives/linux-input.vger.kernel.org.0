Return-Path: <linux-input+bounces-16454-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ADCCA0C6B
	for <lists+linux-input@lfdr.de>; Wed, 03 Dec 2025 19:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4787A30038FF
	for <lists+linux-input@lfdr.de>; Wed,  3 Dec 2025 18:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E970235772B;
	Wed,  3 Dec 2025 17:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wi6+OgTZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E6235292F;
	Wed,  3 Dec 2025 17:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764781384; cv=none; b=oJ2macgCZciZMS4qUhRZOo51fyd8t1bvOKcQkdG0tRlJmng4aGJ/8pDmBoHrkif4aDhGwTpzimAUXSOznEqSLIxTI5Qjoof4OiR51tseg8ICMpLweA8jgO4uzKRvCuCYfHvYJchVt3p9GtuwVMrb32BogiT+rxV3D1EUl5k0qd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764781384; c=relaxed/simple;
	bh=/tkmS+Cdhl8OzbpddmgXYvUZFax0nCB5neguOLn0VKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2MBuRso7kqISoA8mr2AuAeBySQW3k7DQX3htFOPPgUOIMQIHRgKAJ726IAH5GcY63sxAlXPrmKtguRjLp9XVyAFkaetDs2fJHX/QtBmmRC92nBeXCo2s8cbaA/ydQoqQQkbwB+fb58O4jK7IMRXXazrQGCvxgIWHX6hGBjSkIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wi6+OgTZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764781383; x=1796317383;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/tkmS+Cdhl8OzbpddmgXYvUZFax0nCB5neguOLn0VKw=;
  b=Wi6+OgTZxAsFvfWmMaDO/EHAKwcfT07G+Q7ACUBnuM1nLjltRhPbf6Nr
   z0UjWp5CB6SMrlGfQIrFv5J0aWGQeHRLSiKc/K5gkbd+9eNbt8MrmBr91
   SCbw3wD4PB/iWXjlz1KdDxzRXrF4mbFRzMwRe8wqEbPbMv/nt0/Wwu1N5
   xIy6bibhRgIJ16K980tUvSdNkUJGIB75MJiPCXalgew0fiQdY4yXhlgt7
   Nd8EcLmkuBGZCZFAO9SlD2EPFjBU23qzuOGjIC2Vqz/TLxo9AJz5lpdcF
   E63yjpFZJvsr9hKFNwE7OVlCOIeH4qxmx3hoXHivLS15CGfl36pIl7LiA
   A==;
X-CSE-ConnectionGUID: thrtZnZjTRub6o/XAWvLgg==
X-CSE-MsgGUID: jCLPTiWDQJm5pVWax8tPgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="65972643"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="65972643"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 09:03:02 -0800
X-CSE-ConnectionGUID: Sij97oWiShmsGyrnqZlm5A==
X-CSE-MsgGUID: gV2Vtec/RYmjJtuo/uuglA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="194391239"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.81])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 09:03:00 -0800
Date: Wed, 3 Dec 2025 19:02:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Even Xu <even.xu@intel.com>, Xinpeng Sun <xinpeng.sun@intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: Intel-thc-hid: Intel-thc: fix dma_unmap_sg() nents
 value
Message-ID: <aTBtQpJI_eu00H9N@smile.fi.intel.com>
References: <20251203165651.69215-2-fourier.thomas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203165651.69215-2-fourier.thomas@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Dec 03, 2025 at 05:56:35PM +0100, Thomas Fourier wrote:
> The `dma_unmap_sg()` functions should be called with the same nents as the
> `dma_map_sg()`, not the value the map function returned.
> 
> Save the number of entries in struct thc_dma_configuration.

Your email has an empty To:. Some spamfilters may be triggered by this.
I recommend to use `b4` tool to handle the patches.

The change LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



