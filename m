Return-Path: <linux-input+bounces-9573-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F8CA1CC7E
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 17:10:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DE8A3B32D4
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 16:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964B61F9437;
	Sun, 26 Jan 2025 15:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZT9NOpI"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699CD1F943C;
	Sun, 26 Jan 2025 15:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737904139; cv=none; b=jRZYkM9nul18JRVXP1So+5u6hDXaYfFQN+zkcb4MP3xga+JvK99mKZRa6kl4GbJvtovzlc1DMouPDPFLcSU71frcu2vsvvPIJP6zbZQ0VIeR1GgQb0L8zzixaiNhh1EETKsHiKcJUiKooCvQDjxw4fhmkoLrymxrHRGvXAyiNRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737904139; c=relaxed/simple;
	bh=79S6p1dzAo83LjiM4h+1g1KMQ/eV5WKp5iEfHEhxF+U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HXdUVEG/7EgdvNN3/AOT6z+RAUJSa3Rs6MTjlaIk4S5DLScZn+idVTuo5ZtBymgiPcp2WV8typCUlKLQAKPrxrnUPj5F7EQPOUm7v8hpHz8uB00wJYROsN4wXekueeoK+BqtWvz9zDE+hv97CYlBxBSuKt8aCpbPZlTglrgMg1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZT9NOpI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE5EC4CED3;
	Sun, 26 Jan 2025 15:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737904138;
	bh=79S6p1dzAo83LjiM4h+1g1KMQ/eV5WKp5iEfHEhxF+U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NZT9NOpIv3Rj1sEqlYpxcb7IY9dSiHMZQF/v6fDUdP1WML44V9ND0a9zldx/5RPuH
	 aGOn0kqgFF9y18LonF+BTCmw/b9cRRWm2hDg2SZ9h4iB4f9edCKVgmRjwgknHaH6u7
	 L75Or4wUbilzH5YHBXtgTpi8iSXBNgtpUOX+pDoIvLLWLpM5AuIDZ2u8OsRH8ghBGK
	 ZTlU//eb0TYXScyTMffPXVdKC9pmcnerGCeL7TMW+j40YEIX+Yg5SEehHtAdk0dhdh
	 Va5XrgFfU31DQi9K5CK6Q/Q6mQz43b9ZipaWCsF8ilPhEBwWvCnvrYGVxSyYBtH2HM
	 6LKE44jzwNkBA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Illia Ostapyshyn <illia@yshyn.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 8/9] Input: allocate keycode for phone linking
Date: Sun, 26 Jan 2025 10:08:36 -0500
Message-Id: <20250126150839.962669-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150839.962669-1-sashal@kernel.org>
References: <20250126150839.962669-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.74
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


