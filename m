Return-Path: <linux-input+bounces-8124-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 181019D007E
	for <lists+linux-input@lfdr.de>; Sat, 16 Nov 2024 19:25:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97BE2B24011
	for <lists+linux-input@lfdr.de>; Sat, 16 Nov 2024 18:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28362B2F2;
	Sat, 16 Nov 2024 18:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nobelis.eu header.i=@nobelis.eu header.b="HQDVXMO2"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-42ab.mail.infomaniak.ch (smtp-42ab.mail.infomaniak.ch [84.16.66.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9632F2D
	for <linux-input@vger.kernel.org>; Sat, 16 Nov 2024 18:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731781515; cv=none; b=NvVVokpmzc4MszV/Av6ByBlO694/9GpJnWmmEU60657N/iuypVYqbejtFPfWA01w2Zqk8E/LPZRiRPfbM8coEj1tE/AcXI1piH1m6Yo4oNV1w/S2i1+tt8MzCOUNMTQGadTGyNHbkyC4SSJOgr0ex+dE0faKAorDjD7bCaKfNdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731781515; c=relaxed/simple;
	bh=aSptY61CxC7UCCF8nOKA9P79zIttrB28plUwdtibUwc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P7poH7QplZ4EIqheiO/moVw+B4ZlnMgyvxRp6kftaU0SPBT40nW/sfgZg+Y8JgZHwY22841M+UnKiPNeLGSFM/YxuaW4qbq80pNmYAYLa1X2GH/JfuxJbwNPRCY4PczGTPpd8lmU2CrYdTarpkZF68osjx1YYeaE4zicn1oI4QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nobelis.eu; spf=pass smtp.mailfrom=nobelis.eu; dkim=pass (2048-bit key) header.d=nobelis.eu header.i=@nobelis.eu header.b=HQDVXMO2; arc=none smtp.client-ip=84.16.66.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nobelis.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nobelis.eu
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10:40ca:feff:fe05:1])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4XrMkQ6zyxzlrr;
	Sat, 16 Nov 2024 19:25:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nobelis.eu;
	s=20230617; t=1731781502;
	bh=hpVJjNZ6owEGLX8QbZlQ/OwAy8yJR7SEmRmPzqO5PK0=;
	h=From:To:Cc:Subject:Date:From;
	b=HQDVXMO2SffixPAO0hnIaau17PH90AHKT58f1SbU1iX4uMIRbsiLFFLh1ZdcNrqGL
	 MNQaS8cFi722ypJVpz1tic8WrxjvSrWj8SpD2xkSekqrD3qPOkpRUiKEvsWiIu4rSe
	 TcqlqxUjM9qUpPqEThJbtDJ4kjt0t1AOTk+ptnpOz5yI6lMj2Ak3LL608RLAJkMzRD
	 ihAz8JKEm7ArgZ/wF8Q1gxhZtv62RtDkcoV4E65DkMqdzFL6pmKNzX1u/+JPS5ys2+
	 gLeq+YY6uqdYldoXiMd6dE4LBK19QqNpouAS8Zz/K6kJanJhlRaK2L4RG5njyt/W9W
	 eJjOFvpThSJYQ==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4XrMkQ3ftvzr9D;
	Sat, 16 Nov 2024 19:25:02 +0100 (CET)
From: nicolas@nobelis.eu
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	Nicolas Nobelis <nicolas@nobelis.eu>
Subject: [PATCH] Input: xpad - add support for Nacon Pro Compact
Date: Sat, 16 Nov 2024 19:24:19 +0100
Message-Id: <20241116182419.33833-1-nicolas@nobelis.eu>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

From: Nicolas Nobelis <nicolas@nobelis.eu>

Add Nacon Pro Compact to the list of supported devices. These are the
ids of the "Colorlight" variant. The buttons, sticks and vibrations
work. The decorative LEDs on the other hand do not (they stay turned
off).

Signed-off-by: Nicolas Nobelis <nicolas@nobelis.eu>
---
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 3e61df927277..d87faef67404 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -381,6 +381,7 @@ static const struct xpad_device {
 	{ 0x31e3, 0x1300, "Wooting 60HE (AVR)", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1310, "Wooting 60HE (ARM)", 0, XTYPE_XBOX360 },
 	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
+	{ 0x3285, 0x0646, "Nacon Pro Compact", 0, XTYPE_XBOXONE },
 	{ 0x3537, 0x1004, "GameSir T4 Kaleid", 0, XTYPE_XBOX360 },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
 	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
-- 
2.39.5


