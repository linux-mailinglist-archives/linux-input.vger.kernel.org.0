Return-Path: <linux-input+bounces-9948-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 345A5A30D21
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 14:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B410A188528F
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 13:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D30524C665;
	Tue, 11 Feb 2025 13:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="LejbcdjA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4114244196;
	Tue, 11 Feb 2025 13:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739281205; cv=none; b=JR2tMTXELAB1NsKlVmxbC57F1MkVJiWpMuHrL/Pewy6kpFo9TQLTzmUgXBrzU8r2LF3hHq0ViifKMD5tTIHMiviyz4MK3Nnjb+p0j02lXewRUIJKzMfHJS5t+Pu8Az08jYC2VbPYQ/GRhQD71zEeEekp7S2LiH9lKgvu/CMLDkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739281205; c=relaxed/simple;
	bh=MzCHS4xcpR6oKnwNF5bnd1dPG4rnXwLyPn8vttdj214=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DMSf/SeyC2WGgWYAUg12YLIZk8wz/OLrwA7182JjenZ4EHBbQEblWu9+sPLQb2KxQgkq6W+vQARN4gx39fHHfZYwkz3cGkR6rF8Myqoshbpn0DrRKtWaKBM5xqAVf2FCx+vLJzoCdj9aiyHils6HO6gyGswdzeoD3ydWJ47Jazk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=LejbcdjA; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from wse-pc.fritz.box (pd9e59260.dip0.t-ipconnect.de [217.229.146.96])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 6FBFF2FC004D;
	Tue, 11 Feb 2025 14:39:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1739281193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YB3kOHzvyAH2tkfntNwIJh9bjqnKflyo3rJ0J7XtYAg=;
	b=LejbcdjAU8pD0rYzMhKZKn4haEWqKG5eIgAoipIC//nWAIX908c2QHyxT7Q7uY4pmRs4Wt
	11xO+TYOEs8CxTLZEfbnEF2PKEB1fEPKbMB2anehDQPkbrZq2mZAZbRdRxqCBYYxmTfarO
	8+m3Nu40xDVl9Tyfb+IF4suW9BNyosk=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Add functions for HID drivers to react on first open and last close call
Date: Tue, 11 Feb 2025 14:39:05 +0100
Message-ID: <20250211133950.422232-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a new function to the hid_driver struct that is called when the
userspace starts using the device, and another one that is called when
userspace stop using the device. With this a hid driver can implement
special suspend handling for devices currently not in use.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/hid/hid-core.c | 9 ++++++++-
 include/linux/hid.h    | 4 ++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 4497b50799dbf..283917a79ac86 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2392,6 +2392,9 @@ int hid_hw_open(struct hid_device *hdev)
 		ret = hdev->ll_driver->open(hdev);
 		if (ret)
 			hdev->ll_open_count--;
+
+		if (hdev->driver->on_hid_hw_open)
+			hdev->driver->on_hid_hw_open(hdev);
 	}
 
 	mutex_unlock(&hdev->ll_open_lock);
@@ -2411,8 +2414,12 @@ EXPORT_SYMBOL_GPL(hid_hw_open);
 void hid_hw_close(struct hid_device *hdev)
 {
 	mutex_lock(&hdev->ll_open_lock);
-	if (!--hdev->ll_open_count)
+	if (!--hdev->ll_open_count) {
 		hdev->ll_driver->close(hdev);
+
+		if (hdev->driver->on_hid_hw_close)
+			hdev->driver->on_hid_hw_close(hdev);
+	}
 	mutex_unlock(&hdev->ll_open_lock);
 }
 EXPORT_SYMBOL_GPL(hid_hw_close);
diff --git a/include/linux/hid.h b/include/linux/hid.h
index cdc0dc13c87fe..3b7db4eb3f2f6 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -790,6 +790,8 @@ struct hid_usage_id {
  * @suspend: invoked on suspend (NULL means nop)
  * @resume: invoked on resume if device was not reset (NULL means nop)
  * @reset_resume: invoked on resume if device was reset (NULL means nop)
+ * @on_hid_hw_open: invoked when hid core opens first instance (NULL means nop)
+ * @on_hid_hw_close: invoked when hid core closes last instance (NULL means nop)
  *
  * probe should return -errno on error, or 0 on success. During probe,
  * input will not be passed to raw_event unless hid_device_io_start is
@@ -845,6 +847,8 @@ struct hid_driver {
 	int (*suspend)(struct hid_device *hdev, pm_message_t message);
 	int (*resume)(struct hid_device *hdev);
 	int (*reset_resume)(struct hid_device *hdev);
+	void (*on_hid_hw_open)(struct hid_device *hdev);
+	void (*on_hid_hw_close)(struct hid_device *hdev);
 
 /* private: */
 	struct device_driver driver;
-- 
2.43.0


