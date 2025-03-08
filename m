Return-Path: <linux-input+bounces-10645-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E127A57ADF
	for <lists+linux-input@lfdr.de>; Sat,  8 Mar 2025 15:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EBC016DCB7
	for <lists+linux-input@lfdr.de>; Sat,  8 Mar 2025 14:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDEB21B4152;
	Sat,  8 Mar 2025 14:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DTSuNGxa"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB587482;
	Sat,  8 Mar 2025 14:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741442924; cv=none; b=nEsz8mFG4jxuN5clt3QkPQaBMW30Ps+3E1K/MKAu4u0ePH+z/H/pS/r7HR8zBus002Kl3fNaBhEL/pXplDRC/PC3WNtiNbWT196hYBefIzO7nLVvbpbRVJ88qhcvg8Ta3yMyFCBpSN4FqOxz3BUwKnKf3j/de/mdEMg3B+NIdpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741442924; c=relaxed/simple;
	bh=4IIqHb1ubbSm67oPA82YiDriXUvqZ8bRVc5tBk8MEhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gnXxT/I3zYxesswuu+Xk+4sOSYJefVqxt2khCzKFgsgvh/95/2rXVFDmQAog2Y/nb6IOYyFTs7O85xmS7UFL4Gmr5/e5oXE2pgBq7q/J8G/3CXqVzLa0f1sk70mpZZnzIVDFyiRUD3Acf2ZkdgMjDdqbzxARrL1+r/erOgyKUfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DTSuNGxa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17E45C4CEE7;
	Sat,  8 Mar 2025 14:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741442924;
	bh=4IIqHb1ubbSm67oPA82YiDriXUvqZ8bRVc5tBk8MEhk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DTSuNGxafgTn/oFVNzDjglqWzoNgBO/pS5y+FCBgBzCyL3cQQc30bRetgaD3BZm6U
	 cFKZcRAuf07w+g3/RKddzP9i5aW+ARPG5Dvbg3EY58dJV89JVXF7vaOJluZYGV1XpA
	 2ApUevdh/A/+g/3iS/v4GIgu5eeaoDo6ayn0Y10mrV8ykNyb/mwppKFYSJSnJ5EDbk
	 dvRCZlRu27doPTN5jl5nFKPWbr0pOKhvrUO5WLAuNaP23NyVXaU+ET/llHg54AdeJi
	 rnpIqmA/gFUHsKYI70ObUUGDI+2EFnvdrFy3BZUOR3NtNPcAAPj8AkD89fiuFbZnPN
	 dR93547BBeGGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EFA8C28B25;
	Sat,  8 Mar 2025 14:08:44 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 08 Mar 2025 15:08:37 +0100
Subject: [PATCH v3 1/7] dt-bindings: input: syna,rmi4: document
 syna,pdt-fallback-desc
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-synaptics-rmi4-v3-1-215d3e7289a2@ixit.cz>
References: <20250308-synaptics-rmi4-v3-0-215d3e7289a2@ixit.cz>
In-Reply-To: <20250308-synaptics-rmi4-v3-0-215d3e7289a2@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vincent Huang <vincent.huang@tw.synaptics.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1840; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=jfmUi6aalLoxYMxgZ9dsU2ijbzSO/6EcRXn0H1q6Lhw=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBnzE9pmemkpBW5RebUKjneZXgHyLcvBe53wAiOD
 /zx7wh9UG+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ8xPaQAKCRBgAj/E00kg
 ci7FEADNz7N+u/eG8cZSNAFeLMmu9Y8psA4jZYFiNqxKdCX7tOnd79NgC7Z87+Pw684EMK2AZLR
 IzZQRrtS8R/8ZmbA8VNG7FqFOHcsbQ1tm6NpxiE9+yvhZvJFSOJBtre4/U56V7CP7Cr0feg3ALu
 +UBSpGrGBc6TExUgP3Inh9ybV/RUdsPkWwNQ9DBxmHqOMwECGf1bITBvvmsleB6DDlAw4jzLNLw
 X3gJH2V4xVJiu1tqkAAgW5QMh2Jse+eE2H0RWdk+ageDilyzM8dZVL8iYYizV+rFeWWTRfqr/PV
 wV2nkeKxsLCbfA41O1SA1KEwkSVhh+e2hCgz8xQQIwr31TpQW5tHdO4qAV4G424uq0n/al9rAQn
 o9ClrXLzW2Mg8sY9J6oMkpvmqITYCcQDnLvmJ9KjkHQnSX15RHqztGT6a4P4tTzsTXHFECHhG7y
 sVaCJZXYWDpzCX6HzsilPg67wbWc8qqgwNpXFmOX3YiDaHTi6Joc0R1lKL0P0+id/93pQwkqjdl
 mEhrCDz12ZP9IrXRGjMuwtcILKtawkePnRGf6agrQ0uihH6yLZIX56jgSmWe2lNoH52dM/0FL0n
 a9xkf3wq50swfPgeHg/Z/nkl88uLlyjk5lr0mFk2MR/9egBbCRZCel1bpIB5TZyJF9xRAGhRVNj
 J+wO6yADY/u6QAA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Caleb Connolly <caleb.connolly@linaro.org>

This new property allows devices to specify some register values which
are missing on units with third party replacement displays. These
displays use unofficial touch ICs which only implement a subset of the
RMI4 specification.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/input/syna,rmi4.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/syna,rmi4.yaml b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
index b522c8d3ce0db719ff379f2fefbdca79e73d027c..a80ec0c052cb1b7278f0832dd18ebd3256bc0874 100644
--- a/Documentation/devicetree/bindings/input/syna,rmi4.yaml
+++ b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
@@ -49,6 +49,24 @@ properties:
     description:
       Delay to wait after powering on the device.
 
+  syna,pdt-fallback-desc:
+    $ref: /schemas/types.yaml#/definitions/uint8-matrix
+    description:
+      This property provides fallback values for certain register fields that
+      are missing on devices using third-party replacement displays.
+      These unofficial displays contain touch controllers that claim RMI4
+      compliance but fail to populate the function_number and function_version
+      registers of their Page Descriptor Table (PDT) entries.
+
+      Since the number of required fallback entries depends on the number of
+      Page Descriptor Tables supported by a given device, this property
+      should be provided on a best-effort basis.
+
+    items:
+      items:
+        - description: The 5th byte of the PDT entry (function number)
+        - description: The 4th byte of the PDT entry (version value)
+
   vdd-supply: true
   vio-supply: true
 

-- 
2.47.2



