Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7024B36007B
	for <lists+linux-input@lfdr.de>; Thu, 15 Apr 2021 05:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbhDODaf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Apr 2021 23:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbhDODae (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Apr 2021 23:30:34 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E2FC06138C
        for <linux-input@vger.kernel.org>; Wed, 14 Apr 2021 20:30:10 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id em21-20020a17090b0155b029014e204a81e6so4012581pjb.1
        for <linux-input@vger.kernel.org>; Wed, 14 Apr 2021 20:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L/J0PuGsoQ9jKaU7QDPzGYAqcrZkxGOtbfN36+E+p8I=;
        b=LGHLZBSOwzpZ9O510rIL4ZM32mfTVVIY11xJJeGRe404aX0hfcWxjokJKytl+/wxiO
         bSuhMJNi1caURHh9x8TSTzB4INo7Yy5crEqzvacuN3sQjzQppEtluAKaHfRmW8467vuk
         KomjIjGzFdAYynHossjAeKnE+UL6wviA9+iHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L/J0PuGsoQ9jKaU7QDPzGYAqcrZkxGOtbfN36+E+p8I=;
        b=I1sbsrmRavkuskuLsbOzbakPJ2I//xhDnteF+hDmsEFdVzUd+4WnyRZMFXJzQ4LTtA
         ukiYG29GPV6WnD/e6aEYpBK4KU/Qtn6HFEbeiYuU4AzbCA29cQqSPqvvdaJaqRRtwey+
         04zgh/6BcMEI1C2L7SXnrp22MyV6zRvOiI8nahEglRZ5Zup/8loRBm6mDZq2O+1Hi60B
         6koWMxz9tDfI9whir8HIB4c6+2VeYSFx8ZgQv9s5rwxjQ7hh6kMKGBGwHLT4lMb+0PRD
         BKMUoHzBczh59az0unyKXv1I8IYB44tXhXp8KoAKFkpTbmafY79N9KI2pp5zzB1Ymts/
         xkhA==
X-Gm-Message-State: AOAM532VCrBPXuHQE8WG1DSNmrdZ/VfCRYUiAcUQ6+dQ7lfDRcYeOGQ9
        dsQTSDtRLfvstzp3P8dty4Ftu2FHsPzwzQ==
X-Google-Smtp-Source: ABdhPJwoj7f2JqKoECZlBfOxjMxLfaPaqA7yxldayc265YPN0gbhK0JJj702ZI/Wz77wEj5Y8ROZWA==
X-Received: by 2002:a17:90a:e298:: with SMTP id d24mr1455055pjz.37.1618457410343;
        Wed, 14 Apr 2021 20:30:10 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:b:2d50:863d:8932:d6bc])
        by smtp.gmail.com with ESMTPSA id n3sm351622pga.92.2021.04.14.20.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 20:30:09 -0700 (PDT)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dmitry Torokhov <dtor@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Ikjoon Jang <ikjn@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] HID: google: Add of_match table to Whiskers switch device.
Date:   Thu, 15 Apr 2021 11:29:58 +0800
Message-Id: <20210415032958.740233-3-ikjn@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210415032958.740233-1-ikjn@chromium.org>
References: <20210415032958.740233-1-ikjn@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a device tree match table for "cros-cbas" switch device.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Jiri Kosina <jkosina@suse.cz>

---

(no changes since v1)

Please note that v3 was submitted in 28 Oct 2019, 1.5yrs ago.
Link(v2): https://patchwork.kernel.org/project/linux-input/patch/20191021030158.32464-1-ikjn@chromium.org/

---
 drivers/hid/hid-google-hammer.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
index d9319622da44..be4f9f3dbbba 100644
--- a/drivers/hid/hid-google-hammer.c
+++ b/drivers/hid/hid-google-hammer.c
@@ -17,6 +17,7 @@
 #include <linux/hid.h>
 #include <linux/leds.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
 #include <linux/platform_device.h>
@@ -272,12 +273,21 @@ static const struct acpi_device_id cbas_ec_acpi_ids[] = {
 };
 MODULE_DEVICE_TABLE(acpi, cbas_ec_acpi_ids);
 
+#ifdef CONFIG_OF
+static const struct of_device_id cbas_ec_of_match[] = {
+	{ .compatible = "google,cros-cbas" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, cbas_ec_of_match);
+#endif
+
 static struct platform_driver cbas_ec_driver = {
 	.probe = cbas_ec_probe,
 	.remove = cbas_ec_remove,
 	.driver = {
 		.name = "cbas_ec",
 		.acpi_match_table = ACPI_PTR(cbas_ec_acpi_ids),
+		.of_match_table = of_match_ptr(cbas_ec_of_match),
 		.pm = &cbas_ec_pm_ops,
 	},
 };
-- 
2.31.1.295.g9ea45b61b8-goog

