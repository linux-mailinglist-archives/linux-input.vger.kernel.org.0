Return-Path: <linux-input+bounces-9576-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E70C4A1CC6C
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 17:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E07F318861ED
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 16:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B98F02500A6;
	Sun, 26 Jan 2025 15:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVa2s9/Q"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF072500A0;
	Sun, 26 Jan 2025 15:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737904178; cv=none; b=ntr7dLH0kC3JiiknfhmIO0ePfNtpAJiDbcDyw9IVKN5YcWKsrSLlnyP4dcBwGGUA2L9OhlH/k7hMph7phW/ebe+1XJ1JDhxG2TT7y8Shtg5vW8t/4JgQBbskB+s9LprqTWHsKr/cpA84BTUJ6gHIryhGm3W9hgGUiEmdmyumXhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737904178; c=relaxed/simple;
	bh=+JNNE5lyuBZEOBCkt0LJpVMPkZvJj4st8hHHS1kg9a0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SxyZCfUzYXB0G8ib6Ytc7RI5CkJ3wVBtYKZOqK0MyT/W2og7zB1siPYmS1bGoVfARW0FN1zzRhKs9/STOuq7V1wPifYG/a2s4PEL7dlEI5Fg7HjVXg0WvT0nnY5RzQV8jeK+7zGyXNuRCkKXVZ41Mo2yJwXTXUGnwOoiquWbQRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVa2s9/Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4487FC4CEE3;
	Sun, 26 Jan 2025 15:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737904178;
	bh=+JNNE5lyuBZEOBCkt0LJpVMPkZvJj4st8hHHS1kg9a0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nVa2s9/Q4dNWyrdpuzwVSil8IuRM2xkod/0clrbjlZ83hpaUYOQ64OvSFRl5r9iJE
	 XBMMmhX4H4DhFA8gXkOHvjJcfb4lJhnrWJiz3dyow9OgRqOpX19nrGKJ2qWtYNiQxq
	 dv1LdvfTEE4pK9sK/h5Q3mK/WDros95YTESWqUUWDJmWpl23cVWYSmUFC0HIuyyrsl
	 lzbe2BO3S28QpyQG3sKQ7wzz+fIgJTjmOGojP2csPdtYaYIs3KT59R7npNseeEjXga
	 CGD7BkJZ0T0jzf+q0/ABd+2sGeK6WVEZD7IgXJ5xOzbUITK9HNM3TpU1yp9Gsz1n0i
	 cQv0beYguVGtA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Illia Ostapyshyn <illia@yshyn.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 2/2] Input: allocate keycode for phone linking
Date: Sun, 26 Jan 2025 10:09:31 -0500
Message-Id: <20250126150932.963016-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150932.963016-1-sashal@kernel.org>
References: <20250126150932.963016-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.233
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


