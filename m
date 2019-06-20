Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F58D4D08C
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2019 16:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbfFTOjS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Jun 2019 10:39:18 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45124 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbfFTOjS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Jun 2019 10:39:18 -0400
Received: by mail-pf1-f195.google.com with SMTP id r1so1779126pfq.12;
        Thu, 20 Jun 2019 07:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Abt4RqBWuzAO1Yg7V0VfRrHk6H4CsqP60Bl2BbL+bIU=;
        b=exbcx6AI0QekvUwQRN34ooqnB7nJrZWPGY4EsAACSQ4tlt7Fu5IT0LTGG0o0+mDT+H
         kawmnxOtQm6C1LtWMHwErHGM0ZtGOZd61EeCioHvGDFNSzgTbFxbCxIPb7y7Hy/40Zkl
         rB7H87oIkpEcv6ZvPo54T5W9UiM0DU+z95jKIbJo91vJHzqs71+T54XjXdDKWbWUC5q5
         ROdQo7UQDF2T4HNxuxkLBZ5a5Stc5h5UZ2D2nmvfLpvP79ZdaURm/HHtnu9NlM2nbbdw
         r08k5k6SK2KdP9631ICWKo/TE32wTzhMhJXfH5ZxvGikNHDI+yyFOW1gkcO4KyoV+bmO
         IW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Abt4RqBWuzAO1Yg7V0VfRrHk6H4CsqP60Bl2BbL+bIU=;
        b=BIeXKeMLa2VIxTla8+Xo18xe3QkID4jXspqu9i94ElmCKl1zraVf+0yDrI84UvsmPq
         V2SubXE21Nqk7BSWVdohD+9OWSdNyWAidu+/zHpH4PY6gC8ZJO85sXoOcSJboOClaVlV
         cMDxl8nQUriYAlafQQtbNrhQS/yGTXDIVUfpVyVyUAMufvRAaxObuA9vMvg46NxkIXeB
         1E2hg/RFR6fVxugwpnHk4qO4nsdJhT1miU/fWbe17Z0+/fjDE9reKwa4l5NiGkgYEEaP
         QidcCplakEihEQjjHk+bnH418c9uUbpOW6gQZ7fpJ5UNObU0KCwKXOjrRekgUjzQiaJ8
         BNHQ==
X-Gm-Message-State: APjAAAWy5/ZNpkeIOPu1TWW24p7k+myH3vGxkpl6P5cwN5S6eiZBgCh7
        9AiLoWN5Zn/Sn8CdtwnpcgQ=
X-Google-Smtp-Source: APXvYqwJE9ER7gwzsOh1GYaqONBw89+7JFoFhcLaZ1n6jKCxepVzXe194tB/KrJbuCxFNPFrxH9fXw==
X-Received: by 2002:a17:90a:480d:: with SMTP id a13mr16326pjh.40.1561041557615;
        Thu, 20 Jun 2019 07:39:17 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id n26sm28590507pfa.83.2019.06.20.07.39.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 07:39:17 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        jikos@kernel.org, hdegoede@redhat.com, lee.jones@linaro.org,
        xnox@ubuntu.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v7 5/5] arm64: dts: qcom: Add Asus NovaGo TP370QL
Date:   Thu, 20 Jun 2019 07:39:13 -0700
Message-Id: <20190620143913.12086-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190620142801.11827-1-jeffrey.l.hugo@gmail.com>
References: <20190620142801.11827-1-jeffrey.l.hugo@gmail.com>
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

