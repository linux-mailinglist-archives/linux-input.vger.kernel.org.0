Return-Path: <linux-input+bounces-9143-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D11DA0A153
	for <lists+linux-input@lfdr.de>; Sat, 11 Jan 2025 07:36:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C1983A32CB
	for <lists+linux-input@lfdr.de>; Sat, 11 Jan 2025 06:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 475BB15383D;
	Sat, 11 Jan 2025 06:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3q5w3WW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE06ABA4A
	for <linux-input@vger.kernel.org>; Sat, 11 Jan 2025 06:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736577371; cv=none; b=hRralCS2SNj7oweJ8dM1FszJ1XkP3pq9ZKl75yPm7nyzbVOjWgEBeF12i00hN7600dyBKOhHrD1RxqT99Y9/nxIz6IUBuCga4SK5TDLW+1Xk0IVAwAUqgkttiKSa1DUJfE3c3hkJN86R/Kb73DIKgxvBWFcU4h6he+InjkltaGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736577371; c=relaxed/simple;
	bh=yRSM7ihln/0ZS5pEdt9sDIu3lMI3MtdbIRbWsmn/Mww=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RL7pA6srmT3jkg4Kkfbdm08DwGNnmgaXeKcC04Yk8LjRf6faFfFc+NTTk8kuKjxV7ZLX3yv+Fdra034THO+IHcu+cIydZFBZjHxmF4cGzw9Ak8vOj4DOMMrMvyufLn/dq0ocibAEmWYSxmSbq20WTGXG5zocIfj76q8dYHw91R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3q5w3WW; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-216281bc30fso55302015ad.0
        for <linux-input@vger.kernel.org>; Fri, 10 Jan 2025 22:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736577369; x=1737182169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fw89/V32YkhUM2B4sWXKak00mFjw4D5CeGU8lL3brIg=;
        b=U3q5w3WWc6L0LCWzH31UjSIQjRS9b5jNU+/m94sjmkHABh523IHpy0O5OCJnXPaNkc
         NZLW/c3zcEF01OFVPrxMAPd0E2TDR9c6DKuyJv14wd1kg9atE7eIDjhNqPaWZSrSzWvT
         hZKD2gL8hH7D/xydW9+sKyvbUXKWMnpBkptMcyO7QiUmvlor9lZFAdZYjxmkyQndZdRU
         CZcTef5+SiU/XDQ8vVp2+z2Q6j/bQiKTQsDYvKgZpbbB9VKajCPX+Agum4SG8NV1R/Jb
         KQ+qbX3KH8ZFUfFaVH6d2itxlvl89j8pHuuEXqNyapv1XB8xS5jbL8b45wXuifXsNBzr
         26qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736577369; x=1737182169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fw89/V32YkhUM2B4sWXKak00mFjw4D5CeGU8lL3brIg=;
        b=RKQraFKg0f5/wia0oR4Y5BGWDS2z363GNACAtc8mXoLVzP9xkYke/fJNZrSJLAToA1
         FaDjye23AdJDnD2CGMbZztOVW0uMTNdecQDVRwfIRY7wCWUsX7Y4v8EnBTahrG0tUsWE
         cTrvic8QfLj+xFeNhT2KnKONKFqfRjffc++hp0vqzY+8w5Kd7la/wjTtqQtZYxDVbQyk
         q74OulwXIIf3sycYPLKjpj6gu9QNVnruOF6iBgaDhNyACXc8X0efFXIMsHdALpiwqQbA
         8yH6MvwLwXAEvGmKPBIiD7fZ4/jMEhXA0mHGgSNPbA0o3ulQmVBbd2/3+fXniMbHS5qJ
         /30A==
X-Gm-Message-State: AOJu0YzvROwNFQHVQg8eb6GdSLYo2wMueVJan98opNMI9YVjREUS1Il9
	cMdbo3eV6DhS8DzP0J0EC+RwSc3aLJ3NM2n9z6zs1tIdZfd67T4t4LgNV3wk
X-Gm-Gg: ASbGnctZf8Hwh6cCWpKHodQ7MUE5ubbS8lnwL61NBr7NyEXwaCMsM3LDQd2S703swLd
	4F5lOMjjI6a305U2l7aYo/4H6hFPKltO11UjjyUK9dgRjil9ObBKpKRuDexItTb2oaAO9UQX356
	8RO6xLue/knJDLF5xLvrZkW3uETIB8ZDR8pTF+xhU3jS5psA2e3UuMCjhwNWcaHPw+BUETX0Efi
	SdNXAQC1Jp/wIcl81734MOMn5G579Ar8iCq3pH0e6I7ycPZq49BQQR73TicHgm0Gg==
X-Google-Smtp-Source: AGHT+IHQIvleQe5p6yWWlrKZf0WQnBaPN/JLHPrasNVUKNZmQ0e4YCQ5c4DMZCl/BJI5MK/sbiuCgw==
X-Received: by 2002:a17:903:32cf:b0:216:644f:bc0e with SMTP id d9443c01a7336-21a83f502aemr225432485ad.24.1736577368640;
        Fri, 10 Jan 2025 22:36:08 -0800 (PST)
Received: from localhost.localdomain ([50.34.47.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a369e30sm6980230a91.45.2025.01.10.22.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 22:36:08 -0800 (PST)
From: Ryan McClelland <rymcclel@gmail.com>
To: linux-input@vger.kernel.org
Cc: djogorchock@gmail.com,
	benjamin.tissoires@redhat.com,
	jikos@kernel.org,
	linux@emily.st,
	Ryan McClelland <rymcclel@gmail.com>
Subject: [PATCH v2] HID: nintendo: add support for md/gen 6B controller
Date: Fri, 10 Jan 2025 22:35:16 -0800
Message-Id: <20250111063515.4356-1-rymcclel@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NSO MD/GEN 6B was a Japan-only controller released which has
6 buttons on the face of the controller. This adds support for this
controller. It still enumerates just like the 3B controller, but
will use extra bits in it's report for the 3 extra buttons. This
also changes the events to match the proper position. The VID/PID
it reports is the same as the 3B controller.

This also removes a comment on the N64 Controllers which didn't
mean anything.

Signed-off-by: Ryan McClelland <rymcclel@gmail.com>
---
 drivers/hid/Kconfig        |  2 +-
 drivers/hid/hid-nintendo.c | 18 +++++++-----------
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index f8a56d631242..5b1156f4e9bc 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -775,7 +775,7 @@ config HID_NINTENDO
 	Adds support for the Nintendo Switch Joy-Cons, NSO, Pro Controller.
 	All controllers support bluetooth, and the Pro Controller also supports
 	its USB mode. This also includes support for the Nintendo Switch Online
-	Controllers which include the Genesis, SNES, and N64 controllers.
+	Controllers which include the NES, Genesis, SNES, and N64 controllers.
 
 	To compile this driver as a module, choose M here: the
 	module will be called hid-nintendo.
diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 55153a2f7988..839d5bcd72b1 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -456,24 +456,20 @@ static const struct joycon_ctlr_button_mapping snescon_button_mappings[] = {
 	{ /* sentinel */ },
 };
 
-/*
- * "A", "B", and "C" are mapped positionally, rather than by label (e.g., "A"
- * gets assigned to BTN_EAST instead of BTN_A).
- */
 static const struct joycon_ctlr_button_mapping gencon_button_mappings[] = {
-	{ BTN_SOUTH,	JC_BTN_A,	},
-	{ BTN_EAST,	JC_BTN_B,	},
-	{ BTN_WEST,	JC_BTN_R,	},
-	{ BTN_SELECT,	JC_BTN_ZR,	},
+	{ BTN_WEST,	JC_BTN_A,	}, /* A */
+	{ BTN_SOUTH,	JC_BTN_B,	}, /* B */
+	{ BTN_EAST,	JC_BTN_R,	}, /* C */
+	{ BTN_TL,	JC_BTN_X,	}, /* X MD/GEN 6B Only */
+	{ BTN_NORTH,	JC_BTN_Y,	}, /* Y MD/GEN 6B Only */
+	{ BTN_TR,	JC_BTN_L,	}, /* Z MD/GEN 6B Only */
+	{ BTN_SELECT,	JC_BTN_ZR,	}, /* Mode */
 	{ BTN_START,	JC_BTN_PLUS,	},
 	{ BTN_MODE,	JC_BTN_HOME,	},
 	{ BTN_Z,	JC_BTN_CAP,	},
 	{ /* sentinel */ },
 };
 
-/*
- * N64's C buttons get assigned to d-pad directions and registered as buttons.
- */
 static const struct joycon_ctlr_button_mapping n64con_button_mappings[] = {
 	{ BTN_A,		JC_BTN_A,	},
 	{ BTN_B,		JC_BTN_B,	},
-- 
2.34.1


