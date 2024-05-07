Return-Path: <linux-input+bounces-3584-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9298BF17C
	for <lists+linux-input@lfdr.de>; Wed,  8 May 2024 01:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 433ADB269D4
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 23:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20AB13DBA8;
	Tue,  7 May 2024 23:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZLeaQWyp"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AD613DBA5;
	Tue,  7 May 2024 23:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715123317; cv=none; b=D2LRYF5qyFNSBzir1OcOaNyjCUqNSfFvX52MTWXOmJBnuXEUvPMYtUsPml9N7oHgiLbm6I3iW8rDCBznQYCGV+KO60mhYbUIkre8+7Fk6k+S6Fru/ufDhhb4SNUXMaNhQE5s6uzoAikX1JlyDsySp9H+IuUkvzUlyM3CqgngNAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715123317; c=relaxed/simple;
	bh=kBfJ4CUGpAFe5MU2hCmU5LmTT/VhLSzeTL0LWRn4emQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=seVbvc/GGSsen4hhiwF0Ui9Gn5dm2RgeUUKK9tOJ2E5hiFCrr7w7btexTDl9ixkkRNbRKlfX2GLACv+luf4SmLcJPa3kyDXE9bZZJavX76nhHd8zfAvQ9HRZ514LiWnsdsam4h+7Vrrc4nhvDo+oJwq550n/FrBDa8f5Yf8/5ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZLeaQWyp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35DBAC2BBFC;
	Tue,  7 May 2024 23:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715123317;
	bh=kBfJ4CUGpAFe5MU2hCmU5LmTT/VhLSzeTL0LWRn4emQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZLeaQWypdZVA+Mt4C7o1kNvg/0TXZ9Bi76d+L6KsvoK6Ebr2ZVm0yPol5xUjsB6s2
	 wzeB7dba/spSL4dZHPkbRUr66B0Bf5xJtB5cSCR+WdKFyXIx2lIu6jINhhueOLh6C+
	 oTayS8KrrQx0fLdEB9s1kPdemHX8GIFoDl736oFvu1qZXNg65sm3qQKJjh/QRboj/j
	 8s4F9kcS0+V0dD9v/kU5ng5NElAX2ats3zxT446LC1Kkf+rjDN+o057+efk6ryb8jI
	 9fdEWCvE1R5HHNLO1uIIPFyDG+f44qtWk+CeAUDEWTS+Rtmj85oSZapltdoexu0pHA
	 cbfGeueZpZFYg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	maxwell.nguyen@hp.com,
	carl.ng@hp.com,
	appsforartists@google.com,
	swyterzone@gmail.com,
	luca@z3ntu.xyz,
	christophe.jaillet@wanadoo.fr,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.8 19/52] Input: xpad - add support for ASUS ROG RAIKIRI
Date: Tue,  7 May 2024 19:06:45 -0400
Message-ID: <20240507230800.392128-19-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507230800.392128-1-sashal@kernel.org>
References: <20240507230800.392128-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.9
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
index 1fad51b51b0e1..c2de2f063cb8d 100644
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


