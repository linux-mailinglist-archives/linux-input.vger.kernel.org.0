Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1703341AABA
	for <lists+linux-input@lfdr.de>; Tue, 28 Sep 2021 10:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239593AbhI1Ikz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Sep 2021 04:40:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50380 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239618AbhI1Iky (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Sep 2021 04:40:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632818354;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lu2qx5rEGi9a5b3rc3S1fUIgoiBWiswy6C1i615rv/o=;
        b=R+k4TEney6ax0+Estkl6ALHSLycCStZTAZvptdf6R5hwQlttQcIGHssjTpaMDOdErPYsPf
        FR9VnB5fD915y0JF/yKcGWMEYDLxU2eJaNohcyoWSXS6v0jas2ElYFW+pFx//z8tcKIVhn
        4MgRi5WpnTTANxbTRKYq+VsQPQvzT2w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-QrP6NDzFOXCxCZIb29VMBw-1; Tue, 28 Sep 2021 04:39:13 -0400
X-MC-Unique: QrP6NDzFOXCxCZIb29VMBw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 549001084681;
        Tue, 28 Sep 2021 08:39:12 +0000 (UTC)
Received: from xps-13.redhat.com (unknown [10.39.195.86])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D8FD25D9D5;
        Tue, 28 Sep 2021 08:39:10 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        =?UTF-8?q?Michal=20Mal=C3=BD?= <madcatxster@devoid-pointer.net>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 1/2] HID: lg: do not return an error when FF is disabled
Date:   Tue, 28 Sep 2021 10:39:05 +0200
Message-Id: <20210928083906.43983-2-benjamin.tissoires@redhat.com>
In-Reply-To: <20210928083906.43983-1-benjamin.tissoires@redhat.com>
References: <20210928083906.43983-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Found when CONFIG_LOGIRUMBLEPAD2_FF was disabled:
lg2ff_init() returns -1, and lg_probe() checks the return value and
bails out, laterally disabling the device.

Fixes: 2dbf635ea1c0 "HID: hid-lg: Check return values from lg[N]ff_init()"
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/hid/hid-lg.h    | 6 +++---
 drivers/hid/hid-lg4ff.h | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-lg.h b/drivers/hid/hid-lg.h
index 3d8902ba1c6c..dbec5e8fc142 100644
--- a/drivers/hid/hid-lg.h
+++ b/drivers/hid/hid-lg.h
@@ -10,19 +10,19 @@ struct lg_drv_data {
 #ifdef CONFIG_LOGITECH_FF
 int lgff_init(struct hid_device *hdev);
 #else
-static inline int lgff_init(struct hid_device *hdev) { return -1; }
+static inline int lgff_init(struct hid_device *hdev) { return 0; }
 #endif
 
 #ifdef CONFIG_LOGIRUMBLEPAD2_FF
 int lg2ff_init(struct hid_device *hdev);
 #else
-static inline int lg2ff_init(struct hid_device *hdev) { return -1; }
+static inline int lg2ff_init(struct hid_device *hdev) { return 0; }
 #endif
 
 #ifdef CONFIG_LOGIG940_FF
 int lg3ff_init(struct hid_device *hdev);
 #else
-static inline int lg3ff_init(struct hid_device *hdev) { return -1; }
+static inline int lg3ff_init(struct hid_device *hdev) { return 0; }
 #endif
 
 #endif
diff --git a/drivers/hid/hid-lg4ff.h b/drivers/hid/hid-lg4ff.h
index e5c55d515ac2..25bc88cd877e 100644
--- a/drivers/hid/hid-lg4ff.h
+++ b/drivers/hid/hid-lg4ff.h
@@ -16,8 +16,8 @@ static inline int lg4ff_adjust_input_event(struct hid_device *hid, struct hid_fi
 					   struct hid_usage *usage, s32 value, struct lg_drv_data *drv_data) { return 0; }
 static inline int lg4ff_raw_event(struct hid_device *hdev, struct hid_report *report,
 		u8 *rd, int size, struct lg_drv_data *drv_data) { return 0; }
-static inline int lg4ff_init(struct hid_device *hdev) { return -1; }
-static inline int lg4ff_deinit(struct hid_device *hdev) { return -1; }
+static inline int lg4ff_init(struct hid_device *hdev) { return 0; }
+static inline int lg4ff_deinit(struct hid_device *hdev) { return 0; }
 #endif
 
 #endif
-- 
2.26.3

