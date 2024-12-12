Return-Path: <linux-input+bounces-8505-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 841329EDDA1
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 03:27:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B61C72813AD
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 02:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1DB613B5A0;
	Thu, 12 Dec 2024 02:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPEAFWal"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E1013C918
	for <linux-input@vger.kernel.org>; Thu, 12 Dec 2024 02:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733970364; cv=none; b=WE1uqGX7PeGG5L5rnsj5KbuM2oj+SgWLXgTIUn7SMSq7zWA66mzoLu940+JOYdhZkjpvbPOR9o8/62/CHdSbNdLo9A+L9cehZ3BMTkKzsz+yRkt5VJcucQPZBqJv6as/xLpxzW2RyTd34Ani1Gu0Hd2/z0Q5YGGiNAPw6TVpxSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733970364; c=relaxed/simple;
	bh=uDrXoIS9jU54+mQU/5nGRWUXPUWF8Jvb8aj/Anaq4Dk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z8aae5wqDRG/mH09T16fvBB5h4gd0lNGAb1Gs2CHnrr/Ih2B68sFSnpUwuDIe6AwAnXJvEvadS30THV0HutoVM3axc4Xg3rV3GFEg0a7h1xzE+nQdUFQk/dNcOe9zMb9OslUqLIyZiS74HhT8etxa06obkolzkx1ZvJ8eAtgdrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZPEAFWal; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-725dc290c00so1104468b3a.0
        for <linux-input@vger.kernel.org>; Wed, 11 Dec 2024 18:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733970362; x=1734575162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5obsVgIqglHteiayUbstO9iXmffeE1QKszvUu2SPKO0=;
        b=ZPEAFWalnKJQslFrEFgCKAU3C0nbF4FFoAbdmTNCt1IfZv2QzM811D2QNZI3+zmpMr
         u+A7AMDMbxsIMg5XnmHjY0RkLTzUnaZpKIGhKpx/rWxzRsbbXqOqEjDB7+DMjyH6uGD7
         xch3gW8LAaqMhahowlkmf4givD7SzRiBstW8YaiG5MCE3lr9XjC5VgBDiSg0Xgsj1o1l
         l7QMef/RGj/8lb/C2XXGsdtSis6w4q4CW0942ZQC/UiL8AdevfNcP9eHbW170g2+rrqi
         q1ukwzkKbcV99Fp89QjmGCdEZARqsHXuJ0eSIMY6BwhlbEy3hOhXoOTzvtQdlP+Gse8g
         v4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733970362; x=1734575162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5obsVgIqglHteiayUbstO9iXmffeE1QKszvUu2SPKO0=;
        b=K/Ov5ZwvcjjBSJzu9ntrNOCY5Em180/KhxEWSUHvd1hxlbD176iS47LEC1fDkPlYa6
         5QGyQJ6RruV6PrV7Ne2zztHRbRVyLFSsQxu+3fwbiHC0+C5x8wofCMg/PPjTgyuig0/N
         l3IdT2GWwpJ43Wmp6bpGmOnz1lRovjAHLEX7TwsVWiu1qJa4xGM9djgw22CLjNDhQpVE
         JhfJEv7dpKlpK6hw1s90NK7TMPBL+oyd2QQt0bXa/pRo/LXhn6/GMAB9JBdo7W8cvEWX
         LsNE8l/oqsq99R0l3fJJod5N3XAdBDf3LPtiMSa9g7lSmtGmgdic/8UAj+lDEOxmUVL4
         aQqw==
X-Gm-Message-State: AOJu0Yz/HhgVVyZKXkGQaX/cZX87H/pOU0XCz282GYLH5jOIaRLo9MXN
	7wj3lH9NncfgJ5NODwzj0M/A6ovQYWR9wV9JRPh4wIWratPBijOqFQVZVAvy3TMOEA==
X-Gm-Gg: ASbGncvbLL6k61F3f7G20tlmIHdl1Dn8Y8/xULZOziw3VFWFgq2A2+XXrV9w7JkwduZ
	0g6QPxBTIxCSyM5R+xwNC9xAR3+J0PIRaIcLLNz+fafBXgbS2ArgdQrUVqM9MtarTiYEbIKKqBi
	8SOBQ8xjBuAQNXZGK6yfC7ygOx2K6NyfoFUjrfeGxNgCMncpOacmOP8/+njI0dbFclX/FQyWH/D
	WxJhTAkfG/8xa1UKXKTzjIq0IzU7l0fXeXWqf+kUx4siFjCoFSJavUyL96baXq0
X-Google-Smtp-Source: AGHT+IGJZVcJz4A5vjzhLI3vHnVgALTtqrM9nCgVAnMMjgg84hJEPhWg2e6mXTIutgulejnrxg4Q+Q==
X-Received: by 2002:a05:6a00:999:b0:725:f1e9:5334 with SMTP id d2e1a72fcca58-728faacb4ccmr2591408b3a.8.1733970362298;
        Wed, 11 Dec 2024 18:26:02 -0800 (PST)
Received: from localhost.localdomain ([50.47.88.67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a29e8df0sm12172563b3a.68.2024.12.11.18.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 18:26:01 -0800 (PST)
From: Ryan McClelland <rymcclel@gmail.com>
To: linux-input@vger.kernel.org
Cc: djogorchock@gmail.com,
	benjamin.tissoires@redhat.com,
	jikos@kernel.org,
	linux@emily.st,
	Ryan McClelland <rymcclel@gmail.com>
Subject: [PATCH] [PATCH] HID: nintendo: add support for md/gen 6B controller
Date: Wed, 11 Dec 2024 18:25:57 -0800
Message-Id: <20241212022557.11250-1-rymcclel@gmail.com>
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
will use extra bits in it's report for the 3 extra controllers. This
also changes the events reported to match the letter on the controller
for the NSO MD/GEN controller. The VID/PID it reports is the same as
the 3B controller.

This also removes a comment on the N64 Controllers which didn't
mean anything.

Signed-off-by: Ryan McClelland <rymcclel@gmail.com>
---
 drivers/hid/Kconfig        |  2 +-
 drivers/hid/hid-nintendo.c | 16 ++++++----------
 2 files changed, 7 insertions(+), 11 deletions(-)

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
index 55153a2f7988..11ac246176ae 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -456,14 +456,13 @@ static const struct joycon_ctlr_button_mapping snescon_button_mappings[] = {
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
+	{ BTN_A,	JC_BTN_A,	},
+	{ BTN_B,	JC_BTN_B,	},
+	{ BTN_C,	JC_BTN_R,	},
+	{ BTN_X,	JC_BTN_X,	}, /* MD/GEN 6B Only */
+	{ BTN_Y,	JC_BTN_Y,	}, /* MD/GEN 6B Only */
+	{ BTN_Z,	JC_BTN_L,	}, /* MD/GEN 6B Only */
 	{ BTN_SELECT,	JC_BTN_ZR,	},
 	{ BTN_START,	JC_BTN_PLUS,	},
 	{ BTN_MODE,	JC_BTN_HOME,	},
@@ -471,9 +470,6 @@ static const struct joycon_ctlr_button_mapping gencon_button_mappings[] = {
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


