Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 329501121E2
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2019 04:41:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbfLDDlR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Dec 2019 22:41:17 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:57383 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726804AbfLDDlR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Dec 2019 22:41:17 -0500
Received: from localhost.localdomain (p4FF9F0D1.dip0.t-ipconnect.de [79.249.240.209])
        by mail.holtmann.org (Postfix) with ESMTPSA id 564CBCEC92;
        Wed,  4 Dec 2019 04:50:24 +0100 (CET)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     abhishekpandit@chromium.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] HID: hidraw: add support uniq ioctl
Date:   Wed,  4 Dec 2019 04:41:09 +0100
Message-Id: <20191204034109.21944-1-marcel@holtmann.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for reading out the uniq information from the underlying HID
device. This might be the iSerialNumber in case of USB or the BD_ADDR in
case of Bluetooth.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 drivers/hid/hidraw.c        | 9 +++++++++
 include/uapi/linux/hidraw.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/hid/hidraw.c b/drivers/hid/hidraw.c
index bbc6ec1aa5cb..039304069fd0 100644
--- a/drivers/hid/hidraw.c
+++ b/drivers/hid/hidraw.c
@@ -450,6 +450,15 @@ static long hidraw_ioctl(struct file *file, unsigned int cmd,
 						-EFAULT : len;
 					break;
 				}
+
+				if (_IOC_NR(cmd) == _IOC_NR(HIDIOCGRAWUNIQ(0))) {
+					int len = strlen(hid->uniq) + 1;
+					if (len > _IOC_SIZE(cmd))
+						len = _IOC_SIZE(cmd);
+					ret = copy_to_user(user_arg, hid->uniq, len) ?
+						-EFAULT : len;
+					break;
+				}
 			}
 
 		ret = -ENOTTY;
diff --git a/include/uapi/linux/hidraw.h b/include/uapi/linux/hidraw.h
index 98e2c493de85..4913539e5bcc 100644
--- a/include/uapi/linux/hidraw.h
+++ b/include/uapi/linux/hidraw.h
@@ -39,6 +39,7 @@ struct hidraw_devinfo {
 /* The first byte of SFEATURE and GFEATURE is the report number */
 #define HIDIOCSFEATURE(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x06, len)
 #define HIDIOCGFEATURE(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x07, len)
+#define HIDIOCGRAWUNIQ(len)     _IOC(_IOC_READ, 'H', 0x08, len)
 
 #define HIDRAW_FIRST_MINOR 0
 #define HIDRAW_MAX_DEVICES 64
-- 
2.23.0

