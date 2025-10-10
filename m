Return-Path: <linux-input+bounces-15365-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD12BCDA0F
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 16:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8570B4EBBC7
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 14:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2032F6585;
	Fri, 10 Oct 2025 14:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mD9MOdGJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7B52F6573;
	Fri, 10 Oct 2025 14:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760108110; cv=none; b=YV0iVpe55TtFnX3gmTnKughrKDam9ykADo90As5G3DFL1LodGrNklOEXr4TjBPFgIM4ZDMtii9T3Q1EXah4tg+g6W26GLgFCCMwsNdNqaC7yW+CtSE5aAs0HLoQnROIYOnrp0P5HQsE0mELD1RfBktrGlACHN7pJn9BD/fWD4mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760108110; c=relaxed/simple;
	bh=Yvb8aVJVis9QZMfOYEDqkWf00tU51I0d/lWVnt9mK/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vGasEZRfPTl9rWtDLX9BDjk+DvxHXQEyoJ0PmvUsrTgLypII5G+4W1k8zva7AJtCkAL2vieTdy3k1iM7R7uF1tO4lKdUjFsMzhMCm8uGmRvRVbTJ3gpvqlcl/7C7iUC5Cc0t+qD2zvcNy2xGdlNKOw6gxABMnkX3ry/Cv5DEOeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mD9MOdGJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760108108; x=1791644108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yvb8aVJVis9QZMfOYEDqkWf00tU51I0d/lWVnt9mK/A=;
  b=mD9MOdGJdNvo35QXAEHK6GP73kgABC0Mjqwta+LVHvTzP1Arp8UjzN+9
   WDLha5jbiCfFsWVKNNviqcLxMdGqlUECEQEyM6Qo/XROM+WHNk+egpsbl
   zXSRYwRiAY3MoMldNFaUPvOng+XXEtrQPCyRs0pKxSopJNuILGujN+66K
   fePnng7iE4QtwQl6wKwvkurI1SGhAN0hDoNonHAJhKpdJWZ8IrnkIM4Wb
   EAegZdjo0LLHLUn4MzRN1CekF4U9LuSSgECHX0LrQhvFCKmyp0GypEv2p
   P5/KUkxCBxv8ls6teX2Qa1UOocfs67/1mWhMBks6H4uHWSGPEzBKMMCPn
   A==;
X-CSE-ConnectionGUID: YbGc9nvHT4uUXiejo7Nawg==
X-CSE-MsgGUID: 1VDMKJvuReuJm8SzTsHbbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="79971676"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="79971676"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 07:55:08 -0700
X-CSE-ConnectionGUID: UqSbxBVxQbKlVIxFfwpojg==
X-CSE-MsgGUID: WKpQExJZQnqrmGk3I6IobQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="180250212"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 10 Oct 2025 07:55:06 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 86D8E96; Fri, 10 Oct 2025 16:55:04 +0200 (CEST)
Date: Fri, 10 Oct 2025 16:55:04 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Tero Kristo <tero.kristo@linux.intel.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com
Subject: Re: [PATCH] HID: multitouch: fix name of Stylus input devices
Message-ID: <20251010145504.GI2912318@black.igk.intel.com>
References: <20251008-hid_multitouch_stylus-v1-1-9f43f7e79195@igalia.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251008-hid_multitouch_stylus-v1-1-9f43f7e79195@igalia.com>

Hi,

On Wed, Oct 08, 2025 at 09:40:33AM -0300, Thadeu Lima de Souza Cascardo wrote:
> HID_DG_PEN devices should have a suffix of "Stylus", as pointed out by
> commit c0ee1d571626 ("HID: hid-input: Add suffix also for HID_DG_PEN").
> However, on multitouch devices, these suffixes may be overridden. Before
> that commit, HID_DG_PEN devices would get the "Stylus" suffix, but after
> that, multitouch would override them to have an "UNKNOWN" suffix. Just add
> HID_DG_PEN to the list of non-overriden suffixes in multitouch.
> 
> Before this fix:
> 
> [    0.470981] input: ELAN9008:00 04F3:2E14 UNKNOWN as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-16/i2c-ELAN9008:00/0018:04F3:2E14.0001/input/input8
> ELAN9008:00 04F3:2E14 UNKNOWN
> 
> After this fix:
> 
> [    0.474332] input: ELAN9008:00 04F3:2E14 Stylus as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-16/i2c-ELAN9008:00/0018:04F3:2E14.0001/input/input8
> 
> ELAN9008:00 04F3:2E14 Stylus
> 
> Fixes: c0ee1d571626 ("HID: hid-input: Add suffix also for HID_DG_PEN")
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>

Looks good to me,

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

