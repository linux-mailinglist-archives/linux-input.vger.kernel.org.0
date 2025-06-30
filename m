Return-Path: <linux-input+bounces-13197-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E535AED9AB
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 12:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE5757A8CC4
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 10:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD7EF25B31E;
	Mon, 30 Jun 2025 10:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="V646PLmc"
X-Original-To: linux-input@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0380F25B2FD;
	Mon, 30 Jun 2025 10:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751278809; cv=pass; b=KKGls9TR4S6IREmUXxywWs9DZvYkmZW7IttwdymI0ZmZr2I01cZL6v4YSVXCpmCJYSLJ23G8Syr/xpLoaouUGz5gZo7g5QPnBfp4jlbMv8mEfwvTJY8mdwq6+rC8sV6yDg0DFOn+BVdO55QPj2bqpJ3Ri3jLgtiqUQsi8mghucw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751278809; c=relaxed/simple;
	bh=5IKHBKNkvDIqPBpGJU+iUfBRQ0Xc7cnG5YynHtBb5a0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=us3ZFVP977znkRnI8LrtDZD0fpSNI8qW48XyN6G2V4MSMzEkCD9EOoFrgmVtwVQBaTqwytpPgmkcBGxYKuB2cU0aFSbUC8f2njDc6H1FjdS/c6MS1DAVTNIFYKMLt1Avk9s/KLAqM+8OBuJlCONtisonro+M11Acp0H7E+ElcYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=V646PLmc; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1751278786; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=R+XsFmJlOH88IPsfmTD8tDk8RlbfWYQS8CSLDpRd2LvIOpVOD7Dm3hDLgBinQLA4CNNc/G14bapI+9XdK1FGzEVMudSq9Ca0i6dOp2TyhoFyvLOx1cvb35uuuDX9r/zqyCaD5qe2oXal61UvDlH431rTVsDiA5wnv3udMAY0u3g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751278786; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DVGNQK3ovA1eStReJPPWHDBj+E6PFN3lZlWCymwT7kA=; 
	b=gg4y2DBoW9TKvUNNXly/AJWjkkICsOzIuY2Evbzn6psahfRaXgkvcS6L+f+55zBA3YCwKzLXmM8DmMKZ2R5digvIejp3mGJQWGLaKyaa/MZx+lyQ/Ulh3zerGqe2wBa9jzvTMy+yc0l5SW3fIXcbsHVKHdZ89Cb+FsAbyjvKnSo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751278786;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=DVGNQK3ovA1eStReJPPWHDBj+E6PFN3lZlWCymwT7kA=;
	b=V646PLmcVVU+4vqXaywt467wXSxznevX+2nnj9Y+ClnwXT/t3J07FZRwilpzrx9s
	l9KyRR4S+bKU1DIPh6e7jWhiiz4S6cQ1CLvrk8XsHXS6n5bRJdT1sSo6cTeC+AnkHsk
	3rI/iK9O30eumSFoaJiaZjZyPIZx4LExc/BzICyw=
Received: by mx.zohomail.com with SMTPS id 1751278785189692.9528694352027;
	Mon, 30 Jun 2025 03:19:45 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 30 Jun 2025 12:19:27 +0200
Subject: [PATCH 4/4] arm64: dts: rockchip: add HDMI audio on ROCK 4D
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-rock4d-audio-v1-4-0b3c8e8fda9c@collabora.com>
References: <20250630-rock4d-audio-v1-0-0b3c8e8fda9c@collabora.com>
In-Reply-To: <20250630-rock4d-audio-v1-0-0b3c8e8fda9c@collabora.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

Much like the Sige5, the ROCK 4D also has an HDMI port, so is capable of
providing HDMI audio output as well.

Enable the SoC's hdmi_sound card, and also enable the SoC audio
controller (sai6) that feeds into it.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
index 4d4b8ababd2436b82515443b029916b3c786dba1..70bc6f909ec0843607c2705ee9f73b0ba521a977 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
@@ -322,6 +322,10 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&hdmi_sound {
+	status = "okay";
+};
+
 &hdptxphy {
 	status = "okay";
 };
@@ -772,6 +776,10 @@ &sai1m0_sdi0
 	status = "okay";
 };
 
+&sai6 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&vcca1v8_pldo2_s0>;
 	status = "okay";

-- 
2.50.0


