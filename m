Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFFFD35C52F
	for <lists+linux-input@lfdr.de>; Mon, 12 Apr 2021 13:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240440AbhDLLbP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Apr 2021 07:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240442AbhDLLbN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Apr 2021 07:31:13 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4224EC06138E
        for <linux-input@vger.kernel.org>; Mon, 12 Apr 2021 04:30:56 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id y32so9110677pga.11
        for <linux-input@vger.kernel.org>; Mon, 12 Apr 2021 04:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L/J0PuGsoQ9jKaU7QDPzGYAqcrZkxGOtbfN36+E+p8I=;
        b=jxUM1Vlcs9HJZ+XkiurdTz3RLTTchqy8JW4keBeGimx/NgdkjzIga2gTMja8jtvpFl
         IOKgDwG9Y+ek4G6T7/+j8mL7dekkWw2fjK6HFnrzMnznTrQM0TDK6YVlOA1Q179cYHCU
         t7JDL2nkctQpW0yNdQ200MfR/ugZQmOgXdMkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L/J0PuGsoQ9jKaU7QDPzGYAqcrZkxGOtbfN36+E+p8I=;
        b=n3K6KPpf0nhPXQu77E/+tYgb55GQi2lSjLG0bivE5eBZ2oQ6dWPCvhIbaeKVJ4hnVi
         LbumW6Tby0wljjUCeOD7uYe6Rkzx3gWsCe3Hwu4kmmAzqdOIxbjyzWdZPl2HYcqeKSUh
         CU57qwVYwHrprUvWFu0dDBQ2tUZV77/2KHEqWOKg12UBF3+Mcx5nIqzUYbgVv5jj9VKN
         uajQ7IimQM6pyJ6F2ccdkHSmvhsYmT4d3t08UTiHqwe22AcC6gwFtXvU6xge7K0K/jEe
         aWOk/rzqpUMu4ZvO8Q5fNbb12ZBwl1SAl2puMEJF6vCevIh+AZ5BYVPg5NJhpYLHeMjj
         yl9w==
X-Gm-Message-State: AOAM532Zo3ebyYNLDb0QIRWVdQBpOx9odhV5LfqzxYiw3NhrdjGENYb2
        VvmgzsURzQ+pLMlPzIqT1BTAyQ5gspVAAQ==
X-Google-Smtp-Source: ABdhPJxQcccsa6WuSwNP51GClJBEn2bgeJsPTj66sKqeSR86avKgeV0NuXCxoRd16rao6y8rnjK0jw==
X-Received: by 2002:a62:754c:0:b029:242:22d1:58af with SMTP id q73-20020a62754c0000b029024222d158afmr23588812pfc.11.1618227055652;
        Mon, 12 Apr 2021 04:30:55 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:b:32f1:1e05:984e:e039])
        by smtp.gmail.com with ESMTPSA id 129sm1572413pfv.159.2021.04.12.04.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 04:30:55 -0700 (PDT)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Dmitry Torokhov <dtor@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Ikjoon Jang <ikjn@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] HID: google: Add of_match table to Whiskers switch device.
Date:   Mon, 12 Apr 2021 19:30:20 +0800
Message-Id: <20210412113020.2724134-3-ikjn@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210412113020.2724134-1-ikjn@chromium.org>
References: <20210412113020.2724134-1-ikjn@chromium.org>
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

