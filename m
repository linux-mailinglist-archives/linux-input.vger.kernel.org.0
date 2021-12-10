Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 325F946FE02
	for <lists+linux-input@lfdr.de>; Fri, 10 Dec 2021 10:39:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbhLJJn2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Dec 2021 04:43:28 -0500
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:38756 "EHLO
        out30-130.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236707AbhLJJn2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Dec 2021 04:43:28 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0V-8vrp2_1639129184;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0V-8vrp2_1639129184)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 10 Dec 2021 17:39:51 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] HID: clean up some inconsistent indenting
Date:   Fri, 10 Dec 2021 17:39:43 +0800
Message-Id: <20211210093943.57658-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Eliminate the follow smatch warning:

drivers/hid/hid-core.c:2497 hid_add_device() warn: inconsistent
indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/hid/hid-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index f1aed5bbd000..04a1f3d7d8eb 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2494,10 +2494,10 @@ int hid_add_device(struct hid_device *hdev)
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
2.20.1.7.g153144c

