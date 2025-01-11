Return-Path: <linux-input+bounces-9144-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE51A0A154
	for <lists+linux-input@lfdr.de>; Sat, 11 Jan 2025 07:39:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6EB73A3780
	for <lists+linux-input@lfdr.de>; Sat, 11 Jan 2025 06:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E6B15383D;
	Sat, 11 Jan 2025 06:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4+4eUIS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA21DBA4A
	for <linux-input@vger.kernel.org>; Sat, 11 Jan 2025 06:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736577590; cv=none; b=tkR6trSaYn2xHAflSzC4GACLtnYpa9KT8e+jDlzaz7x1n9I+RD5bNHB4+ceaS+LZ0NQjzIcJNMsYbOy7nBw9EI8yebBKOP6KNB8ZgYy5iDjQLawHKJd3HTcT6By8aq9fqWq3CYkOH0qUGvaoRdy8+bn462n6BwjV9CJrc2Ax+uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736577590; c=relaxed/simple;
	bh=+AtlH6MqO+Bu1VWWXFIwraFW/vj9Wz8Q6T6dfwkJUDc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Rd+dK4DAHBvwwIUTNDX3m4x4aWyxGM/EiTzU3JF2s682/4nFZobu0SSiWrNgDEMTb3ceHZVK8HC00Ay2K5aaA7EhmTx+h/YUKDf9Y4MAMbVp6bqyo1DjCEpUMZnQ/0+vNOnhFj38nh7gzHTKqSg9j8k1wEgOZqvBf3VFliNKnak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O4+4eUIS; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ef748105deso3602669a91.1
        for <linux-input@vger.kernel.org>; Fri, 10 Jan 2025 22:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736577588; x=1737182388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=86YjT+Lg+FHCbECyLcDBjj1Ra+pYm7UYYdNdv+yU2L4=;
        b=O4+4eUISs+arDRMgpRx4MndG+N6RHVJllVyLeAZJ4iAwA8zsift+pGbraUHDMsga4g
         nDHc4JCE8J2Kyh40mnXwOOz0eRLzvY3nn0799ShKAJ4vCU5htxNZotqSQ9hoRY1Z2Q6g
         /zqo9Wg92ikFbTJJVgaKIw8a+TJT2zgcd1bgo8H1AqEdQ7NgTNmDpKZb4yNAUkuFADi6
         tMjijIRt4igZ3c5nfcuAPkgM7a5AT2FHvJ8HOJHzA/RzzTlXDqpxjUqHjh4WZVc7uF2Z
         DakU1MYDyut5bVglcVY5F4z5mHnrsglC6gugQs/RJOOFXoLqLlvmZ5uzGPVZmnMfxPzQ
         q0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736577588; x=1737182388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86YjT+Lg+FHCbECyLcDBjj1Ra+pYm7UYYdNdv+yU2L4=;
        b=BL1/IwbWakZ11MdAyY76GqQMS6bf781v2jJ7WNkwq/ZMH5KklK9IXzHMP1KvflF340
         QGz8w7fqHGJZ9SC10acCEI7/VwCrlQ3TIRW1/XD9whgGterbLnT4BAijCm70PbvYlM2a
         CfuzFXbhqbJ93OF7yKPPeQcSM6z1UdtXG1T+YUE/v9rFFEkXH7IFuwLmBE27xwJ7QaiG
         lN+I9KoUCnI8KAaQWTmN/fniZrp6KBiYa0J05PA1JF1fkIpPgLeSnxOEAO0tvr0FfDyJ
         lubotdk8MyYpjOY6cXWceBJ2v8t0c+BfHOw1CTBlfxhnLxSYN2YhN/47b92kOqkMIwMQ
         gOXg==
X-Gm-Message-State: AOJu0Yy7pyC0KN/GlKEe5EpLR+T+q1rRs+H8UT2WPrq/cfJIsbEWmt+i
	yShS4QiwJbUqyi0pd8bSkB3Xi0tKRVEO4YHLFoQ508UyXpDe2jjUsdK5zT6c
X-Gm-Gg: ASbGnctxC7KWtBDf9JFbklivmbLv3qPhYy/+5ZIneXEuvUu4CpG9Lxe9tRWno22XKWw
	xpmTABkV7PcR/1qNys2yRwtShS/TG1gcPP9Ko73kVueQfPmum9EwDr6qhFc1xBE9RjSQQQUkVxy
	tJA3DGcidQabeL6hn8EPNd6e9VF8yDhroNpxLw5Aq2qIUKBc9S8Lk+EM7Y0XB7E/t93JUsgC1AV
	3xgl4OCl7SyTfwaIUbiGT+fiKAXmW/6M313bCtMAIku+rr1S1Q6ZDW43zcJFud2Wg==
X-Google-Smtp-Source: AGHT+IHL6+WKlIig8HiEifpFAXhPxhzoExEr/aPFwolLhiEbPrZ9MAXJVpOdxHZKVMQ4kuk0ivDI1Q==
X-Received: by 2002:a17:90b:2b87:b0:2ee:8031:cdbc with SMTP id 98e67ed59e1d1-2f548f1ec3fmr16872813a91.23.1736577587818;
        Fri, 10 Jan 2025 22:39:47 -0800 (PST)
Received: from localhost.localdomain ([50.34.47.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f12fd12sm21877435ad.74.2025.01.10.22.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 22:39:47 -0800 (PST)
From: Ryan McClelland <rymcclel@gmail.com>
To: linux-input@vger.kernel.org
Cc: djogorchock@gmail.com,
	benjamin.tissoires@redhat.com,
	jikos@kernel.org,
	linux@emily.st,
	Ryan McClelland <rymcclel@gmail.com>
Subject: [PATCH v2] HID: nintendo: add support for md/gen 6B controller
Date: Fri, 10 Jan 2025 22:36:22 -0800
Message-Id: <20250111063621.4715-1-rymcclel@gmail.com>
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
V1 -> V2: fix button events for genesis with redundant Z and correct layout

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


