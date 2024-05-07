Return-Path: <linux-input+bounces-3586-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE018BF1F0
	for <lists+linux-input@lfdr.de>; Wed,  8 May 2024 01:38:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCB01283317
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 23:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F0714A62D;
	Tue,  7 May 2024 23:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avVUBa04"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A6314A62B;
	Tue,  7 May 2024 23:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715123464; cv=none; b=h89dx9J6+eUi3fSgIgMQdOMCPrNgOiJ5t9ZiL7DsmP0yKwoQ2DQS/fd6RMdUbjf84jM2beWWtyaf2Wsfgiptmf33akKaIFGEJ3CxqtasX+y9dNnz8uVmrHeMVi8XX6Bd1gGiP3TaoS0VZqQRTfjmVg6KiOzSmkRvSe+AeyigAq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715123464; c=relaxed/simple;
	bh=91OSAVcq8c3ZAQ/ZXNJN5YVGla1vrLOT0Ct0XJll44w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IOxM/tZOKPXYludS7L1e2/rtyyD5glj3Wcbv9YEi/FLyzOjYPh/NqFolzYk9aD10aOTB3G9Ip0aMXcMMkBub9F475iXIAIOYm/xgHcybBXgzcBArGVyYaMxWZRL1iuNIbXtqiige82IyfS3/7CclB4J/IvT2oJ/ayTi0CzIazfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avVUBa04; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C9FC4AF17;
	Tue,  7 May 2024 23:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715123463;
	bh=91OSAVcq8c3ZAQ/ZXNJN5YVGla1vrLOT0Ct0XJll44w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=avVUBa04+gk7y0ENhy7f+ujOrnLSeaECqsOWvIP3A2SD7qZy9zt7/Cf78k3nZpHiJ
	 AIYNT2oYQ//2UJwZcLIOgs5AuGoMIBM6torqUP7B5tV2Mju6r4731iRZdPqnD7u84N
	 YFU4e9BS51ChBpyOxO67LSxnLQjIWInlK/2TWfFt86XfwS0XL9X41rQC6yufrXdG5t
	 PrjTQMQdg9y8AEp11HcQIPPqUEEdIqPRi5C1sp0FHgCK0CKFs8qm3ADsmC0PsZ3Q+C
	 txrjfHVSKvyhRpKbzYBSnfCl1CfxPWFn2zfS1iBKrliBKsZAOWyDyhioxu3KTsEfcc
	 h51l5ntb1vWhw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	appsforartists@google.com,
	maxwell.nguyen@hp.com,
	carl.ng@hp.com,
	swyterzone@gmail.com,
	slouken@libsdl.org,
	christophe.jaillet@wanadoo.fr,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 16/43] Input: xpad - add support for ASUS ROG RAIKIRI
Date: Tue,  7 May 2024 19:09:37 -0400
Message-ID: <20240507231033.393285-16-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507231033.393285-1-sashal@kernel.org>
References: <20240507231033.393285-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.30
Content-Transfer-Encoding: 8bit

From: Vicki Pfau <vi@endrift.com>

[ Upstream commit be81415a32ef6d8a8a85529fcfac03d05b3e757d ]

Add the VID/PID for ASUS ROG RAIKIRI to xpad_device and the VID to xpad_table

Signed-off-by: Vicki Pfau <vi@endrift.com>
Link: https://lore.kernel.org/r/20240404035345.159643-1-vi@endrift.com
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 9206253422016..cd97a7a9f812d 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -207,6 +207,7 @@ static const struct xpad_device {
 	{ 0x0738, 0xcb29, "Saitek Aviator Stick AV8R02", 0, XTYPE_XBOX360 },
 	{ 0x0738, 0xf738, "Super SFIV FightStick TE S", 0, XTYPE_XBOX360 },
 	{ 0x07ff, 0xffff, "Mad Catz GamePad", 0, XTYPE_XBOX360 },
+	{ 0x0b05, 0x1a38, "ASUS ROG RAIKIRI", 0, XTYPE_XBOXONE },
 	{ 0x0c12, 0x0005, "Intec wireless", 0, XTYPE_XBOX },
 	{ 0x0c12, 0x8801, "Nyko Xbox Controller", 0, XTYPE_XBOX },
 	{ 0x0c12, 0x8802, "Zeroplus Xbox Controller", 0, XTYPE_XBOX },
@@ -482,6 +483,7 @@ static const struct usb_device_id xpad_table[] = {
 	{ USB_DEVICE(0x0738, 0x4540) },		/* Mad Catz Beat Pad */
 	XPAD_XBOXONE_VENDOR(0x0738),		/* Mad Catz FightStick TE 2 */
 	XPAD_XBOX360_VENDOR(0x07ff),		/* Mad Catz Gamepad */
+	XPAD_XBOXONE_VENDOR(0x0b05),		/* ASUS controllers */
 	XPAD_XBOX360_VENDOR(0x0c12),		/* Zeroplus X-Box 360 controllers */
 	XPAD_XBOX360_VENDOR(0x0e6f),		/* 0x0e6f Xbox 360 controllers */
 	XPAD_XBOXONE_VENDOR(0x0e6f),		/* 0x0e6f Xbox One controllers */
-- 
2.43.0


