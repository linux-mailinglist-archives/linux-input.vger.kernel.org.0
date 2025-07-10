Return-Path: <linux-input+bounces-13456-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3575AAFFE40
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 11:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 845F5179E54
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 09:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A38926FDA9;
	Thu, 10 Jul 2025 09:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jpn7G5OP"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B355120B80A
	for <linux-input@vger.kernel.org>; Thu, 10 Jul 2025 09:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752140122; cv=none; b=ifwwMv2AnQCEEW37e2pF1Wpg6ri/Hy/eG50RgBqzZ5ZN5vuz2INB8zMHs0YrrLk04jrFyh46M9qyBfYPIxWlMsR4RBz5Xgmv2rXk4ySuPmO7meBQZ5lyspmMTOZnUA48B2FZ5Wjs9/orB2PDpG00TCXyRpu0nw3nPUogBAFrRmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752140122; c=relaxed/simple;
	bh=1quEgcw5/5xop31uXNRGZmIdqDqnj3ytvIioKu5LDWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFuULmf7+ywlLXq2F/Si9R/S1xyUiHy+0cDfrK5ujny3WFcXWsgVPWzK41lt2Upk4cFKkMUViGCckwlxkq0E13HWAZ9E+50Mg7TB8DVP3eQufgQmV2OMN+AWHHBdoH/pzJvy3NuyXRwtl5pbOesHCLLaZAiDfFIv9QVLH7CRqgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jpn7G5OP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752140121; x=1783676121;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1quEgcw5/5xop31uXNRGZmIdqDqnj3ytvIioKu5LDWg=;
  b=Jpn7G5OPN0qI+UO/8ATPPcQwbSOTRcI4Dpx2x9ax+GQ5uQuDDYY58G/L
   ck8Bt66IjCc81rvnKEqI+3Sh0ps1EPJOGhIxi2gtL13xREkQxjtICOf2k
   1inMX+cgKyshUwvynhjUZ3V5hpsqGLGt4Q4DcwVXshmZwfsJ0Ifismivd
   oHUltaG9pZ2kGrh+Khu9RLPSeDWTQD69/UBWbRC8KW4jSm7zlPdYA+heB
   TPooshLLlwT3cUukEimkzJebPdDel8ezpjNa2R3LrzbuazubGnda38g9q
   IOjSG82yj6DjykOGoxBwnIzwKaKgPM9XiNwR5RmCvDZqD7oTGQzU8NzjA
   Q==;
X-CSE-ConnectionGUID: kF/XG/5bToCIkNFav+n/WA==
X-CSE-MsgGUID: K0fk31LbQGG5Q73IZgx4Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="65765977"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="65765977"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 02:35:20 -0700
X-CSE-ConnectionGUID: /oP8Cv3LR1mjkXOOoZNSUg==
X-CSE-MsgGUID: 4SAtxcVtTvCny8364bItag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="155435292"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 10 Jul 2025 02:35:19 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7BDD51B7; Thu, 10 Jul 2025 12:35:17 +0300 (EEST)
Date: Thu, 10 Jul 2025 12:35:17 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Vicki Pfau <vi@endrift.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: Fix debug name for BTN_GEAR_DOWN, BTN_GEAR_UP,
 BTN_WHEEL
Message-ID: <aG-JVc9eSsYSpt0R@black.fi.intel.com>
References: <20250702034642.124791-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702034642.124791-1-vi@endrift.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jul 01, 2025 at 08:46:42PM -0700, Vicki Pfau wrote:
> The name of BTN_GEAR_DOWN was WheelBtn and BTN_WHEEL was missing.

Not true. Please, read code better.

> Further,
> BTN_GEAR_UP had a space in its name and no Btn, which is against convention.
> This makes the names BtnGearDown, BtnGearUp, and BtnWheel, fixing the errors
> and matching convention.

-- 
With Best Regards,
Andy Shevchenko



