Return-Path: <linux-input+bounces-4555-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41082913082
	for <lists+linux-input@lfdr.de>; Sat, 22 Jun 2024 00:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1AD32893D7
	for <lists+linux-input@lfdr.de>; Fri, 21 Jun 2024 22:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1CF16F916;
	Fri, 21 Jun 2024 22:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="DB09cX5Z"
X-Original-To: linux-input@vger.kernel.org
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF16016F0F4;
	Fri, 21 Jun 2024 22:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719009644; cv=none; b=INVfkUTbr+SJxV2n/XBK6MqUq7cZbYVhzryD2YaobBfKLK67lrvAH7buetvEXmRm9qalLJtBdVZZabICFZX37PAW50RFUPQ4sTsfi8u+UTVkwaoDBBI4qF5n85FMlxYvHMu2UqwFHx3nkR1KT2wPSgXhb8ES3h1cPsTOOKLQRb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719009644; c=relaxed/simple;
	bh=JmY/x2z6q1Q4af+tn6wc8WVCFrk0TIFyxVDD8495agM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dLHHWTJ/hhv4rGTW03vJqCpF+b/NVorJynVySA475NF2dqDzu57MMFL3FWKjM/G0V/VxmO3fj5MwI2QS25/B0aJLPLiXLM/A/BOjjquMjrIl1Nru0ETDlcGAFgzKY6+09WvJM9jpd5JefaSge3YOg2p8OsEbIOfSzWzK7aYPkTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=DB09cX5Z; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sKmvk-000Utz-0X;
	Sat, 22 Jun 2024 00:40:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PGYb7xrswlXlviOfBdG+br1HD4qryj9qiptkmvxI+94=; b=DB09cX5ZTGZwtx10ft7gqZU6Kk
	UjDDzc1zO5WHV6+Msp+8acHJj7TzGMqmTwReEKx4Lid4Pgl03y2RwRTvTgiZJAnP+Pr8zCtsY1Jml
	FK2ulSSoXbppzXEd31tIeV1XtuNpEwukNtp+QoKS7MDR61Fmx+ijmmXW9goNUNA6TpRQu+Tnlnp8V
	9YVGy/EFCYKLiVos7fShWhfVCWSjcpAfw5j+I5or3sSQWN34m7b/dvborDTAFM3QVAs+cW3jmihHv
	qk42rmA+FN87DsfywZ6AwY0jtKxhMzBNRvLHjIyQPWbHDonlf6gn4rwKLJv0mtWEjNHz5NkO3JZ+c
	v0CaTgMA==;
Received: from p200300c20737c2001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:c2:737:c200:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sKmvi-003PlR-37;
	Sat, 22 Jun 2024 00:40:28 +0200
Received: from andi by aktux with local (Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sKmvj-006nfp-3D;
	Sat, 22 Jun 2024 00:40:28 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andreas@kemnade.info,
	hdegoede@redhat.com,
	andy.shevchenko@gmail.com,
	u.kleine-koenig@pengutronix.de,
	siebren.vroegindeweij@hotmail.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RESEND v3 2/3] dt-bindings: touchscreen: elan,ektf2127: Add EKTF2232
Date: Sat, 22 Jun 2024 00:40:21 +0200
Message-Id: <20240621224022.1620897-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621224022.1620897-1-andreas@kemnade.info>
References: <20240621224022.1620897-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for the EKTF2232, which is similar to other chips in this
document.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/input/touchscreen/elan,ektf2127.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/elan,ektf2127.yaml b/Documentation/devicetree/bindings/input/touchscreen/elan,ektf2127.yaml
index 5c4c29da0b11d..ff0ec3fd24c5d 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/elan,ektf2127.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/elan,ektf2127.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - elan,ektf2127
       - elan,ektf2132
+      - elan,ektf2232
 
   reg:
     maxItems: 1
-- 
2.39.2


