Return-Path: <linux-input+bounces-9572-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D75EA1CC40
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 17:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90C457A4805
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 16:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48481235BFA;
	Sun, 26 Jan 2025 15:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YabAg1nx"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A4D235BF7;
	Sun, 26 Jan 2025 15:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737904114; cv=none; b=ZVMrc+hhXjvTJ6chMKxOHcTq+qqO9yCyQlo46x3tcsN2yGqG0E5Uc1jMSgwvH9eoGG2Xv0v0WlaQXZRtNYQgOYQ+tadRMK2JxUySisCADxSaAWje5m+w+kBYSTLCuy4QxhadI6u7Wqk7Y7LIfZbjH6Q8kZhFfARrBNjMfF4Pk1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737904114; c=relaxed/simple;
	bh=79S6p1dzAo83LjiM4h+1g1KMQ/eV5WKp5iEfHEhxF+U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ctVEF4cP93Y14hvpyxn2MylyDOztz/LSc9nKePxlBRpC55uJXgslISDR6ZKJMfS06SqjD3K7jSxbAVkYGtaQvtdP0lAgaFszupYf7rAn+nqmr7GDznEQ4Js8yhfUvmTYnl8JqAhe5bccf3mjAbO2QTGxBO7yJgJT+IdkSmjkqj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YabAg1nx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2624DC4CEE2;
	Sun, 26 Jan 2025 15:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737904113;
	bh=79S6p1dzAo83LjiM4h+1g1KMQ/eV5WKp5iEfHEhxF+U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YabAg1nx/lVUPReSLX76GhFIN24Glslnbbszkd9cZUTZTus9tNrv8P1UlcV7pkimR
	 fijBytRNhrMst/oBrhKFFhhIA5DD73XF2U4QJIJAD3Pb0GKPxEj1i2G0VpCIM/ysyG
	 f8O2p+/EeOuUeqd0mhz9hjg/g3Gn2lHWhMi4Hm6xkaD1kRQv97uygZ9iTm/nrDu/uf
	 knglxfdUk++i2WskqEBG/rBQPyV7JDi8QDIwenFy/CyhTBnx0CMF0vT00ZgO+Nqnxx
	 or8ZaTBJBZ3bzPKnj4LK3pgZQ1S1Bh2q0wZefpV2cOTrI0ycl0RLRS17uMKPyrG2RD
	 nXJUtPQrfVekw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Illia Ostapyshyn <illia@yshyn.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 12/14] Input: allocate keycode for phone linking
Date: Sun, 26 Jan 2025 10:07:59 -0500
Message-Id: <20250126150803.962459-12-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150803.962459-1-sashal@kernel.org>
References: <20250126150803.962459-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.11
Content-Transfer-Encoding: 8bit

From: Illia Ostapyshyn <illia@yshyn.com>

[ Upstream commit 1bebc7869c99d466f819dd2cffaef0edf7d7a035 ]

The F11 key on the new Lenovo Thinkpad T14 Gen 5, T16 Gen 3, and P14s
Gen 5 laptops includes a symbol showing a smartphone and a laptop
chained together.  According to the user manual, it starts the Microsoft
Phone Link software used to connect to Android/iOS devices and relay
messages/calls or sync data.

As there are no suitable keycodes for this action, introduce a new one.

Signed-off-by: Illia Ostapyshyn <illia@yshyn.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Link: https://lore.kernel.org/r/20241114173930.44983-2-illia@yshyn.com
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/uapi/linux/input-event-codes.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index a4206723f5033..5a199f3d4a26a 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -519,6 +519,7 @@
 #define KEY_NOTIFICATION_CENTER	0x1bc	/* Show/hide the notification center */
 #define KEY_PICKUP_PHONE	0x1bd	/* Answer incoming call */
 #define KEY_HANGUP_PHONE	0x1be	/* Decline incoming call */
+#define KEY_LINK_PHONE		0x1bf   /* AL Phone Syncing */
 
 #define KEY_DEL_EOL		0x1c0
 #define KEY_DEL_EOS		0x1c1
-- 
2.39.5


