Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8401395501
	for <lists+linux-input@lfdr.de>; Mon, 31 May 2021 07:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbhEaFYz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 31 May 2021 01:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbhEaFYx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 31 May 2021 01:24:53 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF6C6C06174A;
        Sun, 30 May 2021 22:23:12 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id k5so5938273pjj.1;
        Sun, 30 May 2021 22:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L2oO4yyapOcPcSgk5euKZ0kOypADACJjFfpex/V3+Lk=;
        b=oGTXhTdM8wNru8KORHE0rJGRmMXqLdj9RZ5Cnd4/qX5mfWqF/vXs7JgkgJfdmxk5WC
         U3qMHNTPMJgV4yAJWMqUvBARbWbU3DY3R7YipA1u9ea5Ha9+hjwLD9W9M0/izTBD+4RY
         RSmN0IUCGXYoDpsQ0iz8riHgUBvMfJVi3Ysh5ug7PyOnwSBFfIguDm5IYhLiuXi0yOR4
         bGPJB8KRojNwxpf5nlO8AStlYXfrR3SFnqDI/hBsRuBk75XEo6wQ9Ip7QzI5CYGR2kdJ
         oWjOtlyasekzMf/QRDCdjVcCJFQ1i73SGxiBt9Ks9tTXwKYU86aj9ZFYUZhvqF6+XCzj
         5OXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L2oO4yyapOcPcSgk5euKZ0kOypADACJjFfpex/V3+Lk=;
        b=RQ5oH8zb8RBBvT7HxeaxO9PJA9OoUUPyNcOuXh7jPpIBkNMQ3vf0TcWNgbWsHOc5bL
         VoQVwr+R8c3tPanaFLONQeq+z/jbaYcCk58aAk3CQOueOW83arMD0CIYx7JL6iqvu9Zb
         SXYNJ7EAc5KCxYjC4GyXeyBbUiqcdz+amUwmG/GRNis18w6ep/jzj7MyvBEcAg8u7zlV
         q6xJV+Zf33cefgfEFsACyIKbxoY3YVhmDyN1ls7xFXe6va9el9f8S8RMpfjKihfUJGOV
         Vn10GB+GyHN7KRhI+vuUB5j3ku+XYzRBOFQ6LHJmBXC0EeXmCOWQrZmcaRNQmwi3JBn6
         DQgw==
X-Gm-Message-State: AOAM5339X7e3ycE+2Hj8sjb0d9YOthwOdtMKPolXSpQs8rqlsFtzf4Cy
        F7sTF2P5Ypahdi9CafjZbEM=
X-Google-Smtp-Source: ABdhPJwhMpX/Dpwm4x83+K8MVoTaYChsHSX94IxXhljd51rI4zEVbsrPLjrid1qzjY2N4Q+YGG1oCg==
X-Received: by 2002:a17:903:2482:b029:fd:696c:1d2b with SMTP id p2-20020a1709032482b02900fd696c1d2bmr19107198plw.24.1622438592395;
        Sun, 30 May 2021 22:23:12 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:f797:8c47:4837:ec11])
        by smtp.gmail.com with ESMTPSA id y1sm9895555pfn.13.2021.05.30.22.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 22:23:11 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Input: cyttsp - remove public header
Date:   Sun, 30 May 2021 22:23:07 -0700
Message-Id: <20210531052307.1433979-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
In-Reply-To: <20210531052307.1433979-1-dmitry.torokhov@gmail.com>
References: <20210531052307.1433979-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There is nothing in include/linux/input/cyttsp.h that might be of interes
to the kernel at large, so let's move this information into the driver
code and remove the header.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 MAINTAINERS                             |  1 -
 drivers/input/touchscreen/cyttsp_core.c |  9 +++++++-
 drivers/input/touchscreen/cyttsp_core.h |  1 -
 drivers/input/touchscreen/cyttsp_i2c.c  |  2 ++
 drivers/input/touchscreen/cyttsp_spi.c  |  2 ++
 include/linux/input/cyttsp.h            | 29 -------------------------
 6 files changed, 12 insertions(+), 32 deletions(-)
 delete mode 100644 include/linux/input/cyttsp.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 9a43400480e2..920f33866799 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4918,7 +4918,6 @@ M:	Linus Walleij <linus.walleij@linaro.org>
 L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/input/touchscreen/cyttsp*
-F:	include/linux/input/cyttsp.h
 
 D-LINK DIR-685 TOUCHKEYS DRIVER
 M:	Linus Walleij <linus.walleij@linaro.org>
diff --git a/drivers/input/touchscreen/cyttsp_core.c b/drivers/input/touchscreen/cyttsp_core.c
index a6352d79e23d..1dbd849c9613 100644
--- a/drivers/input/touchscreen/cyttsp_core.c
+++ b/drivers/input/touchscreen/cyttsp_core.c
@@ -46,8 +46,15 @@
 #define CY_MAXZ				255
 #define CY_DELAY_DFLT			20 /* ms */
 #define CY_DELAY_MAX			500
-#define CY_ACT_DIST_DFLT		0xF8
+/* Active distance in pixels for a gesture to be reported */
+#define CY_ACT_DIST_DFLT		0xF8 /* pixels */
 #define CY_ACT_DIST_MASK		0x0F
+/* Active Power state scanning/processing refresh interval */
+#define CY_ACT_INTRVL_DFLT		0x00 /* ms */
+/* Low Power state scanning/processing refresh interval */
+#define CY_LP_INTRVL_DFLT		0x0A /* ms */
+/* touch timeout for the Active power */
+#define CY_TCH_TMOUT_DFLT		0xFF /* ms */
 #define CY_HNDSHK_BIT			0x80
 /* device mode bits */
 #define CY_OPERATE_MODE			0x00
diff --git a/drivers/input/touchscreen/cyttsp_core.h b/drivers/input/touchscreen/cyttsp_core.h
index 8eba9d8ba74a..075509e695a2 100644
--- a/drivers/input/touchscreen/cyttsp_core.h
+++ b/drivers/input/touchscreen/cyttsp_core.h
@@ -22,7 +22,6 @@
 #include <linux/module.h>
 #include <linux/types.h>
 #include <linux/device.h>
-#include <linux/input/cyttsp.h>
 #include <linux/regulator/consumer.h>
 
 #define CY_NUM_RETRY		16 /* max number of retries for read ops */
diff --git a/drivers/input/touchscreen/cyttsp_i2c.c b/drivers/input/touchscreen/cyttsp_i2c.c
index 0a09f07bc23a..4c8473d327ab 100644
--- a/drivers/input/touchscreen/cyttsp_i2c.c
+++ b/drivers/input/touchscreen/cyttsp_i2c.c
@@ -18,6 +18,8 @@
 #include <linux/i2c.h>
 #include <linux/input.h>
 
+#define CY_I2C_NAME		"cyttsp-i2c"
+
 #define CY_I2C_DATA_SIZE	128
 
 static const struct cyttsp_bus_ops cyttsp_i2c_bus_ops = {
diff --git a/drivers/input/touchscreen/cyttsp_spi.c b/drivers/input/touchscreen/cyttsp_spi.c
index 8715e5354d79..30c6fbf86a86 100644
--- a/drivers/input/touchscreen/cyttsp_spi.c
+++ b/drivers/input/touchscreen/cyttsp_spi.c
@@ -20,6 +20,8 @@
 #include <linux/input.h>
 #include <linux/spi/spi.h>
 
+#define CY_SPI_NAME		"cyttsp-spi"
+
 #define CY_SPI_WR_OP		0x00 /* r/~w */
 #define CY_SPI_RD_OP		0x01
 #define CY_SPI_CMD_BYTES	4
diff --git a/include/linux/input/cyttsp.h b/include/linux/input/cyttsp.h
deleted file mode 100644
index 118b9af6e01a..000000000000
--- a/include/linux/input/cyttsp.h
+++ /dev/null
@@ -1,29 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Header file for:
- * Cypress TrueTouch(TM) Standard Product (TTSP) touchscreen drivers.
- * For use with Cypress Txx3xx parts.
- * Supported parts include:
- * CY8CTST341
- * CY8CTMA340
- *
- * Copyright (C) 2009, 2010, 2011 Cypress Semiconductor, Inc.
- * Copyright (C) 2012 Javier Martinez Canillas <javier@dowhile0.org>
- *
- * Contact Cypress Semiconductor at www.cypress.com (kev@cypress.com)
- */
-#ifndef _CYTTSP_H_
-#define _CYTTSP_H_
-
-#define CY_SPI_NAME "cyttsp-spi"
-#define CY_I2C_NAME "cyttsp-i2c"
-/* Active Power state scanning/processing refresh interval */
-#define CY_ACT_INTRVL_DFLT 0x00 /* ms */
-/* touch timeout for the Active power */
-#define CY_TCH_TMOUT_DFLT 0xFF /* ms */
-/* Low Power state scanning/processing refresh interval */
-#define CY_LP_INTRVL_DFLT 0x0A /* ms */
-/* Active distance in pixels for a gesture to be reported */
-#define CY_ACT_DIST_DFLT 0xF8 /* pixels */
-
-#endif /* _CYTTSP_H_ */
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog

