Return-Path: <linux-input+bounces-14268-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AACAB32946
	for <lists+linux-input@lfdr.de>; Sat, 23 Aug 2025 16:40:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A81067B961F
	for <lists+linux-input@lfdr.de>; Sat, 23 Aug 2025 14:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4452026560B;
	Sat, 23 Aug 2025 14:40:02 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565F725E80B;
	Sat, 23 Aug 2025 14:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755960002; cv=none; b=sWrOP08Vd61eevJ3GsrjNTneEERDhJTrfhljxgtiXeALJgQgo2LtVXRMO4DedRMDk4EYHZ6gsdJ/mSn1dGiCTj92lv07kqvaxBFNqRC7a8BH2jDXBFpCySgH4gVd/ri27k21d3ckxTsgBYOhKLAH2PQRCkAWYaT+I/4MHR35ZDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755960002; c=relaxed/simple;
	bh=0+IqykIZ5TbtogQ0NeEszQ9meNkcBVCBP7kmsiruBfc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OP0RTu0wGQSv2mPKA/9aE2e4Jqw425EIHd8G1j5ZzKdFqGLmA5kXfNKskzI7Jui1Jy9DgdfwN48SIMvwlP3RF46yUQQ40mU6o2T3hDu2ruLeZTxwKe91uqeG0aBwZcoKB5RU+uzMRnAG4sUZbjJjq8ihfoRqgOOw6ypx0ElHlMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 57NEit8M012763;
	Sat, 23 Aug 2025 14:44:55 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 57NEitrp012758;
	Sat, 23 Aug 2025 14:44:55 GMT
From: Alexander Kurz <akurz@blala.de>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>,
        Heiko Stuebner <heiko@sntech.de>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexander Kurz <akurz@blala.de>
Subject: [PATCH v2 8/9] leds: mc13783: use fsl,led-control as node name
Date: Sat, 23 Aug 2025 14:44:40 +0000
Message-Id: <20250823144441.12654-9-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250823144441.12654-1-akurz@blala.de>
References: <20250823144441.12654-1-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to fsl,mc13xxx.yaml, the node name for led-control is
vendor prefixed. Change it accordingly.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 drivers/leds/leds-mc13783.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
index e22f09d13798..11add1fd24ce 100644
--- a/drivers/leds/leds-mc13783.c
+++ b/drivers/leds/leds-mc13783.c
@@ -127,7 +127,7 @@ static struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(
 	if (!parent)
 		return ERR_PTR(-ENODATA);
 
-	ret = of_property_read_u32_array(parent, "led-control",
+	ret = of_property_read_u32_array(parent, "fsl,led-control",
 					 pdata->led_control,
 					 leds->devtype->num_regs);
 	if (ret)
-- 
2.39.5


