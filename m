Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6A7CDE279
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2019 05:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbfJUDCn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Oct 2019 23:02:43 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37391 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbfJUDCn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Oct 2019 23:02:43 -0400
Received: by mail-pf1-f195.google.com with SMTP id y5so7460601pfo.4
        for <linux-input@vger.kernel.org>; Sun, 20 Oct 2019 20:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X1eK+NEyVQBtfNuPFEp6l0dI2uta1Eahnc/cFfsNqiQ=;
        b=WK0tvccTx2DeB4CUYuCDL66HxZtd1Sap9zxjlQofSF2tieZmraP/KeQEMGtHktBXRR
         5O/pZZ16xe/JWOrMaXp1NByBxB6E5GBsE3x+CfAYMnm38ctfxZtYERtkBTx33Vdx8pBY
         is+0ex+/W4jVdXtvcRZk4L6CbY9mE0VDQcqI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X1eK+NEyVQBtfNuPFEp6l0dI2uta1Eahnc/cFfsNqiQ=;
        b=GHzxr+1yg0A1eycBzit+/S7y9Jomv8aKQ9apYJiVekzHrFSjVJPxGQeDqeLoAfWZqR
         OFgxqSEFaDBN7dqZDAQsYQA23XN8aqOPtyPqzER1wOJtaFzs5tnlcnDhWWVuOnJkV+Qq
         hz3Rv2uMdzPUMfrCALdVRlCTVPH9sPZlUHbeP5+fGBdOxdlO/PF4w7b3TEs9UR+iTUkb
         mk/B2pg4g8eGgOOULT2DPkdvF6qm2h3YcciHkcbB2H1xx0lpybjnlCDg1zlhm0G9ZIsg
         UWDj8KwLH0tkkpRYof225IFy6koAiNxhotorIXMI5+WYYvdBYDbYM3OwG6WKBWH4cjqm
         4asw==
X-Gm-Message-State: APjAAAXajOQrJMkaBWGQnwkZp7oxoHgKuvvLDZS7PvMevkqzQps1Opk8
        OY6T51boZnPmgzbTx4c6qF6vvDkeOm4=
X-Google-Smtp-Source: APXvYqxUUoJOAyB2wgSrG9oFIZmiN1g2Uwzzl0ruzJP8tMcRwMsU7LTXKoT32oc7VUPe6nlgSwX5KA==
X-Received: by 2002:a17:90a:8002:: with SMTP id b2mr149420pjn.39.1571626961198;
        Sun, 20 Oct 2019 20:02:41 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:10:254e:2b40:ef8:ee17])
        by smtp.gmail.com with ESMTPSA id x65sm14250600pgb.75.2019.10.20.20.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 20:02:39 -0700 (PDT)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org,
        Nicolas Boitchat <drinkcat@chromium.org>,
        Ikjoon Jang <ikjn@chromium.org>
Subject: [PATCH v2 2/2] HID: google: Add of_match table to Whiskers switch device.
Date:   Mon, 21 Oct 2019 11:02:33 +0800
Message-Id: <20191021030233.32592-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a device tree match table.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---
 drivers/hid/hid-google-hammer.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
index 84f8c127ebdc..b726f8a15044 100644
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
@@ -264,12 +265,21 @@ static const struct acpi_device_id cbas_ec_acpi_ids[] = {
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
2.23.0.866.gb869b98d4c-goog

