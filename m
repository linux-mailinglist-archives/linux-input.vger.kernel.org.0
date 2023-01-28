Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF9C67FAD1
	for <lists+linux-input@lfdr.de>; Sat, 28 Jan 2023 21:26:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234862AbjA1U0P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 28 Jan 2023 15:26:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234861AbjA1U0O (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 28 Jan 2023 15:26:14 -0500
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 516F123C5A;
        Sat, 28 Jan 2023 12:26:13 -0800 (PST)
Received: by mail-qv1-xf2f.google.com with SMTP id j9so6383408qvt.0;
        Sat, 28 Jan 2023 12:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjpzg4TvvF5ijVNt6jTclmaBmB/Tsf6MP2Z3c8TENhI=;
        b=L/DPCADetPtg/QOsFtQGtyT/6BINpDgO0UaDCPp8TmailR5OaD5/T50cVJLpExhZYO
         bNjt9z/UstDx/4TLi18brrZASVSgmW1SSWSRCfrPPxFu+5jWD/3dUpmQddzmMHPtUvih
         CaX1VcvKPTUe0s0dshF+oVMqzbqi59IB8k8Re4dVjQ+j9PUI/bz4Oxs8eYOQhg8QEHM5
         eLz8MhndtIAc14wBjN8A+BhfHOud87OLJgDjjqJiBlMhctPnVsEt2eTXcC+hnvVCPYL4
         FXQgUbQiM6PbpscJ0EOrAK8532Bz+ucvWmN6zFLVbKkkuGmSlReqCBhTy4yX3du99HRf
         eXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zjpzg4TvvF5ijVNt6jTclmaBmB/Tsf6MP2Z3c8TENhI=;
        b=0k85Wr7ALyJCUwSF5xXQgYRyJzVb3gRxTehTamEGVlV/kiZxy7H28TNboAOIR5hMdY
         Si3GaDj6wDjbJe/7Aa6chVi5wYhHm2eDrbxyY4iqP5mneKMHcnkptKf2Uv7pyvpMO+2f
         fQdwzmRsLvRxZU0EWmXRqDFa+TpIRWIjYUGS+R8oQYimFTRl5vuS0DkiMEL2kRBWnfI+
         cSfba6irFTYqcAS9rzYHBisBB+1X3aUYF9OHE8b7PKEt4drqyWCc8YmkvgLzRwkhKf0E
         eepM6+agL6U4ZvYqumyp0P0HbFkbSwd+9KN4J28/tduVnMT5NP1JBtzXKNlBDeJsHcn2
         3a8A==
X-Gm-Message-State: AO0yUKVlYHCyUcyPijjZLGHgYh88fEP4PV7C5Kb2VQaCtlQ4jOtoOCuK
        H0NN5rHIpHb6409ZE6uFbC0=
X-Google-Smtp-Source: AK7set8wV8BbmblBu4kZSfSb7TtOUKCx68BYFiscFflITiIB+fD0v5vh/46Xbi9HkV9PIG4x2rsn0A==
X-Received: by 2002:a05:6214:1712:b0:537:ab77:fbd9 with SMTP id db18-20020a056214171200b00537ab77fbd9mr13570652qvb.28.1674937572300;
        Sat, 28 Jan 2023 12:26:12 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id q26-20020a05620a025a00b0071de2b6d439sm52460qkn.49.2023.01.28.12.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jan 2023 12:26:12 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: [PATCH 4/4] CP2112 Devicetree Support
Date:   Sat, 28 Jan 2023 14:26:22 -0600
Message-Id: <20230128202622.12676-5-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230128202622.12676-1-kaehndan@gmail.com>
References: <20230128202622.12676-1-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Bind i2c and gpio interfaces to subnodes with names
"i2c" and "gpio" if they exist, respectively. This
allows the gpio and i2c controllers to be described
in DT as usual.

Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
---
 drivers/hid/hid-cp2112.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 27cadadda7c9..99e8043e1c34 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -1310,6 +1310,7 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	dev->adap.algo		= &smbus_algorithm;
 	dev->adap.algo_data	= dev;
 	dev->adap.dev.parent	= &hdev->dev;
+	dev->adap.dev.of_node   = of_get_child_by_name(hdev->dev.of_node, "i2c");
 	snprintf(dev->adap.name, sizeof(dev->adap.name),
 		 "CP2112 SMBus Bridge on hidraw%d",
 		 ((struct hidraw *)hdev->hidraw)->minor);
@@ -1336,6 +1337,9 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	dev->gc.ngpio			= 8;
 	dev->gc.can_sleep		= 1;
 	dev->gc.parent			= &hdev->dev;
+#if defined(CONFIG_OF_GPIO)
+	dev->gc.of_node			= of_get_child_by_name(hdev->dev.of_node, "gpio");
+#endif
 
 	dev->irq.name = "cp2112-gpio";
 	dev->irq.irq_startup = cp2112_gpio_irq_startup;
@@ -1391,6 +1395,11 @@ static void cp2112_remove(struct hid_device *hdev)
 	struct cp2112_device *dev = hid_get_drvdata(hdev);
 	int i;
 
+	of_node_put(dev->adap.dev.of_node);
+#if defined(CONFIG_OF_GPIO)
+	of_node_put(dev->gc.of_node);
+#endif
+
 	sysfs_remove_group(&hdev->dev.kobj, &cp2112_attr_group);
 	i2c_del_adapter(&dev->adap);
 
-- 
2.25.1

