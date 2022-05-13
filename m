Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B247525F58
	for <lists+linux-input@lfdr.de>; Fri, 13 May 2022 12:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379119AbiEMJkE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 May 2022 05:40:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379122AbiEMJjy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 May 2022 05:39:54 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBA7E291CDE
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:53 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id v12so10620690wrv.10
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sYXD96b2plf8NyekUlKZlUyJ7fPvj/lz8no+CsIMAkU=;
        b=KnlKzq2K9WdhkuhyfLU3VGfvHRS8SkgXoWViG7EQ+rtW3QfnQQ92NzNGU2NITBrZIz
         h7UfgrPr4DQ/IPTzpKvE5id6eWXbCbi5MlVKylj5BohtVyo+pC3yA1Lg6MFn3Wqw12CF
         /5H/JlXyQe0o3U6iPARsx5bBEYB95fIrTcMcf+p0hVinH89KC+rl9pkNve6W/CVkw4tk
         bIjpVN2VFcL8CFOTh8oMTSqiKSoLEnOvffYt8Kimc3kBXuYY2+w+JLdBVlRhpxH6X5e1
         9RbmW2oqU1ys2AHRtKfK5NBibD5aMd0tIY8daDX/3mLHyeI2ciaTynMiCFhZLxqM/cAX
         eBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sYXD96b2plf8NyekUlKZlUyJ7fPvj/lz8no+CsIMAkU=;
        b=YLAxsGRFuIntCVcAKCzrCW90lwhRIBW/To8AuObUCVTxFfoB23VmiakzDUle9vkO12
         9o29Of4/3fr3o3Hwib9gYNl2qOSKzbRyRfzsi+vt97seAoaRvArmnzfZY3SNR0H6RVQp
         etnHf3C/P+jA708t5oeLUm+2OIwtsYMu0aOKockQ4kKwXZAoGjaUFr4WwBA873weXM5p
         l9DSMZ8//p0/dMriInf/rU+E8gDwh5GKnliRj2zxvOYa6OdSuVoZ5zAp+S/L1Vd5fzjm
         5PvNsmMbhgD/zY5/vATKQPZmY7c1baCKPe11SM3tfhc+gxSeEMnAO85e7Ljxx1auNKRD
         Zggw==
X-Gm-Message-State: AOAM533VDuGUadyZslFYU6VbRxd8oLIsEHPBe8U22YuJLJ1AIZ3ddo+c
        yU3ucPal1YiwAGTqXfPS7rYvA0ukrbVhTU0Mig0=
X-Google-Smtp-Source: ABdhPJzPlH2nTQObcPMPxoVIPoDkCXJelJI7Qup2k4wFM29WlwHbWIdbLZcm6pA1RfZ/VQVtcCVaKw==
X-Received: by 2002:a05:6000:c:b0:20a:df2e:2c38 with SMTP id h12-20020a056000000c00b0020adf2e2c38mr3058716wrx.481.1652434793428;
        Fri, 13 May 2022 02:39:53 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id l5-20020adfa385000000b0020ce015ed48sm1631404wrb.103.2022.05.13.02.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 02:39:53 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v3 16/17] HID: haptic: implement HID haptic reset callback
Date:   Fri, 13 May 2022 09:39:26 +0000
Message-Id: <20220513093927.1632262-17-acz@semihalf.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
In-Reply-To: <20220513093927.1632262-1-acz@semihalf.com>
References: <20220513093927.1632262-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/hid/hid-haptic.c     |  7 +++++++
 drivers/hid/hid-haptic.h     |  5 +++++
 drivers/hid/hid-multitouch.c | 15 +++++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index 4b3ad5168fbb..a8d89a9235e7 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -226,6 +226,13 @@ static void switch_mode(struct hid_device *hdev, struct hid_haptic_device *hapti
 	haptic->mode = mode;
 }
 
+void hid_haptic_reset(struct hid_device *hdev, struct hid_haptic_device *haptic)
+{
+	if (haptic->press_ordinal_cur && haptic->release_ordinal_cur)
+		switch_mode(hdev, haptic, HID_HAPTIC_MODE_KERNEL);
+}
+EXPORT_SYMBOL_GPL(hid_haptic_reset);
+
 #ifdef CONFIG_PM
 void hid_haptic_resume(struct hid_device *hdev, struct hid_haptic_device *haptic)
 {
diff --git a/drivers/hid/hid-haptic.h b/drivers/hid/hid-haptic.h
index 96757a4655ec..03e657094dae 100644
--- a/drivers/hid/hid-haptic.h
+++ b/drivers/hid/hid-haptic.h
@@ -82,6 +82,7 @@ int hid_haptic_input_mapping(struct hid_device *hdev,
 			     unsigned long **bit, int *max);
 bool hid_haptic_input_configured(struct hid_device *hdev,
 				 struct hid_haptic_device *haptic);
+void hid_haptic_reset(struct hid_device *hdev, struct hid_haptic_device *haptic);
 #ifdef CONFIG_PM
 void hid_haptic_resume(struct hid_device *hdev, struct hid_haptic_device *haptic);
 void hid_haptic_suspend(struct hid_device *hdev, struct hid_haptic_device *haptic);
@@ -120,6 +121,10 @@ bool hid_haptic_input_configured(struct hid_device *hdev,
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
index 7546c98de503..2d1b8c400c2f 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1877,6 +1877,20 @@ static int mt_resume(struct hid_device *hdev)
 }
 #endif
 
+static int mt_reset(struct hid_device *hdev)
+{
+	struct mt_device *td = hid_get_drvdata(hdev);
+	struct hid_haptic_device *haptic = td->haptic;
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
@@ -2284,6 +2298,7 @@ static struct hid_driver mt_driver = {
 #ifdef CONFIG_PM
 	.suspend = mt_suspend,
 	.reset_resume = mt_reset_resume,
+	.reset = mt_reset,
 	.resume = mt_resume,
 #endif
 };
-- 
2.36.0.550.gb090851708-goog

