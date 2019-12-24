Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79845129D29
	for <lists+linux-input@lfdr.de>; Tue, 24 Dec 2019 04:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbfLXDw4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Dec 2019 22:52:56 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7737 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726747AbfLXDw4 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Dec 2019 22:52:56 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 99CE0BD3E0E93DEBEFC4;
        Tue, 24 Dec 2019 11:52:54 +0800 (CST)
Received: from HGHY4L002753561.china.huawei.com (10.133.215.186) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Tue, 24 Dec 2019 11:52:45 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>,
        Hillf Danton <hdanton@sina.com>
Subject: [PATCH 1/1] HID: hiddev: remove a duplicated check
Date:   Tue, 24 Dec 2019 11:51:17 +0800
Message-ID: <20191224035117.98816-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.133.215.186]
X-CFilter-Loop: Reflected
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

After commit 9c09b214f30e ("HID: hiddev: avoid opening a disconnected
device"), the original check "list->hiddev->exist" become unnecessary.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/hid/usbhid/hiddev.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/hid/usbhid/hiddev.c b/drivers/hid/usbhid/hiddev.c
index e421cdf2d1a4ec5..e04cf95fca094a8 100644
--- a/drivers/hid/usbhid/hiddev.c
+++ b/drivers/hid/usbhid/hiddev.c
@@ -292,16 +292,16 @@ static int hiddev_open(struct inode *inode, struct file *file)
 		res = -ENODEV;
 		goto bail_unlock;
 	}
-	if (!list->hiddev->open++)
-		if (list->hiddev->exist) {
-			struct hid_device *hid = hiddev->hid;
-			res = hid_hw_power(hid, PM_HINT_FULLON);
-			if (res < 0)
-				goto bail_unlock;
-			res = hid_hw_open(hid);
-			if (res < 0)
-				goto bail_normal_power;
-		}
+	if (!list->hiddev->open++) {
+		struct hid_device *hid = hiddev->hid;
+
+		res = hid_hw_power(hid, PM_HINT_FULLON);
+		if (res < 0)
+			goto bail_unlock;
+		res = hid_hw_open(hid);
+		if (res < 0)
+			goto bail_normal_power;
+	}
 	mutex_unlock(&hiddev->existancelock);
 	return 0;
 bail_normal_power:
-- 
1.8.3


