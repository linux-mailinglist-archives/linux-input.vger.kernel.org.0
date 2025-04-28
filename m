Return-Path: <linux-input+bounces-12028-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFA9A9EADE
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 10:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0BD27ABC6D
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 08:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F9325E471;
	Mon, 28 Apr 2025 08:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EWssw/de"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF43A153808;
	Mon, 28 Apr 2025 08:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745829324; cv=none; b=SGdWCb+d+gshzBy4FV59+zOXJY8xHKKyVYW3jTWNaitpfx9kE3GgEmCYTOGHtp8cPztZljghXeFPivWfyn6s/C3RbFIDj/DG9CfYPxu9QzyXwONfO1d9Drj0xiEXU4guJlADIYgWzFQiai4LYMRsLAY3wE90IRPEOMLp05onRU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745829324; c=relaxed/simple;
	bh=klD0yv01bNm8wfCoVGBvRVDfqDEPJmac1efJ8e3eiuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BV9Nkp1rUEuQvji4qGl3qXhA2D9jP5LUYi1uRTDZP8hkm0F4igqtm/XGd6ZA5Rl66tTOh9Ot6FITQez599mYYDtjNa4QqodoX71IbRUqAyWt/dUeYzNEWUSSpgu1B73xmTKh+HoYF9LUG79maJ690cibykUFYlUeVydrx1flpf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EWssw/de; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDBDC4CEE4;
	Mon, 28 Apr 2025 08:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745829323;
	bh=klD0yv01bNm8wfCoVGBvRVDfqDEPJmac1efJ8e3eiuU=;
	h=From:Date:Subject:To:Cc:From;
	b=EWssw/degF9d52y01LUX3btS1KaiMEgTm8vT9UI7TXsPEy8aku9mD+fpzl6p7usS+
	 QcA93ZUz+uxUgPIFXKKqI5efNteLeVSBu/cIsGrQIthKcUZzgIzTliWMN/2jqhB+SD
	 TG4Dlet4Rsh9XkFXp//cD+rpnRTWYpmFlVIfLD8/qfc7BPNMhPes93ed97zYCB27Ad
	 kDxG448m1u+t9waz7UhPLdi6bZLD57cBVTeg7dYaHcedOgdMTgtYJZKWH6WZrJTQKc
	 tiQMA/aZgrU56G8QD1HWbPur0Qx0oUQqmwATEWeFSCjfs4qKZlivNUH3NdG/cgDUY7
	 mwRqk3wPbqq3A==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Mon, 28 Apr 2025 10:35:13 +0200
Subject: [PATCH RESEND] dt-bindings: mediatek,mt6779-keypad: Update
 Mattijs' email address
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-keypad-email-v1-1-dde6ac76725b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMA9D2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyML3ezUyoLEFN3U3MTMHN2URIMUE8s0E8NEIwMloJaCotS0zAqwcdF
 KQa7Brn4uSrG1tQCLzcXtZgAAAA==
X-Change-ID: 20250428-keypad-email-da0d49f41a20
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.3-dev-7b9b9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1315;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=klD0yv01bNm8wfCoVGBvRVDfqDEPJmac1efJ8e3eiuU=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBoDz3IMCv1w77XgX5NrlwsfIOOrq7C9ZyynIyHL
 xD7dUlX1seJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCaA89yAAKCRAZDR20Zk4Z
 NduXB/0f7JL64NbMpgZ91HFYYNb/FNnjQYOXVD/hnH0iIEGh8QkXpJyoHRfCk9pWYrekxRW5FBM
 8I4wPQyEepyHbWa49tQspk6xU/Vp7vwQuY0mtxeHZewHtRDxSqIXqaCaXLXp+XOfqQfXs6wMSxc
 yOGKU1oDrJ/W09S8HzM5RZtV8Lq04e2OkeMyeunabYfqMxPl+1XSVCyqjbGYwWlxNDJnPZElNFv
 5Eyg7jjmQ5caLlvqreAB+E1cuMaTOM4GEBGXmdUMfwdaXNveAl6gZQKBEjIybWJzwVpAEf+hZ+5
 4IHhRo7A+vgpAIEUPt8MK2qJj5Ni85UzoNu5ShVWvAAOLIFJ
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28

Update Mattijs Korpershoek's email address to @kernel.org.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Hi Dmitry,

Would it be possible to pick this up please?
My BayLibre email will no longer work soon and I'd really like to stay
involved with the mt6779-keypad driver.

Thanks!
Mattijs
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
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250428-keypad-email-da0d49f41a20

Best regards,
-- 
Mattijs Korpershoek <mkorpershoek@kernel.org>


