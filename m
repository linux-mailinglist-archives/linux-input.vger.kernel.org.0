Return-Path: <linux-input+bounces-16884-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D48D070A5
	for <lists+linux-input@lfdr.de>; Fri, 09 Jan 2026 04:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E48FB300BBF0
	for <lists+linux-input@lfdr.de>; Fri,  9 Jan 2026 03:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47962561A7;
	Fri,  9 Jan 2026 03:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="enjmuxD5"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E2322652D;
	Fri,  9 Jan 2026 03:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767930726; cv=none; b=inFJrgwpf9Q19keYV6X+moPcfXCx6JI6eS8dG0ZFvFIl72gk0xdLQZwSN2XXYSRIda6IE8djxx+6j/lKFUqmcNb3E/8fXhL9B+nvFenlEqDCdJppBx8BoFbriT9NqhaqYpQnNWtk+EFRRcX2Kya7gx3gXQJ/lSLMqSHeKQfz4WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767930726; c=relaxed/simple;
	bh=FvFyh4ZinehOBtz03onLOIgqVdsUfxrFR2M8+j6z8JM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AURHRthlmljs8dG8dA4HOsxoPrIYNxSd0xpo+qmCd5jtui7nl+sU6T3F4D6eqG/yABIr0N8EnOlWQuvfzQTolpIzfv32N29N1jbuUpLyHjluMX3AAucUq73rGdB209kJxW/D32I5iVi4JR/MvbH0TeAtiq5t54puP812tzxnw08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=enjmuxD5; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BFCCA10D8D4;
	Fri,  9 Jan 2026 04:51:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1767930715; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=KkMzoOIYLGZjXFaM1kGQKv40GhTm4Hwge52MUw+0nJc=;
	b=enjmuxD5Q+k0YnKIR06jsAj6ndCOVIzjJUOG6l3W7VsOCS0WPFY1m23i9Bu+6bUONYAl7H
	i5ntEUpPFAbBDYzoT2g/+Jh4OtOrx83OGcYVwuzJQ4nY74JC3DRlYPdgcilJesP5CB9Xr0
	HR9OmqXf51SiB3LJ6DyzeBqxsNPmoW53Rom7sHeJYyig72nwp6w4kjU9f2CO8DANMr7K7J
	cPqKO0H4s1/LgUVkaMQLQoeAp4BSNDKGExGPfCRbkDjtwtdNVTBpQVedZHE/HO0FbwUi4F
	k10WG31RYf1bOGkOa9kyqSOoB8npGQa5ocvLO4///nIu1AwQxcVYqO0+DdRdrw==
From: Marek Vasut <marex@nabladev.com>
To: linux-input@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jens Reidel <adrian@mainlining.org>,
	Joel Selvaraj <foss@joelselvaraj.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: input: touchscreen: edt-ft5x06: Drop 'interrupts' requirement
Date: Fri,  9 Jan 2026 04:51:44 +0100
Message-ID: <20260109035149.1341931-1-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The interrupts property is optional, since at least the Linux kernel driver
supports also polling mode. Drop the interrupts property requirement.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jens Reidel <adrian@mainlining.org>
Cc: Joel Selvaraj <foss@joelselvaraj.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
index 7d3edb58f72d8..1c6d3c674841e 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
@@ -111,7 +111,6 @@ unevaluatedProperties: false
 required:
   - compatible
   - reg
-  - interrupts
 
 examples:
   - |
-- 
2.51.0


