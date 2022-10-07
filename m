Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0125F7D5C
	for <lists+linux-input@lfdr.de>; Fri,  7 Oct 2022 20:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbiJGSa2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Oct 2022 14:30:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbiJGSaW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Oct 2022 14:30:22 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1809EC5113
        for <linux-input@vger.kernel.org>; Fri,  7 Oct 2022 11:30:18 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id bk15so8429703wrb.13
        for <linux-input@vger.kernel.org>; Fri, 07 Oct 2022 11:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EiRWz3/ju05cpZJVAmO9L3pe6FrhtoFaBzT/35Bs1Uk=;
        b=Ky9Sli+8xgtf1RpNmKLvZ2thfkDTKWiG2hgvtWJzv2jjeo+1do7gbuJF4K25EhSXsC
         E0n30BSVm+uuoXE3Ii4fSX3MwTkI/hB2gtTRbuYSC7QY8ho2r6fwJFZcRttXUg08GCeq
         nt56B0WxBSpoFApO18AaUJmqmwXe+ZdTG536qMilz+CdsBBsZIJjfu74JOD2hUHOSm2d
         KnZGSWUAfwMxObHY4gaficqSOfThCLceOAre2Nqgd5YhZ6q6yq3hEt7n2WphxLFeLjsN
         jkhWUG5hStHXrpQITCn3YPoxvKTxcFeoMjPOMO9y9g89Mq9HVuQ0fNXBrNKypMPXdKh7
         VFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EiRWz3/ju05cpZJVAmO9L3pe6FrhtoFaBzT/35Bs1Uk=;
        b=5X6g2P7TaghPyZYesNBgVijyh0WDe/6SdZtfD9P5Kqe49yXKO785bGn3x5z+n2LQL9
         VXe9Cxx5tZLWLa0ltDzU83IBItG8TJJZ+fezJdKUkvrha4YBtbv9dqeRipxGbB/rabGg
         sbK90XWHvaHjbd5TfiYLiOMwLIBnDkdSjtWycg+sajrXvhC7qI/+fx3P+8/fYOQJ2dSi
         Xnx/8lmAWSCPpM11Ev7lClQ65HAoXKm9CpsLMZZ17wX9cfe92ydQQMsmKYcHna8CTPhP
         LDgSlsqRFaa8aCkR3iS7kdc3x/k7Ihe9QJgpVIic4/WsIu4yoTasX+zyTPTxv4+qqOQS
         7QRg==
X-Gm-Message-State: ACrzQf2vfsgY77L5xiHGW1LRnabEL93LCHU3qGYu39Zu0IPjnd5+atjZ
        gQMRzqBD9tB99KlkiQbuwn51Y+0ETNjNExcj
X-Google-Smtp-Source: AMsMyM509+WcxOKTuCBbxavkvpfF/avs/9OydMugjuhYfWYuJBx2VeXmGlmNyJCagGJQ3Kpu4T36bg==
X-Received: by 2002:a5d:5224:0:b0:22e:397:d4da with SMTP id i4-20020a5d5224000000b0022e0397d4damr4027315wra.364.1665167417024;
        Fri, 07 Oct 2022 11:30:17 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (230.213.79.34.bc.googleusercontent.com. [34.79.213.230])
        by smtp.gmail.com with ESMTPSA id l10-20020a05600012ca00b002258235bda3sm2573627wrx.61.2022.10.07.11.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 11:30:16 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v4 07/17] HID: haptic: implement release and press effects
Date:   Fri,  7 Oct 2022 18:29:35 +0000
Message-Id: <20221007182945.1654046-8-acz@semihalf.com>
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

Upload shared haptic affects for release and press waveforms if a device
exposes them and it is a forcepad

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/hid/hid-haptic.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index 327106152d795..3301bf27dfdee 100644
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
2.38.0.rc1.362.ged0d419d3c-goog

