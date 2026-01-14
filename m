Return-Path: <linux-input+bounces-17089-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8001FD1D8B1
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 10:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C9A4300B9C1
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 09:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8183876A1;
	Wed, 14 Jan 2026 09:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4RHWDhR"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6515E324B09;
	Wed, 14 Jan 2026 09:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768383071; cv=none; b=o+u26PyoczDuqy7tnJfGlUxxF62+H1vUuXe5nYB1tqEa3snSu6mztVGhIXycKigRBBMfSvH+Sf49ykUiZLdU53YWnY8VztXhH38aRvCN834g28dGu6TpHJ48ZTr2YCUkbWCRtsIclDdrYyIlQxb/mgLkuR77I80UapSzv3BDDCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768383071; c=relaxed/simple;
	bh=bLtziZlfzLupaRKZLjA5+K4TNHL5aHyGalXUz4Vybos=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RCupsnbumt8bMAhCYi7T47p/esMrycsATwdTR99Ln86JiPBieuFGKYrITKLaVewKUbODN49BOP86hdluSizR5XtxRrAWUvw0/DYy2nCE7AxaE+hMFugI7418tkBHNGucp3Zmv71dftFCShQhJ00v85CMYtgy/BFuNsi5cVjC4+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4RHWDhR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13ED4C16AAE;
	Wed, 14 Jan 2026 09:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768383071;
	bh=bLtziZlfzLupaRKZLjA5+K4TNHL5aHyGalXUz4Vybos=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=U4RHWDhRQjMftak4Zt8Lesp13qJhZjyyvyajSfSLeFSk5YX4aWHxta4xp8Pq7xBxP
	 7qVcT3iKq5wI7paeOHFY6orYzbNiDPKP5gdpRRiUp8bWGqVeeM1K98B5g6x84Dt27W
	 cdmDlhoyjVTujCJILKYSjnMyRSf1S1qwLiQ4L3vQiL0q2l+4Oc83sEzIQM1OVc+ulN
	 YgUWn4/mw4k7wB8TA5qAXRp/or2CBdpPdKZcjDLM/RtUyDhKD9sCZ38gljaYUzyyQv
	 99yPVAyu0wDbCqg8pdZnQPIVlOwPzq8MDhYQVfx+KELvQuM3gUcQGUNO1pCeaXzl77
	 4hKi46vYACudQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC6ED31A37;
	Wed, 14 Jan 2026 09:31:11 +0000 (UTC)
From: Yedaya Katsman via B4 Relay <devnull+yedaya.ka.gmail.com@kernel.org>
Date: Wed, 14 Jan 2026 11:31:06 +0200
Subject: [PATCH v2 1/3] dt-bindings: input: touchscreen: edt-ft5x06: Add
 FocalTech FT3518
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-touchscreen-patches-v2-1-4215f94c8aba@gmail.com>
References: <20260114-touchscreen-patches-v2-0-4215f94c8aba@gmail.com>
In-Reply-To: <20260114-touchscreen-patches-v2-0-4215f94c8aba@gmail.com>
To: SzczurekYT <szczurek@szczurek.yt>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768383069; l=984;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=SqsHa1FpeRSC7pDZsCiIt95zVp6duwvdtWnRvd2BIBs=;
 b=NXVOGklMCHzyDE9Vx6PjrhFq4h5CvOMmuoyJo+4WmwIuFMWGygUs/OxB/fYUrvzpiUTuw5ox6
 D7VqO1sVT4FCCXlZ1UrZPc7iBgJrDwhDo0o/be33K4qNSpL4TblsdpQ
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Endpoint-Received: by B4 Relay for yedaya.ka@gmail.com/20260113 with
 auth_id=601
X-Original-From: Yedaya Katsman <yedaya.ka@gmail.com>
Reply-To: yedaya.ka@gmail.com

From: Yedaya Katsman <yedaya.ka@gmail.com>

Document FocalTech FT3518 support by adding the compatible.

Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
 Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
index 7d3edb58f72d84ed19fb87fdd136c97f855aba00..6f90522de8c0afbe2d9d1e04578316350f66ec58 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
@@ -39,6 +39,7 @@ properties:
       - edt,edt-ft5406
       - edt,edt-ft5506
       - evervision,ev-ft5726
+      - focaltech,ft3518
       - focaltech,ft5426
       - focaltech,ft5452
       - focaltech,ft6236

-- 
2.52.0



