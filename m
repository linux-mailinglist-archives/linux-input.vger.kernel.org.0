Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D57944CD1F
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2019 13:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfFTLvr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Jun 2019 07:51:47 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37746 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbfFTLvq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Jun 2019 07:51:46 -0400
Received: by mail-wr1-f66.google.com with SMTP id v14so2729956wrr.4;
        Thu, 20 Jun 2019 04:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qt7ilRYrtFffaWJJ/RMaWnUnJ4ybJEaYlbppHjgR3/w=;
        b=dsUJBFO9Oe0lw18G3zzN8ReHz6MllMbZl+UfJn832wzekDiq2PdnqEoPMqVD8JvSEl
         QQBHiafpl2KY6uAL2KQqIP5W8EnPda/yRczvC8UD0ll8t3vG+Tbh9sd40+3/Vsa9CVYN
         eYMh384MuWFj1Q+/iHYWV0f8bkbwjcXtFqzCVzJYH0oMoogX/zHIgTl6kp6FZdO7EsfH
         xMAZC1XlvELs+lf5YRvDDxTWNSgzOfhUjoOXTGdxfwvW0YGVfH5WXlbZmUz1MO5sdaBU
         /uW5tTklpOuCTxzMdPtFYyI/woPAFnL/Hwi4iPonj4j95KhVt08/G3s53iFS1IWVC8KZ
         GHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qt7ilRYrtFffaWJJ/RMaWnUnJ4ybJEaYlbppHjgR3/w=;
        b=UyDv+amni+fNu4NIe/RKQAPEzCB+2a8KH8Yr+CI8yz9AZk2D0tNsCj6OpScKl8UUR7
         fmBwbtoxdOYWzwRp3Yi5YXMmnQWpPYzC/bj9/wQhUYWF5qYgJHCw8USzfmrCkV8/ownJ
         sHJlBzZ72uclgNmwLbEtVjUR2mzfbfXbhGSTWuxoitrY9aNjIPe2B3OXMD2GPHcfrbqJ
         wDmfH/wGMocXt6t6nzBbvpQhFtgukuRMajTbhb8BR4SETKsEK6R6mDI2BbAkVBH1CHrL
         m33VdGoulEajH6HzLa1AicHO4Shg+Jxd+R9oHzsrT6N2X3T9c11rJG2KhLqNqVaCboK8
         YpPg==
X-Gm-Message-State: APjAAAU28HSa2dYZNQ463E/7m16tcBJdvaGQRGn53Y4BGQ34M7RAAr1H
        dIiWaO7bhTt/Uq9Vq+aGYdeBKcT/
X-Google-Smtp-Source: APXvYqzbWsMTnvcMtipSV2GcVbZV7WXLL22fweAMmTaWVlAP6MqyVqTJ2iO+tYKEiOeX2qDrsN4jYQ==
X-Received: by 2002:a5d:53ca:: with SMTP id a10mr29124539wrw.131.1561031505046;
        Thu, 20 Jun 2019 04:51:45 -0700 (PDT)
Received: from xws.fritz.box (pD9E5A621.dip0.t-ipconnect.de. [217.229.166.33])
        by smtp.gmail.com with ESMTPSA id s7sm7918213wmc.2.2019.06.20.04.51.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 04:51:44 -0700 (PDT)
From:   Maximilian Luz <luzmaximilian@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>
Subject: [PATCH 1/2] platform: Fix device check for surfacepro3_button
Date:   Thu, 20 Jun 2019 13:50:55 +0200
Message-Id: <20190620115056.4169-2-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190620115056.4169-1-luzmaximilian@gmail.com>
References: <20190620115056.4169-1-luzmaximilian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Do not use the surfacepro3_button driver on newer Microsoft Surface
models, only use it on the Surface Pro 3 and 4. Newer models (5th, 6th
and possibly future generations) use the same device as the Surface Pro
4 to represent their volume and power buttons (MSHW0040), but their
acutal implementation is significantly different. This patch ensures
that the surfacepro3_button driver is only used on the Pro 3 and 4
models, allowing a different driver to bind on other models.

Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
---
 drivers/platform/x86/surfacepro3_button.c | 38 +++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/platform/x86/surfacepro3_button.c b/drivers/platform/x86/surfacepro3_button.c
index 47c6d000465a..0e2c7dfafd9f 100644
--- a/drivers/platform/x86/surfacepro3_button.c
+++ b/drivers/platform/x86/surfacepro3_button.c
@@ -20,6 +20,12 @@
 #define SURFACE_BUTTON_OBJ_NAME		"VGBI"
 #define SURFACE_BUTTON_DEVICE_NAME	"Surface Pro 3/4 Buttons"
 
+#define MSHW0040_DSM_REVISION		0x01
+#define MSHW0040_DSM_GET_OMPR		0x02	// get OEM Platform Revision
+static const guid_t MSHW0040_DSM_UUID =
+	GUID_INIT(0x6fd05c69, 0xcde3, 0x49f4, 0x95, 0xed, 0xab, 0x16, 0x65,
+		  0x49, 0x80, 0x35);
+
 #define SURFACE_BUTTON_NOTIFY_TABLET_MODE	0xc8
 
 #define SURFACE_BUTTON_NOTIFY_PRESS_POWER	0xc6
@@ -142,6 +148,34 @@ static int surface_button_resume(struct device *dev)
 }
 #endif
 
+/*
+ * Surface Pro 4 and Surface Book 2 / Surface Pro 2017 use the same device
+ * ID (MSHW0040) for the power/volume buttons. Make sure this is the right
+ * device by checking for the _DSM method and OEM Platform Revision.
+ */
+static int surface_button_check_MSHW0040(struct acpi_device *dev)
+{
+	acpi_handle handle = dev->handle;
+	union acpi_object *result;
+	u64 oem_platform_rev = 0;
+
+	// get OEM platform revision
+	result = acpi_evaluate_dsm_typed(handle, &MSHW0040_DSM_UUID,
+					 MSHW0040_DSM_REVISION,
+					 MSHW0040_DSM_GET_OMPR,
+					 NULL, ACPI_TYPE_INTEGER);
+
+	if (result) {
+		oem_platform_rev = result->integer.value;
+		ACPI_FREE(result);
+	}
+
+	dev_dbg(&dev->dev, "OEM Platform Revision %llu\n", oem_platform_rev);
+
+	return oem_platform_rev == 0 ? 0 : -ENODEV;
+}
+
+
 static int surface_button_add(struct acpi_device *device)
 {
 	struct surface_button *button;
@@ -154,6 +188,10 @@ static int surface_button_add(struct acpi_device *device)
 	    strlen(SURFACE_BUTTON_OBJ_NAME)))
 		return -ENODEV;
 
+	error = surface_button_check_MSHW0040(device);
+	if (error)
+		return error;
+
 	button = kzalloc(sizeof(struct surface_button), GFP_KERNEL);
 	if (!button)
 		return -ENOMEM;
-- 
2.22.0

