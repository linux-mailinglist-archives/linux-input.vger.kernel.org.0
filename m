Return-Path: <linux-input+bounces-7493-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CC09A0B87
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 15:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2775F1C22805
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 13:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E461FCC67;
	Wed, 16 Oct 2024 13:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TvunK528"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC931D8E1D;
	Wed, 16 Oct 2024 13:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729085733; cv=none; b=G+it5ZK69KywwXqFOrwreCf3dsYHWx7Apal2Ne9c471pdt3lqpgtYep0I2qvvbfTObwhdueIFTnd6kvxJlNnj9nZvj781H2xImpIOonvJmEr0gvy21jt/uBmmn6FXLnJKx3BDC1Fu6Q2pqcQVLQv1SaDxqvEz76pbcY8MwRRNjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729085733; c=relaxed/simple;
	bh=FzAlRA8pLPeLqTdYnVhbuzSLx+1InD1DoZ5BCd9/5w8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cKE90jTZQcvSG4pBZRp8DASxDwgOsVt3jrjEG2WG1gcZ/lJHiGtmRxW1pXmmWRSI9TtwG4ujaopNvx/l7oI0ZAdaqM2z/LPRF0EObkh+cqD1LfGuyyZRiX4Ij/8JdCu6rREzjZ0uz0iSY7pNLGVKUT2FGcicFvAXEhVsjzLtnxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TvunK528; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729085732; x=1760621732;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FzAlRA8pLPeLqTdYnVhbuzSLx+1InD1DoZ5BCd9/5w8=;
  b=TvunK528zYZ1sfUeP2e1P9fj14HSYMgq9cJuXTGg7QEtwgY9d5j2edYW
   5nnpC3Kc3ENZIjOmqlaTDTZ6J2qr+T01iMtxK67i5vR9Pd7z8z5qZa3kH
   qKRD0nLxzn25Qpi0SCMjDPgclZ8zHIThbx8hW0x7FuTe9UowsGuxw/eRH
   EKYyn9myTpbXupW2wk9CKglaD57Z3KRJry3WNVzzBCGI5ewSd3fpVwHXj
   iO7FzZkTS4RefBfMxUIa9UrDYWauRywUjslPgFpo/Q7HhGpUgwcqEohC7
   VEoWc9By+VS74WUl4YsYsjmLl/4kZIPi9ZcLPyZI8Okfk7D4V3EcRtCuw
   Q==;
X-CSE-ConnectionGUID: nIvRfgwsReme/wKLxvVCVg==
X-CSE-MsgGUID: I6tv6b86RAu5DCSqQ5B+7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="32333965"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="32333965"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 06:35:32 -0700
X-CSE-ConnectionGUID: +fk8pQQYTMO5/oV9c5J9Zw==
X-CSE-MsgGUID: L7IWNxReRwuBJdeHS+ZKSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="77905325"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 16 Oct 2024 06:35:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8B267165; Wed, 16 Oct 2024 16:35:27 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Kuehne <thomas.kuehne@gmx.li>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/1] HID: debug: Remove duplicates from 'keys'
Date: Wed, 16 Oct 2024 16:32:40 +0300
Message-ID: <20241016133523.899754-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Duplicates in 'keys prevents kernel builds with clang, `make W=1` and
CONFIG_WERROR=y, for example:

drivers/hid/hid-debug.c:3443:18: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
 3443 |         [KEY_HANGEUL] = "HanGeul",              [KEY_HANGUP_PHONE] = "HangUpPhone",
      |                         ^~~~~~~~~
drivers/hid/hid-debug.c:3217:18: note: previous initialization is here
 3217 |         [KEY_HANGUEL] = "Hangeul",              [KEY_HANJA] = "Hanja",
      |                         ^~~~~~~~~

Fix this by removing them.

The logic of removal is that, remove...
1) if there is a constant that uses another defined constant, OR
2) the one that appears later in the list.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: fixed which one to remove for KEY_HANGEUL (Jiri)
 drivers/hid/hid-debug.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index d5abfe652fb5..541d682af15a 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -3309,9 +3309,9 @@ static const char *keys[KEY_MAX + 1] = {
 	[KEY_EPG] = "EPG",			[KEY_PVR] = "PVR",
 	[KEY_MHP] = "MHP",			[KEY_LANGUAGE] = "Language",
 	[KEY_TITLE] = "Title",			[KEY_SUBTITLE] = "Subtitle",
-	[KEY_ANGLE] = "Angle",			[KEY_ZOOM] = "Zoom",
+	[KEY_ANGLE] = "Angle",
 	[KEY_MODE] = "Mode",			[KEY_KEYBOARD] = "Keyboard",
-	[KEY_SCREEN] = "Screen",		[KEY_PC] = "PC",
+	[KEY_PC] = "PC",
 	[KEY_TV] = "TV",			[KEY_TV2] = "TV2",
 	[KEY_VCR] = "VCR",			[KEY_VCR2] = "VCR2",
 	[KEY_SAT] = "Sat",			[KEY_SAT2] = "Sat2",
@@ -3409,8 +3409,7 @@ static const char *keys[KEY_MAX + 1] = {
 	[BTN_TRIGGER_HAPPY35] = "TriggerHappy35", [BTN_TRIGGER_HAPPY36] = "TriggerHappy36",
 	[BTN_TRIGGER_HAPPY37] = "TriggerHappy37", [BTN_TRIGGER_HAPPY38] = "TriggerHappy38",
 	[BTN_TRIGGER_HAPPY39] = "TriggerHappy39", [BTN_TRIGGER_HAPPY40] = "TriggerHappy40",
-	[BTN_DIGI] = "Digi",			[BTN_STYLUS3] = "Stylus3",
-	[BTN_TOOL_QUINTTAP] = "ToolQuintTap",	[BTN_WHEEL] = "Wheel",
+	[BTN_STYLUS3] = "Stylus3",		 [BTN_TOOL_QUINTTAP] = "ToolQuintTap",
 	[KEY_10CHANNELSDOWN] = "10ChannelsDown",
 	[KEY_10CHANNELSUP] = "10ChannelsUp",
 	[KEY_3D_MODE] = "3DMode",		[KEY_ADDRESSBOOK] = "Addressbook",
@@ -3440,7 +3439,7 @@ static const char *keys[KEY_MAX + 1] = {
 	[KEY_FN_RIGHT_SHIFT] = "FnRightShift",	[KEY_FRAMEBACK] = "FrameBack",
 	[KEY_FRAMEFORWARD] = "FrameForward",	[KEY_FULL_SCREEN] = "FullScreen",
 	[KEY_GAMES] = "Games",			[KEY_GRAPHICSEDITOR] = "GraphicsEditor",
-	[KEY_HANGEUL] = "HanGeul",		[KEY_HANGUP_PHONE] = "HangUpPhone",
+	[KEY_HANGUP_PHONE] = "HangUpPhone",
 	[KEY_IMAGES] = "Images",		[KEY_KBD_LCD_MENU1] = "KbdLcdMenu1",
 	[KEY_KBD_LCD_MENU2] = "KbdLcdMenu2",	[KEY_KBD_LCD_MENU3] = "KbdLcdMenu3",
 	[KEY_KBD_LCD_MENU4] = "KbdLcdMenu4",	[KEY_KBD_LCD_MENU5] = "KbdLcdMenu5",
-- 
2.43.0.rc1.1336.g36b5255a03ac


