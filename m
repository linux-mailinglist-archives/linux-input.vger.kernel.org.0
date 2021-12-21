Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0136447C758
	for <lists+linux-input@lfdr.de>; Tue, 21 Dec 2021 20:17:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241739AbhLUTRw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Dec 2021 14:17:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241742AbhLUTRw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Dec 2021 14:17:52 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B2F6C061574
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:52 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id b73so100682wmd.0
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xSCw5K4AnkP2An+YATsjN2i5JFyLHn8xlnkNkxCanGA=;
        b=J7fGzlAeoSFT67ygCKFecvdBTuM+JU5wD00x2R7n9owvMbhLo5HexyruYcIbBvjUUj
         ybZvyGQvTN1rLOT3OMABeqMYJVY2L/K5h2fYt+mRUA+NaPf1I/vhnj9LwxmNQ3RGbMd+
         scXlIeHV7TSsHI/aQ+JH/EMYCdW8u3wQUqPQVIR0V3FS1k7EYU87IE4GJ8z34b30KhHm
         3EKA+jljIO/geEwtFbyy1I6DfaXRZD0MsrljmlGz/b3SdOtprs02Vfa1SgSbHa3Ybqid
         sS86JAfeYgzdkYTH2YHgBmUIB8Op4ubP7vL7Ier6RsAL/6vVgduE5Pkfyj0PLo/xOZUk
         LZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xSCw5K4AnkP2An+YATsjN2i5JFyLHn8xlnkNkxCanGA=;
        b=0DNAs568p7MKHUX9X7pQXsfiGE3Z2AxPcm38PueuXB9a5KZQIDPaMoB6ldViXTr3AA
         tHBOdWrDOky9d2soXGrFmBx4yaCsL6c2ockfGXemrhAS6yICtoidSFNvCvIes+TJK5HD
         ddydZmuYgJU1zZ65m10KJOLNqD0rAhFnKfPyvWmfF+bPFwAsm3zTIWNFJi3M5dkLi8pC
         Om3VDCRs5pridm/G7GCP+GbtMWxyQXCzNRw+U4dqoOKbna/Zgdt/hJdCmJaoNvognLjk
         bQp/t6CqCr4flida61ymWilDha088Ad5JXBkuE8aU7OOVc87tCMPmpmUyw1IIX5L1D5M
         FIjw==
X-Gm-Message-State: AOAM5328FAVNizPF1Km9nk4SmlKIp3YEZqmk94EiDz0TNM7QaxpHhKpj
        mQ0kwRPZi2/gNPDwLz8Exmynse4gspDcNHRmB/M=
X-Google-Smtp-Source: ABdhPJxpdp9dZhqS7QyPYkgwk9nJEvyQEQhuEEjSLMm6jcREYBBvR+Nb1h/oo2ualxCZjOAFZKOMcg==
X-Received: by 2002:a05:600c:4e8d:: with SMTP id f13mr3939161wmq.7.1640114270817;
        Tue, 21 Dec 2021 11:17:50 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id t8sm3994846wmq.32.2021.12.21.11.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 11:17:50 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH 06/18] HID: haptic: add functions for mapping and configuration
Date:   Tue, 21 Dec 2021 19:17:31 +0000
Message-Id: <20211221191743.1893185-7-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
In-Reply-To: <20211221191743.1893185-1-acz@semihalf.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add functions that recognize auto trigger and manual trigger reports
as well as save their addresses.
Verify that the pressure unit is either grams or newtons.
Mark the input device as a haptic touchpad if the unit is correct and
the reports are found.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/hid/hid-haptic.c | 63 ++++++++++++++++++++++++++++++++++++++++
 drivers/hid/hid-haptic.h | 46 +++++++++++++++++++++++++++++
 2 files changed, 109 insertions(+)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index 0910d8af9f38..f130ec96a240 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -7,4 +7,67 @@
 
 /*
  */
+
 #include "hid-haptic.h"
+
+void hid_haptic_feature_mapping(struct hid_device *hdev,
+				struct hid_haptic_device *haptic,
+				struct hid_field *field, struct hid_usage *usage)
+{
+	if (usage->hid == HID_HP_AUTOTRIGGER) {
+		if (usage->usage_index >= field->report_count) {
+			dev_err(&hdev->dev,
+				"HID_HP_AUTOTRIGGER out of range\n");
+			return;
+		}
+
+		hid_get_feature(hdev, field->report);
+		haptic->default_auto_trigger =
+			field->value[usage->usage_index];
+		haptic->auto_trigger_report = field->report;
+	}
+}
+EXPORT_SYMBOL_GPL(hid_haptic_feature_mapping);
+
+bool hid_haptic_check_pressure_unit(struct hid_haptic_device *haptic,
+				    struct hid_input *hi, struct hid_field *field)
+{
+	/* Accepted units are either grams or newtons. */
+	if (field->unit == 0x0101 || field->unit == 0xe111)
+		return true;
+	return false;
+}
+EXPORT_SYMBOL_GPL(hid_haptic_check_pressure_unit);
+
+int hid_haptic_input_mapping(struct hid_device *hdev,
+			     struct hid_haptic_device *haptic,
+			     struct hid_input *hi,
+			     struct hid_field *field, struct hid_usage *usage,
+			     unsigned long **bit, int *max)
+{
+	if (usage->hid == HID_HP_MANUALTRIGGER) {
+		haptic->manual_trigger_report = field->report;
+		/* we don't really want to map these fields */
+		return -1;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(hid_haptic_input_mapping);
+
+int hid_haptic_input_configured(struct hid_device *hdev,
+				struct hid_haptic_device *haptic,
+				struct hid_input *hi)
+{
+
+	if (hi->application == HID_DG_TOUCHPAD) {
+		if (haptic->auto_trigger_report &&
+		    haptic->manual_trigger_report) {
+			__set_bit(INPUT_PROP_HAPTIC_TOUCHPAD, hi->input->propbit);
+			return 1;
+		}
+		return 0;
+	}
+	return -1;
+}
+EXPORT_SYMBOL_GPL(hid_haptic_input_configured);
diff --git a/drivers/hid/hid-haptic.h b/drivers/hid/hid-haptic.h
index 41f19cd22f75..4645d6cfd55a 100644
--- a/drivers/hid/hid-haptic.h
+++ b/drivers/hid/hid-haptic.h
@@ -66,3 +66,49 @@ struct hid_haptic_device {
 	struct hid_haptic_effect *effect;
 	struct hid_haptic_effect stop_effect;
 };
+
+#ifdef CONFIG_MULTITOUCH_HAPTIC
+void hid_haptic_feature_mapping(struct hid_device *hdev,
+				struct hid_haptic_device *haptic,
+				struct hid_field *field, struct hid_usage
+				*usage);
+bool hid_haptic_check_pressure_unit(struct hid_haptic_device *haptic,
+				    struct hid_input *hi, struct hid_field *field);
+int hid_haptic_input_mapping(struct hid_device *hdev,
+			     struct hid_haptic_device *haptic,
+			     struct hid_input *hi,
+			     struct hid_field *field, struct hid_usage *usage,
+			     unsigned long **bit, int *max);
+int hid_haptic_input_configured(struct hid_device *hdev,
+				struct hid_haptic_device *haptic,
+				struct hid_input *hi);
+#else
+static inline
+void hid_haptic_feature_mapping(struct hid_device *hdev,
+				struct hid_haptic_device *haptic,
+				struct hid_field *field, struct hid_usage
+				*usage)
+{}
+static inline
+bool hid_haptic_check_pressure_unit(struct hid_haptic_device *haptic,
+				    struct hid_input *hi, struct hid_field *field)
+{
+	return false;
+}
+static inline
+int hid_haptic_input_mapping(struct hid_device *hdev,
+			     struct hid_haptic_device *haptic,
+			     struct hid_input *hi,
+			     struct hid_field *field, struct hid_usage *usage,
+			     unsigned long **bit, int *max)
+{
+	return 0;
+}
+static inline
+int hid_haptic_input_configured(struct hid_device *hdev,
+				struct hid_haptic_device *haptic,
+				struct hid_input *hi)
+{
+	return 0;
+}
+#endif
-- 
2.34.1.307.g9b7440fafd-goog

