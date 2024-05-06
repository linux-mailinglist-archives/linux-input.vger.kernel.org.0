Return-Path: <linux-input+bounces-3497-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A8C8BD2AF
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 18:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4B02286B78
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 16:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B173156991;
	Mon,  6 May 2024 16:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="VtXhDCsE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F7215664D;
	Mon,  6 May 2024 16:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012650; cv=none; b=tMIMvsPBQ+k0T/A9+M/5jjlP7CeQVMwtOVJEoVgoB2wA4XuFH6xWdpEm5M+J9ipzZJv2Wp3KPFp6n3u76pFnmP7fTt/He+mpTLPaMHLxNoM/jehcgbHWrYtuQuK1qQfrYJg4Dcvxq42pGT0fEn69lYqBBKL3l7cYtiJ8yTYnTnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012650; c=relaxed/simple;
	bh=JmY/x2z6q1Q4af+tn6wc8WVCFrk0TIFyxVDD8495agM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u2DpYB/AKcMTPM2pJcJ0dNBh8QAYWxzvjz7LSZw2bIwqiJ9TDraqKCbTUuc4Fyc6A3mnP40bAeo1zEHnOHWOaUiZiJ0U7ywxol9HX/g9uudviXVxjkD26GfAsmKV+DEIk1ZezRXip9RRp5WzAVw0G/fgYbeny9KPOGNhvCofoq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=VtXhDCsE; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1s418F-005r2d-0a;
	Mon, 06 May 2024 18:24:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PGYb7xrswlXlviOfBdG+br1HD4qryj9qiptkmvxI+94=; b=VtXhDCsES+46UFjF+K0DpM2H1d
	Ft7EGvxSxKg9wByOiqjjgonp1qbV8TVOAojeQgGJBO0zbGu33QMQV7AQZhvoJ4mvang6KYFYBOvN6
	25SizJyMsPcWTzDpCCfmbRK/JNa4oqJFeU/qL14VoLW2tmjd2yqeaTlr1jOGMz9HJs1bzqXTF2Epa
	adXlHyadTbyvjAbR70MBnd6ONsBqQcQqWe86wkpY55oAc+bu5FAt99PlsyzgCHCfTRSO+O8Fz71dh
	cXTfvqJd4eEJBOKYpftE4DQKn1iXKdIvg7L/c6gh52UA2xaF9r5lcW7/Muo71c2u8PL+5mIP120tq
	f2VCt3Pg==;
Received: from p200300c20737c2001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:c2:737:c200:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1s418E-000fJs-1j;
	Mon, 06 May 2024 18:24:03 +0200
Received: from andi by aktux with local (Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1s418F-003pVK-1a;
	Mon, 06 May 2024 18:24:03 +0200
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
Subject: [PATCH v3 2/3] dt-bindings: touchscreen: elan,ektf2127: Add EKTF2232
Date: Mon,  6 May 2024 18:23:49 +0200
Message-Id: <20240506162350.912950-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240506162350.912950-1-andreas@kemnade.info>
References: <20240506162350.912950-1-andreas@kemnade.info>
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


