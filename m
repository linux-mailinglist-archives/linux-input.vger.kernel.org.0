Return-Path: <linux-input+bounces-3983-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 548BE8D5D48
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 10:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EAEB28A6C6
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 08:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B9215382E;
	Fri, 31 May 2024 08:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="pOc9AkPW"
X-Original-To: linux-input@vger.kernel.org
Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497DB43154;
	Fri, 31 May 2024 08:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717145775; cv=none; b=SuIvGJNVZzGDdB19cnvauEKArhvqzNCZPvrD09gzGNpfKq69gkGyCUxbUftMZvbS9FW1nwNLWQVVgB8L/fEy6k/AB2qUXSLOewooNgvZ7rbCBFwefJlNF74sm0pzgeLlqRNPkqNJLKpnXbsjvrKf2aZVfnKX5MNblTJdPVdXcmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717145775; c=relaxed/simple;
	bh=uufcw6oujOLQl7VZgDVpVzPHP5RUxXfD8NilZSVUj/o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OHqnlu2lHx3zZJqFaH5mhz+m5M5Pq0SNmSAlzsO2nkqyl1YaCp8nW6JKtCaxU5928QTSUUj/0aKnnzwVmiWZsWjrWAXs8pvtfFZVyKt5LwTmouRV2gzyh8DKBreQCzD7mR6QKzCvqfhG+QuOV/A6b0IPrdCj6q3fRAXt/7/VFQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=pOc9AkPW; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1717145771; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=1MefsR+2pwQXl5/eKO2LWlo8tWSj5pqbqQVIYdsw+P0=;
	b=pOc9AkPW6f7mEMhr3sSMtco6Sl5pPcxJ4gcq/R7uqXFAqqHlOyALQ2YASz8XIVutKkU1oCKbW933HLPW3DW7um3BcjTDlkl6Ivel3NuAEMcYI0WBdHR/l3ig9uc0qTFEZqwv7EAvTfvm+5U2eTFvtcGfarItpunPyezQS05nY2g=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R411e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032014031;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0W7ZKHe9_1717145759;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0W7ZKHe9_1717145759)
          by smtp.aliyun-inc.com;
          Fri, 31 May 2024 16:56:10 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: djogorchock@gmail.com
Cc: jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] HID: nintendo: Remove some unused functions
Date: Fri, 31 May 2024 16:55:59 +0800
Message-Id: <20240531085559.129085-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These functions are defined in the hid-nintendo.c file, but not
called elsewhere, so delete these unused functions.

drivers/hid/hid-nintendo.c:672:20: warning: unused function 'joycon_device_is_procon'.
drivers/hid/hid-nintendo.c:682:20: warning: unused function 'joycon_device_is_snescon'.
drivers/hid/hid-nintendo.c:687:20: warning: unused function 'joycon_device_is_gencon'.
drivers/hid/hid-nintendo.c:692:20: warning: unused function 'joycon_device_is_n64con'.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9265
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/hid/hid-nintendo.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index b4a97803eca3..be7f7e47d65f 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -658,7 +658,6 @@ struct joycon_ctlr {
 	(ctlr->ctlr_type == JOYCON_CTLR_TYPE_JCR || \
 	 ctlr->ctlr_type == JOYCON_CTLR_TYPE_PRO)
 
-
 /*
  * Controller device helpers
  *
@@ -669,31 +668,11 @@ struct joycon_ctlr {
  * These helpers are most useful early during the HID probe or in conjunction
  * with the capability helpers below.
  */
-static inline bool joycon_device_is_procon(struct joycon_ctlr *ctlr)
-{
-	return ctlr->hdev->product == USB_DEVICE_ID_NINTENDO_PROCON;
-}
-
 static inline bool joycon_device_is_chrggrip(struct joycon_ctlr *ctlr)
 {
 	return ctlr->hdev->product == USB_DEVICE_ID_NINTENDO_CHRGGRIP;
 }
 
-static inline bool joycon_device_is_snescon(struct joycon_ctlr *ctlr)
-{
-	return ctlr->hdev->product == USB_DEVICE_ID_NINTENDO_SNESCON;
-}
-
-static inline bool joycon_device_is_gencon(struct joycon_ctlr *ctlr)
-{
-	return ctlr->hdev->product == USB_DEVICE_ID_NINTENDO_GENCON;
-}
-
-static inline bool joycon_device_is_n64con(struct joycon_ctlr *ctlr)
-{
-	return ctlr->hdev->product == USB_DEVICE_ID_NINTENDO_N64CON;
-}
-
 /*
  * Controller type helpers
  *
-- 
2.20.1.7.g153144c


