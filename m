Return-Path: <linux-input+bounces-9328-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2658A149E1
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 07:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A9EA16B204
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 06:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97BBD1F75A6;
	Fri, 17 Jan 2025 06:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bN24B5x5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0491F76D5
	for <linux-input@vger.kernel.org>; Fri, 17 Jan 2025 06:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737097011; cv=none; b=c92mLt3URZ5qdB7lPoW84ZaPyD9apMsQurLfBfmEHyJKkKYFMV7fkgQoQjsBCRuc+EUHZ8FVi3IDTi/WQ0x2loaTJGSdxKx6oJW8yiToCRpMqPVfuvsUjMjRmxlRIjQ4JnS0Cc7C+CkUR9hai789TpB1PrquFJGfeyt/65BZo4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737097011; c=relaxed/simple;
	bh=0uo/aAP3kWiGjmIbTDvn+OQONV/Km16Enjf1KTNCPUo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AY7aFHVKLa0dP1CqKYIrj+S/YkcHpiOQRrs4hwAf7LaE8cq4LGu2AtduLM8deb3b1x93rtVFJUbCIDE4C5q62+02GPdD54SJKryBpWV9gIGYIPB4/y07wutp4OxO6Y8Sr6i2e57cdJSyWOL05lAb+Ai6/aoQso6AhVH8AK4Iq0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bN24B5x5; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2161eb95317so32838495ad.1
        for <linux-input@vger.kernel.org>; Thu, 16 Jan 2025 22:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737097009; x=1737701809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=63cbFINjGlt2rD8s5ULHaLw8lMNA+pd00g/JnJyCLfQ=;
        b=bN24B5x5c0mbvmw0BDc7uw3KnKt/BxtxkGu3SqLH7nUU87BftFVR00ti6ONa2ryDDe
         yuu6X3EtxK+caasb+NV8KPB7JPZu5S3qu96fZOmEI6vKcbcy5WWrT7LSWgM7pKgeYSAq
         HGSkiMO9fj4RL8jBhzSDogCXtco7Uj8TAfn9mB7YigUXPsv/9cmvFueo1eT28vovKkRr
         n1cPo0VwBAi0UhTGDTM+0y3UabzM7JT58rl8DKMiMdMKsqodDrLamxk0veFigdYDIlMq
         Al2y2mLRutX0HywSBHxz/2w7Ajg8VKojo3OrEionr5mJiuE6kaVx9i4HSw7cg8zsbUV0
         pGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737097009; x=1737701809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=63cbFINjGlt2rD8s5ULHaLw8lMNA+pd00g/JnJyCLfQ=;
        b=mDx000NaR4ApGUg67TVluaLUGilh1JIJcRqZfoFDaZ99QO7g+ZcL7ywbwufDchBo6H
         ZsOoq1s7+77uZhaaHRaNNBXyn4Qk3lsnzMTuNe8DC51xlEwBl60bS6rg3rZWmb2zlAOF
         3LYkVdjJvwkjEKK8zei/+PcGpJZgWYdjbsc+T/KFrTo/UDfbFrX5Au0h3j79m8BR0/fD
         HR7pGELXhvKP1cKBoYkfWLqQOOaBrw69NzAOqGn37yDTLCNj2h5gQnmz09V742VJ2UqL
         /6ZbNXidSMlo0kF5bG8HwA41KFJ8jsBygkYARLiXHZlMnct+UujXkkro3fX9S5xxC9tl
         H7UA==
X-Gm-Message-State: AOJu0YzJqvonzeuKtdruPFoRDB+44aQwsktufM/myIu+8/8XlOaiM+CE
	/+WW3eYe196zGWY11q2u4lG1u9maLAdP6i+TsOKKZG7brPGEfkoRqDS37uKV
X-Gm-Gg: ASbGncvpx7DXw9qMHgAqDAokHMp3/FUtdq19R7bAgXIPObuz52E4jWtwj6dMnDv3iEJ
	NdkkN8vD1eT5CVHinnokht89asbE/KrVvdFehYSojJD8MWdDZV7OkmuVNTDDeEGN0z5GfCbeg5z
	y41L3Snhjb7qGcH4hfgC1lhOZP7bARPWzrQLN80g659HLKtVfGEWumMpP5aBFNmkrAFoPkOyNS0
	n6nJ7NheQueU/FPnhvW7KMfExYzwWWaAKpLiHTLZOHOZ/gQF8xb3pbf0fvV0rmo4Q==
X-Google-Smtp-Source: AGHT+IEQFqvKb/JM/lcZ1gjUDLCdFY+1nd+AYZa1rPe4mzNGhn9WuVMOz/bZrX/IZQB3hIIqCwE2ZA==
X-Received: by 2002:a17:903:1c7:b0:215:b75f:a18d with SMTP id d9443c01a7336-21c351bd440mr23807555ad.11.1737097009030;
        Thu, 16 Jan 2025 22:56:49 -0800 (PST)
Received: from localhost.localdomain ([50.34.47.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3acf50sm9524565ad.143.2025.01.16.22.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 22:56:48 -0800 (PST)
From: Ryan McClelland <rymcclel@gmail.com>
To: linux-input@vger.kernel.org
Cc: djogorchock@gmail.com,
	benjamin.tissoires@redhat.com,
	jikos@kernel.org,
	linux@emily.st,
	Ryan McClelland <rymcclel@gmail.com>
Subject: [PATCH] HID: nintendo: fix gencon button events map
Date: Thu, 16 Jan 2025 22:49:24 -0800
Message-Id: <20250117064923.3811-1-rymcclel@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes the button event map to match the 3-button recommendation
as well as the redundant 'z' in the button map events for the Sega
MD/Gen 6 Button.

Signed-off-by: Ryan McClelland <rymcclel@gmail.com>
---
 drivers/hid/hid-nintendo.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 11ac246176ae..839d5bcd72b1 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -457,13 +457,13 @@ static const struct joycon_ctlr_button_mapping snescon_button_mappings[] = {
 };
 
 static const struct joycon_ctlr_button_mapping gencon_button_mappings[] = {
-	{ BTN_A,	JC_BTN_A,	},
-	{ BTN_B,	JC_BTN_B,	},
-	{ BTN_C,	JC_BTN_R,	},
-	{ BTN_X,	JC_BTN_X,	}, /* MD/GEN 6B Only */
-	{ BTN_Y,	JC_BTN_Y,	}, /* MD/GEN 6B Only */
-	{ BTN_Z,	JC_BTN_L,	}, /* MD/GEN 6B Only */
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
-- 
2.34.1


