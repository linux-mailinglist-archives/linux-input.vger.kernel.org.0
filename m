Return-Path: <linux-input+bounces-3465-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 316DA8BC40D
	for <lists+linux-input@lfdr.de>; Sun,  5 May 2024 23:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A8731C20AF3
	for <lists+linux-input@lfdr.de>; Sun,  5 May 2024 21:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC12137749;
	Sun,  5 May 2024 21:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="ghfZolh6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FF713667B;
	Sun,  5 May 2024 21:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714945729; cv=none; b=RsWyXqNwDbUEnu+yw1IrGPUE9SpaC8brH6L4rIM6netovT7kdBXI7/fnY8RICQ1EWAAU6xal7l2uLyiGxm0y7k4HrBir4PoN4aR7cdjWPn6wcyjFz/NGbB2Mfpo4h32Of7lxB0wiTmE3y9uZ67Y0/IY4LZea8QCBQblqp8EKc1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714945729; c=relaxed/simple;
	bh=BfcYcy+g5vRGOxT7Eyza/k94pC5vxujBJ5vBukv4+3k=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UhVYDw6++pJJzBQoqj8RDpsEvVlor9Jvw6Luq3cBs7xt79HUIl4XqTwxNJnyk10oFvQH75bbZ321+4dcUfJqezXESyAXx5RNr8WnSJWZbWRLtvL2wYOtUWMvqsNfW9MHM+mbhYpzBTTTiYoVJJmfRGYT8hGWVy+6A1YHhFStCyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=ghfZolh6; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1s3jir-005kk8-00;
	Sun, 05 May 2024 23:48:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jq4ul0HfMwHbZAQBdcNVCPfCEbXvT0e+cZ1ly+iFADg=; b=ghfZolh67wT6xBtCcovtqzmdV/
	6rl1mM+e/Wh75bu2sA+cH4mnyabMno7/ruuD2l0+aAAdj/TyEC7UsVe/z3pd20dYnJUOR8pWw30mb
	ivWoS9TjsEjd330dpgxWHYaH5T3f865CyLjb9PvW37vbi9Oua4Y854rkE8qX9yfwuChKlJSZFqugF
	zMnybJ8f+cjklMpOhvg4M+HEqMrNr7c00xxnptXx/CLMaQu7Rx5APgNdPRGTfw6x4PUcLElA25H+U
	R84TyFjktBFSQCqc4CSZFBPBCzvv34JtfuN35mOJp78Cg6zQndUaibam3FdTW6e/+oMNOXWAcb3E0
	1MrkY4gQ==;
Received: from p200300c20737c2001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:c2:737:c200:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1s3jin-000ccB-0D;
	Sun, 05 May 2024 23:48:38 +0200
Received: from andi by aktux with local (Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1s3jio-003jyb-0E;
	Sun, 05 May 2024 23:48:38 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andreas@kemnade.info,
	u.kleine-koenig@pengutronix.de,
	hdegoede@redhat.com,
	andy.shevchenko@gmail.com,
	siebren.vroegindeweij@hotmail.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: touchscreen: elan,ektf2127: Add EKTF2232
Date: Sun,  5 May 2024 23:47:53 +0200
Message-Id: <20240505214754.891700-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240505214754.891700-1-andreas@kemnade.info>
References: <20240505214754.891700-1-andreas@kemnade.info>
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


