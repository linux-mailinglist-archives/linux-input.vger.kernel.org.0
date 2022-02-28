Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8704C6424
	for <lists+linux-input@lfdr.de>; Mon, 28 Feb 2022 08:55:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233752AbiB1Hzg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Feb 2022 02:55:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233751AbiB1Hzf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Feb 2022 02:55:35 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8500768FB2
        for <linux-input@vger.kernel.org>; Sun, 27 Feb 2022 23:54:57 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id g1so10389875pfv.1
        for <linux-input@vger.kernel.org>; Sun, 27 Feb 2022 23:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=afmbhtxJXuu2P8Qqschaw9Jggn6kd8iv6fg4aLXPxdU=;
        b=m1YIGzof/6U/6x9Z4Bajw8GzlU4QFrtqCCC7wey5c0y83GyHwL8wCFXYIyJBpEgDkh
         SwyVaTMnXEpiwHGfi/mqB6R30C1Vu8FZVrUNpF7z586vDA0Ey0RI5KJDBrBIQte15i78
         8GNYaphpemIjateTFynV72ahtDrnUaJKqZ2Sha629jm/LX7VCirGeqcr23Bqq1wMoeFk
         3IoMgZclSpJDrV9F5/Z6MwSdijcZL3NQ4f41ksW1IJikMV4fpWYvww7rR3kPszNL0CK0
         nP8CabiK5GIae26PnwPmFkyLteyEb59grpEvgFhBAu7xYEE/QEoy51fe0u1o0r9emu5F
         UYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=afmbhtxJXuu2P8Qqschaw9Jggn6kd8iv6fg4aLXPxdU=;
        b=nfzIIsmE/T/RrsS0RoKdpoBRhg5BnTbYkG+Fr/bjHMqXA+Eh3aQ/qPKC2Xu65/LTqI
         Jn0hRErPenMhg8vwjKbsL9uzD874MNRq7FSOr5Y5t9rNAisey186cDSVql8ka1Sg4AOl
         Yl8sH+RhuCBbys1QAIjzbDGoxk8G3kG0Iw8EoD1/nzYhnNSBrMkBiMp4rX9Pxq1Gakj4
         1JKw1o6MoXEIFm3HHwxkdBKIQjBMmr35A7UQDn0z5Fzr733XDR/qNixrdxJlOnMlx/KT
         ILBa3+Ecu5wSsEQRjxExrGE8m/SHZm8cSkdjLlS3CW+zdIaTWqnqs903Z1jTfKLVjRp6
         O/rg==
X-Gm-Message-State: AOAM531rcCwW7piT5PyRpfuzbl2MEXzTEncMCy1AZNe3QCHwrLD+j+yL
        J4zWXByosm2YLEJkkQdM1sH+is0+8bo=
X-Google-Smtp-Source: ABdhPJyZZKyr1JkI/yjvJrg1f/D1kk193Y+GAZ/cSlzy6BuAZkmIUxUrPlQscQ/VEf5yktmXdjgDiQ==
X-Received: by 2002:a05:6a00:8cc:b0:4cb:b981:2676 with SMTP id s12-20020a056a0008cc00b004cbb9812676mr20270192pfu.5.1646034896529;
        Sun, 27 Feb 2022 23:54:56 -0800 (PST)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:43a2:93b6:ebd7:94fd])
        by smtp.gmail.com with ESMTPSA id d13-20020a17090ac24d00b001bcd7c2b2c3sm10718517pjx.16.2022.02.27.23.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 23:54:55 -0800 (PST)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Stephen Boyd <swboyd@chromium.org>, benjamin.tissoires@redhat.com,
        Jiri Kosina <jikos@kernel.org>,
        Sean O'Brien <seobrien@chromium.org>,
        "Douglas Anderson linux-kernel @ vger . kernel . org" 
        <dianders@chromium.org>
Subject: [PATCH v5 4/5] HID: google: Add support for vivaldi to hid-hammer
Date:   Sun, 27 Feb 2022 23:54:45 -0800
Message-Id: <20220228075446.466016-5-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.35.1.574.g5d30c73bfb-goog
In-Reply-To: <20220228075446.466016-1-dmitry.torokhov@gmail.com>
References: <20220228075446.466016-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Stephen Boyd <swboyd@chromium.org>

Add support to the hammer driver to parse vivaldi keyboard layouts and
expose them to userspace. This allows hammer devices to use vivaldi
function row keys while also supporting the other features this driver
supports, like the CBAS (chrome base attached switch) and a keyboard
backlight.

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Link: https://lore.kernel.org/r/20220216195901.1326924-4-swboyd@chromium.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/Kconfig             |  2 ++
 drivers/hid/hid-google-hammer.c | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index f5245c5fe1af..4bea966e617b 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -412,6 +412,8 @@ config HID_VIVALDI_COMMON
 
 config HID_GOOGLE_HAMMER
 	tristate "Google Hammer Keyboard"
+	select HID_VIVALDI_COMMON
+	select INPUT_VIVALDIFMAP
 	depends on USB_HID && LEDS_CLASS && CROS_EC
 	help
 	Say Y here if you have a Google Hammer device.
diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
index e7da4e74b4bf..5d774c9c596c 100644
--- a/drivers/hid/hid-google-hammer.c
+++ b/drivers/hid/hid-google-hammer.c
@@ -15,6 +15,7 @@
 
 #include <linux/acpi.h>
 #include <linux/hid.h>
+#include <linux/input/vivaldi-fmap.h>
 #include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -25,6 +26,7 @@
 #include <asm/unaligned.h>
 
 #include "hid-ids.h"
+#include "hid-vivaldi-common.h"
 
 /*
  * C(hrome)B(ase)A(ttached)S(witch) - switch exported by Chrome EC and reporting
@@ -501,8 +503,15 @@ static void hammer_stop(void *hdev)
 static int hammer_probe(struct hid_device *hdev,
 			const struct hid_device_id *id)
 {
+	struct vivaldi_data *vdata;
 	int error;
 
+	vdata = devm_kzalloc(&hdev->dev, sizeof(*vdata), GFP_KERNEL);
+	if (!vdata)
+		return -ENOMEM;
+
+	hid_set_drvdata(hdev, vdata);
+
 	error = hid_parse(hdev);
 	if (error)
 		return error;
@@ -598,6 +607,8 @@ static struct hid_driver hammer_driver = {
 	.id_table = hammer_devices,
 	.probe = hammer_probe,
 	.remove = hammer_remove,
+	.feature_mapping = vivaldi_feature_mapping,
+	.input_configured = vivaldi_input_configured,
 	.input_mapping = hammer_input_mapping,
 	.event = hammer_event,
 };
-- 
2.35.1.574.g5d30c73bfb-goog

