Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0B404D087
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2019 16:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726649AbfFTOin (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Jun 2019 10:38:43 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35873 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbfFTOin (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Jun 2019 10:38:43 -0400
Received: by mail-pf1-f196.google.com with SMTP id r7so1801570pfl.3;
        Thu, 20 Jun 2019 07:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ERVoWxtrJMWr7j0HNJMfaRBRwVy095sC6GzF6uth9PI=;
        b=hpn5/mZZdpRC3hgGuzr2zcpCYaI7hQ/89G2volnGsF0ab55L6yBbT5p+19/AygaviS
         jlm7z6uvivrrZmli3cJi844U1zJqbPdPeS4JwZEFMsQo18xyKDJcjzowXXCjEMk+3sz8
         LHdQO33vuesB2OHNqujBtROtaHHeDWco5wFC9hCYxnrQo13o2Kyc+Oqt7Gvj5fMf3x+u
         /goayEblI3AN7g3rEUXGb5O16hpbNrcmTevSdQ8xDwuzI6JCAkYEoPi6nVPHo/qDZbDP
         37Fn0t10Y1T+mXd9f23McP3iTtpP/3I2tgrIUoKkc6C61WPRxv7B/wFuAxuW4IRaXsKl
         eojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ERVoWxtrJMWr7j0HNJMfaRBRwVy095sC6GzF6uth9PI=;
        b=b73CkrEtxKSPocov9sTTj5ftl+xc+6BdPD3wBzMOCl6gqIG4jOrutp4Hob4wuvV0XX
         jmgcaOhfRGJQE/7hw7XgfnIjwjREn9+fjtB5wfrYGlyVk3idlghiWU26PdfCAZ+MB/Fs
         q3AQDMHB5rygFtUmiX1BPCdW6p1GY9PSop6j2fMTu19t6EzfDbQCF1Ny3PHM9EiK63nz
         2/2idxDQHsfM0AV9EaAp6V3cC0pOPiVbUoUZPFt+U/ihOmhUYDPgcQGT6NlpFfabzHB7
         RK1LMrzAK4Km0A01CYZ/NWGOyR+0NasgWPp9dxARF1vaGIRt/TddUOK0Zg1JynqUzyxx
         dzXQ==
X-Gm-Message-State: APjAAAX08qPsXZK5u0xBCRl3r7LXSnsGbCTAk/iq5ZsQRkM/PnawlV7X
        LkzLJIcc8H3vBonRAQUCkpg=
X-Google-Smtp-Source: APXvYqx6OyYjcTVTxeYpVueNn9GFEPM65wzcua+RwVOJGnWpOlrXiebTiO0jJlEqojoS6sySNGKGTQ==
X-Received: by 2002:aa7:9ab5:: with SMTP id x21mr33441499pfi.139.1561041522674;
        Thu, 20 Jun 2019 07:38:42 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 128sm22905142pff.16.2019.06.20.07.38.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 07:38:42 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        jikos@kernel.org, hdegoede@redhat.com, lee.jones@linaro.org,
        xnox@ubuntu.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v7 4/5] arm64: dts: qcom: Add HP Envy x2
Date:   Thu, 20 Jun 2019 07:38:38 -0700
Message-Id: <20190620143838.12035-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190620142801.11827-1-jeffrey.l.hugo@gmail.com>
References: <20190620142801.11827-1-jeffrey.l.hugo@gmail.com>
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

