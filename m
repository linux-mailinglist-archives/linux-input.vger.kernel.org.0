Return-Path: <linux-input+bounces-13530-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6683AB04424
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 17:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 168FE3A97E9
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 15:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02204272E75;
	Mon, 14 Jul 2025 15:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=khirnov.net header.i=@khirnov.net header.b="piqLE9cJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail1.khirnov.net (quelana.khirnov.net [94.230.150.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71513266EF9;
	Mon, 14 Jul 2025 15:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.230.150.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752506906; cv=none; b=o0EG1tTBhQOn5+i90fM9kqfY7vRA04+FU9E+0gieU2NjmxF422yuj5m+m4wk88BAIDDYT4exerO0CbQb5TD7aB5o0xJFpViNHwDMDaIf+1Z2dSiSX0ZOXbZjQjLPghmWAEm6XUqZYXKw/rNzw/MmY61b7yvvgrhPHbL3E+0eGp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752506906; c=relaxed/simple;
	bh=NUnBBDHaIeOZRpZ99g3X6g+5/j84aEiBr/RfaJULEew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X7N6IIV+mxTrAqC03A5IZSDTtf/2vtw8F0QMwcL/Ud/6EGCoKlkeMSnlY3Biz6ELfDnt67CbNb58MVPk4wcTzMSW7bbSurQ90H5gGAPf0wwpDTgaGcIGEdjJ5OUdgi4J4NZqLjkcRH7KBvmKpErkqd/i71ssJ9ac+AnrrClYYBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khirnov.net; spf=pass smtp.mailfrom=khirnov.net; dkim=pass (2048-bit key) header.d=khirnov.net header.i=@khirnov.net header.b=piqLE9cJ; arc=none smtp.client-ip=94.230.150.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khirnov.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khirnov.net
Authentication-Results: mail1.khirnov.net;
	dkim=pass (2048-bit key; unprotected) header.d=khirnov.net header.i=@khirnov.net header.a=rsa-sha256 header.s=mail header.b=piqLE9cJ;
	dkim-atps=neutral
Received: from localhost (mail1.khirnov.net [IPv6:::1])
	by mail1.khirnov.net (Postfix) with ESMTP id DDD2F3E49;
	Mon, 14 Jul 2025 17:20:09 +0200 (CEST)
Received: from mail1.khirnov.net ([IPv6:::1])
 by localhost (mail1.khirnov.net [IPv6:::1]) (amavis, port 10024) with ESMTP
 id aHN6JMB8peBg; Mon, 14 Jul 2025 17:20:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=khirnov.net; s=mail;
	t=1752506404; bh=NUnBBDHaIeOZRpZ99g3X6g+5/j84aEiBr/RfaJULEew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=piqLE9cJvJLGG/tFyrMSU+pGmeWBCLBBTeQlC0MeIcRmbDfBOQGOiFhQLLdqcF1SC
	 WLG/oxsoINkTCYjfgRdkmGNygoA/5JVcr2IsHqIEw469ESrUcCa7Sg01Iw7GND4v8z
	 xo2JPGHftjFknU/wH8DaiwgfQFp70x8pD9p2XozpsB49YGTJbWJaH9WQ7JCfmIyHaZ
	 nicWIm+rHQR6V4W60niXpSY7ZW+/qHEL42+XAHrkQdrKIr5cRbZVwVINqLBPZrupaU
	 7OavU9yxQfNj6PrYlYtW3r8ExVt0aqKl/AlWK7y310gBsE7BWDMDa3oPO3SWQQIS4S
	 UqwOY4QcZkxdw==
Received: from dev0.khirnov.net (dev0.khirnov.net [IPv6:2a00:c500:561:201::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "dev0.khirnov.net", Issuer "smtp.khirnov.net SMTP CA" (verified OK))
	by mail1.khirnov.net (Postfix) with ESMTPS id 7A5A43290;
	Mon, 14 Jul 2025 17:20:04 +0200 (CEST)
Received: by dev0.khirnov.net (Postfix, from userid 1000)
	id 01610404ED3; Mon, 14 Jul 2025 17:18:07 +0200 (CEST)
From: Anton Khirnov <anton@khirnov.net>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v2 1/2] Input: allocate a keycode for Fn+space
Date: Mon, 14 Jul 2025 17:07:57 +0200
Message-Id: <20250714150756.21197-2-anton@khirnov.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250714150756.21197-1-anton@khirnov.net>
References: <20250714150756.21197-1-anton@khirnov.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Asus ExpertBook B9 laptop sends a WMI event when Fn+space is
pressed. Since I could not find any information on what this combination
is intended to do on this or any other Asus laptop, allocate a
KEY_FN_SPACE keycode for it.

Signed-off-by: Anton Khirnov <anton@khirnov.net>
---
 include/uapi/linux/input-event-codes.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 3b2524e4b667..a49b0782fd8a 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -548,6 +548,7 @@
 #define KEY_FN_S		0x1e3
 #define KEY_FN_B		0x1e4
 #define KEY_FN_RIGHT_SHIFT	0x1e5
+#define KEY_FN_SPACE		0x1e6
 
 #define KEY_BRL_DOT1		0x1f1
 #define KEY_BRL_DOT2		0x1f2
-- 
2.39.5


