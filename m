Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 827254EB64
	for <lists+linux-input@lfdr.de>; Fri, 21 Jun 2019 17:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726212AbfFUO74 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jun 2019 10:59:56 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39901 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfFUO7z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jun 2019 10:59:55 -0400
Received: by mail-pl1-f194.google.com with SMTP id b7so3138354pls.6;
        Fri, 21 Jun 2019 07:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Abt4RqBWuzAO1Yg7V0VfRrHk6H4CsqP60Bl2BbL+bIU=;
        b=es3ZixTrMIQWERBBC4ZFxsre0+V0N1n5T37wF/Sp7+W8FY5o3DUuV4bOTJNNnjHnqW
         H9BWQ9OaVZlrjlA5cf1e9Ps5Y/icmTiTyCZ0XdA1lxGBZlycq+5ozTTmQXjmmK1nLwq3
         F/z/ObhC5et1xwz+cA/fibKLqYcSonF2WmfzLy1o+S3TyQgzSQuITF96rHl0xVqxnCC0
         p0BiwDoCjfHwUZbEOlSdPFfBO3qrXje0nmDjyY9LA6L799NWzBkZD6x1+jm50HvXWd5A
         8xx8FdRb6lQ9zhfcOMLkmzVO71nOEfAyYhvlcvjkGu1F7/0aLe/UFuAdnLVD9IZSJf5w
         mZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Abt4RqBWuzAO1Yg7V0VfRrHk6H4CsqP60Bl2BbL+bIU=;
        b=JE/2FFhFugJn/FAxCKNASEz27Q9u6LtIPRxv6PHb1ivx6C9hDR+HNshDDUq0HM35Kb
         1qDZPwM/JJGiP7yc434/aJ45Xs4w1OdeAkwE5dsrLdofMHemJfkffBKA4GHoC4wl9PLO
         o9MvrO3OhAkCg2zMzbYy4KMjpps5Oqqy5vx4CiIr3JJnAoyJTHF9GpLpCYHoAVrjbfvk
         hgcuLyIdl7PBTHXY3MhxMU7Xj3ve1Q0kcEkgnhlPJBGDEfU9mJdlLXjEBqdEZUysF1EA
         ValKwLN8tY4NTrcl6CoRMvemYxabXXOdcKxFPIJVyTG24vcYT44sp3F6PpDgpLKzN05A
         sQfA==
X-Gm-Message-State: APjAAAUCh60fg90XGanW52FovqYD5St+R6RZvHPtp5ZngoKDTR6rKG+a
        hxz2p+vCtjw0tDFYzx2R++F0IDlj
X-Google-Smtp-Source: APXvYqwaN0DOlyRP1f7amX1tgxpd1DIPm8wkTbTuuLQ1d9NPXLh6MqnBwKFpM/rNnqeAVfFJX64mIg==
X-Received: by 2002:a17:902:d715:: with SMTP id w21mr132670828ply.234.1561129194997;
        Fri, 21 Jun 2019 07:59:54 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id o13sm3049745pje.28.2019.06.21.07.59.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 07:59:54 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        jikos@kernel.org, hdegoede@redhat.com, lee.jones@linaro.org,
        xnox@ubuntu.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v8 5/5] arm64: dts: qcom: Add Asus NovaGo TP370QL
Date:   Fri, 21 Jun 2019 07:59:51 -0700
Message-Id: <20190621145951.38844-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190621144854.38568-1-jeffrey.l.hugo@gmail.com>
References: <20190621144854.38568-1-jeffrey.l.hugo@gmail.com>
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

