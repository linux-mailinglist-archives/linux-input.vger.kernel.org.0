Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 335FD2FE352
	for <lists+linux-input@lfdr.de>; Thu, 21 Jan 2021 08:02:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbhAUHBq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jan 2021 02:01:46 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:43397 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727030AbhAUG7z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jan 2021 01:59:55 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 083A35C00FF;
        Thu, 21 Jan 2021 01:56:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 21 Jan 2021 01:56:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=D5q7/JpfWnXMs
        /U4/SdqmnZ4pMs2OR5puiCrTr0sajE=; b=Hrq9b3zieHUW2k/J5MFrdHjXoSHXk
        F0wYlJo5rqOauNSaFl/d42c52Sb6adSfvalqc6tR1KJtjyfJwJ7ZlWxM/7y4Hp0o
        1vLqUBWodEJFAdnxVu/ZZjhskFM9HFD7SUQAjTCrZQf0xC8MAsthbyDcvWUlFX33
        A/QFVebDaFeELKm2/wryWZoGQmA7Gaz8lNZMFpEt8a7a4IllciDQb6CXAsK5ytcX
        j8t7VuDAxr/PDUiIAAXiihOTVXbskq8gJFoyeNUHthQgFS5RVhaCSBzfWwWKNUID
        2qHK/JgF7gaLJGHZqsW7etfQsWFc+dAKm9aehk9pBic6gfjquXmCMTGeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=D5q7/JpfWnXMs/U4/SdqmnZ4pMs2OR5puiCrTr0sajE=; b=R82duAvM
        aKVruW7TzsaWPlo+/2zLpA31XfK9/2gisBAfmxi7rFCrEvrZ8jlXUK7xlD9R3OtO
        f1V7u+v0Y4fpuqzOlj72glXGcpLXRz4ix8PFh6Rcms2MFrdqgjlG7xN6GEiTvORi
        BGDKcUkXknYCZmdy3wt+Yb0D364MN8g5IT+Wddrg2jT/krQ4WS6gg9y/28pRHPj5
        zDd/0rTsiGwafYUbpapnTAcyuH0I07mBcFUIq8Ba9Zb846uKoPI1lHPQfxpNvW9d
        2PmKzrRYHcXHEPKAUl/t/DQEeLHa9JoiAu8L8X7e3y4fkNGzD0YXE+Oc55Y0U7ZA
        54jGLgLL3t6qZw==
X-ME-Sender: <xms:tSUJYHFdAPeW4Yo4D0hYpgwT6cA3v8WzHzoZptdzj30mNRHSjEGGBw>
    <xme:tSUJYEVrPek4ktdgPWQWcG41lk3eiQMGS8yjNS8EzymBSvbGINsaFS7aVtf-1QRMD
    3sZtK2AWgEEogmYhzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgddutddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucfkphepjeefrdel
    fedrkeegrddvtdeknecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilh
    hfrhhomheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:tSUJYJICgy65XJAZxLMxqOnt7FYdEh8G-iMQLbwFyqzPwDXrJ_gAtQ>
    <xmx:tSUJYFGwksHwDLP_CyNaWPShNXQnoNMg1i-O1aM3o-Jd8oqKTHrrZg>
    <xmx:tSUJYNWczTpwEpesbtHRVU1dQm_mvINgrWn0c9NK4HBT81wEy52Ubw>
    <xmx:tiUJYAQkZhGFuBSjx-gi5Sg5Wmuo9-VX0bLx_J-PxAxcC5jiOlNkYg>
Received: from ThinkpadX1Yoga3.localdomain (c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
        by mail.messagingengine.com (Postfix) with ESMTPA id 13D0C1080057;
        Thu, 21 Jan 2021 01:56:52 -0500 (EST)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v2 6/6] arch/arm: reMarkable2: Enable wacom_i2c
Date:   Wed, 20 Jan 2021 22:56:43 -0800
Message-Id: <20210121065643.342-7-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121065643.342-1-alistair@alistair23.me>
References: <20210121065643.342-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Enable the wacom_i2c touchscreen for the reMarkable2.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 arch/arm/boot/dts/imx7d-remarkable2.dts | 41 +++++++++++++++++++++++++
 arch/arm/configs/imx_v6_v7_defconfig    |  1 +
 2 files changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-remarkable2.dts b/arch/arm/boot/dts/imx7d-remarkable2.dts
index fba55a0e028a..8052d884a5e5 100644
--- a/arch/arm/boot/dts/imx7d-remarkable2.dts
+++ b/arch/arm/boot/dts/imx7d-remarkable2.dts
@@ -150,6 +150,30 @@ &dma_apbh {
 	status = "disabled";
 };
 
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1>;
+	status = "okay";
+
+	digitizer: wacom-i2c@9 {
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&pinctrl_wacom>;
+		pinctrl-1 = <&pinctrl_wacom>;
+		compatible = "wacom,wacom-i2c";
+		reg = <0x09>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <1 2>;
+		flip-tilt-x;
+		flip-tilt-y;
+		flip-pos-x;
+		flip-pos-y;
+		flip-distance;
+		vdd-supply = <&reg_digitizer>;
+	};
+};
+
 &sdma {
 	status = "okay";
 };
@@ -221,6 +245,16 @@ &wdog1 {
 };
 
 &iomuxc_lpsr {
+	pinctrl_wacom: wacomgrp {
+		fsl,pins = <
+			/*MX7D_PAD_LPSR_GPIO1_IO00__GPIO1_IO0	0x00000074 /* WACOM RESET */
+			MX7D_PAD_LPSR_GPIO1_IO01__GPIO1_IO1	0x00000034 /* WACOM INT */
+			MX7D_PAD_LPSR_GPIO1_IO04__GPIO1_IO4	0x00000074 /* PDCTB */
+			/*MX7D_PAD_LPSR_GPIO1_IO05__GPIO1_IO5	0x00000014 /* FWE */
+			/*MX7D_PAD_LPSR_GPIO1_IO06__GPIO1_IO6	0x00000014 /* WACOM PWR ENABLE */
+		>;
+	};
+
 	pinctrl_digitizer_reg: digitizerreggrp {
 		fsl,pins = <
 			/* DIGITIZER_PWR_EN */
@@ -236,6 +270,13 @@ MX7D_PAD_SAI1_RX_SYNC__GPIO6_IO16	0x59
 		>;
 	};
 
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX7D_PAD_I2C1_SDA__I2C1_SDA		0x4000007f
+			MX7D_PAD_I2C1_SCL__I2C1_SCL		0x4000007f
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX7D_PAD_UART1_TX_DATA__UART1_DCE_TX	0x79
diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index fa9229616106..2fc8dc6a8b0a 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -167,6 +167,7 @@ CONFIG_TOUCHSCREEN_DA9052=y
 CONFIG_TOUCHSCREEN_EGALAX=y
 CONFIG_TOUCHSCREEN_GOODIX=y
 CONFIG_TOUCHSCREEN_ILI210X=y
+CONFIG_TOUCHSCREEN_WACOM_I2C=y
 CONFIG_TOUCHSCREEN_MAX11801=y
 CONFIG_TOUCHSCREEN_IMX6UL_TSC=y
 CONFIG_TOUCHSCREEN_EDT_FT5X06=y
-- 
2.29.2

