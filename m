Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8D555C65C
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2019 02:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbfGBAi0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Jul 2019 20:38:26 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38467 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726977AbfGBAi0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Jul 2019 20:38:26 -0400
Received: by mail-wr1-f67.google.com with SMTP id p11so4499004wro.5;
        Mon, 01 Jul 2019 17:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qt7ilRYrtFffaWJJ/RMaWnUnJ4ybJEaYlbppHjgR3/w=;
        b=Bd5Q5iverXZZq8de1gOngqSs7Oi+gHUtBmp0wCZX3e2GWqKa1dC/ldHVzjwMqI8cN/
         ewZED7opRDYkb9OwcdBx72aI7gSadOMCZ3Ex1cqpFoDzqqvVRuWqqUDuY53vM9tHpIAi
         7deMLfBL8RbNPPkKB4Dmy1kxCP5YsWEKOX/y5HEd7a71abptKYNpqlQ/kNiq/HGzE7bQ
         wHCUAZLfKaX1kyRICRmsveytOtFb2OKHNnjfop4+T1zZ0WayJDBWWci1D2R97phwaeUZ
         CrV2cBg2yOG3IpknF2cfTBj/akzEb6Xp3FPSZ+dUdO10Q2LpGeLsJ58NOa+aHG6iIHF5
         YPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qt7ilRYrtFffaWJJ/RMaWnUnJ4ybJEaYlbppHjgR3/w=;
        b=E9TSyKWBmaN1DXPmLGTo7BsLnZjZCf69GTDpJgj1ft5++XPOGae2TP4ITXVuQqfQAP
         y7tjk5mR0RevfqHsEJfK9p+lTkQ5kI9VEj1X3DNXMmlhstvxc4OCae8hDkalcJHsewcC
         CM/hfpaVYZnpj+CFbfdP4AjPQCvBnMpNYHD/VC74CKwtREcCv7zjq4BU9Cjuh536FG+e
         8v4YhUE7SWEeFoQvnbOfMGXkNHDIaIJJpCDKaugw7FjHjPED4BpHNOWM3wsez4NMyuD6
         YtD34DSxY1uB0cV0ejbdsghB0en0hlpJTBgyqxxJue3mDmzIoHZbViLgOpR+C/BExUkQ
         czDA==
X-Gm-Message-State: APjAAAWt6KAQzoWiRKEv4HSYgLaSum+uM+jI7elRG6zbW9xiyE/6X3ow
        gZiQSSO8NqCqE3xIHcEuiAwpZFPv
X-Google-Smtp-Source: APXvYqx7EpuueS7ZUiPFxWNyu1oQATkiLJ/wya7b9oHjjiNnsL5tj9S5L/tpmMXxgnIkLfuBOWtfLQ==
X-Received: by 2002:a5d:4681:: with SMTP id u1mr20183500wrq.102.1562027903292;
        Mon, 01 Jul 2019 17:38:23 -0700 (PDT)
Received: from xws.fritz.box (p5487BBD4.dip0.t-ipconnect.de. [84.135.187.212])
        by smtp.gmail.com with ESMTPSA id 60sm3066087wrc.68.2019.07.01.17.38.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 01 Jul 2019 17:38:22 -0700 (PDT)
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
Subject: [PATCH v2 1/2] platform: Fix device check for surfacepro3_button
Date:   Tue,  2 Jul 2019 02:37:39 +0200
Message-Id: <20190702003740.75970-2-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190702003740.75970-1-luzmaximilian@gmail.com>
References: <20190702003740.75970-1-luzmaximilian@gmail.com>
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

