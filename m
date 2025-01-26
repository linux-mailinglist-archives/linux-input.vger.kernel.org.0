Return-Path: <linux-input+bounces-9575-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E97A1CC80
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 17:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F4567A066D
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 16:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53812475F6;
	Sun, 26 Jan 2025 15:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xe5eJkP5"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE6B1F9AB7;
	Sun, 26 Jan 2025 15:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737904169; cv=none; b=Ahup9wqkUWWrRMRAsZfEsQRSzfGxTMYsEsxaETQbbFQk9yajX+WCxL/LZbiKKwQUXkrN/2cltSJC3/JC77h4S4+2KTHLljM/ihgpxLIMACia4jWGrY7ZBR1PLTDCJPmr1E/z4HUaUKDihi3QzsB4hFA0DIma3ajJFGcpDdlHppw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737904169; c=relaxed/simple;
	bh=+JNNE5lyuBZEOBCkt0LJpVMPkZvJj4st8hHHS1kg9a0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UFrwae/aKNmzCcZ7kTBqqA58nC8IaDLq/dJUHkHbg0T2TmtiDmmnrE3l3Ty6WpPzbrqEgGy1JDLe/zfis7IdsYxeDct5Hx6p1WX8k86+6AsodDgvgDdy9h30aWYwosAE/HxNP8v3vl57HlOotERb7pA9PFfMjoyu/V7fcSt5d/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xe5eJkP5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9E6C4CEE2;
	Sun, 26 Jan 2025 15:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737904169;
	bh=+JNNE5lyuBZEOBCkt0LJpVMPkZvJj4st8hHHS1kg9a0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xe5eJkP5TtNK0gQ7LQMXFQfqgtI84HGwNh4S1JCoYc+SQTmkPa59YXjLtuyP7IKB1
	 B7JFJ7rpYsgVL4INZdUCN9hM7FHGK/XpiqsNhpF2qOm2Hu3bE3t5JsYeFm1s1l5hPT
	 sEdwbV8MrBSWWI9FPmpBtLjCj51Y8T7c21yJhbQ2U014lc9Zt4eIzlLBlRjP34rdem
	 Z/u38yVbXLRarEE9rNeE3NfZ11cmatoh+SMG8B5KRng2zCDr5GoXoMg57Jpnlfl6dX
	 mX8jIKaF2dtR9gQ9OObuqw2rwIVt/ga9iZ4oc6WEV5tbP1wSiZQP1FSSEmOk6EtVwp
	 9NlVc/RWm98GA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Illia Ostapyshyn <illia@yshyn.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 2/3] Input: allocate keycode for phone linking
Date: Sun, 26 Jan 2025 10:09:21 -0500
Message-Id: <20250126150923.962963-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150923.962963-1-sashal@kernel.org>
References: <20250126150923.962963-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.177
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
index bed20a89c14c1..6128146bb133b 100644
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


