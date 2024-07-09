Return-Path: <linux-input+bounces-4922-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 080AF92BFA6
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 18:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8315B2A1CF
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 16:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C28B19F480;
	Tue,  9 Jul 2024 16:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aEnHTmpC"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0356158A36;
	Tue,  9 Jul 2024 16:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542023; cv=none; b=ZTscox+is7tISE/BlJ5OmW+AKJ8kE8NyDD2HskyIG2OisYboBF/gzkPL1H46kU5srQp0eEt3RA0j62YwvlKjknEqsXTGrgKrzmDYU2f4bGYb/l34XSwPQh052M8nX8DQhplyFaBJRpJTvCxoglcns/6052odH39hr+L7if7/P5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542023; c=relaxed/simple;
	bh=1nXATt9mFXz0Fj+Z1Wwmlpy+9RSQ0yEeq/tP00RZfec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L7mL5Dtg3wQcplxDqWVD40AcmWHMR4EEP8BlXBa9JOgzgTkYwhp5eAUBnuqNHsvOJ+XgMMxvsjHn/ZBupoKS3JrHVIq8LLkmhsXA7s0ob2f9TBoiZAiaH1wa1ihpULcMe5EJji89uek9FW+rmQeVMLcwOhK+f5o2+MVenOfSeyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aEnHTmpC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97C7C4AF07;
	Tue,  9 Jul 2024 16:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542023;
	bh=1nXATt9mFXz0Fj+Z1Wwmlpy+9RSQ0yEeq/tP00RZfec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aEnHTmpCZ+BT//RxpiQhjFOc+pzQjcLFdGG+uGwzrEfDVuxnPfy5dujHR7iOXBMgw
	 telY3EsK0Few6lzGSximCciTA/XrHvw9fTjpLGrTvfWPr+OmH0Hcemjg2VN95J3uPi
	 IkVFcDu9t+EW5Nl+jPdcMtcOmz71RHe5VAEA73T0fC6X4YzG8daaB+bqCI0udAMRCg
	 2YXVzMU9IEKtvUZVk05TKx955QNwYDBPriw0BWBOYtUORumW2gmNo/puw4u1Hv8ZYi
	 +tR1YcBQkCOJvW5u+D95CX1KdC9zv54rfbEhAR4RehmAS9KENxk6jLFZ+D4iR5Mfg+
	 pjG79moDHl8zg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Luke D. Jones" <luke@ljones.dev>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	carl.ng@hp.com,
	maxwell.nguyen@hp.com,
	appsforartists@google.com,
	matt.git@fastmail.fm,
	matthias_berndt@gmx.de,
	christophe.jaillet@wanadoo.fr,
	artewar6767@gmail.com,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.9 06/40] Input: xpad - add support for ASUS ROG RAIKIRI PRO
Date: Tue,  9 Jul 2024 12:18:46 -0400
Message-ID: <20240709162007.30160-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709162007.30160-1-sashal@kernel.org>
References: <20240709162007.30160-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.8
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
index 6fadaddb2b908..3a5af0909233a 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -209,6 +209,7 @@ static const struct xpad_device {
 	{ 0x0738, 0xf738, "Super SFIV FightStick TE S", 0, XTYPE_XBOX360 },
 	{ 0x07ff, 0xffff, "Mad Catz GamePad", 0, XTYPE_XBOX360 },
 	{ 0x0b05, 0x1a38, "ASUS ROG RAIKIRI", 0, XTYPE_XBOXONE },
+	{ 0x0b05, 0x1abb, "ASUS ROG RAIKIRI PRO", 0, XTYPE_XBOXONE },
 	{ 0x0c12, 0x0005, "Intec wireless", 0, XTYPE_XBOX },
 	{ 0x0c12, 0x8801, "Nyko Xbox Controller", 0, XTYPE_XBOX },
 	{ 0x0c12, 0x8802, "Zeroplus Xbox Controller", 0, XTYPE_XBOX },
-- 
2.43.0


