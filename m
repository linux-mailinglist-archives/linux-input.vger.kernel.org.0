Return-Path: <linux-input+bounces-4926-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D5792C031
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 18:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 209BC28B2B4
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 16:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619C419FA90;
	Tue,  9 Jul 2024 16:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SitNMKF3"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3529919FA6D;
	Tue,  9 Jul 2024 16:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542155; cv=none; b=P8oHPMdY00n4z/ot3t0uINUwHuzU4WuUL1BpqvSC2HbJxyQorpdjA5MRlhwwWqOW4tQ25FOuR0LijKBM78EYlxLpmbdAlOWtzY9titejUwBNhwLVa9Lza265bkNjRrA5kUssh+XGRybG7XppRhxDpJXPVLu/pTK0SD/XclbOy7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542155; c=relaxed/simple;
	bh=XDZJnfoGw3m0A2na1fj+v5K1pEPU5MfbQx0yl6av+Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iYJrXd+0WUCrZ3la6xwv1occ1TN4RlZumV/Fz5DSHZZadYDID2AIITGV1cbqDWwnoeG4iodmq9Ae9qGgq4UWFUFNBXpi/8qxUqUZFHhGfzew61IgXOX+9tRHg97Y1iQiQCDEanD2HZRmLXnPZ6emjIQGytuCknaaHmK9QbueOtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SitNMKF3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A08C4AF0B;
	Tue,  9 Jul 2024 16:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542154;
	bh=XDZJnfoGw3m0A2na1fj+v5K1pEPU5MfbQx0yl6av+Vs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SitNMKF3pHUpDpqwZjMLuuMKyeTk69Tuxicf+E0uM8wYw6wkF5KwLgS2V9/BpwSsU
	 RsgjzThoyV3fIg6lNklTvkilb7LUPzdjrAxKuv3ms4lHX2yJdHsbYgW301d/RBsgua
	 h+j2MxrgUt+lwLfAMMw9Jx/b+keNAq/k/YhOlaWHWbXCNbSr8M5E8QS0iICsAioFpm
	 5GEnDyQC4UhYcBisd9CdyGZ7b9Io0sOt8N9rsg2vi568vSYlDMXizAgSDiXCl43RcJ
	 O/yHJLmWIsZLIlVdQLjp5DhQaWhuk2gbCh4dopgK7RU5VKkWXfd9S5KDAoywjlIsz3
	 MQLHsKPlX7vuQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Luke D. Jones" <luke@ljones.dev>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	carl.ng@hp.com,
	maxwell.nguyen@hp.com,
	appsforartists@google.com,
	luca@z3ntu.xyz,
	matt.git@fastmail.fm,
	christophe.jaillet@wanadoo.fr,
	matthias_berndt@gmx.de,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 04/33] Input: xpad - add support for ASUS ROG RAIKIRI PRO
Date: Tue,  9 Jul 2024 12:21:30 -0400
Message-ID: <20240709162224.31148-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709162224.31148-1-sashal@kernel.org>
References: <20240709162224.31148-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.38
Content-Transfer-Encoding: 8bit

From: "Luke D. Jones" <luke@ljones.dev>

[ Upstream commit cee77149ebe9cd971ba238d87aa10e09bd98f1c9 ]

Add the VID/PID for ASUS ROG RAIKIRI PRO to the list of known devices.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Link: https://lore.kernel.org/r/20240607223722.1170776-1-luke@ljones.dev
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index cd97a7a9f812d..daf2a46521f01 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -208,6 +208,7 @@ static const struct xpad_device {
 	{ 0x0738, 0xf738, "Super SFIV FightStick TE S", 0, XTYPE_XBOX360 },
 	{ 0x07ff, 0xffff, "Mad Catz GamePad", 0, XTYPE_XBOX360 },
 	{ 0x0b05, 0x1a38, "ASUS ROG RAIKIRI", 0, XTYPE_XBOXONE },
+	{ 0x0b05, 0x1abb, "ASUS ROG RAIKIRI PRO", 0, XTYPE_XBOXONE },
 	{ 0x0c12, 0x0005, "Intec wireless", 0, XTYPE_XBOX },
 	{ 0x0c12, 0x8801, "Nyko Xbox Controller", 0, XTYPE_XBOX },
 	{ 0x0c12, 0x8802, "Zeroplus Xbox Controller", 0, XTYPE_XBOX },
-- 
2.43.0


