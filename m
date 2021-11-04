Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 882C6445415
	for <lists+linux-input@lfdr.de>; Thu,  4 Nov 2021 14:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231848AbhKDNk0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Nov 2021 09:40:26 -0400
Received: from mga12.intel.com ([192.55.52.136]:50285 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231666AbhKDNkJ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Nov 2021 09:40:09 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="211755246"
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; 
   d="scan'208";a="211755246"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2021 06:37:31 -0700
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; 
   d="scan'208";a="501542058"
Received: from eyulyugi-mobl1.ger.corp.intel.com (HELO tkristo-desk.intel.com) ([10.251.215.15])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2021 06:37:29 -0700
From:   Tero Kristo <tero.kristo@linux.intel.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        mika.westerberg@linux.intel.com, tero.kristo@linux.intel.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC 8/8] HID: USI: add support for ioctls
Date:   Thu,  4 Nov 2021 15:37:01 +0200
Message-Id: <20211104133701.1733551-9-tero.kristo@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211104133701.1733551-1-tero.kristo@linux.intel.com>
References: <20211104133701.1733551-1-tero.kristo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a new device node /dev/usi, which can be used to apply ioctls for
USI to modify pen parameters.

Signed-off-by: Tero Kristo <tero.kristo@linux.intel.com>
---
 .../userspace-api/ioctl/ioctl-number.rst      |   1 +
 drivers/hid/hid-usi.c                         | 134 ++++++++++++++++--
 include/linux/hid-usi.h                       |  22 +++
 3 files changed, 149 insertions(+), 8 deletions(-)
 create mode 100644 include/linux/hid-usi.h

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 6655d929a351..bfaba2748592 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -154,6 +154,7 @@ Code  Seq#    Include File                                           Comments
 'H'   C0-DF  net/bluetooth/cmtp/cmtp.h                               conflict!
 'H'   C0-DF  net/bluetooth/bnep/bnep.h                               conflict!
 'H'   F1     linux/hid-roccat.h                                      <mailto:erazor_de@users.sourceforge.net>
+'H'   F2-F3  linux/hid-usi.h
 'H'   F8-FA  sound/firewire.h
 'I'   all    linux/isdn.h                                            conflict!
 'I'   00-0F  drivers/isdn/divert/isdn_divert.h                       conflict!
diff --git a/drivers/hid/hid-usi.c b/drivers/hid/hid-usi.c
index a465c140d25a..f7e739d9f554 100644
--- a/drivers/hid/hid-usi.c
+++ b/drivers/hid/hid-usi.c
@@ -10,14 +10,18 @@
 
 #include <linux/module.h>
 #include <linux/sysfs.h>
+#include <linux/cdev.h>
 #include <linux/device.h>
 #include <linux/hid.h>
+#include <linux/hid-usi.h>
 #include <linux/input.h>
 #include <linux/leds.h>
 #include <linux/workqueue.h>
 
 #include "hid-ids.h"
 
+#define USI_MAX_DEVICES		1
+
 #define USI_HAS_PENS		0
 #define USI_PENS_CONFIGURED	1
 
@@ -67,6 +71,12 @@ struct usi_drvdata {
 	bool need_flush;
 	struct delayed_work work;
 	u8 saved_data[USI_NUM_ATTRS];
+	bool user_pending;
+	struct completion user_work_done;
+	struct cdev cdev;
+	struct device *dev;
+	dev_t dev_id;
+	struct class *class;
 	spinlock_t lock; /* private data lock */
 };
 
@@ -237,9 +247,9 @@ static struct usi_pen *_usi_select_pen(struct usi_drvdata *usi, int index,
  *
  * Parses input event passed from input layer. This is used to detect
  * any writes to the USI driver from userspace and to program hardware
- * to the new value. No return value.
+ * to the new value. Returns 0 on success, or negative error value.
  */
-static void __usi_input_event(struct usi_drvdata *usi, unsigned int code,
+static int __usi_input_event(struct usi_drvdata *usi, unsigned int code,
 			      int value)
 {
 	struct usi_pen *pen = usi->current_pen;
@@ -251,13 +261,13 @@ static void __usi_input_event(struct usi_drvdata *usi, unsigned int code,
 		usi->update_pending);
 
 	if (code < MSC_PEN_SET_COLOR || code > MSC_PEN_SET_LINE_STYLE)
-		return;
+		return -EINVAL;
 
 	if (!pen)
-		return;
+		return -ENODEV;
 
 	if (test_bit(__msc_to_usi_id(code), &usi->update_pending))
-		return;
+		return -EBUSY;
 
 	/*
 	 * New value received, kick off the work for actually re-programming HW
@@ -276,6 +286,8 @@ static void __usi_input_event(struct usi_drvdata *usi, unsigned int code,
 
 		schedule_delayed_work(&usi->work, delay);
 	}
+
+	return 0;
 }
 
 static int _usi_input_event(struct input_dev *input, unsigned int type,
@@ -459,6 +471,11 @@ static int usi_raw_event(struct hid_device *hdev,
 				spin_lock_irqsave(&usi->lock, flags);
 				clear_bit(i, &usi->update_running);
 				spin_unlock_irqrestore(&usi->lock, flags);
+				if (usi->user_pending) {
+					complete(&usi->user_work_done);
+					usi->user_pending = false;
+				}
+
 				check_work = true;
 			}
 		}
@@ -516,6 +533,74 @@ static void _apply_quirks(struct usi_drvdata *usi, struct hid_device *hdev)
 	}
 }
 
+static long usi_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	void __user *p = (void __user *)arg;
+	struct usi_pen_info info;
+	struct usi_pen *pen;
+	struct usi_drvdata *usi = file->private_data;
+	int ret;
+
+	if (cmd != USIIOCSET && cmd != USIIOCGET)
+		return -EINVAL;
+
+	if (copy_from_user(&info, p, sizeof(info)))
+		return -EFAULT;
+
+	pen = usi_find_pen(usi, info.index);
+	if (!pen)
+		return -ENODEV;
+
+	switch (cmd) {
+	case USIIOCSET:
+		if (info.code < MSC_PEN_SET_COLOR ||
+		    info.code > MSC_PEN_SET_LINE_STYLE)
+			return -EINVAL;
+
+		init_completion(&usi->user_work_done);
+
+		ret = __usi_input_event(usi, info.code, info.value);
+		if (ret)
+			return ret;
+
+		usi->user_pending = true;
+		ret = wait_for_completion_timeout(&usi->user_work_done,
+						  usi->timeout * 2);
+		if (!ret) {
+			usi->user_pending = false;
+			return -ETIMEDOUT;
+		}
+		return 0;
+
+	case USIIOCGET:
+		ret = __usi_pen_get_value(pen, info.code);
+		if (ret < 0)
+			return ret;
+
+		info.value = ret;
+
+		if (copy_to_user(p, &info, sizeof(info)))
+			return -EFAULT;
+
+		return sizeof(info);
+	}
+
+	return -EINVAL;
+}
+
+static int usi_open(struct inode *inode, struct file *file)
+{
+	struct usi_drvdata *usi = container_of(inode->i_cdev,
+					       struct usi_drvdata, cdev);
+	file->private_data = usi;
+	return 0;
+}
+
+static const struct file_operations usi_ops = {
+	.unlocked_ioctl = usi_ioctl,
+	.open = usi_open,
+};
+
 static int usi_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	int ret;
@@ -529,28 +614,61 @@ static int usi_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	usi->hdev = hdev;
 
+	ret = alloc_chrdev_region(&usi->dev_id, 0, USI_MAX_DEVICES, "usi");
+	if (ret < 0)
+		return ret;
+
+	cdev_init(&usi->cdev, &usi_ops);
+	ret = cdev_add(&usi->cdev, usi->dev_id, USI_MAX_DEVICES);
+	if (ret < 0)
+		goto err;
+
+	usi->class = class_create(THIS_MODULE, "usi");
+	if (IS_ERR(usi->class)) {
+		ret = PTR_ERR(usi->class);
+		goto err;
+	}
+
+	usi->dev = device_create(usi->class, &hdev->dev, usi->dev_id, NULL,
+				 "usi");
+	if (IS_ERR(usi->dev)) {
+		ret = PTR_ERR(usi->dev);
+		goto err_class;
+	}
+
 	hid_set_drvdata(hdev, usi);
 
 	ret = hid_parse(hdev);
 	if (ret)
-		return ret;
+		goto err_dev;
 
 	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
 	if (ret)
-		goto err;
+		goto err_dev;
 
 	_apply_quirks(usi, hdev);
 
 	return 0;
 
+err_dev:
+	device_destroy(usi->class, usi->dev_id);
+
+err_class:
+	class_destroy(usi->class);
+
 err:
-	hid_hw_stop(hdev);
+	unregister_chrdev_region(usi->dev_id, USI_MAX_DEVICES);
 	return ret;
 }
 
 static void usi_remove(struct hid_device *hdev)
 {
+	struct usi_drvdata *usi = hid_get_drvdata(hdev);
+
 	hid_hw_stop(hdev);
+	device_destroy(usi->class, usi->dev_id);
+	class_destroy(usi->class);
+	unregister_chrdev_region(usi->dev_id, USI_MAX_DEVICES);
 }
 
 /**
diff --git a/include/linux/hid-usi.h b/include/linux/hid-usi.h
new file mode 100644
index 000000000000..1840285c7bc1
--- /dev/null
+++ b/include/linux/hid-usi.h
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021, Intel Corporation
+ * Authors: Tero Kristo <tero.kristo@linux.intel.com>
+ */
+
+#ifndef __HID_USI_H
+#define __HID_USI_H
+
+#include <linux/hid.h>
+#include <linux/types.h>
+
+struct usi_pen_info {
+	__s32 index;
+	__u32 code;
+	__s32 value;
+};
+
+#define USIIOCGET _IOR('H', 0xf2, struct usi_pen_info)
+#define USIIOCSET _IOW('H', 0xf3, struct usi_pen_info)
+
+#endif
-- 
2.25.1

