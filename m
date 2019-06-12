Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA2244957
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2019 19:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727438AbfFMRQb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 13:16:31 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34791 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbfFLV2P (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 17:28:15 -0400
Received: by mail-pf1-f195.google.com with SMTP id c85so10428496pfc.1;
        Wed, 12 Jun 2019 14:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Abt4RqBWuzAO1Yg7V0VfRrHk6H4CsqP60Bl2BbL+bIU=;
        b=iGzjYuEH25ssl+vNe1uoZW1vYfSuEXO14VWjxhsiBZLLboXPoDynBezbpz0EslhzB3
         rn8EFOct68qfYYoHPULJWeMwbO/Pp0QDdromop/QBFNekA3t5VqFm8Dr/g9tA7QGOcX3
         dee8GqRnSpz7vn1eHQBsUVYTuQrvnk1tbQEs3ORL2UHOhbHi9HTy6PCPZFDvWbOPMmvA
         QL1FOH51wcP/LqcusVIepqk1jUG3jB04Tio5oesDzeuoFwvfGAPLqmDLMMoA9T257Hz9
         ww/w9X4FE3CI5At2gCo9YZ8CWpduUVUsD8oeGzkolPInbEnGtMf0lCjAmjEnYr7dYnh0
         uEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Abt4RqBWuzAO1Yg7V0VfRrHk6H4CsqP60Bl2BbL+bIU=;
        b=OJCa1nS2txAAMnFGBOd5hKX6yFk8tWPW5S2YNBWW8r1YQecte4OP/ZPhYruRKK5G6T
         MLKk2gIn4s2Y3ieuQJjMQn23uFQuGDzVH3GSXJvpU9K1SYhFi0adBv5sUrOUXNEL9fkI
         HXjiLw7vUeZ8dk5U5+I591wtwha9dj31RAwsf5oCgUAk+Yz8hUPXa01auvfVSlsyOL3K
         CkMsB5O4ydxBu95pQvqe7PQ1zJJoyOJrlegihMPALhRsfPI3Q6+Q/Qu9lGUA0hTbiSOQ
         39CmP9d9kkdnuTZcqXstBJlSJv2XPNDBwJiI7rsFAJ6SkJCfwxDUv0jJoEIO98ZKg/LE
         W/xg==
X-Gm-Message-State: APjAAAXzWihryUmrKLXqaHBLaOH2yj507Rpm+qaaNclQSH6L2U+kCSK2
        /a2XVL432wWmMm+913xsmw0=
X-Google-Smtp-Source: APXvYqxju0zMxwWj6t3ggokCgevi7OmMx7JgjO129AL1coGiJqeul2Ck0JeZytprVKHsvjfsmx2eaw==
X-Received: by 2002:a65:620d:: with SMTP id d13mr27469784pgv.109.1560374894898;
        Wed, 12 Jun 2019 14:28:14 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id u97sm336121pjb.26.2019.06.12.14.28.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 14:28:14 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        jikos@kernel.org, hdegoede@redhat.com, lee.jones@linaro.org,
        xnox@ubuntu.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v6 5/5] arm64: dts: qcom: Add Asus NovaGo TP370QL
Date:   Wed, 12 Jun 2019 14:28:09 -0700
Message-Id: <20190612212809.32350-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190612212604.32089-1-jeffrey.l.hugo@gmail.com>
References: <20190612212604.32089-1-jeffrey.l.hugo@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This adds the initial DT for the Asus NovaGo TP370QL laptop.  Supported
functionality includes USB (host), microSD-card, keyboard, and trackpad.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../dts/qcom/msm8998-asus-novago-tp370ql.dts  | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 76436f33a013..5cd1844a6d33 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-angler-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-asus-novago-tp370ql.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-hp-envy-x2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-lenovo-miix-630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dts b/arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dts
new file mode 100644
index 000000000000..db5821be1e2f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dts
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2019, Jeffrey Hugo. All rights reserved. */
+
+/dts-v1/;
+
+#include "msm8998-clamshell.dtsi"
+
+/ {
+	model = "Asus NovaGo TP370QL";
+	compatible = "asus,novago-tp370ql", "qcom,msm8998";
+};
+
+&blsp1_i2c6 {
+	status = "okay";
+
+	touchpad@15 {
+		compatible = "hid-over-i2c";
+		interrupt-parent = <&tlmm>;
+		interrupts = <0x7b IRQ_TYPE_LEVEL_LOW>;
+		reg = <0x15>;
+		hid-descr-addr = <0x0001>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchpad>;
+	};
+
+	keyboard@3a {
+		compatible = "hid-over-i2c";
+		interrupt-parent = <&tlmm>;
+		interrupts = <0x25 IRQ_TYPE_LEVEL_LOW>;
+		reg = <0x3a>;
+		hid-descr-addr = <0x0001>;
+	};
+};
+
+&sdhc2 {
+	cd-gpios = <&tlmm 95 GPIO_ACTIVE_HIGH>;
+};
+
+&tlmm {
+	touchpad: touchpad {
+		config {
+			pins = "gpio123";
+			bias-pull-up;
+		};
+	};
+};
-- 
2.17.1

