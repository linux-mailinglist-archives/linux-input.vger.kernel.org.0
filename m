Return-Path: <linux-input+bounces-16593-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3308CBFED9
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 22:29:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12F2D305BC77
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 21:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41020325735;
	Mon, 15 Dec 2025 21:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UW5Yk+rD"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1306B3242A3;
	Mon, 15 Dec 2025 21:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765833930; cv=none; b=Ap6QTBP0ZNwhRfJIrU0qIb2ysFSuJH1YVjjpHYDExpHYuCSmvhD8MGBd7p1kthcbkaWf2ahRJ/b2OBGIpJAw5j6J9sT5qULCYpYGMV1fBQsWc+UyixGmbl0PLytRE+/CELDQOXjXpCQ4iLMO1CTGkoUHGEu5zP9owNGbqpCxqTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765833930; c=relaxed/simple;
	bh=A//1Ln9CY1YqYbup5fuROZMVur0HtV9hrTy3DkMitho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yvfn8OYXcqvfuvMXtcHCVdS6OD8cOqKnhBRf6veTlhGDY7Qw+kyUdQqNaJFmnLHnx2N/0aKi87y9T0R4HuKawlyA9fZL7hzIBBdc8YPhGdlgCcHgfwW0LC6RfLGRf4OYgrQ7dLZ2XJNoAKMM27FpxCxUxLBLTgAII/Temwc2eeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UW5Yk+rD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BEEC4CEF5;
	Mon, 15 Dec 2025 21:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765833929;
	bh=A//1Ln9CY1YqYbup5fuROZMVur0HtV9hrTy3DkMitho=;
	h=From:To:Cc:Subject:Date:From;
	b=UW5Yk+rD+ij/i72Hc17ycUeVAtg1nK5wD8LOLs2lj6ApW9v28DidR9HEw/deIfyFb
	 oN4N55JFAglcLFy1JsJL4v/gr/TmXVs1OqKO/v2YpkDZYi53OXuzWnD7gGBgXPw2WT
	 wFVPxcUTwD3AAowxP+U1a8vqWDCVZhqyMuSOG3xOQ3VeFvYcy7Z7H0TJk9CVMB52EV
	 0ft+ma1Q6zqxInRWih51EwJd9CnXLlUMX1Z+2GPK7B0EmwsYGqLrN5oRZUikPQw0qH
	 IDBkEw285VrIzy/YRQF04WTLIVtX8kuUZKIvPXSvD8fcvUKdoNKJipYcNm4DOY1a2c
	 Y5+iPLsX9nFFw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bastian Hecht <hechtb@gmail.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: input: touchscreen: sitronix,st1232: Add Sitronix ST1624
Date: Mon, 15 Dec 2025 15:25:24 -0600
Message-ID: <20251215212524.3318311-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Sitronix ST1624 which is compatible with ST1633.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/input/touchscreen/sitronix,st1232.yaml    | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml b/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml
index e7ee7a0d74c4..978afaa4fcef 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml
@@ -14,9 +14,13 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - sitronix,st1232
-      - sitronix,st1633
+    oneOf:
+      - enum:
+          - sitronix,st1232
+          - sitronix,st1633
+      - items:
+          - const: sitronix,st1624
+          - const: sitronix,st1633
 
   reg:
     maxItems: 1
-- 
2.51.0


