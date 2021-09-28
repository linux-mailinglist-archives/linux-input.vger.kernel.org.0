Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D74B41AABF
	for <lists+linux-input@lfdr.de>; Tue, 28 Sep 2021 10:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239702AbhI1IlB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Sep 2021 04:41:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34986 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239668AbhI1Ik6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Sep 2021 04:40:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632818359;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=x73TaEwSMGsf6IJOBqJhMbAKQfUjkLTOhEKFUx2syuQ=;
        b=BnCV2K1SX5UZnjbvmvCmFxiVTFQEjEgVLaBibMToscWySVLF+WieGGz330X4far5sAv22a
        iCBuN7blU0XrYIqKDvs4K0K/uZr7LYyNrqFStXb0DWLrbR3uKKqlI5P6FXWlKy/qXKl/pI
        bRLvpYUSygkkgBtPJxxfI0ikByIGIv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-hkCjyarUMkiVPhb0GwvSSQ-1; Tue, 28 Sep 2021 04:39:15 -0400
X-MC-Unique: hkCjyarUMkiVPhb0GwvSSQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28E9D802947;
        Tue, 28 Sep 2021 08:39:14 +0000 (UTC)
Received: from xps-13.redhat.com (unknown [10.39.195.86])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B27815D9D5;
        Tue, 28 Sep 2021 08:39:12 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        =?UTF-8?q?Michal=20Mal=C3=BD?= <madcatxster@devoid-pointer.net>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 2/2] HID: lg4ff: do not return a value for deinit
Date:   Tue, 28 Sep 2021 10:39:06 +0200
Message-Id: <20210928083906.43983-3-benjamin.tissoires@redhat.com>
In-Reply-To: <20210928083906.43983-1-benjamin.tissoires@redhat.com>
References: <20210928083906.43983-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When removing a device, we can not do much if there is an error while
removing it. Use the common pattern of returning void there so we are
not tempted to check on the return value.
And honestly, we were not looking at it, so why bother?

Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/hid/hid-lg4ff.c | 5 ++---
 drivers/hid/hid-lg4ff.h | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-lg4ff.c b/drivers/hid/hid-lg4ff.c
index 5e6a0cef2a06..ad75c86e0bf5 100644
--- a/drivers/hid/hid-lg4ff.c
+++ b/drivers/hid/hid-lg4ff.c
@@ -1445,7 +1445,7 @@ int lg4ff_init(struct hid_device *hid)
 	return error;
 }
 
-int lg4ff_deinit(struct hid_device *hid)
+void lg4ff_deinit(struct hid_device *hid)
 {
 	struct lg4ff_device_entry *entry;
 	struct lg_drv_data *drv_data;
@@ -1453,7 +1453,7 @@ int lg4ff_deinit(struct hid_device *hid)
 	drv_data = hid_get_drvdata(hid);
 	if (!drv_data) {
 		hid_err(hid, "Error while deinitializing device, no private driver data.\n");
-		return -1;
+		return;
 	}
 	entry = drv_data->device_props;
 	if (!entry)
@@ -1489,5 +1489,4 @@ int lg4ff_deinit(struct hid_device *hid)
 	kfree(entry);
 out:
 	dbg_hid("Device successfully unregistered\n");
-	return 0;
 }
diff --git a/drivers/hid/hid-lg4ff.h b/drivers/hid/hid-lg4ff.h
index 25bc88cd877e..4440e4ea2267 100644
--- a/drivers/hid/hid-lg4ff.h
+++ b/drivers/hid/hid-lg4ff.h
@@ -10,14 +10,14 @@ int lg4ff_adjust_input_event(struct hid_device *hid, struct hid_field *field,
 int lg4ff_raw_event(struct hid_device *hdev, struct hid_report *report,
 		u8 *rd, int size, struct lg_drv_data *drv_data);
 int lg4ff_init(struct hid_device *hdev);
-int lg4ff_deinit(struct hid_device *hdev);
+void lg4ff_deinit(struct hid_device *hdev);
 #else
 static inline int lg4ff_adjust_input_event(struct hid_device *hid, struct hid_field *field,
 					   struct hid_usage *usage, s32 value, struct lg_drv_data *drv_data) { return 0; }
 static inline int lg4ff_raw_event(struct hid_device *hdev, struct hid_report *report,
 		u8 *rd, int size, struct lg_drv_data *drv_data) { return 0; }
 static inline int lg4ff_init(struct hid_device *hdev) { return 0; }
-static inline int lg4ff_deinit(struct hid_device *hdev) { return 0; }
+static inline void lg4ff_deinit(struct hid_device *hdev) { return; }
 #endif
 
 #endif
-- 
2.26.3

