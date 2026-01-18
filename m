Return-Path: <linux-input+bounces-17189-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA21D399BE
	for <lists+linux-input@lfdr.de>; Sun, 18 Jan 2026 21:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8B67D3003489
	for <lists+linux-input@lfdr.de>; Sun, 18 Jan 2026 20:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6353043B2;
	Sun, 18 Jan 2026 20:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iR8jcyfb"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC22B3033D3;
	Sun, 18 Jan 2026 20:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768768203; cv=none; b=STvWpJNRNtvQ5uGE5LDOdbLV35b85OMf9wVO8L01frwKvEpPHLODI2GIZT9HcXTKVdY75rTcgfkR21dJFn6RzfgEcN74cNWOTePMUKkO1KvnlA3Eaodm7d3aP855RRqd8k4iPo2w2Sk75GLevjDWaw4VewzUbFgpeteJNaH+m+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768768203; c=relaxed/simple;
	bh=G/f30v6lQkvmDIQFoVqloKM2BD9viAvOR3UG4PVznmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TISugxGyCQMIt/N/3nUCmort0ab0Zz1Qe+GjKkmm2oKqky/l9fiJLEryfHxVRiNUjPjDyT3Yv8Eh94o5/E0zPgfmFFnm8B4VVSTT3mxWSDANoR4uzMftjeCKyNXpdLOl/90rfOdykI7iK02bYhFgVOn1HT6fVfmfC4/Mgyg8KuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iR8jcyfb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EA1EC19424;
	Sun, 18 Jan 2026 20:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768768203;
	bh=G/f30v6lQkvmDIQFoVqloKM2BD9viAvOR3UG4PVznmI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iR8jcyfbFjq0Z+J2GCY19TnF5mnlqQLUqoFM/XU+8rR4NGs1q/mGs3EFgyLz4D0e4
	 9VtXc0F4UosBegm3lpfMIpnh/lyUspx0EKssG4X+cF99hagKfduq2vCO8jid2L4Ujd
	 rRYXS4ptcLGSqjD+7RBIKaT2uXfLi8Jl4tpmGTgihR4Acf9KjQRnL1hs4cq6hc12Uf
	 mNXVhlECJKisTdjDxN52LgR51PJJ6HgkE9vFWpFlxYUBCuvehwYv72TP0BLmSBVr97
	 VbtUd2fLTm2GfJezRBtDSJAJWOOOCEJFBDQ2wYRyIzZCBvH7GJNthH1EaiDipfFIE9
	 /4U2CL1w9AaZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6FFC98315;
	Sun, 18 Jan 2026 20:30:03 +0000 (UTC)
From: Yedaya Katsman via B4 Relay <devnull+yedaya.ka.gmail.com@kernel.org>
Date: Sun, 18 Jan 2026 22:29:41 +0200
Subject: [PATCH v3 2/3] drivers: input: touchscreen: edt-ft5x06: Add
 FocalTech FT3518
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260118-touchscreen-patches-v3-2-1c6a729c5eb4@gmail.com>
References: <20260118-touchscreen-patches-v3-0-1c6a729c5eb4@gmail.com>
In-Reply-To: <20260118-touchscreen-patches-v3-0-1c6a729c5eb4@gmail.com>
To: =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768768201; l=2144;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=0VBVyZPt9Idgohqi3iHfe82h1fr4SaGPlZ5cS2FCQFQ=;
 b=9IJc2CyT4JRuq6lwxsNoO9EII8BPqj4B6kreWbyVCRfXc64i7rlOmMMapb9hH7/IMzpnNKI9B
 lLpeiewu+T5DeFSx8SU8Mv2ao6hwKVy1szAdsXCRq48GOZ5Jj9UiMui
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Endpoint-Received: by B4 Relay for yedaya.ka@gmail.com/20260113 with
 auth_id=601
X-Original-From: Yedaya Katsman <yedaya.ka@gmail.com>
Reply-To: yedaya.ka@gmail.com

From: Yedaya Katsman <yedaya.ka@gmail.com>

The driver also works with FT3518, which supports up to 10 touch points.
 Add compatible data for it.

Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index bf498bd4dea9651ac939fe137b1c0f05e8557962..d0ab644be0069b5ab29ed037fa090a4279870193 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -1475,6 +1475,10 @@ static const struct edt_i2c_chip_data edt_ft5x06_data = {
 	.max_support_points = 5,
 };
 
+static const struct edt_i2c_chip_data edt_ft3518_data = {
+	.max_support_points = 10,
+};
+
 static const struct edt_i2c_chip_data edt_ft5452_data = {
 	.max_support_points = 5,
 };
@@ -1503,6 +1507,7 @@ static const struct i2c_device_id edt_ft5x06_ts_id[] = {
 	{ .name = "edt-ft5x06", .driver_data = (long)&edt_ft5x06_data },
 	{ .name = "edt-ft5506", .driver_data = (long)&edt_ft5506_data },
 	{ .name = "ev-ft5726", .driver_data = (long)&edt_ft5506_data },
+	{ .name = "ft3518", .driver_data = (long)&edt_ft3518_data },
 	{ .name = "ft5452", .driver_data = (long)&edt_ft5452_data },
 	/* Note no edt- prefix for compatibility with the ft6236.c driver */
 	{ .name = "ft6236", .driver_data = (long)&edt_ft6236_data },
@@ -1519,6 +1524,7 @@ static const struct of_device_id edt_ft5x06_of_match[] = {
 	{ .compatible = "edt,edt-ft5406", .data = &edt_ft5x06_data },
 	{ .compatible = "edt,edt-ft5506", .data = &edt_ft5506_data },
 	{ .compatible = "evervision,ev-ft5726", .data = &edt_ft5506_data },
+	{ .compatible = "focaltech,ft3518", .data = &edt_ft3518_data },
 	{ .compatible = "focaltech,ft5426", .data = &edt_ft5506_data },
 	{ .compatible = "focaltech,ft5452", .data = &edt_ft5452_data },
 	/* Note focaltech vendor prefix for compatibility with ft6236.c */

-- 
2.52.0



