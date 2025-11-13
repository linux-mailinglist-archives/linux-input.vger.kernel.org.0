Return-Path: <linux-input+bounces-16087-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B631CC58A5D
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 17:16:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 417D236041B
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 15:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD1C345CBA;
	Thu, 13 Nov 2025 15:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QNgu245Z"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F178A3451C7;
	Thu, 13 Nov 2025 15:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763048782; cv=none; b=j39d6XEXrWCRy1zB8BgkgjX7YUqkuZcifjwxdfJrzaW8RoNocLFKKFpYGRhNwj1uwa+HTTwg2AFmQdw4RxpQrWecJm9V7t0xO/31AlgscghgUdH7SpBwwa10r0JuyrxCOWUnGz1vgh9AHETYURA3iQpEJ86KXSQkxe8MUUowfco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763048782; c=relaxed/simple;
	bh=ubQWDbFtYlVlHAYe/op5Dbib0kbiXX4+stK8ZRo/Lrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WpFdEZWDeSp7Hd0AWOClAJiGwGlj251NHfT0umi3bq06FDcV8pKIx6gOzfe60kgwNyQG9K+12cNtIV2k2ui1XZ6dOh4kUQ0zgUpLr6v1sn7o6YtirfegquXUAd2sd2FVgz42EEtq7kRE5Da3NDzjjQa3POxavbUzAu9+OV4CcII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QNgu245Z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763048780; x=1794584780;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ubQWDbFtYlVlHAYe/op5Dbib0kbiXX4+stK8ZRo/Lrc=;
  b=QNgu245Z+bgCsra0bWLyStbVIaSCqQ0qFLjVGFia9kEFh485Dabml4FL
   oKyAtP4wNmYK8hpnCtiRhF+9BaG4VbW2OKwEAigjJzpuELYhXdUbHGsCK
   qx+PJj/zgew5hmqBVA8rwQYiUPMUlzA9pROfX4jn6s5V6hM2YZzQw05Xt
   /T+PG3wcBXoScbTdVNqXgar1rTTxJ8YkhjEVsi8uyYgMFT+PLjrHsoIV6
   CKiTjG028/RRGe4yXJLVvZDF7klccy4wh2oOq1075DX3TZ48gz6lUMhtC
   ts2nEdchtCdwyPVYfesTZyAmFVnwOoq25x7b3vv1dyF06hnq3ZSDRLtW2
   Q==;
X-CSE-ConnectionGUID: 3+TCnLD8Qp6Y6K0/K0hbbw==
X-CSE-MsgGUID: xX2etqwGQT+EaNPMLjgEsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75448543"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="75448543"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 07:46:19 -0800
X-CSE-ConnectionGUID: F8lLFZW6SiOdgTReWZ+44g==
X-CSE-MsgGUID: JjIvnuGkRNKcYVgv/B2+og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="212933921"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 13 Nov 2025 07:46:18 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 88DEB96; Thu, 13 Nov 2025 16:46:17 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 0/5] Input: gpio_decoder - update driver to use modern APIs
Date: Thu, 13 Nov 2025 16:44:41 +0100
Message-ID: <20251113154616.3107676-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update gpio_decoder driver to use modern in-kernel APIs.

Changelog v2:
- fixed typo (LKP), dunno what I have compiled before

v1: 20251112191412.2088105-1-andriy.shevchenko@linux.intel.com

Andy Shevchenko (5):
  Input: gpio_decoder - make use of device properties
  Input: gpio_decoder - unify messages with help of dev_err_probe()
  Input: gpio_decoder - replace custom loop by
    gpiod_get_array_value_cansleep()
  Input: gpio_decoder - make use of the macros from bits.h
  Input: gpio_decoder - don't use "proxy" headers

 drivers/input/misc/gpio_decoder.c | 72 ++++++++++++++-----------------
 1 file changed, 33 insertions(+), 39 deletions(-)

-- 
2.50.1


