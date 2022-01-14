Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C685348EFF1
	for <lists+linux-input@lfdr.de>; Fri, 14 Jan 2022 19:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243105AbiANScf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jan 2022 13:32:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243120AbiANScb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jan 2022 13:32:31 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21D87C06161C
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:31 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id c126-20020a1c9a84000000b00346f9ebee43so7227853wme.4
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QkRLDEpyd2dj86Jt9gdru7NEOV/insLnjmGna/TlM78=;
        b=LbC0JqBkagUJMu0kJxwU29nFuFWivn5jt7WKo2C1EM57k/1X6C9uXhWL/PrUhPe0L2
         u2Bt3DtXITvq/iWIGKVDglBRLj7cX+1L5lYQyXTV4MEArcBG3VEeUocPG/oOCE2tc/x1
         4ZGGR5CR7MIjRq0PiFYSnSX0Z0Gaa2fNWGL6Q0dD9zCACTfAt54dshNyLnkzvpFfwMnM
         9QZxaLADxcLOK5neLROHvJ4N0FQ1OK3QzjiTe9NWwbBg1IHfjAOD//3Ro7KKegsDEyUW
         1+5MDhgY+dXVcm9gWINQ5UZzxs4VAvl4g6SXUilkdO858Ay0NuH/H6HVHNvhBw68uEDg
         okcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QkRLDEpyd2dj86Jt9gdru7NEOV/insLnjmGna/TlM78=;
        b=pgytBRxRd6JEbs2K7DQLQIzZKHQjYikbPEJDk9gQBg77+FGbtu+mKcS10mlWnGDN0m
         Drp42fUe4fbifjeQctc1l7kCUIlkZ5S3L/CYeGchnfHQ+O4foG6gL1JU1KqY6Wxyp28w
         V/AQzfEBrlZXQSqTl8WUEjln18sSgHL67Bmh3k8KW7DdnF5OavCXi2ybfOga3DjdZvmi
         kr+Jm0Cet6cLUAb/fUxIit7sFDvkXrwo/kQuhJoIyHJb6bqiPCOEQn+nQRjMXQinr3Fn
         8wQ+7zZUGV4zpZvHPbrz/AeE7rRKcluGUn4sxINqlXI4FiYLiVJZu5OmULUQn8Ix6ugD
         lnZw==
X-Gm-Message-State: AOAM531JhSCsu0lqag+g6AmXS9ZaTe6YtNolsw9PMUd69VnbF2OQXcSs
        +Vhtb5bMu9aaSc3nR5TLsAARNwpFYXrJx8TGTR0=
X-Google-Smtp-Source: ABdhPJwhTt9wu0VIlh4ZsSrWsdgkIOlidSCwbPJvHU7ymIgJakngv37o93qyWVu0JyOFUndZDnprfw==
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr9624116wrv.521.1642185149736;
        Fri, 14 Jan 2022 10:32:29 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id az4sm6410984wrb.14.2022.01.14.10.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 10:32:29 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v2 08/16] HID: haptic: implement release and press effects
Date:   Fri, 14 Jan 2022 18:31:44 +0000
Message-Id: <20220114183152.1691659-9-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114183152.1691659-1-acz@semihalf.com>
References: <20220114183152.1691659-1-acz@semihalf.com>
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
index 7dffd0fa68c6..64e354cb3f2e 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -365,6 +365,7 @@ int hid_haptic_init(struct hid_device *hdev,
 	char *name;
 	int (*flush)(struct input_dev *dev, struct file *file);
 	int (*event)(struct input_dev *dev, unsigned int type, unsigned int code, int value);
+	struct ff_effect release_effect, press_effect;
 
 	haptic->hdev = hdev;
 	haptic->max_waveform_id = max(2u, haptic->max_waveform_id);
@@ -481,8 +482,41 @@ int hid_haptic_init(struct hid_device *hdev,
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
2.34.1.703.g22d0c6ccf7-goog

