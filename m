Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF96B3075AC
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 13:16:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbhA1MOU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 07:14:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37792 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231171AbhA1MOM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 07:14:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611835966;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Hb1Mz6ayVp0FqtW7UJBYGp93F+g/q0hpboiQtt8wXsA=;
        b=H6jvtEwZwh5gT4oauqkJ+AwRKejDHkZXytgucz4l3xpl2Nrkk2QNp1RoZp1dT2MnXEeq6/
        qhAmasJUiwUHcws0KxIyH+v6OTojjo8vt4VdV2ggsnMSCtqQWqKqSJDMr1LEmuezYlAR1j
        YCgHv+Pz6b2ZvW1/APoynwwQ3WGDRYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-hatWUCXLPj-j8QYNXaTYBg-1; Thu, 28 Jan 2021 07:12:42 -0500
X-MC-Unique: hatWUCXLPj-j8QYNXaTYBg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31F09879519;
        Thu, 28 Jan 2021 12:12:39 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-250.ams2.redhat.com [10.36.114.250])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B6A9E5D9F6;
        Thu, 28 Jan 2021 12:12:37 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Sandeep Singh <sandeep.singh@amd.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Richard Neumann <mail@richard-neumann.de>,
        linux-input@vger.kernel.org
Subject: [PATCH 2/3] AMD_SFH: Add sensor_mask module parameter
Date:   Thu, 28 Jan 2021 13:12:18 +0100
Message-Id: <20210128121219.6381-3-hdegoede@redhat.com>
In-Reply-To: <20210128121219.6381-1-hdegoede@redhat.com>
References: <20210128121219.6381-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a sensor_mask module parameter which can be used to override the
sensor-mask read from the activestatus bits of the AMD_P2C_MSG3
registers. Some BIOS-es do not program the activestatus bits, leading
to the AMD-SFH driver not registering any HID devices even though the
laptop in question does actually have sensors.

While at it also fix the wrong indentation of the MAGNO_EN define.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199715
BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1651886
Fixes: 4f567b9f8141 ("SFH: PCIe driver to add support of AMD sensor fusion hub")
Suggested-by: Richard Neumann <mail@richard-neumann.de>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index f3cdb4ea33da..ab0a9443e252 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -22,9 +22,13 @@
 
 #define ACEL_EN		BIT(0)
 #define GYRO_EN		BIT(1)
-#define MAGNO_EN		BIT(2)
+#define MAGNO_EN	BIT(2)
 #define ALS_EN		BIT(19)
 
+static int sensor_mask_override = -1;
+module_param_named(sensor_mask, sensor_mask_override, int, 0444);
+MODULE_PARM_DESC(sensor_mask, "override the detected sensors mask");
+
 void amd_start_sensor(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info info)
 {
 	union sfh_cmd_param cmd_param;
@@ -78,8 +82,12 @@ int amd_mp2_get_sensor_num(struct amd_mp2_dev *privdata, u8 *sensor_id)
 	int activestatus, num_of_sensors = 0;
 	u32 activecontrolstatus;
 
-	activecontrolstatus = readl(privdata->mmio + AMD_P2C_MSG3);
-	activestatus = activecontrolstatus >> 4;
+	if (sensor_mask_override >= 0) {
+		activestatus = sensor_mask_override;
+	} else {
+		activecontrolstatus = readl(privdata->mmio + AMD_P2C_MSG3);
+		activestatus = activecontrolstatus >> 4;
+	}
 
 	if (ACEL_EN  & activestatus)
 		sensor_id[num_of_sensors++] = accel_idx;
-- 
2.29.2

