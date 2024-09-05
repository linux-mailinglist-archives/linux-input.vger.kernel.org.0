Return-Path: <linux-input+bounces-6261-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B9796E234
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 20:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61A9B1C22789
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 18:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B68186E37;
	Thu,  5 Sep 2024 18:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZQQOISAU"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7912C17C991;
	Thu,  5 Sep 2024 18:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725561839; cv=none; b=TSKBFE7XuPfJ52926JG94zy8CtDBP0hKQYhEwBw5gWYbpUmzmikFLXP5nbDWCBRPE97wMiAM2jfUNIQH1iq8xkTDaMam4oiHVgEyMnTokD6q9yFKnWneu1plJraQM9r6AXWKcXEMUU9EdE+o3GjcAwp8O2MCRsB5q4QChvT6ono=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725561839; c=relaxed/simple;
	bh=nBfjKE3bg5Bz1iS/U8d1Ggy3AginAlf1fR3zMKD5m24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rdXNJZG9E4uZ2a47q0GijtoYQg/ZQ3NXgVOfgqcDlbULa8FKLqdTgsbIrNb710XMWHLUaiDHafIlj/IF4lMlnGHfCpsqBuXpkCUWzwj1mDcvsgyV5Gy5Ieh6eH0q1LgdslJUtQxZ26yFRuvmZGr/boFREfpzrlOVcbJLsNLwmP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZQQOISAU; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725561837; x=1757097837;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nBfjKE3bg5Bz1iS/U8d1Ggy3AginAlf1fR3zMKD5m24=;
  b=ZQQOISAUpQSoiZTtsoaj+Xi5Q/P6e7FqzvYFq6SDiqDssDiiKfuNR8eM
   oCauTRzfewAuqNe6Ku58ldOgJm5G/eLpBHdhtnrxJW7oOI2VyXPSF4m4w
   9vG4of7ICr6TRoFxEHncW/kucwDzN/thEZzNN6z4LY4ihPQJsMHjJqJ3B
   wnw4YiGFeShzTd2QHnbiOOGYVkSa1dJ3z3YxN6vFRpYTkICNECiSjM5ed
   LnQsN7PJJwxxZDIhKQ6OL3jcKt4U/J/trxc00a4EPk4jBzg9NW3N3Gjre
   E5I5ZR3miZexMNad3Qglx92oTiPxvSAbu4XWoZC42/uwkT+tUjGlbalVR
   Q==;
X-CSE-ConnectionGUID: 2senLj4+Rri22isfFvWQoQ==
X-CSE-MsgGUID: qGYmf1NEQGCgkxRLgL4Hvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="28052938"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="28052938"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 11:43:56 -0700
X-CSE-ConnectionGUID: zWIrjf09Rkieqb+IT4Yw6A==
X-CSE-MsgGUID: 0aospkpTQAmLaCnKqZSwfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="65955636"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 05 Sep 2024 11:43:53 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BDE8731E; Thu, 05 Sep 2024 21:43:51 +0300 (EEST)
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
Subject: [PATCH v1 1/1] HID: debug: Remove duplicates from 'keys'
Date: Thu,  5 Sep 2024 21:43:50 +0300
Message-ID: <20240905184351.311858-1-andriy.shevchenko@linux.intel.com>
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
 drivers/hid/hid-debug.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index d5abfe652fb5..618ebaa3bfc0 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -3214,7 +3214,7 @@ static const char *keys[KEY_MAX + 1] = {
 	[KEY_VOLUMEUP] = "VolumeUp",		[KEY_POWER] = "Power",
 	[KEY_KPEQUAL] = "KPEqual",		[KEY_KPPLUSMINUS] = "KPPlusMinus",
 	[KEY_PAUSE] = "Pause",			[KEY_KPCOMMA] = "KPComma",
-	[KEY_HANGUEL] = "Hangeul",		[KEY_HANJA] = "Hanja",
+	[KEY_HANJA] = "Hanja",
 	[KEY_YEN] = "Yen",			[KEY_LEFTMETA] = "LeftMeta",
 	[KEY_RIGHTMETA] = "RightMeta",		[KEY_COMPOSE] = "Compose",
 	[KEY_STOP] = "Stop",			[KEY_AGAIN] = "Again",
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
-- 
2.43.0.rc1.1336.g36b5255a03ac


