Return-Path: <linux-input+bounces-8383-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D34FF9E35A4
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 09:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1BD3BB248EC
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 08:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0DF19007D;
	Wed,  4 Dec 2024 08:34:48 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cmccmta2.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5559F18C018;
	Wed,  4 Dec 2024 08:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733301288; cv=none; b=CH9D/mxIbGiOJ5EwEGAeBAeaipYph+ly7jwCA5eR5veDH63S7lij60je8Hjs2eF3BwEPIT9W/7jdQTfBtEcr5LWzxuOJOhY1/L8ZDfIFCSDbq3I0VXLVKbEcmtzyn2Rsu+lgGGBGai8efWtEIGRq65YFoStDcEm/ADH2YMtxLhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733301288; c=relaxed/simple;
	bh=Su5xWDUYaIWXJSBz4Ik7mZTAKW4lFMFJGhCC44Iw7ug=;
	h=From:To:Cc:Subject:Date:Message-Id; b=hDxVJVPqVHkBrJCnvnEZnynowR2rvs0oBofMmO0b+10O1s0pXkLAcZxNVKELQIjxHuEHrBx8KgEyIHUK8X8iBRHcm1RcKnUIFo6/ili9fjf4owQnbKV5eu4Cj+CLMHj3gN48LTeZmE0oeaxD9KPpkA646KlatP3yhX1cPpJktag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56750141edc2-cadd9;
	Wed, 04 Dec 2024 16:34:41 +0800 (CST)
X-RM-TRANSID:2ee56750141edc2-cadd9
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from ubuntu.localdomain (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea67501420245-60e29;
	Wed, 04 Dec 2024 16:34:41 +0800 (CST)
X-RM-TRANSID:2eea67501420245-60e29
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: jikos@kernel.org
Cc: bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhujun2@cmss.chinamobile.com
Subject: [PATCH] HID: Fix typo in hid-appleir.c and hid-logitech-hidpp.c
Date: Wed,  4 Dec 2024 00:34:39 -0800
Message-Id: <20241204083439.12659-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

The word 'accross' is wrong, so fix it.

Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/hid/hid-appleir.c        | 2 +-
 drivers/hid/hid-logitech-hidpp.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-appleir.c b/drivers/hid/hid-appleir.c
index 8deded185..d84d69e52 100644
--- a/drivers/hid/hid-appleir.c
+++ b/drivers/hid/hid-appleir.c
@@ -117,7 +117,7 @@ struct appleir {
 static int get_key(int data)
 {
 	/*
-	 * The key is coded accross bits 2..9:
+	 * The key is coded across bits 2..9:
 	 *
 	 * 0x00 or 0x01 (        )	key:  0		-> KEY_RESERVED
 	 * 0x02 or 0x03 (  menu  )	key:  1		-> KEY_MENU
diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 10a3bc5f9..c5856e24c 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -3321,7 +3321,7 @@ static int m560_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 /*
  * The Logitech K400 keyboard has an embedded touchpad which is seen
  * as a mouse from the OS point of view. There is a hardware shortcut to disable
- * tap-to-click but the setting is not remembered accross reset, annoying some
+ * tap-to-click but the setting is not remembered across reset, annoying some
  * users.
  *
  * We can toggle this feature from the host by using the feature 0x6010:
-- 
2.17.1




