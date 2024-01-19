Return-Path: <linux-input+bounces-1326-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAFE8324FF
	for <lists+linux-input@lfdr.de>; Fri, 19 Jan 2024 08:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEA721F23A6D
	for <lists+linux-input@lfdr.de>; Fri, 19 Jan 2024 07:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF403C0A;
	Fri, 19 Jan 2024 07:27:53 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1306F138F;
	Fri, 19 Jan 2024 07:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705649273; cv=none; b=R3J9UDEY0wcR4kJJ7ijHbAHapQU9RZ3v3DSS6u532X4n/xYwnNrbJzrrhswfOgBXt+GOs1O2wTZdeNRYy7gRBSvUUmhu3JuqMAL7AxJ8wo1OjGWodoPmnYPqrXXrO33LqNv/ZOnwA6BU8Avib04jmkbG8VI7y1Ijpe78hXWG7RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705649273; c=relaxed/simple;
	bh=k4zY6zSfiVrGSgWwEbgj3i1uxtZL9Q19dTH4gm4sUnM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oR0Y4q+Pk0n6a6yqxlg79mu+FxjajpfCAkWoZvLLbfancxyuRaTjXgI0ZPEDDmdBmUEDlk+kEDe2T7wQJgPmS9ruM8NugA560P2VHyIeAuf+zdgCC9ws4zHG6s08c60oGL+A7lvnm2qFviKtFHFDlwrO0NcnfVzQ4OkxBOIYp1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R831e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045170;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0W-vEN39_1705649251;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0W-vEN39_1705649251)
          by smtp.aliyun-inc.com;
          Fri, 19 Jan 2024 15:27:41 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: djogorchock@gmail.com
Cc: jikos@kernel.org,
	benjamin.tissoires@redhat.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] HID: nintendo: Remove some unused functions
Date: Fri, 19 Jan 2024 15:27:29 +0800
Message-Id: <20240119072729.54499-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These functions are defined in the hid-nintendo.c file, but not called
elsewhere, so delete these unused functions.

drivers/hid/hid-nintendo.c:670:20: warning: unused function 'joycon_device_is_left_joycon'.
drivers/hid/hid-nintendo.c:674:20: warning: unused function 'joycon_device_is_right_joycon'

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=7992
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/hid/hid-nintendo.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index ccc4032fb2b0..7ce6be0a8dee 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -667,16 +667,6 @@ struct joycon_ctlr {
  * These helpers are most useful early during the HID probe or in conjunction
  * with the capability helpers below.
  */
-static inline bool joycon_device_is_left_joycon(struct joycon_ctlr *ctlr)
-{
-	return ctlr->hdev->product == USB_DEVICE_ID_NINTENDO_JOYCONL;
-}
-
-static inline bool joycon_device_is_right_joycon(struct joycon_ctlr *ctlr)
-{
-	return ctlr->hdev->product == USB_DEVICE_ID_NINTENDO_JOYCONR;
-}
-
 static inline bool joycon_device_is_procon(struct joycon_ctlr *ctlr)
 {
 	return ctlr->hdev->product == USB_DEVICE_ID_NINTENDO_PROCON;
-- 
2.20.1.7.g153144c


