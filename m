Return-Path: <linux-input+bounces-12195-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9707EAADD95
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 13:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1D259872FC
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 11:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D21234963;
	Wed,  7 May 2025 11:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mn81UYnO"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5078233151;
	Wed,  7 May 2025 11:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746618097; cv=none; b=ZpzFpc9SV1qm0jMdwKom693u+ccoCvJ4UsOT6359x7lzuPhbCFVGE0SzJyr040Sr7WQ/lwgIHNVZc6Gh9ocypGWmJ6Y+qwKSngCbHDKMkstznlbLvUkvN1y7Tngr2HhXo9kuwVPDiNzVLORP7xptkuiZcWwHwf9FQBrEOpx15mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746618097; c=relaxed/simple;
	bh=qHiu8ahzD+x4ZTKrsoBCcxqQziMgt53ujYAi5qCE1mI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BHQyEe9/TFyOPiZARR8BVJIAU2+DGmbXuoVZWKqMhPO5BzVrG80FN04SxXWy/HxMS+64jBhG8o8DRE8vlqCyX48JYhvmWNP/h3LbZZSN8u9qe5weS16rj9pk1gfMMvLnpgjMJsq9wm6tjl1d6f5LeikpFpJPsk2EGdBf/Qy8TJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mn81UYnO; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746618095; x=1778154095;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=qHiu8ahzD+x4ZTKrsoBCcxqQziMgt53ujYAi5qCE1mI=;
  b=mn81UYnOu2v/5NYCM6yDlcly/AIzMf33h7W8yv9C7XKJzlglsnOgWDYp
   4doQeKf/blQXoFMUIqp2js/RgZIPwiyIrmAel/bKu75xXU2nqJPIDfX8h
   Qvnum7w7gXFpJTzOTgNAa78rp7RcQy0DaiDGIA9+YufQSP0PjQRuuh3o8
   QYv6jOxN3y6cbG2Pgyc3VJxTMbPFgri7z6u9w/WUqY/VnLdAXdkj0JLHb
   PW6TdchXuDmN6HwOxBKhz9ZEe27wNMkw4sQtG4ep+mqmdqqINhdwb4Dev
   HfWqYOayx/ceccwGeCKQvArooXB5pc9bBeJXoUTK66m+GUAOVCSOjZCqV
   A==;
X-CSE-ConnectionGUID: dl6WH2wvSH+byUNKM43E5Q==
X-CSE-MsgGUID: zpMJK2GARJ2j15NMLVygcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="58538499"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="58538499"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 04:41:35 -0700
X-CSE-ConnectionGUID: GT1xIdd4R6mPnY3UAyHhng==
X-CSE-MsgGUID: ptAQIVnfQCCET4Oczkk6GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="139978951"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 04:41:28 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 7 May 2025 14:41:25 +0300 (EEST)
To: Pavel Machek <pavel@ucw.cz>
cc: Hans de Goede <hdegoede@redhat.com>, bentiss@kernel.org, 
    Werner Sembach <wse@tuxedocomputers.com>, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v9 0/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
In-Reply-To: <aBtFDy+Qu3RvAHur@duo.ucw.cz>
Message-ID: <56a927e8-b6c6-d07b-df34-1a73cdef8528@linux.intel.com>
References: <20250425210043.342288-1-wse@tuxedocomputers.com> <174645314692.23202.56309255974182976.b4-ty@linux.intel.com> <aBtFDy+Qu3RvAHur@duo.ucw.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 7 May 2025, Pavel Machek wrote:

> > Thank you for your contribution, it has been applied to my local
> > review-ilpo-next branch. Note it will show up in the public
> > platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> > local branch there, which might take a while.
> 
> Can I ask you to Cc me with the pull request when you'll send the
> patch upstream?

Hi Pavel,

To not forget your request, I've temporarily added you to the Cc list of 
any PRs I'm sending towards Linus.

This means you'll be Cc'ed the unrelated fixes PRs too but there shouldn't 
be that many of those until the next merge window (I'm sorry about the 
extra noise but I'd likely forget it otherwise). And if I forget to remove 
you afterwards the CC list and you keep getting PRs Cc'ed, please just 
sent me a note then.

-- 
 i.


