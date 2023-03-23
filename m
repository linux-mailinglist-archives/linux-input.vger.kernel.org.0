Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9AC26C5CE4
	for <lists+linux-input@lfdr.de>; Thu, 23 Mar 2023 03:54:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbjCWCyP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Mar 2023 22:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbjCWCyO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Mar 2023 22:54:14 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A43910F7;
        Wed, 22 Mar 2023 19:53:54 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id j13so20256689pjd.1;
        Wed, 22 Mar 2023 19:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679540033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2b2cYygU+LX0ZvIUsqKn/3NwRFS+je4j5ssTIHKMfQ=;
        b=Y11CzypPAV8GbrmoZPU5VY4pArcHuXYhwUhs4tR6X2oGPpX1YUZZO3+e7TDBzDKnV4
         1CEbgCmO7yw07mZMCqw8IVxj4rcRAzCxi2ZvI1sxWIk6rXXUG1uC6yjoX9vqo+dV+ED4
         3sy3cEe2EkiYpTNyrAfLijS2kqWCTFJl4PFTM/jd2G0+1SNsvcHJudHGXMg6P/dHIRv+
         4aKHjgXHsMcFN80CXPIspLb9pTS0Hl1i74xb/MChy3YPPhcMq7XB0qOVTCv0gm9OCyzg
         EKljclh0i0pXSuTLf68Is8doee184Y35XkdfGR5HIiiAAlabfVSIVlsfLsuNJkgU8IUm
         VAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679540033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2b2cYygU+LX0ZvIUsqKn/3NwRFS+je4j5ssTIHKMfQ=;
        b=ccsCuJKr2bntE2cJMsxV1ttk+C9qjnYfNyBTHNTj/qu/13D9fu8kHQMSGb2sjH2Qc8
         r9qAzuETBTt6pnhJoPyU458Ty0EjB7X53y7RzvilflXN1Sy+tpFFmdgfz304Ew8pA7wj
         5jPFEaHE+IvydE32SYGPLKtAiZKuO24AZCXLdMASrC2bMpf0JNF2nyb2OifTMEluN8H2
         BSPsARpehz5vs8PSImWgbC32shu7S6lpi7V0I1zd4oDHNkic/xsHVPg6NJUnMX8Bq59/
         5H9q6vtr7VXQ8ustoMLJcxCebZ+zlmToUA1tA7JcVhvtSyY4SPMEFkprsCMRSo5dtn3+
         eXzw==
X-Gm-Message-State: AO0yUKVsGEgl0MTFs6LzEZlRdy5ryNDSwWHp9g8HJ+qWd06I58ygAQX5
        h/CmdA5VQuw1/XuawLlK/NpEJi0Jz52o9g==
X-Google-Smtp-Source: AK7set9arrFks2yIM4Yr9M8KDA4N7AFYG7FUXWV0dJ8SWhOg40myjSTELFi/2VRhn3w5b6SsJvNvBQ==
X-Received: by 2002:a17:902:f98b:b0:1a0:50bd:31bf with SMTP id ky11-20020a170902f98b00b001a050bd31bfmr4362497plb.32.1679540033268;
        Wed, 22 Mar 2023 19:53:53 -0700 (PDT)
Received: from localhost.localdomain ([47.147.242.129])
        by smtp.gmail.com with ESMTPSA id iy13-20020a170903130d00b001a1c74554f3sm7623697plb.185.2023.03.22.19.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 19:53:53 -0700 (PDT)
From:   Andrew Kallmeyer <kallmeyeras@gmail.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     Andrew Kallmeyer <kallmeyeras@gmail.com>,
        Gergo Koteles <soyer@irl.hu>,
        Ike Panhc <ike.pan@canonical.com>, linux-input@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Armin Wolf <W_Armin@gmx.de>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v2 1/2] platform/x86: Move ideapad ACPI helpers to a new header
Date:   Wed, 22 Mar 2023 19:51:59 -0700
Message-Id: <20230323025200.5462-2-kallmeyeras@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230323025200.5462-1-kallmeyeras@gmail.com>
References: <20230323025200.5462-1-kallmeyeras@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

These functions will be used by a driver written by Gergo Koteles to
detect the tablet mode switch in Lenovo Yoga laptops. These changes were
discussed in review of that patch.

This is the minimal set of functions needed in that driver, there are
several more small functions left in the ACPI Helpers section in
ideapad-laptop.c. The only change is the functions are now marked inline
as requested in the review comments.

Signed-off-by: Andrew Kallmeyer <kallmeyeras@gmail.com>
Link: https://lore.kernel.org/r/20221004214332.35934-1-soyer@irl.hu/
---
 drivers/platform/x86/ideapad-laptop.c | 135 +----------------------
 drivers/platform/x86/ideapad-laptop.h | 151 ++++++++++++++++++++++++++
 2 files changed, 152 insertions(+), 134 deletions(-)
 create mode 100644 drivers/platform/x86/ideapad-laptop.h

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 0eb5bfdd8..55f56697e 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -20,7 +20,6 @@
 #include <linux/init.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
-#include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/leds.h>
 #include <linux/module.h>
@@ -31,6 +30,7 @@
 #include <linux/sysfs.h>
 #include <linux/types.h>
 #include <linux/wmi.h>
+#include "ideapad-laptop.h"
 
 #include <acpi/video.h>
 
@@ -85,33 +85,6 @@ enum {
 	SALS_FNLOCK_OFF       = 0xf,
 };
 
-enum {
-	VPCCMD_R_VPC1 = 0x10,
-	VPCCMD_R_BL_MAX,
-	VPCCMD_R_BL,
-	VPCCMD_W_BL,
-	VPCCMD_R_WIFI,
-	VPCCMD_W_WIFI,
-	VPCCMD_R_BT,
-	VPCCMD_W_BT,
-	VPCCMD_R_BL_POWER,
-	VPCCMD_R_NOVO,
-	VPCCMD_R_VPC2,
-	VPCCMD_R_TOUCHPAD,
-	VPCCMD_W_TOUCHPAD,
-	VPCCMD_R_CAMERA,
-	VPCCMD_W_CAMERA,
-	VPCCMD_R_3G,
-	VPCCMD_W_3G,
-	VPCCMD_R_ODD, /* 0x21 */
-	VPCCMD_W_FAN,
-	VPCCMD_R_RF,
-	VPCCMD_W_RF,
-	VPCCMD_R_FAN = 0x2B,
-	VPCCMD_R_SPECIAL_BUTTONS = 0x31,
-	VPCCMD_W_BL_POWER = 0x33,
-};
-
 struct ideapad_dytc_priv {
 	enum platform_profile_option current_profile;
 	struct platform_profile_handler pprof;
@@ -227,7 +200,6 @@ static void ideapad_shared_exit(struct ideapad_private *priv)
 /*
  * ACPI Helpers
  */
-#define IDEAPAD_EC_TIMEOUT 200 /* in ms */
 
 static int eval_int(acpi_handle handle, const char *name, unsigned long *res)
 {
@@ -270,116 +242,11 @@ static int exec_sals(acpi_handle handle, unsigned long arg)
 	return exec_simple_method(handle, "SALS", arg);
 }
 
-static int eval_int_with_arg(acpi_handle handle, const char *name, unsigned long arg, unsigned long *res)
-{
-	struct acpi_object_list params;
-	unsigned long long result;
-	union acpi_object in_obj;
-	acpi_status status;
-
-	params.count = 1;
-	params.pointer = &in_obj;
-	in_obj.type = ACPI_TYPE_INTEGER;
-	in_obj.integer.value = arg;
-
-	status = acpi_evaluate_integer(handle, (char *)name, &params, &result);
-	if (ACPI_FAILURE(status))
-		return -EIO;
-
-	if (res)
-		*res = result;
-
-	return 0;
-}
-
 static int eval_dytc(acpi_handle handle, unsigned long cmd, unsigned long *res)
 {
 	return eval_int_with_arg(handle, "DYTC", cmd, res);
 }
 
-static int eval_vpcr(acpi_handle handle, unsigned long cmd, unsigned long *res)
-{
-	return eval_int_with_arg(handle, "VPCR", cmd, res);
-}
-
-static int eval_vpcw(acpi_handle handle, unsigned long cmd, unsigned long data)
-{
-	struct acpi_object_list params;
-	union acpi_object in_obj[2];
-	acpi_status status;
-
-	params.count = 2;
-	params.pointer = in_obj;
-	in_obj[0].type = ACPI_TYPE_INTEGER;
-	in_obj[0].integer.value = cmd;
-	in_obj[1].type = ACPI_TYPE_INTEGER;
-	in_obj[1].integer.value = data;
-
-	status = acpi_evaluate_object(handle, "VPCW", &params, NULL);
-	if (ACPI_FAILURE(status))
-		return -EIO;
-
-	return 0;
-}
-
-static int read_ec_data(acpi_handle handle, unsigned long cmd, unsigned long *data)
-{
-	unsigned long end_jiffies, val;
-	int err;
-
-	err = eval_vpcw(handle, 1, cmd);
-	if (err)
-		return err;
-
-	end_jiffies = jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1;
-
-	while (time_before(jiffies, end_jiffies)) {
-		schedule();
-
-		err = eval_vpcr(handle, 1, &val);
-		if (err)
-			return err;
-
-		if (val == 0)
-			return eval_vpcr(handle, 0, data);
-	}
-
-	acpi_handle_err(handle, "timeout in %s\n", __func__);
-
-	return -ETIMEDOUT;
-}
-
-static int write_ec_cmd(acpi_handle handle, unsigned long cmd, unsigned long data)
-{
-	unsigned long end_jiffies, val;
-	int err;
-
-	err = eval_vpcw(handle, 0, data);
-	if (err)
-		return err;
-
-	err = eval_vpcw(handle, 1, cmd);
-	if (err)
-		return err;
-
-	end_jiffies = jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1;
-
-	while (time_before(jiffies, end_jiffies)) {
-		schedule();
-
-		err = eval_vpcr(handle, 1, &val);
-		if (err)
-			return err;
-
-		if (val == 0)
-			return 0;
-	}
-
-	acpi_handle_err(handle, "timeout in %s\n", __func__);
-
-	return -ETIMEDOUT;
-}
-
 /*
  * debugfs
  */
diff --git a/drivers/platform/x86/ideapad-laptop.h b/drivers/platform/x86/ideapad-laptop.h
new file mode 100644
index 000000000..7dd8ce027
--- /dev/null
+++ b/drivers/platform/x86/ideapad-laptop.h
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  ideapad-laptop.h - Lenovo IdeaPad ACPI Extras
+ *
+ *  Copyright © 2010 Intel Corporation
+ *  Copyright © 2010 David Woodhouse <dwmw2@infradead.org>
+ */
+
+#ifndef _IDEAPAD_LAPTOP_H_
+#define _IDEAPAD_LAPTOP_H_
+
+#include <linux/acpi.h>
+#include <linux/jiffies.h>
+#include <linux/errno.h>
+
+enum {
+	VPCCMD_R_VPC1 = 0x10,
+	VPCCMD_R_BL_MAX,
+	VPCCMD_R_BL,
+	VPCCMD_W_BL,
+	VPCCMD_R_WIFI,
+	VPCCMD_W_WIFI,
+	VPCCMD_R_BT,
+	VPCCMD_W_BT,
+	VPCCMD_R_BL_POWER,
+	VPCCMD_R_NOVO,
+	VPCCMD_R_VPC2,
+	VPCCMD_R_TOUCHPAD,
+	VPCCMD_W_TOUCHPAD,
+	VPCCMD_R_CAMERA,
+	VPCCMD_W_CAMERA,
+	VPCCMD_R_3G,
+	VPCCMD_W_3G,
+	VPCCMD_R_ODD, /* 0x21 */
+	VPCCMD_W_FAN,
+	VPCCMD_R_RF,
+	VPCCMD_W_RF,
+	VPCCMD_R_FAN = 0x2B,
+	VPCCMD_R_SPECIAL_BUTTONS = 0x31,
+	VPCCMD_W_BL_POWER = 0x33,
+};
+
+static inline int eval_int_with_arg(acpi_handle handle, const char *name, unsigned long arg, unsigned long *res)
+{
+	struct acpi_object_list params;
+	unsigned long long result;
+	union acpi_object in_obj;
+	acpi_status status;
+
+	params.count = 1;
+	params.pointer = &in_obj;
+	in_obj.type = ACPI_TYPE_INTEGER;
+	in_obj.integer.value = arg;
+
+	status = acpi_evaluate_integer(handle, (char *)name, &params, &result);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	if (res)
+		*res = result;
+
+	return 0;
+}
+
+static inline int eval_vpcr(acpi_handle handle, unsigned long cmd, unsigned long *res)
+{
+	return eval_int_with_arg(handle, "VPCR", cmd, res);
+}
+
+static inline int eval_vpcw(acpi_handle handle, unsigned long cmd, unsigned long data)
+{
+	struct acpi_object_list params;
+	union acpi_object in_obj[2];
+	acpi_status status;
+
+	params.count = 2;
+	params.pointer = in_obj;
+	in_obj[0].type = ACPI_TYPE_INTEGER;
+	in_obj[0].integer.value = cmd;
+	in_obj[1].type = ACPI_TYPE_INTEGER;
+	in_obj[1].integer.value = data;
+
+	status = acpi_evaluate_object(handle, "VPCW", &params, NULL);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return 0;
+}
+
+#define IDEAPAD_EC_TIMEOUT 200 /* in ms */
+
+static inline int read_ec_data(acpi_handle handle, unsigned long cmd, unsigned long *data)
+{
+	unsigned long end_jiffies, val;
+	int err;
+
+	err = eval_vpcw(handle, 1, cmd);
+	if (err)
+		return err;
+
+	end_jiffies = jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1;
+
+	while (time_before(jiffies, end_jiffies)) {
+		schedule();
+
+		err = eval_vpcr(handle, 1, &val);
+		if (err)
+			return err;
+
+		if (val == 0)
+			return eval_vpcr(handle, 0, data);
+	}
+
+	acpi_handle_err(handle, "timeout in %s\n", __func__);
+
+	return -ETIMEDOUT;
+}
+
+static inline int write_ec_cmd(acpi_handle handle, unsigned long cmd, unsigned long data)
+{
+	unsigned long end_jiffies, val;
+	int err;
+
+	err = eval_vpcw(handle, 0, data);
+	if (err)
+		return err;
+
+	err = eval_vpcw(handle, 1, cmd);
+	if (err)
+		return err;
+
+	end_jiffies = jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1;
+
+	while (time_before(jiffies, end_jiffies)) {
+		schedule();
+
+		err = eval_vpcr(handle, 1, &val);
+		if (err)
+			return err;
+
+		if (val == 0)
+			return 0;
+	}
+
+	acpi_handle_err(handle, "timeout in %s\n", __func__);
+
+	return -ETIMEDOUT;
+}
+
+#undef IDEAPAD_EC_TIMEOUT
+#endif /* !_IDEAPAD_LAPTOP_H_ */
-- 
2.40.0

