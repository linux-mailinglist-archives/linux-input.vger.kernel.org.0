Return-Path: <linux-input+bounces-12350-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E1BAB5FC2
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 01:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8784A46518D
	for <lists+linux-input@lfdr.de>; Tue, 13 May 2025 23:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC3713A3F2;
	Tue, 13 May 2025 23:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="mWdbfkRf"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8361DFD8B
	for <linux-input@vger.kernel.org>; Tue, 13 May 2025 23:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747177402; cv=none; b=qKKLt58mFdDufY0gqMM//ojXv7SN7Fj5c3gmyAezGdnjNiRqrtle7VzRKIMbg5Hyr0C6ASaXC2bS1Db48+s1rMkIwUyZVYRd2vMNsZvE84PHupvLZnSFVaKOWh37EQStWGot2s1NAgiOKsT04gRQNZdJcVbXzTNIkWJRHnDJA74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747177402; c=relaxed/simple;
	bh=JNNR95L89Cfl2VGZgPbrLxTYYLBPCiKwP+pqLuDi2hQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qpsCZ+DdEUSqJBcVIqTtRrXT6GVjgQUhg+4jsSJXEKfO5BJgLLC5MalFdWBvzbREN70I2Fi6HXStPsoCjgLJifLkKt/BwdBHAYFC332gws7G97Dxsy6wvPHNAxlWmRvRy7hrwvQKxR4qw0HMXduaEmKnoS+5UTWya8GahLgQL04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=mWdbfkRf; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1747176916; bh=JNNR95L89Cfl2VGZgPbrLxTYYLBPCiKwP+pqLuDi2hQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mWdbfkRfskskttS6w2m6HMEjnyMUHnMvW9TNrsHcWxLdS4by9s6hkmDQOUrqgzG1S
	 8Qz3ja6HXCkvCZ001i+nncwmWsIMnp6lh8d4fETi8Kl3zWqgWqQGbtoEIcMP5eltUB
	 rZ+6bzYe9iAUGR0/rjKwNEJPzFgec6PJBVEq0Z/1GEhqsoaYaOSu5Don0JC25UfSfU
	 xEvse8bEABF3KP181Us32DguIhffHKYxp5qSZJ6GSwgmHXA6MDQYwAxZP/L9Osmj6a
	 pAKep7TdcZgL2Nmi53SFTliR3qiSuWVNPpteLKVIqSq9mWXkL7SGV6xi8qZNHAQpXL
	 2Sam/siuMmdYQ==
Received: from nebulosa.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id CDE39A161;
	Tue, 13 May 2025 15:55:15 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>,
	Vicki Pfau <vi@endrift.com>
Subject: [PATCH 2/4] Input: xpad - Add the ByoWave Proteus controller
Date: Tue, 13 May 2025 15:54:00 -0700
Message-ID: <20250513225411.2718072-3-vi@endrift.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513225411.2718072-1-vi@endrift.com>
References: <20250513225411.2718072-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>

Signed-off-by: Pierre-Loup A. Griffais <pgriffais@valvesoftware.com>
Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 3eaf79cbe262..e57157726089 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -416,6 +416,7 @@ static const struct xpad_device {
 	{ 0x3285, 0x0663, "Nacon Evol-X", 0, XTYPE_XBOXONE },
 	{ 0x3537, 0x1004, "GameSir T4 Kaleid", 0, XTYPE_XBOX360 },
 	{ 0x3537, 0x1010, "GameSir G7 SE", 0, XTYPE_XBOXONE },
+	{ 0x366c, 0x0005, "ByoWave Proteus Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE, FLAG_DELAY_INIT },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
 	{ 0x413d, 0x2104, "Black Shark Green Ghost Gamepad", 0, XTYPE_XBOX360 },
 	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
@@ -571,6 +572,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOXONE_VENDOR(0x3285),		/* Nacon Evol-X */
 	XPAD_XBOX360_VENDOR(0x3537),		/* GameSir Controllers */
 	XPAD_XBOXONE_VENDOR(0x3537),		/* GameSir Controllers */
+	XPAD_XBOXONE_VENDOR(0x366c),		/* ByoWave controllers */
 	XPAD_XBOX360_VENDOR(0x413d),		/* Black Shark Green Ghost Controller */
 	{ }
 };
-- 
2.49.0


