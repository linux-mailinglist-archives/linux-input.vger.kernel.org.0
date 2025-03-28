Return-Path: <linux-input+bounces-11345-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D09A75379
	for <lists+linux-input@lfdr.de>; Sat, 29 Mar 2025 00:54:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B9DB3AE842
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 23:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814101DED66;
	Fri, 28 Mar 2025 23:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="duF5G6YR"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E8982899
	for <linux-input@vger.kernel.org>; Fri, 28 Mar 2025 23:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743206045; cv=none; b=csmSioaqNnQ190rXBZj+a9uCcqHf8FuMrMlAUkyrCGma18HylL2zMikqA5Bm09ps4Dmp6dKPZ0MVlDicvLxUieQYKSC/bAXr5rZc1nPeBLaybutHn4B6uFUMkk0lVaidrl9Bozfnt+DH11ocVDrskzOu7yvUlyQkOQd7QaUhKt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743206045; c=relaxed/simple;
	bh=IoWjR17HC3TEr2SSoaK/jZWh3KlyAFn/JSu1MGMXGsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Az1wyxo/UV8mOgiLgqWVKCQomwdZMTVoOvmiRUWEzJGLx49UCY16vajy6TSoGTIpi+VcqfaISUYKLrCPnnoTexRL5DU444Xrl3cDMb7Kvp/J0cxQexSlF2kHtnFyDl05uCw+dUm7tPep1I96mFUFZR3e08lOYPVmmOG0zTvjI5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=duF5G6YR; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1743205448; bh=IoWjR17HC3TEr2SSoaK/jZWh3KlyAFn/JSu1MGMXGsE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=duF5G6YR/lJpCzshlDm90ncltlwGskej+9G5Iu6lx8eCMJ998TTNkMV6hw5DygEIa
	 7WfuKsRnGMqTHYdPzrJP/dXDzpPNRkHy9ZP58Bgt4qGcaIAt4f96q0HYaN7f/IHaVc
	 NLfenFBebOxg4Y6FWGR3ba8UtBr6PdNN1MOFC3oN//eNyi/6Gv2il7Nain/Zfy0yls
	 nOspI9l4uX1dBMCJpwPEZoa/6LKP53f+OelgQH6pFBRhuBa0Y5wf2WpK2eINrKCXFK
	 zmB7KyiM3pPgvx8x1e6dX1Uh4F4BNa7M204qXUt0SxfrWBp3heNFOkdBE7fS1VYk4T
	 pTlbpV2zIsiOA==
Received: from nebulosa.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 96747A091;
	Fri, 28 Mar 2025 16:44:08 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 5/5] Input: xpad - Fix xpad_device sorting
Date: Fri, 28 Mar 2025 16:43:40 -0700
Message-ID: <20250328234345.989761-5-vi@endrift.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250328234345.989761-1-vi@endrift.com>
References: <20250328234345.989761-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent commit put one entry in the wrong place. This just moves it to the
right place.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/joystick/xpad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 0714d145e600..2c12a17ce65d 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -144,9 +144,9 @@ static const struct xpad_device {
 	{ 0x044f, 0x0f00, "Thrustmaster Wheel", 0, XTYPE_XBOX },
 	{ 0x044f, 0x0f03, "Thrustmaster Wheel", 0, XTYPE_XBOX },
 	{ 0x044f, 0x0f07, "Thrustmaster, Inc. Controller", 0, XTYPE_XBOX },
-	{ 0x044f, 0xd01e, "ThrustMaster, Inc. ESWAP X 2 ELDEN RING EDITION", 0, XTYPE_XBOXONE },
 	{ 0x044f, 0x0f10, "Thrustmaster Modena GT Wheel", 0, XTYPE_XBOX },
 	{ 0x044f, 0xb326, "Thrustmaster Gamepad GP XID", 0, XTYPE_XBOX360 },
+	{ 0x044f, 0xd01e, "ThrustMaster, Inc. ESWAP X 2 ELDEN RING EDITION", 0, XTYPE_XBOXONE },
 	{ 0x045e, 0x0202, "Microsoft X-Box pad v1 (US)", 0, XTYPE_XBOX },
 	{ 0x045e, 0x0285, "Microsoft X-Box pad (Japan)", 0, XTYPE_XBOX },
 	{ 0x045e, 0x0287, "Microsoft Xbox Controller S", 0, XTYPE_XBOX },
-- 
2.48.1


