Return-Path: <linux-input+bounces-15783-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB8DC15E7F
	for <lists+linux-input@lfdr.de>; Tue, 28 Oct 2025 17:45:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B30B04260AB
	for <lists+linux-input@lfdr.de>; Tue, 28 Oct 2025 16:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625423370E2;
	Tue, 28 Oct 2025 16:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZAtRlfNc"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAAE336EDA;
	Tue, 28 Oct 2025 16:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761669471; cv=none; b=p9giWaeUoCTwlhMw8/OcqJ1lEd2vOmdmsQkjNwDl8Ut0BPXkf70QUGc6kNgf1ieR8FnQafHUOa57fr4DrB0xzm6O7Ap6ZOXijnBGrdJzm9ynjHd8la+QjonPE3CsOwccVRsxvVw9HnzIu6mg3IVlgNAi8JTv7O6cONKrtp/IhnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761669471; c=relaxed/simple;
	bh=ZnXEqSNV3/vRNUYQ71ZmPOGbFbWmKd7kEWK/wEQ5t5Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WHW9GcgkGnH2V6rQOlnOv/mRYKVjy65PUDXF/pDjpsF4/jdFIGv64nHJ/fIWwtZojndPjKpNmfKwuChoPxhTOvZURUigeXquWfjBgq9qUCSaUPst+98OzEVjdQoF7NYK66NXWVBTcpEm3YXd3kxoLFP9Pn6ymKfYavuxArbqW2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZAtRlfNc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761669470; x=1793205470;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=ZnXEqSNV3/vRNUYQ71ZmPOGbFbWmKd7kEWK/wEQ5t5Y=;
  b=ZAtRlfNcJ6nBuRNcPJZoGot2XEba9P4XLmytGagWjmxESAn3WYHsNUTB
   loCIUn86fqVEvsYIYr0PhbIR0945rkiJo4S9bzLCAicawNRWPWPwgTzcQ
   ymbxJetIhoDWZOM+eVoDkZZmRHFrAv0MEzxMHFOjCEe9wW856/KuSpna1
   WTz1DYLBQuV7M/ZvbloGsRWzlhsRgTVa7kNkOglHUlzBW15WK7tq5Ncb1
   5sI+jXdsRO8iXz4w+XIU8IOZ3ceKhcqsyMeChtjKm5nvoEW9PjB+yKB8B
   lTbvPgeVw30kFzz1EMIP+dfdQb6EARsEagukFcTo4jj2RXT33N2P+zGhR
   A==;
X-CSE-ConnectionGUID: ClSs5O+3Rz69Zs6RLWJenQ==
X-CSE-MsgGUID: hE8X/StYQciF3PKEh9QYmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63478810"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="63478810"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 09:37:48 -0700
X-CSE-ConnectionGUID: 82srgfKTRSKHcLRbhypuqg==
X-CSE-MsgGUID: djNFIc1QS0WFeCoIAH4n5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="209005374"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.182])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 09:37:45 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>
Cc: linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
In-Reply-To: <20251020152331.52870-1-hansg@kernel.org>
References: <20251020152331.52870-1-hansg@kernel.org>
Subject: Re: [PATCH 0/2] Input: Add keycodes for electronic privacy screen
 on/off an use these in dell-wmi
Message-Id: <176166946030.2044.306996624771048978.b4-ty@linux.intel.com>
Date: Tue, 28 Oct 2025 18:37:40 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 20 Oct 2025 17:23:29 +0200, Hans de Goede wrote:

> Here is a patch series for adding support for the electronic privacy screen
> on/off events send on e.g. Dell Latitude 7300 models.
> 
> On these laptops the firmware does not allow querying the presence nor
> the status of the eprivacy screen at boot. This makes it impossible to
> implement the drm connector eprivacy properties API (1) since drm objects
> do not allow adding new properties after creation and the presence of
> the eprivacy cannot be detected at boot.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] Input: Add keycodes for electronic privacy screen on/off hotkeys
      commit: 8f3eaad9812f62e7006ad08602444b32c3101824
[2/2] platform/x86: dell-wmi-base: Handle electronic privacy screen on/off events
      commit: 4173edb076b3ae30d734d55fce0ebac63139b656

--
 i.


