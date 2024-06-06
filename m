Return-Path: <linux-input+bounces-4177-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 170208FF47F
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 20:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B091F286321
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 18:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A531990DB;
	Thu,  6 Jun 2024 18:16:41 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from forward200b.mail.yandex.net (forward200b.mail.yandex.net [178.154.239.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10392110E;
	Thu,  6 Jun 2024 18:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717697801; cv=none; b=NP/v8fpgW5pinAdMxwY1YuLyYwBk6cJFSz50PcDuv5YsIQy/t+YLrCuaR/vgtgrDHC4fZ389TJAHV0tKu2o5nqCCY5ZQYRNB5/JcC0nxpA+Y5po3yZIa0CEW72IIl2jiOAaCv7JWsMm9eO7Q8Fss4Do4ZZcT4bjyVkjNE9mVrCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717697801; c=relaxed/simple;
	bh=hFVIPfL+ncnejIkZMNZ64W6Y6Etv53HKHSG/0RAIZ0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iUbSnug0A8fV8zeHiF2NM3z6ulHea29AaaFZfTZcHXrv/w8GyldsuGogGIV6+TuntDr3/B11lg1vZ5FbAJVOOB1SncsGGfhNgQusqgVQDNPdaBBFK2X6bZ7iwEZOHU94OKdhHKqS1aJqSrEmwQ9ezOptRrIwVUg4q8n4YQVPKAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=travitia.xyz; spf=none smtp.mailfrom=travitia.xyz; arc=none smtp.client-ip=178.154.239.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=travitia.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=travitia.xyz
Received: from forward101c.mail.yandex.net (forward101c.mail.yandex.net [IPv6:2a02:6b8:c03:500:1:45:d181:d101])
	by forward200b.mail.yandex.net (Yandex) with ESMTPS id 7E21665BA4;
	Thu,  6 Jun 2024 21:11:00 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:5c02:0:640:1c2d:0])
	by forward101c.mail.yandex.net (Yandex) with ESMTPS id 5E00D608ED;
	Thu,  6 Jun 2024 21:10:52 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id SAexc4cOm4Y0-fMx1eK5J;
	Thu, 06 Jun 2024 21:10:51 +0300
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net; dkim=pass
From: Jens Reidel <adrian@travitia.xyz>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jens Reidel <adrian@travitia.xyz>
Subject: [PATCH 2/2] arm64: dts: qcom: pm6150: Add vibrator
Date: Thu,  6 Jun 2024 20:10:27 +0200
Message-ID: <20240606181027.98537-3-adrian@travitia.xyz>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240606181027.98537-1-adrian@travitia.xyz>
References: <20240606181027.98537-1-adrian@travitia.xyz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a node for the vibrator module found inside the PM6150.

Signed-off-by: Jens Reidel <adrian@travitia.xyz>
---
 arch/arm64/boot/dts/qcom/pm6150.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm6150.dtsi b/arch/arm64/boot/dts/qcom/pm6150.dtsi
index 6de6ed562d97..d48cf92bda78 100644
--- a/arch/arm64/boot/dts/qcom/pm6150.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm6150.dtsi
@@ -166,5 +166,11 @@ pm6150_lsid1: pmic@1 {
 		reg = <0x1 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		pm6150_vib: vibrator@5300 {
+			compatible = "qcom,pm6150-vib", "qcom,pmi632-vib";
+			reg = <0x5300>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.45.1


