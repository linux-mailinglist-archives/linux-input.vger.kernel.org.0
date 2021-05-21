Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5D738C38A
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 11:41:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232099AbhEUJnK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 May 2021 05:43:10 -0400
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:33296 "EHLO
        out30-54.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232075AbhEUJnC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 May 2021 05:43:02 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0UZbK3Mc_1621590093;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UZbK3Mc_1621590093)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 21 May 2021 17:41:38 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] HID: hid-core: Fix inconsistent indenting
Date:   Fri, 21 May 2021 17:41:31 +0800
Message-Id: <1621590091-68247-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Eliminate the follow smatch warning:

drivers/hid/hid-core.c:2406 hid_add_device() warn: inconsistent
indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/hid/hid-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 0d4f068..d1d86e4 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2403,10 +2403,10 @@ int hid_add_device(struct hid_device *hdev)
 	/*
 	 * Check for the mandatory transport channel.
 	 */
-	 if (!hdev->ll_driver->raw_request) {
+	if (!hdev->ll_driver->raw_request) {
 		hid_err(hdev, "transport driver missing .raw_request()\n");
 		return -EINVAL;
-	 }
+	}
 
 	/*
 	 * Read the device report descriptor once and use as template
-- 
1.8.3.1

