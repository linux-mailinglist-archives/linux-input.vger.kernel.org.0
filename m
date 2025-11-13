Return-Path: <linux-input+bounces-16099-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A77C58E09
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 17:53:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 48DCF354CBD
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 16:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D824B346FD0;
	Thu, 13 Nov 2025 16:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J/V3HHKy"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A45C342CA9;
	Thu, 13 Nov 2025 16:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763051467; cv=none; b=dXXi7gHOziEWBEoZ3Kdv5MCuCKU9GB8tZOGhF8O5GhtbWiFndVb6DHA5MqBts0PXk6Oyi2A+fYYNYyEjU3CPQ2pd/wJeH+Tk+889ot2qDM5p9ka5Drt4maFQ/unjBkct1o7fRMxIeotKVl+V6BCEgK9Bq+XxagwU6ItPebDMCMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763051467; c=relaxed/simple;
	bh=l8dgGOvyViKqNA3K9WF/sqEXyiSpx66TJOe5rYc67ns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CvalRX7zpJhNk0V+CBYsRffmXgQlOp3oNryphw7AScnp6AlMUJGOMxbs9cPGNXQxYgoQgEpfcM6Q7JFUTrDdVaoRhGOgUYvMPjklj6IQfrqvG5iwf8GfF0j6b6xbsbaFuaKy9X0wMxPfM3DP+YainlmKRxYJn1SVUrZMeppejQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J/V3HHKy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1536DC2BCB1;
	Thu, 13 Nov 2025 16:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763051467;
	bh=l8dgGOvyViKqNA3K9WF/sqEXyiSpx66TJOe5rYc67ns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=J/V3HHKymqrGdGrAzH2tAloc1EKCaVBLZrcbkfZ8EBAnhY7l6Q/34tnsDpAzBfsdU
	 KVKsmgTtPu2IIWbhURRJT6cHgDZjKj7bTVM066JUUgnew+yUfsPQdbnEDRJ6QdzmXJ
	 SHm9yuhu4b91qS6UxzdG4rVy93uLl7/kXoEp8KUOjdwNrntkjLBtsiyD8joVT0sR13
	 R7SbseBTdVyJuFORpG47s6jJDsVEU0EEAm1seOdt9SlDgpF6Pn2u0oalUACzOElNdX
	 JMjsB98laneU71Kgt/9s8kxF9eWd+cqL7Pb7xa9LWidHfonIH523y/gdK3s21aw+pR
	 0oc1OIbajPlAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC14FCD8C9B;
	Thu, 13 Nov 2025 16:31:06 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 13 Nov 2025 17:30:57 +0100
Subject: [PATCH v6 1/7] dt-bindings: input: syna,rmi4: Document
 syna,rmi4-s3706b
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-synaptics-rmi4-v6-1-d9836afab801@ixit.cz>
References: <20251113-synaptics-rmi4-v6-0-d9836afab801@ixit.cz>
In-Reply-To: <20251113-synaptics-rmi4-v6-0-d9836afab801@ixit.cz>
To: Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vincent Huang <vincent.huang@tw.synaptics.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Casey Connolly <casey.connolly@linaro.org>, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1250; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=rwhOCivbUtBWH/U4u1pSZSbkJP3diksC8GrYstkJ/kY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpFgfJgCxB6SQi0xX/lkiQ5kGvuMriLATNx2Ns9
 QscwJ08Ne+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRYHyQAKCRBgAj/E00kg
 ctZhD/9d44CoZsa81vrG2ivCjGlQHv07MqgyoatoEJfcpFVJX4cV1PGQsver1FIxFEaHZth9+D2
 zVgBhZt2aOmpEGyjyh8zwMq+jgm20qL5CxrURRG2NU464ZKxIzyPrNLng+K/tELMxgYdetaBFXx
 6wL97x6zgb2iPFVIIBCceuXWoLe1w8gBktSF6EM4xXxvCwF0ZWbWsQajS0cNO8CSKiT/4oDVegc
 tyCATT/4v0xWTYccky22IPfH85TtlmxuwlE9OhM/je2Ql51DEqvu9lXumRSUssXGP78siZNhNEe
 wgr7202+5aTGCRq0W6AvQMq46K+oGcNj+GiFKMHz9qiAKnDHydvsl+I1QW2N0oZbYWjrQx1Uedn
 ZWjxFtvb5qRb32+IbGh2XOkXOpMj4wch6HIX1AWPknsLuJANzWrSaVsh1YK2llZOAmrI+FNsbVn
 rQUMJ93I7IRBMmtkeLIl/15lLL6f71f5mbX3marfMadlIlItO4SSpmcIfcQ+e0ft3IEfX6RLFfR
 0PdG3K4HULDm/VV+7Al9KXesZA0b63DvaL6Y/bpYzlydE8Nx20PVtRYXm+MRxfIPTKTmyJfEy1A
 4oa56CbHwbzT/+3H+VsyOuOyCBCSRAXC2t0SEpqwCRiGlU29KO1CSwF/JoZZfOUXQQaJRU7b1X4
 +Xl451tqRjgqxhg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Mostly irrelevant for authentic Synaptics touchscreens, but very important
for applying workarounds to cheap TS knockoffs.

These knockoffs work well with the downstream driver, and since the user
has no way to distinguish them, later in this patch set, we introduce
workarounds to ensure they function as well as possible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/input/syna,rmi4.yaml | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/syna,rmi4.yaml b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
index f369385ffaf02..e0e006c9c9ee4 100644
--- a/Documentation/devicetree/bindings/input/syna,rmi4.yaml
+++ b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
@@ -18,9 +18,14 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - syna,rmi4-i2c
-      - syna,rmi4-spi
+    oneOf:
+      - enum:
+          - syna,rmi4-i2c
+          - syna,rmi4-spi
+      - items:
+          - enum:
+              - syna,rmi4-s3706b  # OnePlus 6/6T
+          - const: syna,rmi4-i2c
 
   reg:
     maxItems: 1

-- 
2.51.0



