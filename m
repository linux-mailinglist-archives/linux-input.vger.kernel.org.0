Return-Path: <linux-input+bounces-3997-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5FF8D6969
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 21:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DFA81F27F3D
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 19:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3895F80C0C;
	Fri, 31 May 2024 19:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=math.uni-bielefeld.de header.i=@math.uni-bielefeld.de header.b="s6PRNz2a"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp1.math.uni-bielefeld.de (smtp1.math.uni-bielefeld.de [129.70.45.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5989880604;
	Fri, 31 May 2024 19:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.70.45.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717182560; cv=none; b=e+7jrrLeLxE3eC+TIGWqHbygTHBV9JgtTtqg94jJCnAz4rJ8l1x2BXfESExJblj3Wu88Fy78WR7XAnlhnalbDmCkdr5jgEuQFPBmtvL5bFmzP8OVJTcPcUT/qnSgo7Ja1/7ZmvOJ1Dr3amODFMVbLR2esmNTocnj9TDqG5Qg4TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717182560; c=relaxed/simple;
	bh=f6oyVa4CF+Atx2Os6W1pYW+SHbV4+5PZDkBbDDgOlAE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r40dhGHzpsxfQeUPET2ExC3VNp1UBVRoXXP1lNz7l+Vd88Vwsvk+Wu/sKiIlk/QpkMTh2JjTmwrTN3xXGRMGhuhmdSUv9lVCQjjtPROi+SFzinM4AYpu72XMAv71w1uVK9Db7Vj5ly5Fw9dTgu09ip4CFhVEmdo6Pv8m0acN+qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=math.uni-bielefeld.de; spf=pass smtp.mailfrom=math.uni-bielefeld.de; dkim=pass (2048-bit key) header.d=math.uni-bielefeld.de header.i=@math.uni-bielefeld.de header.b=s6PRNz2a; arc=none smtp.client-ip=129.70.45.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=math.uni-bielefeld.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=math.uni-bielefeld.de
Received: from localhost (dslb-088-074-203-220.088.074.pools.vodafone-ip.de [88.74.203.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp1.math.uni-bielefeld.de (Postfix) with ESMTPSA id 867DA6014D;
	Fri, 31 May 2024 21:01:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=math.uni-bielefeld.de; s=default; t=1717182069;
	bh=f6oyVa4CF+Atx2Os6W1pYW+SHbV4+5PZDkBbDDgOlAE=;
	h=From:To:Cc:Subject:Date:From;
	b=s6PRNz2aHjg5896ke3uhntALQDyhSz99QfC1B91xOm1j62oXnSrWYhuujaM5PPULS
	 6IhG04FI9qC5TGvkMkwrduu2ONlkGbTlqtFymZu+LJNKGtnNg20AwnXAWcXfc5MwsY
	 JK6JXPnIJU0Re522Auaoujm+MiD3LEvfju9oFDHESqnpBKoFVHFS4s5m7L7PA0evcS
	 sWvbF9vGPhKcF8feELZGs1rssjjCFrVv4C0qLdRFTQ4bWJaika122wWJh8Wlfej37U
	 fzjso3cOx0HR/HEOP4pxhkSvEiHJHe8xoj6Kh44N+mLY4sfBy8VjdXzbGs93N9lVMu
	 Xd5A4T6lWTFew==
From: tjakobi@math.uni-bielefeld.de
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Input: i8042 - add Ayaneo Kun to i8042 quirk table
Date: Fri, 31 May 2024 21:00:59 +0200
Message-ID: <20240531190100.3874731-1-tjakobi@math.uni-bielefeld.de>
X-Mailer: git-send-email 2.44.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

See the added comment for details. Also fix a typo in the
quirk's define.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/input/serio/i8042-acpipnpio.h | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
index dfc6c581873b..0a7388985622 100644
--- a/drivers/input/serio/i8042-acpipnpio.h
+++ b/drivers/input/serio/i8042-acpipnpio.h
@@ -76,7 +76,7 @@ static inline void i8042_write_command(int val)
 #define SERIO_QUIRK_PROBE_DEFER		BIT(5)
 #define SERIO_QUIRK_RESET_ALWAYS	BIT(6)
 #define SERIO_QUIRK_RESET_NEVER		BIT(7)
-#define SERIO_QUIRK_DIECT		BIT(8)
+#define SERIO_QUIRK_DIRECT		BIT(8)
 #define SERIO_QUIRK_DUMBKBD		BIT(9)
 #define SERIO_QUIRK_NOLOOP		BIT(10)
 #define SERIO_QUIRK_NOTIMEOUT		BIT(11)
@@ -1332,6 +1332,19 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
 					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
 	},
+	{
+		/*
+		 * The Ayaneo Kun is a handheld device where some the buttons are handled by an
+		 * AT keyboard. The keyboard is usually detected as raw, but sometimes, usually
+		 * after a cold boot, it is detected as translated.
+		 * Make sure that the keyboard is always in raw mode.
+		 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+			DMI_MATCH(DMI_BOARD_NAME, "KUN"),
+		},
+		.driver_data = (void *)(SERIO_QUIRK_DIRECT)
+	},
 	{ }
 };
 
@@ -1655,7 +1668,7 @@ static void __init i8042_check_quirks(void)
 		if (quirks & SERIO_QUIRK_RESET_NEVER)
 			i8042_reset = I8042_RESET_NEVER;
 	}
-	if (quirks & SERIO_QUIRK_DIECT)
+	if (quirks & SERIO_QUIRK_DIRECT)
 		i8042_direct = true;
 	if (quirks & SERIO_QUIRK_DUMBKBD)
 		i8042_dumbkbd = true;
-- 
2.44.1


