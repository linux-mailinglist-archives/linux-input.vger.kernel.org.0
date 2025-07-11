Return-Path: <linux-input+bounces-13482-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC80B014A8
	for <lists+linux-input@lfdr.de>; Fri, 11 Jul 2025 09:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B05A542DB0
	for <lists+linux-input@lfdr.de>; Fri, 11 Jul 2025 07:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F4F1EFF93;
	Fri, 11 Jul 2025 07:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ghy3fGgs"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9D71EFF8D;
	Fri, 11 Jul 2025 07:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752218933; cv=none; b=aecxkBsgxWXyjy+IKv73/RyhILhR+0AG8llhO5pzGEgc+BVnl+5h7DlWa/r+LNlRSMXjWsoyVayY15+WFJtP3KMfDGtxrPic1AC7qdyL14P/mOT2jkyQOZ0WV3Uj6pNCXaxsnBYCSuDE85oMdR4VknH/0ZLWWRozel53cTc/wt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752218933; c=relaxed/simple;
	bh=3avOzIa3vglyeV7w0A35p2T13TGg3Po/DkJErYZD8Ok=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WcgsRpPTh+wLVfiCk5wmbJ4/ReTVoPJC79ojhOfTj/15PxXgGj0mvJNf2jwBTvBPearFVFVQIidclEwzZ2XF30OBknPjPnZfs5G9VZZpnAd9R84DVJg2wacjusM6WHa7BhbMIF3jIN7viEnv8si8FeWRw7RWFA0ghR2N6tqYaUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ghy3fGgs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44DDCC4CEF7;
	Fri, 11 Jul 2025 07:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752218932;
	bh=3avOzIa3vglyeV7w0A35p2T13TGg3Po/DkJErYZD8Ok=;
	h=From:To:Cc:Subject:Date:From;
	b=ghy3fGgsz0Ahkg92NtTOZ233fHDetbm+eMgFd1grRNbdVcSwoLEvHQ0WYbWsL+j1F
	 uTanhGiov6q/38Nr6qmmvGeDqcyHvfnUjMCNLKo/eQP8VevAO9eiUGyBrzLgHTuJPc
	 864jMfpL13igtio1vbVQBu619eEUy3MZ339s9/MDrl1JdaJB16/vciwjxS+QN1vj6u
	 p3opm+jbDs6PUnHW8KZI7yhc852yqHXjnq5UkhJeGhEBSCTDcBswb37I5vUTKoxRI2
	 2QNxMhJvtfwxTP6RxHXTggkfxA4cLx3IVDG74AgHZ9WuAqKkiY5hVw0HyqiZMrekEi
	 LKWNMDPnGH0bg==
From: Arnd Bergmann <arnd@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Peter Hutterer <peter.hutterer@who-t.net>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: tighten ioctl command parsing
Date: Fri, 11 Jul 2025 09:28:43 +0200
Message-Id: <20250711072847.2836962-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The handling for variable-length ioctl commands in hidraw_ioctl() is
rather complex and the check for the data direction is incomplete.

Simplify this code using a switch() statement with the size masked
out, to ensure the rest of the command is correctly matched.

Fixes: 9188e79ec3fd ("HID: add phys and name ioctls to hidraw")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/hid/hidraw.c | 123 ++++++++++++++++++-------------------------
 1 file changed, 50 insertions(+), 73 deletions(-)

diff --git a/drivers/hid/hidraw.c b/drivers/hid/hidraw.c
index c887f48756f4..cc657d60d689 100644
--- a/drivers/hid/hidraw.c
+++ b/drivers/hid/hidraw.c
@@ -403,6 +403,8 @@ static long hidraw_ioctl(struct file *file, unsigned int cmd,
 	struct hidraw *dev;
 	struct hidraw_list *list = file->private_data;
 	void __user *user_arg = (void __user*) arg;
+	struct hid_device *hid;
+	int len;
 
 	down_read(&minors_rwsem);
 	dev = hidraw_table[minor];
@@ -453,81 +455,56 @@ static long hidraw_ioctl(struct file *file, unsigned int cmd,
 				break;
 			}
 		default:
-			{
-				struct hid_device *hid = dev->hid;
-				if (_IOC_TYPE(cmd) != 'H') {
-					ret = -EINVAL;
-					break;
-				}
-
-				if (_IOC_NR(cmd) == _IOC_NR(HIDIOCSFEATURE(0))) {
-					int len = _IOC_SIZE(cmd);
-					ret = hidraw_send_report(file, user_arg, len, HID_FEATURE_REPORT);
-					break;
-				}
-				if (_IOC_NR(cmd) == _IOC_NR(HIDIOCGFEATURE(0))) {
-					int len = _IOC_SIZE(cmd);
-					ret = hidraw_get_report(file, user_arg, len, HID_FEATURE_REPORT);
-					break;
-				}
-
-				if (_IOC_NR(cmd) == _IOC_NR(HIDIOCSINPUT(0))) {
-					int len = _IOC_SIZE(cmd);
-					ret = hidraw_send_report(file, user_arg, len, HID_INPUT_REPORT);
-					break;
-				}
-				if (_IOC_NR(cmd) == _IOC_NR(HIDIOCGINPUT(0))) {
-					int len = _IOC_SIZE(cmd);
-					ret = hidraw_get_report(file, user_arg, len, HID_INPUT_REPORT);
-					break;
-				}
-
-				if (_IOC_NR(cmd) == _IOC_NR(HIDIOCSOUTPUT(0))) {
-					int len = _IOC_SIZE(cmd);
-					ret = hidraw_send_report(file, user_arg, len, HID_OUTPUT_REPORT);
-					break;
-				}
-				if (_IOC_NR(cmd) == _IOC_NR(HIDIOCGOUTPUT(0))) {
-					int len = _IOC_SIZE(cmd);
-					ret = hidraw_get_report(file, user_arg, len, HID_OUTPUT_REPORT);
-					break;
-				}
-
-				/* Begin Read-only ioctls. */
-				if (_IOC_DIR(cmd) != _IOC_READ) {
-					ret = -EINVAL;
-					break;
-				}
-
-				if (_IOC_NR(cmd) == _IOC_NR(HIDIOCGRAWNAME(0))) {
-					int len = strlen(hid->name) + 1;
-					if (len > _IOC_SIZE(cmd))
-						len = _IOC_SIZE(cmd);
-					ret = copy_to_user(user_arg, hid->name, len) ?
-						-EFAULT : len;
-					break;
-				}
-
-				if (_IOC_NR(cmd) == _IOC_NR(HIDIOCGRAWPHYS(0))) {
-					int len = strlen(hid->phys) + 1;
-					if (len > _IOC_SIZE(cmd))
-						len = _IOC_SIZE(cmd);
-					ret = copy_to_user(user_arg, hid->phys, len) ?
-						-EFAULT : len;
-					break;
-				}
-
-				if (_IOC_NR(cmd) == _IOC_NR(HIDIOCGRAWUNIQ(0))) {
-					int len = strlen(hid->uniq) + 1;
-					if (len > _IOC_SIZE(cmd))
-						len = _IOC_SIZE(cmd);
-					ret = copy_to_user(user_arg, hid->uniq, len) ?
-						-EFAULT : len;
-					break;
-				}
-			}
+			break;
+	}
 
+	hid = dev->hid;
+	switch (cmd & ~IOCSIZE_MASK) {
+	case HIDIOCSFEATURE(0):
+		len = _IOC_SIZE(cmd);
+		ret = hidraw_send_report(file, user_arg, len, HID_FEATURE_REPORT);
+		break;
+	case HIDIOCGFEATURE(0):
+		len = _IOC_SIZE(cmd);
+		ret = hidraw_get_report(file, user_arg, len, HID_FEATURE_REPORT);
+		break;
+	case HIDIOCSINPUT(0):
+		len = _IOC_SIZE(cmd);
+		ret = hidraw_send_report(file, user_arg, len, HID_INPUT_REPORT);
+		break;
+	case HIDIOCGINPUT(0):
+		len = _IOC_SIZE(cmd);
+		ret = hidraw_get_report(file, user_arg, len, HID_INPUT_REPORT);
+		break;
+	case HIDIOCSOUTPUT(0):
+		len = _IOC_SIZE(cmd);
+		ret = hidraw_send_report(file, user_arg, len, HID_OUTPUT_REPORT);
+		break;
+	case HIDIOCGOUTPUT(0):
+		len = _IOC_SIZE(cmd);
+		ret = hidraw_get_report(file, user_arg, len, HID_OUTPUT_REPORT);
+		break;
+	case HIDIOCGRAWNAME(0):
+		len = strlen(hid->name) + 1;
+		if (len > _IOC_SIZE(cmd))
+			len = _IOC_SIZE(cmd);
+		ret = copy_to_user(user_arg, hid->name, len) ?  -EFAULT : len;
+		break;
+	case HIDIOCGRAWPHYS(0):
+		len = strlen(hid->phys) + 1;
+		if (len > _IOC_SIZE(cmd))
+			len = _IOC_SIZE(cmd);
+		ret = copy_to_user(user_arg, hid->phys, len) ?  -EFAULT : len;
+		break;
+	case HIDIOCGRAWUNIQ(0):
+		len = strlen(hid->uniq) + 1;
+		if (len > _IOC_SIZE(cmd))
+			len = _IOC_SIZE(cmd);
+		ret = copy_to_user(user_arg, hid->uniq, len) ?  -EFAULT : len;
+		break;
+	default:
 		ret = -ENOTTY;
+		break;
 	}
 out:
 	up_read(&minors_rwsem);
-- 
2.39.5


