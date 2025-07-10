Return-Path: <linux-input+bounces-13457-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F18AFFE58
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 11:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C8663A4156
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 09:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A15AA2D3ED2;
	Thu, 10 Jul 2025 09:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUMI9+Xl"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B04528D82F;
	Thu, 10 Jul 2025 09:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752140487; cv=none; b=gE7siteNQzHtMavRxwGNFgKChTjoPQR1odHTyEHBN6l8z3jRIXpkYtn7etX8bKECaO1pHkwRvXYHjAwO1VFguNMQAMWHVjoRVxEWJ8NY6EV+R1PllSC5+fb+IYQolGifDfLs6tCRQUqnu0mMGviP1w6dbdpRgzERNtAuR4pK2go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752140487; c=relaxed/simple;
	bh=mf03gxBlC/Zw61BCMyp61Hz6+tRCPctQqthHewgkQiM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KtK7lD5rsF5fRBRzmvQxqF67EJW9bbXXG8UJfBfmoqVtwj034xttGn4ksM+pn3jmNzCMVF4m2zlzx8mrY6rQLsg8OMNhrbRaw6VsfIA83iJj2uqCVeBKDEIxBzWudtUfrOopNVYHF0gCGWAu6VfcwyI76ij1H7c+IVPItM72Fy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUMI9+Xl; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752140486; x=1783676486;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mf03gxBlC/Zw61BCMyp61Hz6+tRCPctQqthHewgkQiM=;
  b=lUMI9+XlBXVCQ+k8bbWtiO7MFe1htOkjNELFsUgezcBSbPFG2cN9GYJd
   R09MCGRovCEQ/NQ03p4FB+6YOGZdPNxFGBr0CC5hDf217Z0GCH2nvN4uA
   eGmwbionSZOEaaw5qTQmpbJWRj9HldP4Bp0j5EInZjDwWRCRjKqI7Ug5u
   2Pgi78h2kVtOsLb/jbCU04zmygsfrJOm2REMtp3Th0PCS1p9l1QIKT29r
   IftGM2Be4dTKtxJawU3QWWYQhvX4xva9Mv1AIve5l9BtKMtshCaEPPRp7
   +wDc9dKGqrCyKWs09/XiTEyFw6Iy+ixmMwjWSVd9uZq2LkQ725PTtritt
   A==;
X-CSE-ConnectionGUID: G5PhqOV4TlSeO6L7lgx/Ww==
X-CSE-MsgGUID: gEb5AeRxQLaQhL3APdaCew==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="72000641"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="72000641"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 02:41:25 -0700
X-CSE-ConnectionGUID: B90kZ3SfSYGfgOROOy5IUA==
X-CSE-MsgGUID: /E8+s/hWRIGTYL1KGiNEGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="156758009"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 10 Jul 2025 02:41:23 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 55A7A1B7; Thu, 10 Jul 2025 12:41:21 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jiri Kosina <jikos@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Vicki Pfau <vi@endrift.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] HID: debug: Remove duplicate entry (BTN_WHEEL)
Date: Thu, 10 Jul 2025 12:41:20 +0300
Message-ID: <20250710094120.753358-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BTN_WHEEL is duplicated (by value) and compiler is not happy about that:

drivers/hid/hid-debug.c:3302:16: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
 3302 |         [BTN_WHEEL] = "BtnWheel",               [KEY_OK] = "Ok",
      |                       ^~~~~~~~~~
drivers/hid/hid-debug.c:3301:20: note: previous initialization is here
 3301 |         [BTN_GEAR_DOWN] = "BtnGearDown",        [BTN_GEAR_UP] = "BtnGearUp",
      |                           ^~~~~~~~~~~~~

Remove it again, as the commit 7b2daa648eb7 ("HID: debug: Remove duplicates
from 'keys'") already did this once in the past.

Fixes: 194808a1ea39 ("HID: Fix debug name for BTN_GEAR_DOWN, BTN_GEAR_UP, BTN_WHEEL")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/hid/hid-debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index 62f31e95bd36..e86bda0dab9b 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -3299,7 +3299,7 @@ static const char *keys[KEY_MAX + 1] = {
 	[BTN_STYLUS2] = "Stylus2",		[BTN_TOOL_DOUBLETAP] = "ToolDoubleTap",
 	[BTN_TOOL_TRIPLETAP] = "ToolTripleTap",	[BTN_TOOL_QUADTAP] = "ToolQuadrupleTap",
 	[BTN_GEAR_DOWN] = "BtnGearDown",	[BTN_GEAR_UP] = "BtnGearUp",
-	[BTN_WHEEL] = "BtnWheel",		[KEY_OK] = "Ok",
+						[KEY_OK] = "Ok",
 	[KEY_SELECT] = "Select",		[KEY_GOTO] = "Goto",
 	[KEY_CLEAR] = "Clear",			[KEY_POWER2] = "Power2",
 	[KEY_OPTION] = "Option",		[KEY_INFO] = "Info",
-- 
2.47.2


