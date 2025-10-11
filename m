Return-Path: <linux-input+bounces-15373-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D804BCF039
	for <lists+linux-input@lfdr.de>; Sat, 11 Oct 2025 07:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89D4118998AD
	for <lists+linux-input@lfdr.de>; Sat, 11 Oct 2025 05:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0EC413959D;
	Sat, 11 Oct 2025 05:57:32 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694411400C;
	Sat, 11 Oct 2025 05:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760162252; cv=none; b=cb1XlHBa5At2aFHGKE7Lb4nRuAzNAo6c9Er0XR0lMnS84vkb+a2RoIEI420uB17G43RN1qwsJLjjd5Mog8y5QctfeSYStD/DFKjXagB4ewlKDDiGcnPqskyuUi+a3LSHm7JMLyFuS3pIVOJfGM/PD/g3F1obdVIMQM4yUUAk4To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760162252; c=relaxed/simple;
	bh=/TLxbFVcOffd2gCQWR1V7rl8jK9Kvl2ZEoVFOrfAQj0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MlqXaPyijd9Mw9S7nXIdgu1vmnTwfqjDXZjDy0ZQfh/kH1ZUJQkRhHRZkQz9S/XFLxPsw5QeWiCIqSKN3FHno7jrv7rZ058F/u/2L9aazFwoc3i/RDnmYvVNdQQhCLR2TKVEAnF2doHQr5EmHg4vc1qeAeoYDAbHEmzhV11Zjuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 59B62q4o013399;
	Sat, 11 Oct 2025 06:02:52 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 59B62qfq013398;
	Sat, 11 Oct 2025 06:02:52 GMT
From: Alexander Kurz <akurz@blala.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexander Kurz <akurz@blala.de>
Subject: [PATCH] ARM: dts: imx53: enable PMIC RTC on imx53-qsrb
Date: Sat, 11 Oct 2025 06:02:51 +0000
Message-Id: <20251011060251.13356-1-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RTC inside mc34708 is supported by RTC_DRV_MC13XXX since v3.6-rc1.
Enable the PMIC RTC on the imx53-qsrb. Without a battery the RTC may be
powered via the micro-USB connector when main 5V power is not available.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts b/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts
index 2f06ad61a766..6938ad6dbc2c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts
@@ -28,6 +28,7 @@ pmic: mc34708@8 {
 		reg = <0x08>;
 		interrupt-parent = <&gpio5>;
 		interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
+		fsl,mc13xxx-uses-rtc;
 		regulators {
 			sw1_reg: sw1a {
 				regulator-name = "SW1";
-- 
2.39.5


