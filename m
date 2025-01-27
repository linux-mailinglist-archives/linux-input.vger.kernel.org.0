Return-Path: <linux-input+bounces-9584-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 328B8A1D670
	for <lists+linux-input@lfdr.de>; Mon, 27 Jan 2025 14:16:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 674201884EDD
	for <lists+linux-input@lfdr.de>; Mon, 27 Jan 2025 13:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977D51FECD0;
	Mon, 27 Jan 2025 13:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6t9BLJt"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C5A83A14;
	Mon, 27 Jan 2025 13:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737983761; cv=none; b=mQq11m4z2KywMjbfjrfKZYg40SGPBnVgdl7ZjrYw9Wtb7quLFFlImQ4h1CiFl5kcCbkK2myHP6kj6AQZZL83hb6bnaFnYqVQHTTIryl7sBovdYuYYr//P/OkJ46M/gWB/SNazZ5ApKqCxGeq3SmdYLoPP2adUb3ZHp5tFmiPfuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737983761; c=relaxed/simple;
	bh=Xu50GxzR8W1neQ50fgDIVML7KXLqDSAvu3RelbVOPIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qxfIj2e8nunx6WoelyeDx/NnWUxW6JNsWKNNWgSsawcOhRjUyIEqaUxgZGYnAmuqxyyjjPR1qo7mQG5SEm7nLe+KsUnSWALV6zoFM+mnA8EBoSDrVptp5/jWIn2G7VKRZCQ9C0pO59WLlOtd2+/pJfC9UjKv3WR0vUdIveZlrGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6t9BLJt; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737983760; x=1769519760;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xu50GxzR8W1neQ50fgDIVML7KXLqDSAvu3RelbVOPIg=;
  b=X6t9BLJtm1uUR0XSTOZAgA9sOF4yHT5x6G1VDWD8hZpm6B2bCn+00XFx
   SNuc/+MG/K6N1dYUaWvrYgFkhuXUl7qkM8j1vT1/UV+GMKPi3fk+ySeOV
   UocExp82mcDjy5vwg+Keph73zCL/emeI3NCq+EaA//jwC98VgZGPSSU0n
   7ieYnEo1Qwkw6SyCVGrSsTy9NP99d1/KTavPMnj0DzmMapRz7fmM/hvJl
   6fZPgVLCx0q3KLqBMwHy1dmsJFvNGGR11M3W9fydls4aFAf7B6N3s7sBW
   o9O4WhAXZnwg5VQzqO8EUogjn3oPQ+A63xnLUe7WQpNnC9EzkJYzTy8fx
   w==;
X-CSE-ConnectionGUID: p6M82wjtTbWUXPdGJl94pQ==
X-CSE-MsgGUID: bFxhQ6SqRXalx6zrFZ2Tkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="55865269"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="55865269"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 05:16:00 -0800
X-CSE-ConnectionGUID: i9ENptovR+CvTfcByMw/AA==
X-CSE-MsgGUID: YrHx+gLnQEyN+ctfU/sGZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109342261"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 05:15:57 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1tcOy2-00000005jbl-3kHo;
	Mon, 27 Jan 2025 15:15:54 +0200
Date: Mon, 27 Jan 2025 15:15:54 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Ksenija Stanojevic <ksenija.stanojevic@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: mxs_lradc_ts: Warning due to "0 is an invalid IRQ number"
Message-ID: <Z5eHCsri9NphhKOW@smile.fi.intel.com>
References: <CAOMZO5D7z=Eg=WYgzrpqn9VoU8HxMeBbEZiv9KLjMVD1_kRo+w@mail.gmail.com>
 <20200701224145.GA3616172@bjorn-Precision-5520>
 <YrHPA+TBKZU/RuSz@smile.fi.intel.com>
 <87o7ym2fcv.wl-maz@kernel.org>
 <CAOMZO5B6606rwWoG-ydEz2UQpnj9QhUK2b5dCHRtp9u=Pe4new@mail.gmail.com>
 <128b8f7dffe45dc241ad571e8a273a2e@kernel.org>
 <CAOMZO5DmKJia+6O_H3oUP64HQsaac3kDTOKx_UwG0tWJd1bsxw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5DmKJia+6O_H3oUP64HQsaac3kDTOKx_UwG0tWJd1bsxw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jun 21, 2022 at 09:36:57PM -0300, Fabio Estevam wrote:
> Hi Marc,
> 
> On Tue, Jun 21, 2022 at 1:39 PM Marc Zyngier <maz@kernel.org> wrote:
> 
> > I'm not sure I can help you further on that. '10' seems to be
> > the correct interrupt for the interrupt number (irq index 0 in
> > the lradc device).
> 
> As your proposed changes improve things (no more irq 0 warning is seen and the
> touchscreen irq is registered), please submit it formally, if you have a chance.

Sorry, I haven't followed here, is there any progress on this? Or in other words
what the state of affairs with this driver?

> You can add:
> 
> Tested-by: Fabio Estevam <festevam@gmail.com>


-- 
With Best Regards,
Andy Shevchenko



