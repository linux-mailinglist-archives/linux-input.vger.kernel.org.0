Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 443C44EB50
	for <lists+linux-input@lfdr.de>; Fri, 21 Jun 2019 16:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfFUO51 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jun 2019 10:57:27 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45821 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfFUO50 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jun 2019 10:57:26 -0400
Received: by mail-pl1-f195.google.com with SMTP id bi6so3118256plb.12;
        Fri, 21 Jun 2019 07:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ERVoWxtrJMWr7j0HNJMfaRBRwVy095sC6GzF6uth9PI=;
        b=WDC6HfclPw7d584KXs0ihkS/5uLEn00576sW2a+HQOBeJnsA9WY3CSnGTc3AU1ziyg
         +ypEDEtZCtwXaXdXHrP3jAmgE9/lpkatOYmJNufqLMx0xhxgqk1LnoRqbiLjhbA+kiFq
         lvTh3VmHVTu6J2pUodCBj9qXDgstuxO0wHaJIE2sc593yoyqGGFqw1gq5H0Ya1GYeEPD
         MBIkUBZ7fTubmjQb93ZmQZ6/jbkANBLTQ9iryJj2skJAtLIZHDdCgkLgwfUOuxCzRut+
         Rew7+Me/Hy8yKi5O6AFfpKS8uAaeHTewNUu/T4G/td81PZqqsidQPR6wvLetwR9XT7Ac
         Ti5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ERVoWxtrJMWr7j0HNJMfaRBRwVy095sC6GzF6uth9PI=;
        b=KXyl1zEqyeZV207CWa7u+o/c9LPLxgthnI+sQdHe9NnGtdfkFJNA3y5noPCHCtNQxJ
         FoEh2fr5rlkg3tKLgrewesvJgLKa6UFWUzuJHqOeWApb5jtD4ovFUNY90GNkWS+PdYCt
         Rjt9W4uC9E6C/5Mb9b0j7xJ6LLfB2Wm1WcrQGugjRNopL/bGYMi378SnMbp5/rCGjFRY
         PeKgYT/i4NnbYEDQVtLE2olwMuYeKQB/oCkLJteY9XX2wslQLgQLRg3E64aEu3gUv8CG
         /K+mP28L+lgrLeB+vr+tcH2+aBfK+0+P8xGwmRSSKa5joIqabpD+DLGsEKw0lVgpqmJ6
         t+6w==
X-Gm-Message-State: APjAAAW9M0mVzcixFiJqgJ+e7ADO3dlA4xLd1fGvo3A2QznGiJpCAnC9
        2aol6mjMUP2fyapogKWiE8Q=
X-Google-Smtp-Source: APXvYqwXJJlg8n0/DDtkomBFuJY852Dk14LPpTT6XIK9aqgc6Avi0Z4nL7ba0e0S1aCOFSs+Xwd58g==
X-Received: by 2002:a17:902:8205:: with SMTP id x5mr33643117pln.279.1561129046241;
        Fri, 21 Jun 2019 07:57:26 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id o14sm2693893pjp.29.2019.06.21.07.57.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 07:57:25 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        jikos@kernel.org, hdegoede@redhat.com, lee.jones@linaro.org,
        xnox@ubuntu.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v8 4/5] arm64: dts: qcom: Add HP Envy x2
Date:   Fri, 21 Jun 2019 07:57:21 -0700
Message-Id: <20190621145721.38793-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190621144854.38568-1-jeffrey.l.hugo@gmail.com>
References: <20190621144854.38568-1-jeffrey.l.hugo@gmail.com>
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

