Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D30F3075AD
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 13:16:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbhA1MOV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 07:14:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55584 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229551AbhA1MOO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 07:14:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611835968;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZW1gq7up2SQoCgM65gkcpMUrF2MFoK7g+kkpZgG/4gs=;
        b=Sd/9ON00qAKAcnD4uQ+k8DpuVN9Qx5Ymrq5vAp9ze+h1iuhihq0+BUf+Xrz2cfqTQb2lgu
        j6kt68/0UNuoHg5KYUzX7Z4MrhKhj1TJ1wWQd2Oa+2ulBXbk4ovQBkLEsdcofG68HNznmj
        YM5ehiIF5jdyGjJ59K8AAZsCQ3lPRNE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535--t6MrXSzOb6urSPVSGNWeQ-1; Thu, 28 Jan 2021 07:12:44 -0500
X-MC-Unique: -t6MrXSzOb6urSPVSGNWeQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2844C107ACE6;
        Thu, 28 Jan 2021 12:12:42 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-250.ams2.redhat.com [10.36.114.250])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7A38F5D9F6;
        Thu, 28 Jan 2021 12:12:39 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Sandeep Singh <sandeep.singh@amd.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Richard Neumann <mail@richard-neumann.de>,
        linux-input@vger.kernel.org
Subject: [PATCH 3/3] AMD_SFH: Add DMI quirk table for BIOS-es which don't set the activestatus bits
Date:   Thu, 28 Jan 2021 13:12:19 +0100
Message-Id: <20210128121219.6381-4-hdegoede@redhat.com>
In-Reply-To: <20210128121219.6381-1-hdegoede@redhat.com>
References: <20210128121219.6381-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some BIOS-es do not initialize the activestatus bits of the AMD_P2C_MSG3
register. This cause the AMD_SFH driver to not register any sensors even
though the laptops in question do have sensors.

Add a DMI quirk-table for specifying sensor-mask overrides based on
DMI match, to make the sensors work OOTB on these laptop models.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199715
BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1651886
Fixes: 4f567b9f8141 ("SFH: PCIe driver to add support of AMD sensor fusion hub")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index ab0a9443e252..ddecc84fd6f0 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -10,6 +10,7 @@
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
+#include <linux/dmi.h>
 #include <linux/interrupt.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/module.h>
@@ -77,11 +78,34 @@ void amd_stop_all_sensors(struct amd_mp2_dev *privdata)
 	writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG0);
 }
 
+static const struct dmi_system_id dmi_sensor_mask_overrides[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP ENVY x360 Convertible 13-ag0xxx"),
+		},
+		.driver_data = (void *)(ACEL_EN | MAGNO_EN),
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP ENVY x360 Convertible 15-cp0xxx"),
+		},
+		.driver_data = (void *)(ACEL_EN | MAGNO_EN),
+	},
+	{ }
+};
+
 int amd_mp2_get_sensor_num(struct amd_mp2_dev *privdata, u8 *sensor_id)
 {
 	int activestatus, num_of_sensors = 0;
+	const struct dmi_system_id *dmi_id;
 	u32 activecontrolstatus;
 
+	if (sensor_mask_override == -1) {
+		dmi_id = dmi_first_match(dmi_sensor_mask_overrides);
+		if (dmi_id)
+			sensor_mask_override = (long)dmi_id->driver_data;
+	}
+
 	if (sensor_mask_override >= 0) {
 		activestatus = sensor_mask_override;
 	} else {
-- 
2.29.2

