Return-Path: <linux-input+bounces-11478-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A74F3A79555
	for <lists+linux-input@lfdr.de>; Wed,  2 Apr 2025 20:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 332603AF507
	for <lists+linux-input@lfdr.de>; Wed,  2 Apr 2025 18:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D5F1DFD83;
	Wed,  2 Apr 2025 18:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aTjQKwx+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50C11DDA24;
	Wed,  2 Apr 2025 18:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743619497; cv=none; b=HIFwRt8RijusZp2Benr/fYRFQSlyA6z9QAsH89sns4uMgGUoTpy1bjRuDZXDuR6CnOhAQc4W7LrSPm5vt7lNLr5+y37RO5rECJx+L1+n6L2x62Tx6JR9gutByfgkBBE0oqNfZhsibSjM+UN4QgRw2oXq4i3mLW0A+puaIAHk/dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743619497; c=relaxed/simple;
	bh=mt3wE+MsBBcGD6ggCzr43GLEE0Jjapqy0DoWPLDsuAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dYLSdrTv4ontRb6T5Y15NmwKws0+O3FuJPQLnxJCXrjRaHIPEgJnw/nhF3y5AXN5j4ZL/l4OMDJtRzg9zfaVsB1YhRPK3j7xkOCX7YcOoJASv586CkKjdMpokLT5HEdO1ujWHm9BeoXW7ZSvHQFr+I44+3bF1BHY6h87BjyIAIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aTjQKwx+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61067C4CEE8;
	Wed,  2 Apr 2025 18:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743619497;
	bh=mt3wE+MsBBcGD6ggCzr43GLEE0Jjapqy0DoWPLDsuAw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aTjQKwx+buZ02HtwRABPJdnwleA8CsGGWvjaZvlTqVDp/DRyGCUqCwYshWz87fe2n
	 qqCsd+6PFtiNKM9Z1yR5E4nOaxl4KgdcyvoNLqfpd8at/yOOHr8nYzFnGCdbM5cHaW
	 Clk4XcfQgFxtNtA68b4H1jvlgdnSQ5lfMM3xF/lObq60qLgdFbLC4945rXgjK8emE1
	 58pb8LnL7LkwJs4a3QT3elu0piMo17/nSBfGNtjLbK7U/bWJfyyIvJPb/gieQ1IgvM
	 qwXrT1HmeiuBvZtZgmyTF9cwTJJVCjxJqCqj0Hp+uEVZbCDepvLElFBpRCqLjJfwAp
	 CRF4WjBXgfB8A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E41C36017;
	Wed,  2 Apr 2025 18:44:57 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 02 Apr 2025 20:44:52 +0200
Subject: [PATCH v4 1/7] dt-bindings: input: syna,rmi4: Document
 syna,rmi4-s3706b-i2c
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-synaptics-rmi4-v4-1-1bb95959e564@ixit.cz>
References: <20250402-synaptics-rmi4-v4-0-1bb95959e564@ixit.cz>
In-Reply-To: <20250402-synaptics-rmi4-v4-0-1bb95959e564@ixit.cz>
To: Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vincent Huang <vincent.huang@tw.synaptics.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Caleb Connolly <caleb.connolly@linaro.org>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1244; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=gIdWscr+Jqvsk707l9xEQnt4g2c2mNRlbPov8t2ekx4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBn7YWmm94NXqofT7XHkun4456S/omngFthawuI/
 E08x/7b8OSJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ+2FpgAKCRBgAj/E00kg
 crtTD/46/cU7EY2JWszwm4hLlXx6LZEpm+URrZCQpo2ii6zbwAdzRrWF8yaDWeD9zLsKB/f5XlJ
 G8tSJq1udn+CmVxZXtm/a2qMSAAddvziLcDKSl27NWgokHzdTEGVSCSrb/f6MRLbLVm1kgOraX3
 bgzuBIO8RS4Bp83lx1Q7gbjoKMhALiDuQNfRJt1KOSpjuIq5H84sLmK49mqFbQEeBIWEOnyO09c
 mJKMZsnvyyKqU7A05axvB6jWOaLfdSzlJiY7ckFBrs4e9QcAA2FinXTLIUZWWBcEbgzaWU8sB+h
 NgvCrVxE1PV5GPJYf/XhM19o5kHfTe2ZFs/eaPCACCg3qYvkREYdCrodxPrz1Mr4KUgXPDPjCrY
 SqkgSbaEsZMAlTs+3BMbWVXVk8f2OrHu6vYF5qUMehUcvUFlAXqxC1rX2aXwONOSNE2eaOvdSy+
 Ch3JrjWCazi1iWXcnCItGhvUjfrC4o+SLipmcqEUdBK5PZpyiEX19NB4nrzPviFBHltSCRmF+qK
 CUtd1fXjidYTDaITnezz+ekBLJ1wnVHa4G1p1fVIH+oDVRYWxeQVfIu//qO6qzDcA5qb+8oGWss
 bcwUTJvIj6pMf7m+ggEthsN5Htl6iW8QguRnyBgJxT4gXJOv9YxWmc1f6ztbd6fig+/ji8dGJzk
 +9P1xSsTgHaEelw==
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

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/input/syna,rmi4.yaml | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/syna,rmi4.yaml b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
index b522c8d3ce0db719ff379f2fefbdca79e73d027c..855614718bfd1c6c41805d64e713cf5635c20f10 100644
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
+              - syna,rmi4-s3706b-i2c  # OnePlus 6/6T
+          - const: syna,rmi4-i2c
 
   reg:
     maxItems: 1

-- 
2.49.0



