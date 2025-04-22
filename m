Return-Path: <linux-input+bounces-11927-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B68CFA9708B
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 17:25:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1915F17E7B4
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 15:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EC828FFF0;
	Tue, 22 Apr 2025 15:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="cYDHm37A"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDB528EA7D
	for <linux-input@vger.kernel.org>; Tue, 22 Apr 2025 15:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745335404; cv=none; b=Y37WCvEG5kmzkJlVZTYgDPk2J01CJ0DfuD3hTngzCUkniN2GLDGJoUO/6L7YUL0gUXx3lezUKlQgomMNJhZBgLLvdFruCPDPr3U7q419yGRmxe3x0YGUVNoKebzA4EfQd8V/LqUuPnyaTBrzdSww1/odExfSXLUlGu67MHMzZ4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745335404; c=relaxed/simple;
	bh=ENVcO6fJ07Q9ue66u/qiSIcncXd28QyJZIW3G5Jd6VU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C+4FQe7Hm/vwrMt7cSyTmAb4vCs+LhHegEg4EQsS8B6Zex9Yuj125reTtl0dVG7V/reWN2byjL7TKdsJpH3UEm1kkWtiXb26awoAalUqOJ+DrU76hRsrKFek4oAHNE3CJiP6z95U9CIG0hzVcbNjx5openmeAsgfDfztCqMlNSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=cYDHm37A; arc=none smtp.client-ip=185.70.43.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1745334914; x=1745594114;
	bh=bp+Gp0KHAB3JE9AJDw/mdtN3MLyCWZjeKfW4QBlVxh8=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=cYDHm37AXU7ay9QSebFJ0KhfHG0FZhAvvmCB3L11RHlqh9KEzmaYwAG582QbYrbSu
	 G7z7wUecBnQp2h+WgEveSgvSUQ2OfJLNhMhewsMR5HslNClDzSu4tpL1cu3AfAARtG
	 /qfjOJNB071fAIEL8K2e+HB/hfcx8liEioNLO8H5TyxxpvlsWJz5o6FaSh/dyJCh8K
	 nrt/lZmBkBNzMVMnu6gckI7uiATFTJJafMh3hNnBOVrVe0jaxyW6Ox13+9UG6Y31C6
	 NRc6iFm8Uz6zuZXrr+rEZcjOuNYCda1txSHfqN8VWnAfXrqYWOsrOCukptnus5HRs7
	 J9F8qzryBOaQQ==
From: Esben Haabendal <esben@geanix.com>
Date: Tue, 22 Apr 2025 17:15:02 +0200
Subject: [PATCH 1/2] dt-bindings: input: touchscreen: goodix: Add
 no-reset-pull-up property
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-goodix-no-reset-pull-up-v1-1-3983bb65a1bf@geanix.com>
References: <20250422-goodix-no-reset-pull-up-v1-0-3983bb65a1bf@geanix.com>
In-Reply-To: <20250422-goodix-no-reset-pull-up-v1-0-3983bb65a1bf@geanix.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745334911; l=1026;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=ENVcO6fJ07Q9ue66u/qiSIcncXd28QyJZIW3G5Jd6VU=;
 b=FMIQ+pa/+Zxa3ZyfSAm0zfLEYEQTf6zqo0YFM1UXQt6Yf1bddxDeYCndGv6286smfaUMHxynI
 XC2Ac4jlqqZAWocPikGzEoVR+cmq/yziopysGMEbz+x4eS9CVpEFcD7
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

This should be added for boards where there is no pull-up on the reset pin,
as the driver will otherwise switch the reset signal to high-impedance to
save power, which obviously not safe without pull-up.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
index eb4992f708b70fef93bd4b59b9565123f7c6ad5d..7e5c4b98f2cb1ef61798252ea5c573068a46d4aa 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
@@ -45,6 +45,10 @@ properties:
   reset-gpios:
     maxItems: 1
 
+  no-reset-pull-up:
+    type: boolean
+    description: There is no pull-up on reset pin
+
   AVDD28-supply:
     description: Analog power supply regulator on AVDD28 pin
 

-- 
2.49.0


