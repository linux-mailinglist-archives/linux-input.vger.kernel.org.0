Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 313F04495F
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2019 19:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbfFMRQv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 13:16:51 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42121 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbfFLV2E (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 17:28:04 -0400
Received: by mail-pf1-f195.google.com with SMTP id q10so10399880pff.9;
        Wed, 12 Jun 2019 14:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ERVoWxtrJMWr7j0HNJMfaRBRwVy095sC6GzF6uth9PI=;
        b=dYwNQS7deZ/ymJyL73bhDXSveiMyoXfOlC5OLLnGy2UBcKmOMtomC73lXFB+G4SoaJ
         oS7Ir3rvDRZI3gr2cSb+d3d9+6AqsJYs8j6aPNLz4u/NnhR2DbczNdioSFiF+Q6xddeR
         iFjBr3MegR6x1lm5ZVITGH95qP06RTH6CvlpwObE2Yf2zXkFWqA81+sdyoR3NrYGXSKs
         mGd1Z+fMWI4ZhtvqePaP6JWROHLSvg5egJ+Fz2zNS6e9ALc9fvIE3oiu5wQpWG0YnDKU
         ZqUlFgRciQM3wQcfaHqdhVK+pPrRDFYDQt9eAdwGTGki1HewJiK8rxgJAxJwi+tGpZyb
         aAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ERVoWxtrJMWr7j0HNJMfaRBRwVy095sC6GzF6uth9PI=;
        b=t/+V4VuUmGfUkOWE4l8UETLrHL4wnJhVEzm07GoFg5Sp+SrbKQG0HiatR2OwOAChM/
         UhJVySaSjBESBjFH8v7poUaEj++W0hZ/AZGpzR8dhxdQSJOgC0R0hvoiJ9jNZNRgLRlV
         kJ9FKtsXlHIquqiUw8bUWIlwMGcLin09tiyB8BZUVZcRufhukJrr6QGk8vwQJw1Lyrtw
         wMCgOTMYqMEQ56aZHPBykXMg4HelJBqutzO2WzWSuuIULqwnoU5PUpLacW/k6mXBP4Ue
         XtRnmcNnjQAE7Rv/G/kno80Be7sZg0rOnojCtglyraJqSEDtDYe7ZLF+F3qnqzYHPgPu
         Wtiw==
X-Gm-Message-State: APjAAAXbh/XG58lVSzKqlxrfnkPoq9Pj36ymvbzp8bSKPYpiersrOS3P
        f6+rLqgQ8EOLDUqG1bUd/A17kEqj
X-Google-Smtp-Source: APXvYqyk9N43IFTfHhjbxJxY8AzUEg6HKGrQF+X4ob+tkgZjbSyjs4dIyGy2+qReOWHoFj4kgu0+Bw==
X-Received: by 2002:a65:56c2:: with SMTP id w2mr27576323pgs.49.1560374883499;
        Wed, 12 Jun 2019 14:28:03 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id x7sm449949pfa.125.2019.06.12.14.28.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 14:28:03 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        jikos@kernel.org, hdegoede@redhat.com, lee.jones@linaro.org,
        xnox@ubuntu.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v6 4/5] arm64: dts: qcom: Add HP Envy x2
Date:   Wed, 12 Jun 2019 14:27:59 -0700
Message-Id: <20190612212759.32298-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190612212604.32089-1-jeffrey.l.hugo@gmail.com>
References: <20190612212604.32089-1-jeffrey.l.hugo@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This adds the initial DT for the HP Envy x2 laptop.  Supported
functionality includes USB (host), microSD-card, keyboard, and trackpad.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../boot/dts/qcom/msm8998-hp-envy-x2.dts      | 30 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index c3e4307bcbd4..76436f33a013 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-angler-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-hp-envy-x2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-lenovo-miix-630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dts b/arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dts
new file mode 100644
index 000000000000..24073127091f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2019, Jeffrey Hugo. All rights reserved. */
+
+/dts-v1/;
+
+#include "msm8998-clamshell.dtsi"
+
+/ {
+	model = "HP Envy x2";
+	compatible = "hp,envy-x2", "qcom,msm8998";
+};
+
+&blsp1_i2c6 {
+	status = "okay";
+
+	keyboard@3a {
+		compatible = "hid-over-i2c";
+		interrupt-parent = <&tlmm>;
+		interrupts = <0x79 IRQ_TYPE_LEVEL_LOW>;
+		reg = <0x3a>;
+		hid-descr-addr = <0x0001>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchpad>;
+	};
+};
+
+&sdhc2 {
+	cd-gpios = <&tlmm 95 GPIO_ACTIVE_LOW>;
+};
-- 
2.17.1

