Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 782D547C75C
	for <lists+linux-input@lfdr.de>; Tue, 21 Dec 2021 20:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241750AbhLUTRy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Dec 2021 14:17:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241748AbhLUTRy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Dec 2021 14:17:54 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D7BC061574
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:54 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id g132so77489wmg.2
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LR8/5fV9qusZx/QgD/+UbqkCnKskxPPI5tV0mku1W8U=;
        b=XcTc3ZHKrx1l48StSfvrGfu8RdKkH65zG0Hv6EaYBF5d4n8hWLCGCVcqPKJcmmtueI
         BMDDZ0aPMv3sTuCMg+LBQL5D8JTz01anT/AOZgN9syC1y4MXFm9LTQDqraJMjbZnPzc0
         8pq3G2zjBwUqyF2pmqcU95a6xhqd7e47ai50S14PATQXtq003Qjq4INBe8ZfRIwSlHr4
         uwb0xgkZuLGot5UK0OJEULGFJFXNRZI9pNSWiMGdDGOj8eY4633L5QbFICeV7y2LvV2v
         w0UnLKSz3Jg+hUq127KkCnRmyp8/Y6zXjwRZL1HfGwelfOCZCigenPkNbbgEJMFmoGZP
         8c1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LR8/5fV9qusZx/QgD/+UbqkCnKskxPPI5tV0mku1W8U=;
        b=cYm5DAHQEoV5W1bn0wBKEUsz6JHQ68mCbwPyK79cG6CJYjSHPFsUZxiY2B+ninNktX
         PUTiXxxCuVbtep8ewSGVFQwS6zGaFrcsV6h/ZgK8aQc1RqInVezHe2vJ5Xw6zgqkNSdA
         j+YDCIBlaiDDtRC3A4JDd2uI6bcaZyum6jsQaEc9++pn1vu9qj4SnpMcDiUYr4d4XyKh
         7imam3SMkPKgd75kn6Q9SkJsvQRmO1GcyxorEhBAzwWMnp3X/ikvGlq0xWkEa7/m7gzI
         i3+zAxvFr4aI17FNx09SVvFDrERQHtUzVte2wei8aTIwSg0vERL+8wMKCme/TfG0Wu74
         g77g==
X-Gm-Message-State: AOAM530vSBM7//kOOWHYGr1JCZdWky6Bomg/CSFvUlQmdfrvgLddpR+B
        7X7IANvNyto0gJOn/Fixbbxl5aUXcTAnFLPw0f8=
X-Google-Smtp-Source: ABdhPJy4MMSHr6NH/2oKfdCaPgENUlB8S3OWaxVGPsFLUb8KAYXSZMFf4HbNQfogLL6wzhKknQiayQ==
X-Received: by 2002:a05:600c:4e91:: with SMTP id f17mr3983501wmq.195.1640114272770;
        Tue, 21 Dec 2021 11:17:52 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id t8sm3994846wmq.32.2021.12.21.11.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 11:17:52 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH 10/18] HID: haptic: implement release and press effects
Date:   Tue, 21 Dec 2021 19:17:35 +0000
Message-Id: <20211221191743.1893185-11-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
In-Reply-To: <20211221191743.1893185-1-acz@semihalf.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Upload shared haptic affects for release and press waveforms if a device
exposes them.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/hid/hid-haptic.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index b66bde7475e4..ad458bc7d4c5 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -367,6 +367,7 @@ int hid_haptic_init(struct hid_device *hdev,
 	char *name;
 	int (*flush)(struct input_dev *dev, struct file *file);
 	int (*event)(struct input_dev *dev, unsigned int type, unsigned int code, int value);
+	struct ff_effect release_effect, press_effect;
 
 	haptic->hdev = hdev;
 	haptic->max_waveform_id = max(2u, haptic->max_waveform_id);
@@ -483,8 +484,41 @@ int hid_haptic_init(struct hid_device *hdev,
 		module_put(THIS_MODULE);
 		goto input_free;
 	}
+
+	effect_set_default(&release_effect);
+	if (haptic->release_ordinal_orig)
+		release_effect.u.hid.hid_usage = HID_HP_WAVEFORMRELEASE &
+			HID_USAGE;
+	ret = input_ff_upload(dev, &release_effect, (struct file *)UINTPTR_MAX);
+	if (ret || release_effect.id != HID_HAPTIC_RELEASE_EFFECT_ID) {
+		if (!ret) {
+			ret = -EBUSY;
+			input_ff_erase(dev, release_effect.id,
+				       (struct file *)UINTPTR_MAX);
+		}
+		dev_err(&hdev->dev,
+			"Failed to allocate id 0 for release effect.\n");
+		goto input_free;
+	}
+	effect_set_default(&press_effect);
+	if (haptic->press_ordinal_orig)
+		press_effect.u.hid.hid_usage = HID_HP_WAVEFORMPRESS & HID_USAGE;
+	ret = input_ff_upload(dev, &press_effect, (struct file *)UINTPTR_MAX);
+	if (ret || press_effect.id != HID_HAPTIC_PRESS_EFFECT_ID) {
+		if (!ret) {
+			ret = -EBUSY;
+			input_ff_erase(dev, press_effect.id,
+				       (struct file *)UINTPTR_MAX);
+		}
+		dev_err(&hdev->dev,
+			"Failed to allocate id 1 for press effect.\n");
+		goto release_free;
+	}
+
 	return 0;
 
+release_free:
+	input_ff_erase(dev, release_effect.id, (struct file *)UINTPTR_MAX);
 input_free:
 	input_ff_destroy(dev);
 	/* Do not let double free happen, input_ff_destroy will call
-- 
2.34.1.307.g9b7440fafd-goog

