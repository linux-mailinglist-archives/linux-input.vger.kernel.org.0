Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA10525F72
	for <lists+linux-input@lfdr.de>; Fri, 13 May 2022 12:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379093AbiEMJj7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 May 2022 05:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379100AbiEMJju (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 May 2022 05:39:50 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 364182A5E9B
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:49 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id j25so9637267wrc.9
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gfpO9dugdZxvOunltm8uXiDYgZvaCVfhDaKWWoOV/HI=;
        b=QN/I2ztTZGh9zohZx+ANhrOTO/NXrHR0WFm7r5vprnRIZ629PEp+WwXuVbHSCLhV5J
         9drBf2YO4nJelL1LuMhny8gkOGqJ99AsdFo1PG//X2fmd8Qecwn+uAafhPrN2cpZ9fid
         stUXnO72KWdc54VI0rmX+9p0iiqtDMoaHqrpTgHwZgud08q0zjWpL6y+0aQwIdqB6SBI
         jfjsIMpX8SHdF35/EWpJE9zb30NIe6RGdFIOjdFji+VIEx5AxKcIil9V14+rPLX8HV9O
         Y7GRkgu/WZ3lXv/SvA2bRNap4CkyMfPKyUuXOzKCovV6ePtxKSdXHmJhB+hHTstURJjU
         6Z3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gfpO9dugdZxvOunltm8uXiDYgZvaCVfhDaKWWoOV/HI=;
        b=gIBJtU0pInk9783xEKTOvLIkciDgFp7SggQKOkzh17Rh0+SOpkI74mqtPuNXfv4RpZ
         9BwqB1fLugWUg57QUjlpNiicu6pnpD1eSqQzrmNDh4PlrAHP2EArAdV6PZIDJ3h42uRO
         zBeYwWJuDnqH4kWvOpMu8ehtt0X3uKPApyD3ZD3cSYEy+nn4mUKVQvT8bqjmeC/eJZPO
         rq6edTocxWA6uKQIbqVBRNSZMqdaMi5u+YVBdO/7++5lMTTxGHrn/FWZLMtQK8FM3hwf
         XPSCDwsguQcRLDciUbzBujvCnZUDPL907cm3hVpxQnWxnNwfc88qw5xPBXV34q1Mbmlw
         GAhA==
X-Gm-Message-State: AOAM533dWrtrSakwzenIfE+7OsyglE8XU3nwDuj/6Ozb/PpzMaCEdEsu
        L7OPE8pY2ccugiAxEcQ0Icbijb+IQjW6R4tQjYw=
X-Google-Smtp-Source: ABdhPJx7erWoGDiBOJGvF+AFnSdIX5eNNje9gxhpLgD22y6Tg1L4ScTrTh3L5WRMNYbkQ3Cr0S5NiA==
X-Received: by 2002:adf:d213:0:b0:20a:d703:154f with SMTP id j19-20020adfd213000000b0020ad703154fmr3296663wrh.604.1652434788762;
        Fri, 13 May 2022 02:39:48 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id l5-20020adfa385000000b0020ce015ed48sm1631404wrb.103.2022.05.13.02.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 02:39:48 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v3 07/17] HID: haptic: implement release and press effects
Date:   Fri, 13 May 2022 09:39:17 +0000
Message-Id: <20220513093927.1632262-8-acz@semihalf.com>
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

Upload shared haptic affects for release and press waveforms if a device
exposes them and it is a forcepad

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/hid/hid-haptic.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index 327106152d79..3301bf27dfde 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -361,6 +361,7 @@ int hid_haptic_init(struct hid_device *hdev,
 	char *name;
 	int (*flush)(struct input_dev *dev, struct file *file);
 	int (*event)(struct input_dev *dev, unsigned int type, unsigned int code, int value);
+	struct ff_effect release_effect, press_effect;
 
 	haptic->hdev = hdev;
 	haptic->max_waveform_id = max(2u, haptic->max_waveform_id);
@@ -477,8 +478,44 @@ int hid_haptic_init(struct hid_device *hdev,
 		module_put(THIS_MODULE);
 		goto input_free;
 	}
+
+	if (!haptic->is_forcepad)
+		goto exit;
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
2.36.0.550.gb090851708-goog

