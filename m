Return-Path: <linux-input+bounces-12064-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 204D8AA07D4
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 11:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25CD73B086E
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 09:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45A152BE11B;
	Tue, 29 Apr 2025 09:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="OzCNh0Dr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB732BCF54;
	Tue, 29 Apr 2025 09:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745920594; cv=none; b=A9Ca4c4RmqKzgGWJYpKo+OrppzdNuLkKBcCqRHrCFfCt4XZZ6SS7Qe57pvMxbJYP6QylFQFbF4RBeiF74UEsP0Oss3NSA6C/rewMgHkzz/azF8r14mN0IWW3ulkV0L95bduc/7Ps/0Lxbol5vcAXmVMY6Ny+TEpsFcuMGUXYDeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745920594; c=relaxed/simple;
	bh=QK/b73spM203lHmcwL4U06QdCZ6NzmAeNXW1+LR6zV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KuHBpdW9zYB8ZShTzCxGoPga4wxo+O7XG8TQmikWJW0TAxK5Om31e/Fxc2yw81kDAuprkAssZbViKGG/mHe6x8iYmyyZ9S8QvxnIDbfAl10ffaMtl67Hl5xlnhityTapX8GCtvpD5viK6pjUwUtSz5FCR1KPobntN+d6hQgwphU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=OzCNh0Dr; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1745920588; x=1746179788;
	bh=5M8UB3lb8YXwFi4Sz7fw55A9f2CgUuDRhzX/fbPMljY=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=OzCNh0DrIa20jkDePwlTQAFNS1mNkv50sYS9VmdUIhd7eitQYer9WkGfdJQRGCXdj
	 iZzjjMNGpvewGakfhuOujoLw5Vz8uyb5UXZf03u3Usvz7giaeYBOal0AG0eVgcYHNg
	 xVXCm6QQ+CGIs9h09iIxS7kUq69IeDuQ/kkhoHsmkOC0xfP1jQRSOFB2FnZTsQBtkL
	 llNpNVHutE9TC77TVtQbpk/kWxWoFjlG8sbj9AV+rtH6Gj5FWTSIdG//TKcgD8DDB4
	 9zMXq8LJKGcBB5IPQNy5F8dklqKtut7+lmCPvuvSX3q6ihl2CCoh9lfghA0UBngFR/
	 vOur9/y2KyvAg==
From: Esben Haabendal <esben@geanix.com>
Date: Tue, 29 Apr 2025 11:56:11 +0200
Subject: [PATCH v2 1/2] dt-bindings: input: touchscreen: goodix: Add
 no-reset-pull-up property
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-goodix-no-reset-pull-up-v2-1-0687a4ad5a04@geanix.com>
References: <20250429-goodix-no-reset-pull-up-v2-0-0687a4ad5a04@geanix.com>
In-Reply-To: <20250429-goodix-no-reset-pull-up-v2-0-0687a4ad5a04@geanix.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745920580; l=1033;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=QK/b73spM203lHmcwL4U06QdCZ6NzmAeNXW1+LR6zV8=;
 b=HEYlnnKte1rhMuk+miZPOQL+TJM0j6OLfJCF8+SCpKWcfCo4y4gJAdHiJ3C9QGyau2cFHTc8S
 qRo3nP2K8gcAXWrZDFL2i1iDOE/hb6zlpozS5eT+blFs86JeyLz8Rh2
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
index eb4992f708b70fef93bd4b59b9565123f7c6ad5d..21ac13046b6e021eeb403d854aabc945801dd29f 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
@@ -45,6 +45,10 @@ properties:
   reset-gpios:
     maxItems: 1
 
+  goodix,no-reset-pull-up:
+    type: boolean
+    description: There is no pull-up on reset pin
+
   AVDD28-supply:
     description: Analog power supply regulator on AVDD28 pin
 

-- 
2.49.0


