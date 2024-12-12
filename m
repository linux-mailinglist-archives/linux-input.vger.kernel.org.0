Return-Path: <linux-input+bounces-8506-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 516459EDDA2
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 03:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4258281D65
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 02:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68B413D52E;
	Thu, 12 Dec 2024 02:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOG1szf2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFBD5464B
	for <linux-input@vger.kernel.org>; Thu, 12 Dec 2024 02:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733970441; cv=none; b=GJJfAjnVgr0KefVLd91wN7WKvDmYYwvFkfyPxTp3lO3oJXCCMiKlw5CFUQ+xEogPhPQn5hRbMsAL627diDI4r3SaNOZWVEx7ZeWhf+jG5sE5ZzSV3H9wJNa3xEwf90gXAmgzhNkfY2n/Z1GGsnoFAsbRjKXJZYJ/KbQdUEW78nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733970441; c=relaxed/simple;
	bh=uDrXoIS9jU54+mQU/5nGRWUXPUWF8Jvb8aj/Anaq4Dk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NA9rSsnMFWzjiklLs995yvDob06spBGJK7ifDDUEt46J13jQNicUCtQp4D4HGu+wAdqcUBF7jAKQPBjx2YKdOUshdMOOHY/TyuvGnjN1VG20/INICJ1851MLFa4SyfQi5E1QlPCopX2d5ThYJq1+tzdYOIStXxn//bMc0k2WdMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOG1szf2; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-725dbdf380aso102092b3a.3
        for <linux-input@vger.kernel.org>; Wed, 11 Dec 2024 18:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733970439; x=1734575239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5obsVgIqglHteiayUbstO9iXmffeE1QKszvUu2SPKO0=;
        b=TOG1szf2hV0wjjFJDvBybva9dlw7/EfysXgjkpvjuVCaDbZbZUODbqYeNFrFTTcZq9
         3k9p+0W2tUf3uARot/dQujAC8C7WraXRXd/WxMMRD3aMcUWhDhHaW5P0MLA7w3t2QvQF
         /ic7NYn8+2MfyjqFarxMxtnPaehGKZrvXbTIeJgSs+qPQmyAauSfBRFSGmV9YJyOGZP+
         XR+76LwpUcRD84Nu+j958yOO2ZmfwDS2t1uSZk3OYe/cXpckzxJYK6if59LWnugiCfU7
         h2godIBo8hvcS03Fybok1JzufLOIiZP0tzsyyOlT5vPHeEJjSMBABNN6CvEk2S7tGXEn
         1OdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733970439; x=1734575239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5obsVgIqglHteiayUbstO9iXmffeE1QKszvUu2SPKO0=;
        b=uLHxDP0jZMe5bj9T5VX1CmpxUlrX3OEFx6qDrXuxK+lkCWdu+NaCzoelw5fUJ8YUZK
         XMrWZZFQYLBNzFv0vs6qDYR/ppMvH3pwlqBXldIESZIAHgIfEFdYTlxEnVS03jhXO5mh
         K3fivjCpRFGXYGwb3+lMQadeMvcpb9qf9dObxI/+gb6EVDvFpOt2NhEBOCU4JfB0avjH
         bQ23LhJqJv4GGco7Lw0eWWdxroFfmIzq6BTQja+TPMmChp++oBFv9PDFZJVTOCihfYGB
         rDpIeBTFGpbscyqnXEFEhWEr4pXLiMUMQXxfZ+xsxno7/Xr856GZStAGe4kCb3qzaNDh
         huUw==
X-Gm-Message-State: AOJu0YyZSkWI1pUPMJ+ftUcFQDgZ2ajJept0D7biZPIzqlTO9c2NLKHI
	rCQURaZbfYaWJuz1mruFO1N1ab1p8pD4z/FJ9KPBKykCBKoAoeHxx1Mc2/r7Uzzu/w==
X-Gm-Gg: ASbGncvZv5YqgTLDsqllYMlARs8kzlsuvcQ6LRNlsp0aHl1bur9s1BvP+FpdLZdz6wS
	7r3BcuZIQUZ205a+NLlRdpdZc5A7MUZwl9bDDzigU0eAHVCdK8Q5wAwzC0BjnXJZO1RjCIBeKOy
	UMd41xFT7jJBXVRLx5et/BJtEq4mrl6Oi67muExm4wSleeHQHwplwurFKBLacT3u4b2AFie+mzE
	UznGd3Qk6W40ye/ROnHOAf5tdgiOwuOVwtpEHqnQvRE3PNLWapI/Bz1VQ4N6y7q
X-Google-Smtp-Source: AGHT+IHsAFcTGjyE/J5JvQl/yBN4Jgoapk+7W38sB3yHfQymWDUaDwNlluK/0TJYgvu7j4Ipx0NlIw==
X-Received: by 2002:a05:6a00:92a6:b0:727:3ccc:25b0 with SMTP id d2e1a72fcca58-728faaabfa8mr2186301b3a.16.1733970438921;
        Wed, 11 Dec 2024 18:27:18 -0800 (PST)
Received: from localhost.localdomain ([50.47.88.67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725c7cba42fsm9442575b3a.123.2024.12.11.18.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 18:27:18 -0800 (PST)
From: Ryan McClelland <rymcclel@gmail.com>
To: linux-input@vger.kernel.org
Cc: djogorchock@gmail.com,
	benjamin.tissoires@redhat.com,
	jikos@kernel.org,
	linux@emily.st,
	Ryan McClelland <rymcclel@gmail.com>
Subject: [PATCH] [PATCH] HID: nintendo: add support for md/gen 6B controller
Date: Wed, 11 Dec 2024 18:26:48 -0800
Message-Id: <20241212022648.11680-1-rymcclel@gmail.com>
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


