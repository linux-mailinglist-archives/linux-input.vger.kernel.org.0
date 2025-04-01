Return-Path: <linux-input+bounces-11462-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3DDA77C1A
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 15:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16770168F96
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 13:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75E61E47B3;
	Tue,  1 Apr 2025 13:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R0nXnBHK"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5D51F930;
	Tue,  1 Apr 2025 13:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514251; cv=none; b=iRRQPn2z6TP0WryxBpwNccY480mT95cUU41pLydxvi/msgAu9bFuo1pIhBDBK+F3tz+L59uRUlc5mkZtegMWzeODvgbfRDUsDMzmIUwZO68qhmsnbY7pND7VjYZO1hp2Gs7qt+6ZXC0XCtWQb20/z/HH01auw/wHTSb7gQg09vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514251; c=relaxed/simple;
	bh=Ul6lJvNEHBV/pZeVWxl97I6QputJg4xYguuegwagemc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pvM819CeKKrmCxS7j1GG+CSKBk0l6V0H+FdyNS8ByRjyotnOTdFbIsn3u8/1TCTdrf9UeABjjWebbU6j8EEAIOBiHPj4zT6ktlXrXgHA2VZVjy3sGLJpv5DyRZwA7Im0mTctipmCG9Sq/WOTWFhpY4DsIlwf0XaBPBg/z+RlrrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R0nXnBHK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2996C4CEE4;
	Tue,  1 Apr 2025 13:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743514251;
	bh=Ul6lJvNEHBV/pZeVWxl97I6QputJg4xYguuegwagemc=;
	h=From:Date:Subject:To:Cc:From;
	b=R0nXnBHK+h56PKjMT/5qxNKseT3aIYCEfkg+iICdVnAYkSyVf+/sLwKvt+lgp7A6j
	 21z3BlE6WMo64ddo54dH/lQBUyTaUC4+skd/Bi4vgl5mzyfE6ot6BQVQfRxqeI1blC
	 LTILvkFOt/nMDIVd3zOUeBLOLA7nIq9Nw9OB2z5Kt7iD5yFCl9yHzFMeruBRdCw8S0
	 4NqI/VlEitmpQ0b+XHJJF+G8Ks31zJCKYwg1eChqc6dWoqu/JrnoZ7tyNXzYsjDfDY
	 AP2U1OFkVXY7tQ+IGjEcszhGRQ+AzTjLr76qgoqv6hgjjnoP6WPMBbqf98H0k7j1pB
	 zioIngRf90MEA==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Tue, 01 Apr 2025 15:30:37 +0200
Subject: [PATCH] dt-bindings: mediatek,mt6779-keypad: Update Mattijs' email
 address
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-mattijs-dts-korg-v1-1-0f8d96bf8a99@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHzq62cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwND3dzEkpLMrGLdlJJi3ez8onRdQ4vUNEtzSwsLIxMzJaC2gqLUtMw
 KsJHRsbW1ABsjdO5iAAAA
X-Change-ID: 20250401-mattijs-dts-korg-18ef97988246
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>
X-Mailer: b4 0.14.3-dev-94c79
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=Ul6lJvNEHBV/pZeVWxl97I6QputJg4xYguuegwagemc=;
 b=owEBbQGS/pANAwAIARkNHbRmThk1AcsmYgBn6+qIuKsPabzv/RSvLVVc64fSuzem7BVylb01dply
 PyvhJXaJATMEAAEIAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCZ+vqiAAKCRAZDR20Zk4ZNbvXCA
 CJy+j4InTSuxmwJ0+YwXmooqhVHpiX5qNSmoiOGWB5L9p7+KtQPUq7HFvyg+NY6VlzVycvggb4WmHn
 J+8es2yRg3QFdORFSfoTxGfPCeClajHC8TKmZ5gMmA1X9lzP1IzbGVVcF/9xlZ5aGH5X5pSDNU1x4q
 a6hT5S9ForxGyuKHgwqMorY+CapbkDiYe+opCzp3XeBFfpVuBWvtPXIKzbdBrydalHk9OjuEAH79EN
 S43cmUIYvLyNhSZSnRbIfpwxfkLhUZgx8+oa7XIawEj5TFjjNPzAjKhWj9HSHe9zOGPBmgphhrS1V6
 50Zm2XB1BtHJeXJnZ/va5BDtuVTMvj
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28

Update Mattijs Korpershoek's email address to @kernel.org.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
index 517a4ac1bea3..e365413732e7 100644
--- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Mediatek's Keypad Controller
 
 maintainers:
-  - Mattijs Korpershoek <mkorpershoek@baylibre.com>
+  - Mattijs Korpershoek <mkorpershoek@kernel.org>
 
 allOf:
   - $ref: /schemas/input/matrix-keymap.yaml#

---
base-commit: 08733088b566b58283f0f12fb73f5db6a9a9de30
change-id: 20250401-mattijs-dts-korg-18ef97988246

Best regards,
-- 
Mattijs Korpershoek <mkorpershoek@kernel.org>


