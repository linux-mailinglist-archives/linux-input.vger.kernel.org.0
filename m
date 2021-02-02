Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B26FC30BAFB
	for <lists+linux-input@lfdr.de>; Tue,  2 Feb 2021 10:32:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232968AbhBBJcg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Feb 2021 04:32:36 -0500
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45]:52931 "EHLO
        out30-45.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232766AbhBBJca (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 2 Feb 2021 04:32:30 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0UNfeAix_1612258263;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UNfeAix_1612258263)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 02 Feb 2021 17:31:12 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     erazor_de@users.sourceforge.net
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] HID: displays: convert sysfs sprintf/snprintf family to sysfs_emit
Date:   Tue,  2 Feb 2021 17:31:01 +0800
Message-Id: <1612258261-96457-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix the following coccicheck warning:

./drivers/hid/hid-roccat-arvo.c:45:8-16: WARNING: use scnprintf or
sprintf.

./drivers/hid/hid-roccat-arvo.c:95:8-16: WARNING: use scnprintf or
sprintf.

./drivers/hid/hid-roccat-arvo.c:149:8-16: WARNING: use scnprintf or
sprintf.

Reported-by: Abaci Robot<abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/hid/hid-roccat-arvo.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-roccat-arvo.c b/drivers/hid/hid-roccat-arvo.c
index ffcd444..4556d2a 100644
--- a/drivers/hid/hid-roccat-arvo.c
+++ b/drivers/hid/hid-roccat-arvo.c
@@ -42,7 +42,7 @@ static ssize_t arvo_sysfs_show_mode_key(struct device *dev,
 	if (retval)
 		return retval;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", temp_buf.state);
+	return sysfs_emit(buf, "%d\n", temp_buf.state);
 }
 
 static ssize_t arvo_sysfs_set_mode_key(struct device *dev,
@@ -92,7 +92,7 @@ static ssize_t arvo_sysfs_show_key_mask(struct device *dev,
 	if (retval)
 		return retval;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", temp_buf.key_mask);
+	return sysfs_emit(buf, "%d\n", temp_buf.key_mask);
 }
 
 static ssize_t arvo_sysfs_set_key_mask(struct device *dev,
@@ -146,7 +146,7 @@ static ssize_t arvo_sysfs_show_actual_profile(struct device *dev,
 	struct arvo_device *arvo =
 			hid_get_drvdata(dev_get_drvdata(dev->parent->parent));
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", arvo->actual_profile);
+	return sysfs_emit(buf, "%d\n", arvo->actual_profile);
 }
 
 static ssize_t arvo_sysfs_set_actual_profile(struct device *dev,
-- 
1.8.3.1

