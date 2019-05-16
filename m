Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35DCE20988
	for <lists+linux-input@lfdr.de>; Thu, 16 May 2019 16:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727217AbfEPO0w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 May 2019 10:26:52 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34900 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbfEPO0v (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 May 2019 10:26:51 -0400
Received: by mail-wm1-f66.google.com with SMTP id q15so3713699wmj.0;
        Thu, 16 May 2019 07:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bagp0qR6leMj2o8ooitIQ3YBx8LsUUCC2ep1ixrI5pU=;
        b=j8K9QILRzLZNu3suU8Mf207PMM5bhgDOHCPVlm1q4ruoE7S7CFJYpd+r97MPV9qfsx
         MxhNkXImD6h28R6Gy9ylaI9ohfoGr4oYbZeB1jhv2oyAfkariP9KytQtrbj3+8VewZ2N
         TsyfN1gDorzg56jKjewRAsSS20KlI+g5m8xZZe46xI9NWIvNeLZzIIz0T9t/pPyQup7B
         voSQrY+CwSPQZ9365/nHgy1KH/WDh8KWFwjwhMEG2O44oB5EWD/iqCQAhYK8EK4szUci
         EsQTNIzfhdbPt8xp3THLQ4gpIw/dPbDWiZFgUeeu+TlDK99ZEzVGHRAdZvlz3xx4dYvB
         CkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bagp0qR6leMj2o8ooitIQ3YBx8LsUUCC2ep1ixrI5pU=;
        b=qNe4aR+nVg5JJV9H+gDgyqjUQSyBkDoYRSYaFxD+OfdHr6/wGBAbpm6zXIDlfGCQCD
         JgW+4RjCgd6tJ+wc6+Dl9HDOO6WB1/0y7aqr/tUsguIbjDxKEqScBeeJ0H5JLuK+ldkO
         XSEiFw+dzukF/Huai27apFlfeCVOM/LaJCBgmU0Szl9Wj43wHyH8maGV/ojTTjQlMEoP
         NLTebfL0n7UNza8TXzimBjFu9K0bVdQdiqd6lgt4g0t+LpAQQGNLjbRaA0O9JYtq0I9O
         2n4/vPq/s0+JB92Gu8LAdeFA8dmiJ3IXh4a2Fu7e0UmiOubNNH2Yf5yrD5x6Z5cELdK3
         3/sQ==
X-Gm-Message-State: APjAAAV91IK+tsFdkPlvdTf7JIPXHFJIOdcY42UkrY2w2XgII/FHkK1A
        IpgJGfZGJJcugsoBkos42b7ztDKZKU0=
X-Google-Smtp-Source: APXvYqw+033ozLHevz8inv0F9klEqnuyJtTfvOiaCrXfuWZjBk4rNLcVHALUiS1vZhtGd1BKD/rBjw==
X-Received: by 2002:a1c:1d4:: with SMTP id 203mr29174703wmb.76.1558016809178;
        Thu, 16 May 2019 07:26:49 -0700 (PDT)
Received: from xws.fritz.box (pD9EA30D0.dip0.t-ipconnect.de. [217.234.48.208])
        by smtp.gmail.com with ESMTPSA id q4sm4852427wrx.25.2019.05.16.07.26.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2019 07:26:48 -0700 (PDT)
From:   Maximilian Luz <luzmaximilian@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Maximilian Luz <luzmaximilian@gmail.com>
Subject: [RFC 1/2] platform: Fix device check for surfacepro3_button
Date:   Thu, 16 May 2019 16:25:22 +0200
Message-Id: <20190516142523.117978-2-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190516142523.117978-1-luzmaximilian@gmail.com>
References: <20190516142523.117978-1-luzmaximilian@gmail.com>
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
index 1b491690ce07..eaec30380b11 100644
--- a/drivers/platform/x86/surfacepro3_button.c
+++ b/drivers/platform/x86/surfacepro3_button.c
@@ -24,6 +24,12 @@
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
@@ -146,6 +152,34 @@ static int surface_button_resume(struct device *dev)
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
@@ -158,6 +192,10 @@ static int surface_button_add(struct acpi_device *device)
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
2.21.0

