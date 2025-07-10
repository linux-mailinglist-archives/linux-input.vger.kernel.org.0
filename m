Return-Path: <linux-input+bounces-13455-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0098AFFE3F
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 11:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14E55582307
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 09:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171FC2D3ECE;
	Thu, 10 Jul 2025 09:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eUNHYEG5"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EF420B80A
	for <linux-input@vger.kernel.org>; Thu, 10 Jul 2025 09:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752140064; cv=none; b=Kb2FLml73lUlzhjLe1vaeJuhU9jcmW0Ur6dTajw0p7I0uE7bOyNrh7ZF3feOX+srSusbbo1zyjcNHkzX3dGCANGFwEVyHzki+EF7IrpE8R1aw64TT/G8wmYyZ04BH6kzJT3xQ/o4ubKl2/W7COG+t0TZPl1fBNht/FTp78v+oTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752140064; c=relaxed/simple;
	bh=gfrfzbhXDP8sVlXvaqr5MMrVVnCjV8edoKhqAFU+hs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rmhzq5w+tTPeMXPBpnANN6rCDw42SpiMVcFDnpRf8UKeexmO8dmn6ift6JZyj0wWEiiS62aazjrZizYvoXWbsNJKftAKhOJFEOIo8uJ1L1kHvg1vMH+XgX04W7JFTma392Yvv4sW4/FmscwpmQGjCKlGHKv2SuObj+qjjlXbX1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eUNHYEG5; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752140062; x=1783676062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gfrfzbhXDP8sVlXvaqr5MMrVVnCjV8edoKhqAFU+hs0=;
  b=eUNHYEG5e5fzyulkSBKSZ5v2V2mX3UFvhaNJrI8zGXSxg9hkX3lzhXuM
   INM6aq8E6rKUjXfgLv3JgvhgsFl+4yLMr5uXiBXJ+jTSLYvblr50mhte9
   CCluN67MsOGTqbJMyv8D4VRxZZ/Tqpbh5JScys+e4eojXGpGwtLSuWkqg
   9Dp4W2lox2VHmR6vCKKNCpOu5c3s84PKk/4/SkYtdZLLF6i+Sle2A6u+o
   /anlcLxznZO0ZHRzOIdseTMopQ0Ps56iPfei8RJt3rq4QYhk6FscNUGYh
   GQxbr82l1/MVDVjbOBBgWvwahgUxpb177opF7xZH8gF/C/OWl4uCXyUal
   A==;
X-CSE-ConnectionGUID: cHtDnK/gRlu0DulxEupG7g==
X-CSE-MsgGUID: 9FDRYyZ1R5GMCMFWrWw6YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="64994191"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="64994191"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 02:34:22 -0700
X-CSE-ConnectionGUID: M0rg8/sgTQ+fO60KTYnOXg==
X-CSE-MsgGUID: gKWrpWbxSLS0c8fvMZwQtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="161683478"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 10 Jul 2025 02:34:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2F6121B7; Thu, 10 Jul 2025 12:34:18 +0300 (EEST)
Date: Thu, 10 Jul 2025 12:34:18 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jiri Kosina <jikos@kernel.org>
Cc: Vicki Pfau <vi@endrift.com>, Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: Fix debug name for BTN_GEAR_DOWN, BTN_GEAR_UP,
 BTN_WHEEL
Message-ID: <aG-JGoafBiqvJpiX@black.fi.intel.com>
References: <20250702034642.124791-1-vi@endrift.com>
 <r8831n3q-n077-p703-p73n-9o981r077rp4@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <r8831n3q-n077-p703-p73n-9o981r077rp4@xreary.bet>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jul 03, 2025 at 09:44:54AM +0200, Jiri Kosina wrote:
> On Tue, 1 Jul 2025, Vicki Pfau wrote:
> 
> > The name of BTN_GEAR_DOWN was WheelBtn and BTN_WHEEL was missing. Further,
> > BTN_GEAR_UP had a space in its name and no Btn, which is against convention.
> > This makes the names BtnGearDown, BtnGearUp, and BtnWheel, fixing the errors
> > and matching convention.
> > 
> > Signed-off-by: Vicki Pfau <vi@endrift.com>
> 
> Applied to hid.git#for-6.16/upstream-fixes. Thanks,

Too quick. This breaks the build.

drivers/hid/hid-debug.c:3302:16: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
 3302 |         [BTN_WHEEL] = "BtnWheel",               [KEY_OK] = "Ok",
      |                       ^~~~~~~~~~
drivers/hid/hid-debug.c:3301:20: note: previous initialization is here
 3301 |         [BTN_GEAR_DOWN] = "BtnGearDown",        [BTN_GEAR_UP] = "BtnGearUp",
      |                           ^~~~~~~~~~~~~
1 error generated.


Please, guys, always test your builds with `make W=1` (when CONFIG_WERROR is
not dropped) and with GCC and clang.

-- 
With Best Regards,
Andy Shevchenko



