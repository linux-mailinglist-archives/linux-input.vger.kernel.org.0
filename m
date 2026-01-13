Return-Path: <linux-input+bounces-17062-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFF0D1AFD9
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 20:16:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5577D30B682E
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 19:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59A335F8B6;
	Tue, 13 Jan 2026 19:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lT7EAzG+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6EA35F8A0;
	Tue, 13 Jan 2026 19:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768331574; cv=none; b=CmI8ikPzWotyYzeyIdo/TuVWvDWJ+QwwKICoxjZRTNNXoQbQZ026HzqwhLGnbZ5wOWGJWycURLmsHn5YlVCGLLrEHRPqzl4EnGhpjOr3fb38JMXJzf/7ldjpAgxo1gnqAmnOZSDbJCZuKUB1p5bIO+Dbb8FA8+Sp2dpq11qsCzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768331574; c=relaxed/simple;
	bh=I5bOHrZOVN2snoAnMSWl4gCYqfsxGKcd0afv25LVdkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KCz3jz4RQWhnjU1wY/jxt5KyP4NcafHxNSpnVADZoGp0eGpWlVYF14S4fbUCc1Cq/46BF7KTNhcGRRunpyW+xNlZVxNfFj27/+xaXmWLCuUxiL3y76UuY3QcNLs6FbH6xO9ihww9z8BB1R3UhCunwTYmrBnqflVhK0hbwnveA+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lT7EAzG+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F864C19423;
	Tue, 13 Jan 2026 19:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768331574;
	bh=I5bOHrZOVN2snoAnMSWl4gCYqfsxGKcd0afv25LVdkA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lT7EAzG+KhVkWev8X9m5T1BUzy+uHPYx5YXv8xpJI0C/nVzd19oN6lLkWmE405yjA
	 Jq6LVluCPDzj83odsXQ9PSdI4gPWUiwRbbSlP/zc78XFd2AKDIyrmtGsSoStHU4LVy
	 HsLz1NVKhtNNMWNgXFqAAiS4M3U+ORpIieKUxCCm9zkxULWCcr/lvghx014SrNR3Q6
	 pgeVIy9j+dWbkghyFECADJge7q/1nBssFSdlczcuD+QNATIrP4MA9z7cxvn+MSTZ4O
	 6cBbtkB3gwRSYEn/WIIdrLESMJj55V5G9DxD/LEJun8DC6tuvRQNC0kOo/ZeA6BcLA
	 AAlQqcBZoW+mQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22AF2D2F35C;
	Tue, 13 Jan 2026 19:12:54 +0000 (UTC)
From: Yedaya Katsman via B4 Relay <devnull+yedaya.ka.gmail.com@kernel.org>
Date: Tue, 13 Jan 2026 21:12:35 +0200
Subject: [PATCH 1/3] dt-bindings: input: touchscreen: edt-ft5x06: Add
 FocalTech FT3518
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-touchscreen-patches-v1-1-a10957f32dd8@gmail.com>
References: <20260113-touchscreen-patches-v1-0-a10957f32dd8@gmail.com>
In-Reply-To: <20260113-touchscreen-patches-v1-0-a10957f32dd8@gmail.com>
To: SzczurekYT <szczurek@szczurek.yt>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768331572; l=968;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=VDXUFEuv3upbN0UDPU183YTwX159OGx06IcuT+Bl75c=;
 b=4HaDIpKbTWlZzeQ7JMrY/tTSkxG/wHVoHsaFj5UBJNVl9MRBSwINoOKNa8vAXkMddQ6M+GQk1
 af1tnPBcZnVAR1sg20jGtkpKA3Xbo+theHddb66uWiOazOQ2VTunYPe
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Endpoint-Received: by B4 Relay for yedaya.ka@gmail.com/20260113 with
 auth_id=601
X-Original-From: Yedaya Katsman <yedaya.ka@gmail.com>
Reply-To: yedaya.ka@gmail.com

From: Yedaya Katsman <yedaya.ka@gmail.com>

Document FocalTech FT3518 support by adding the compatible.

Co-developed-by: SzczurekYT <szczurek@szczurek.yt>
Signed-off-by: SzczurekYT <szczurek@szczurek.yt>
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



