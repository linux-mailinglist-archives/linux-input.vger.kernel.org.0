Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04E3C5F7D67
	for <lists+linux-input@lfdr.de>; Fri,  7 Oct 2022 20:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbiJGSag (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Oct 2022 14:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbiJGSa1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Oct 2022 14:30:27 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35FD31ADA2
        for <linux-input@vger.kernel.org>; Fri,  7 Oct 2022 11:30:24 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id b4so8502171wrs.1
        for <linux-input@vger.kernel.org>; Fri, 07 Oct 2022 11:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tSTs+DROsNy8R98PSP2dWqb8FD9s3mzgTmR5HllyQDg=;
        b=mUpRXT5aeGgLAB10eMTUWeBOe9kDtdvMf5MPZq/rziHD0WjX29W0dJoR7ucLfA6wBB
         DFL99JELWsVHv4Lrh/fyruGuM+1u9Eh+CMrKPydV6WQq6L+CsVLCwb8sLx1KoeAQURvG
         lGtPZSZ+mB8NolDZj59ZeQUBUObqsMta34sME1f1KAKXGkBquHAY3GRDJA02UfBAU5JL
         fv8cGn7LoZ9PX93Uy1wL+904gM9en43qA768qhMtdYdZbXdJWPc3Au44GAa4bJF34u0J
         IfgKsjHanNQD4kykkEz5ZtwbnTAV+W9m1Ai3+vTMg7rOcnsddidL6K4J1T9rNpBv/RzE
         U21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tSTs+DROsNy8R98PSP2dWqb8FD9s3mzgTmR5HllyQDg=;
        b=IzoYCUtRNJyTqhKyrxZL3DNOqD9T8APxUNWFgZFd9zN27/ivtvQq5p7vcVZKgLQ271
         ywydujj4oLapCs27izLdIEYOLo7xqwKtud571zl/NHFC4EJPE+nziiHMIsVlFytdSK5w
         aXYF47MxpYhgHJqLFNgS+fD1AoDHN/GzOmpgJc6/V0kiiIGQHIw8iCyOf0YsuSfkP4AR
         gainfZGzrGSIzcIwtLf4eWay/RN88/dtmbY2eRpbp5nzi4MHNwn/Ysw6PYrQViRQA6UI
         7V3Wrq6QIVTOAFH4e+++qSs1xKHFDEfHyHUoA0jUsuv4e4sg7a6F5Qfz8TBkl07OOwCS
         ggvQ==
X-Gm-Message-State: ACrzQf0xiaivP2Fz9VkPWkIXJVmLys8rQSGni+sFDVB/lbbfzUb0uMo/
        vyG9ozRlNtFwOznkS9fR/vTf/af56cNMsBND
X-Google-Smtp-Source: AMsMyM7ZIIicvCAtIHVfb5jfRJ8ZgSpRzgk2X617DvWBTvEp67UkXnechYeKGI74YoXe7FnKNtgGZQ==
X-Received: by 2002:a05:6000:981:b0:22e:6b59:fe52 with SMTP id by1-20020a056000098100b0022e6b59fe52mr3941797wrb.188.1665167423636;
        Fri, 07 Oct 2022 11:30:23 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (230.213.79.34.bc.googleusercontent.com. [34.79.213.230])
        by smtp.gmail.com with ESMTPSA id l10-20020a05600012ca00b002258235bda3sm2573627wrx.61.2022.10.07.11.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 11:30:23 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v4 16/17] HID: haptic: implement HID haptic reset callback
Date:   Fri,  7 Oct 2022 18:29:44 +0000
Message-Id: <20221007182945.1654046-17-acz@semihalf.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221007182945.1654046-1-acz@semihalf.com>
References: <20221007182945.1654046-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When a haptic device performs device initiated reset it puts itself back
into autonomous mode. This leads to incosistency in the actual device state
and the state configured by the kernel (manual mode). Hence user may
observe duplicated force feedback, initiated by the device itself
(due to its autonomous mode) and the host (by sending manual reports).

Configure the device and put it back into manual mode once reset is
noticed.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/hid/hid-haptic.c     | 21 +++++++++++++++++++++
 drivers/hid/hid-haptic.h     |  6 ++++++
 drivers/hid/hid-multitouch.c | 18 ++++++++++++++++++
 3 files changed, 45 insertions(+)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index 4b3ad5168fbb4..d00103be536c2 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -226,6 +226,26 @@ static void switch_mode(struct hid_device *hdev, struct hid_haptic_device *hapti
 	haptic->mode = mode;
 }
 
+static void haptic_reset_work_handler(struct work_struct *work)
+{
+
+	struct hid_haptic_device *haptic = container_of(work,
+							struct hid_haptic_device,
+							reset_work);
+	struct hid_device *hdev = haptic->hdev;
+
+	if (haptic->press_ordinal_cur && haptic->release_ordinal_cur)
+		switch_mode(hdev, haptic, HID_HAPTIC_MODE_KERNEL);
+}
+
+
+void hid_haptic_reset(struct hid_device *hdev, struct hid_haptic_device *haptic)
+{
+	if (haptic->wq)
+		queue_work(haptic->wq, &haptic->reset_work);
+}
+EXPORT_SYMBOL_GPL(hid_haptic_reset);
+
 #ifdef CONFIG_PM
 void hid_haptic_resume(struct hid_device *hdev, struct hid_haptic_device *haptic)
 {
@@ -521,6 +541,7 @@ int hid_haptic_init(struct hid_device *hdev,
 	haptic->hid_usage_map[HID_HAPTIC_ORDINAL_WAVEFORMSTOP] =
 		HID_HP_WAVEFORMSTOP & HID_USAGE;
 
+	INIT_WORK(&haptic->reset_work, haptic_reset_work_handler);
 	mutex_init(&haptic->auto_trigger_mutex);
 	for (r = 0; r < haptic->auto_trigger_report->maxfield; r++)
 		parse_auto_trigger_field(haptic, haptic->auto_trigger_report->field[r]);
diff --git a/drivers/hid/hid-haptic.h b/drivers/hid/hid-haptic.h
index 96757a4655ec7..86823c2de5dd4 100644
--- a/drivers/hid/hid-haptic.h
+++ b/drivers/hid/hid-haptic.h
@@ -65,6 +65,7 @@ struct hid_haptic_device {
 #define HID_HAPTIC_PRESS_EFFECT_ID 1
 	struct hid_haptic_effect *effect;
 	struct hid_haptic_effect stop_effect;
+	struct work_struct reset_work;
 	bool is_forcepad;
 };
 
@@ -82,6 +83,7 @@ int hid_haptic_input_mapping(struct hid_device *hdev,
 			     unsigned long **bit, int *max);
 bool hid_haptic_input_configured(struct hid_device *hdev,
 				 struct hid_haptic_device *haptic);
+void hid_haptic_reset(struct hid_device *hdev, struct hid_haptic_device *haptic);
 #ifdef CONFIG_PM
 void hid_haptic_resume(struct hid_device *hdev, struct hid_haptic_device *haptic);
 void hid_haptic_suspend(struct hid_device *hdev, struct hid_haptic_device *haptic);
@@ -120,6 +122,10 @@ bool hid_haptic_input_configured(struct hid_device *hdev,
 {
 	return 0;
 }
+static inline
+void hid_haptic_reset(struct hid_device *hdev, struct hid_haptic_device *haptic)
+{
+}
 #ifdef CONFIG_PM
 static inline
 void hid_haptic_resume(struct hid_device *hdev, struct hid_haptic_device *haptic) {}
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index c50425a4de62c..f492becbab374 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1888,6 +1888,23 @@ static int mt_resume(struct hid_device *hdev)
 }
 #endif
 
+static int mt_reset(struct hid_device *hdev)
+{
+	struct mt_device *td = hid_get_drvdata(hdev);
+	struct hid_haptic_device *haptic = td->haptic;
+
+	if (!(hdev->claimed & HID_CLAIMED_INPUT))
+		return -ENODEV;
+
+	mt_release_contacts(hdev);
+	mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
+
+	if (td->is_haptic_touchpad)
+		hid_haptic_reset(hdev, haptic);
+
+	return 0;
+}
+
 static void mt_remove(struct hid_device *hdev)
 {
 	struct mt_device *td = hid_get_drvdata(hdev);
@@ -2306,5 +2323,6 @@ static struct hid_driver mt_driver = {
 	.reset_resume = mt_reset_resume,
 	.resume = mt_resume,
 #endif
+	.reset = mt_reset,
 };
 module_hid_driver(mt_driver);
-- 
2.38.0.rc1.362.ged0d419d3c-goog

