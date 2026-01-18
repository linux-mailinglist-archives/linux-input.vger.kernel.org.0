Return-Path: <linux-input+bounces-17188-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B3ECFD399BF
	for <lists+linux-input@lfdr.de>; Sun, 18 Jan 2026 21:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF8083008D5F
	for <lists+linux-input@lfdr.de>; Sun, 18 Jan 2026 20:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91D6303C87;
	Sun, 18 Jan 2026 20:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/P6/bWK"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1A33033D0;
	Sun, 18 Jan 2026 20:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768768203; cv=none; b=VfbMuUOpdNffBmeUdEiUhhNTw7YJW+GNzJc0FgrPcgbSRLJWOXf/ueqBcS0m6nxATwTSlgIVUoqfmE2McvcQcg+ReKw78F25I4bFfqCA57r+oTtBwKUa4pejCjLhPDX+bQAPv+l9NaTWWCGMt43Dz6PkIoLP2D7Wsm/DPsHm4aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768768203; c=relaxed/simple;
	bh=SK1s5R3F0RMwvEvum8dSbUAcAvMjCxKmt7jgUSq3BN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qVR/em7YUC80q4ECkqfGDj2nAQ4Nvr/tyC/YckP7SvQDAtXp73OrEcVl8T+61Lv7XebaQ+VFs2cP/I7tYuJkkTYTmugFmxqtdpnJXLAjCXQ9I9EXn8zufTEqj85HYlR04p4EegCwqrW9qMi6mDDFl3as804RcAtomaZzyYUAFIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/P6/bWK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A8EBC19423;
	Sun, 18 Jan 2026 20:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768768203;
	bh=SK1s5R3F0RMwvEvum8dSbUAcAvMjCxKmt7jgUSq3BN4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=e/P6/bWK93bhJn/gnybHTNNdCK68kjl6TMSPPVJHExhPBUIDWVaINDOUR+9WKpvXw
	 aqOPdXsBoVWzexDFgfwewZUVKSBQeQaOGcelajV5VJB3O6pYpmNmenBP8bW3MTpcJ/
	 23CzD6OfAHm2iNbOwUtI2ftyVfNLpiun5E9qU26raM3XflWheYT7D+9VU5SOQMxghV
	 t7mJm+CZoFkLitrMxwDvhvqpvJ7iVp8RLpRI275HKu5MU9DGG3xYQ72JnKvz0cZyM5
	 NNVJzHlv6OLp02yZLETISpxQuDMmFKh3XFMxuNNssfEpqV1exxavsAKH25t8PSVr6t
	 wz6ZCnVizbsAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38838C9830C;
	Sun, 18 Jan 2026 20:30:03 +0000 (UTC)
From: Yedaya Katsman via B4 Relay <devnull+yedaya.ka.gmail.com@kernel.org>
Date: Sun, 18 Jan 2026 22:29:40 +0200
Subject: [PATCH v3 1/3] dt-bindings: input: touchscreen: edt-ft5x06: Add
 FocalTech FT3518
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260118-touchscreen-patches-v3-1-1c6a729c5eb4@gmail.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768768201; l=1054;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=1Bi52VIjh/c8wtJVop4mGIRRssaUV+3jz69Idk7ZinQ=;
 b=rnO1PoeLK+ZPbI/T1MmzsxTssLrHbpZzYh18ShBRx4/Ly63Miou3WZoGBwBukHCQEeaVJHmID
 RGwEt8D0zbeAbkhRgJzLn3o9nol58A1tA0fvFIvYvePiDUf4IbRmn9w
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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



