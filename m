Return-Path: <linux-input+bounces-11057-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C368A6C298
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 19:40:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 941E0176B16
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 18:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CF122E415;
	Fri, 21 Mar 2025 18:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GLVmcijw"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25952B664;
	Fri, 21 Mar 2025 18:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742582403; cv=none; b=WH9AJgoAsv1aeldp+CY0sNihQYWF14YeLVYeyXs7VSeJSfPrSA9E+2ub7dMFv5kCc2M2N8MtKACQ56bJvEn5Z6mEl89xx+Tq1dKv1ffTjMaYpQY4fGiBVj8DQ4fYUQX+3udVO9ZrmtV3uMBTz1UxxBoNUbn96OxrXPmeGuS0O+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742582403; c=relaxed/simple;
	bh=RP/WPvuCPwDrcACAq+X0WyuYTam2/ENf8fpNc3mXFiM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PkKA/J42iO5w5s0DXPtSJ9VSk1F+F9UyXA06Qh/G7XrXhjla7Qh6t+Gqk9rIHYo+7ONx1GuCtJG5sd7ndq+KxGIieBEnXDINnlcv/4TxuzCrx7Qe9QEyX5zaMh01ARz62HS1q6bc0jazuNf2+k0LavQpT9UHoYgepsQybOBOOZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GLVmcijw; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742582401; x=1774118401;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RP/WPvuCPwDrcACAq+X0WyuYTam2/ENf8fpNc3mXFiM=;
  b=GLVmcijwzKt919wCUty055JeVPO/Fo+VNl3J78NDBmOB+l1m3k42Vg8P
   hgcMOy37q3FaCJJHwAtFx9ZlrCLd5z5hjyJUybttMV6ZirfKnUVnDR7+Y
   5l4HkeuqxOYW4oybdFwwcrihJWyoplt9aQrEoAwRVgMEsgvKtQg0HyQic
   e8tMltXBpvz7b+zxBKDV1F/J8uHxQKjGxnkbJKFx7KVStv6fSKo0OlLbN
   8Dqbt9YKuQEaD8wadk6liBpd5sqCgLO1pKDn41d8DHrcUW9uA3P/nt/hH
   8zFCMxNTM7Ukf7ogfbwM82xXg6HUKXY2DpCE0KvDzsX6FPAGc50m7iGpW
   w==;
X-CSE-ConnectionGUID: kq1uqGN5RkOG/a5kAFGvKA==
X-CSE-MsgGUID: SgGNb50gS4u930I4QDUZYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43986455"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="43986455"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 11:40:00 -0700
X-CSE-ConnectionGUID: JjWiXIZ3QWSaLj/erog0xw==
X-CSE-MsgGUID: R9+/DjCtTjqdBOrjhzQ/8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="123282490"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 21 Mar 2025 11:39:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0430914B; Fri, 21 Mar 2025 20:39:57 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v1 0/2] Input: wdt87xx_i2c - a couple of cleanups
Date: Fri, 21 Mar 2025 20:39:16 +0200
Message-ID: <20250321183957.455518-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A couple of cleanups related to ACPI ID table and probe function.

Andy Shevchenko (2):
  Input: wdt87xx_i2c - tidy up ACPI ID table
  Input: wdt87xx_i2c - switch to use dev_err_probe()

 drivers/input/touchscreen/wdt87xx_i2c.c | 40 ++++++++++++-------------
 1 file changed, 20 insertions(+), 20 deletions(-)

-- 
2.47.2


