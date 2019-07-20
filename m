Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B18906EFBC
	for <lists+linux-input@lfdr.de>; Sat, 20 Jul 2019 17:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728685AbfGTPFx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Jul 2019 11:05:53 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51383 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbfGTPFx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Jul 2019 11:05:53 -0400
Received: by mail-wm1-f68.google.com with SMTP id 207so31260073wma.1;
        Sat, 20 Jul 2019 08:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CV+Src3/orFKmofk/Bya8jyXlTvi8zmBrxoWLjvYSfI=;
        b=hhxE17yVzKLBLnFzf0VxZa6fJwT7cliGJCTmbHqhudf0UPUFigeJx+zzCJWLUgK9h7
         SH+TdoF0bE3tAf2QS9bfntCs2gt/LKWj1o5DaXnQlJQSGrUHV7Ey5af9J+rk57KLGW4B
         /u0g3MxyMFkREm1EDb05FQJhJnvIIfV0QqUz1qRlNgCx2y73AT/dGBl50wEOAXDHIo1q
         +oQFPXG4mLzr2l2bCbWfppHO9BwW1e62W7tis6RcGjBURjVFLu087uphOpwfkIeJyP1t
         y+G7aC+W4oWBW2KjqakpxUK2KYaa0T5vEaM0d1VlgEMpBjm3BtbXlj35YGmkwjvPuMZo
         yMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CV+Src3/orFKmofk/Bya8jyXlTvi8zmBrxoWLjvYSfI=;
        b=i3Uuq/pkuFFRZLR9+SIyiL9UTl1sUcOEd47dB1yTytrLSkVfWSJqD8XU19ub1K+DZ3
         sg5do7hlY9oVKU40xBbSA4mF1y3n/JoKk3LPblg/dx/7Wq1wCKDE2miZcsS3ffQQxp0n
         GNGF87DeF8NVH2i/JwxPfaHe/vcHIWear5wqWlO89ehdr9HonR84hFQ6tChuakD5eQUO
         IeitZqPSdhP8nXDUbGzsBewqyBwv03idyt0saxjklndN56IfnR+ha19I22YcAL+UVZDi
         QJXg0kD+r2nKVvETWZ1lQyk6AIWGcokzQnGt+ujYFzyHIS+3EJEHsD0Bj0fmEuuDnEaN
         N53w==
X-Gm-Message-State: APjAAAWSkgpxCPYdV0WR8szWtJdnr2jWqPvGZvAx/tfR6eb5KIYMGS1C
        F+blCvcuPcl8tjlb2w8CLGkFzN3+
X-Google-Smtp-Source: APXvYqzDCAUdGiwhcq7a+eDYDondHZIONZwCKxPrnHcUJaOKbxvuzgT1mSgOJ2HNwibBKLpUGDAiCQ==
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr51815738wmh.129.1563635151402;
        Sat, 20 Jul 2019 08:05:51 -0700 (PDT)
Received: from xws.fritz.box (pD9EA3BA8.dip0.t-ipconnect.de. [217.234.59.168])
        by smtp.gmail.com with ESMTPSA id g8sm38326864wme.20.2019.07.20.08.05.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 20 Jul 2019 08:05:50 -0700 (PDT)
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
Subject: [PATCH v3 1/2] platform/x86: surfacepro3_button: Fix device check
Date:   Sat, 20 Jul 2019 17:05:10 +0200
Message-Id: <20190720150511.95076-2-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190720150511.95076-1-luzmaximilian@gmail.com>
References: <20190720150511.95076-1-luzmaximilian@gmail.com>
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
actual implementation is significantly different. This patch ensures
that the surfacepro3_button driver is only used on the Pro 3 and 4
models, allowing a different driver to bind on other models.

Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
---
 drivers/platform/x86/surfacepro3_button.c | 47 +++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/platform/x86/surfacepro3_button.c b/drivers/platform/x86/surfacepro3_button.c
index 47c6d000465a..ec515223f654 100644
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
@@ -142,6 +148,44 @@ static int surface_button_resume(struct device *dev)
 }
 #endif
 
+/*
+ * Surface Pro 4 and Surface Book 2 / Surface Pro 2017 use the same device
+ * ID (MSHW0040) for the power/volume buttons. Make sure this is the right
+ * device by checking for the _DSM method and OEM Platform Revision.
+ *
+ * Returns true if the driver should bind to this device, i.e. the device is
+ * either MSWH0028 (Pro 3) or MSHW0040 on a Pro 4 or Book 1.
+ */
+static bool surface_button_check_MSHW0040(struct acpi_device *dev)
+{
+	acpi_handle handle = dev->handle;
+	union acpi_object *result;
+	u64 oem_platform_rev = 0;	// valid revisions are nonzero
+
+	// get OEM platform revision
+	result = acpi_evaluate_dsm_typed(handle, &MSHW0040_DSM_UUID,
+					 MSHW0040_DSM_REVISION,
+					 MSHW0040_DSM_GET_OMPR,
+					 NULL, ACPI_TYPE_INTEGER);
+
+	/*
+	 * If evaluating the _DSM fails, the method is not present. This means
+	 * that we have either MSHW0028 or MSHW0040 on Pro 4 or Book 1, so we
+	 * should use this driver. We use revision 0 indicating it is
+	 * unavailable.
+	 */
+
+	if (result) {
+		oem_platform_rev = result->integer.value;
+		ACPI_FREE(result);
+	}
+
+	dev_dbg(&dev->dev, "OEM Platform Revision %llu\n", oem_platform_rev);
+
+	return oem_platform_rev == 0;
+}
+
+
 static int surface_button_add(struct acpi_device *device)
 {
 	struct surface_button *button;
@@ -154,6 +198,9 @@ static int surface_button_add(struct acpi_device *device)
 	    strlen(SURFACE_BUTTON_OBJ_NAME)))
 		return -ENODEV;
 
+	if (!surface_button_check_MSHW0040(device))
+		return -ENODEV;
+
 	button = kzalloc(sizeof(struct surface_button), GFP_KERNEL);
 	if (!button)
 		return -ENOMEM;
-- 
2.22.0

