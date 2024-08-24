Return-Path: <linux-input+bounces-5817-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F8995DC0B
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 07:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DE871F2260D
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 05:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B4F16BE14;
	Sat, 24 Aug 2024 05:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYprlK0a"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207B015666C;
	Sat, 24 Aug 2024 05:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724478666; cv=none; b=jHuFx89+dclQ2cBxIwhNsi6yR80h1E5dpHPNk3ONPvLiKKcUN3yjxUZspyM79qX6PsVwm3THp3hbGyLPYb4oPxsFj1ddMJ3pvXuugT6P5YHvg8PBfs+8fBBmoUBNhlaOZ38CIRGoqmQ6g1HOT4/EUYeDqpPVBPrXLO+1JS+U/Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724478666; c=relaxed/simple;
	bh=wEFODl4yeDg3eyT9jMQUENszOYCv0kVPep+SFxJdH0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qEAeVasaIJV0dm561WXyEOJiRjCwTLHTw1a9Q61Hx7MXvwaj0UeUa7F0O64BxPsM3yMfb1kVUkghW4DmTn3cTrSuSm7ntRCGnnZ5rJxq5Exmrv1wWVdif4qVDme/g4deztXK6ha+lTkYmIWQ5HdckwCKHA7dyLCHjiVdT75Vn7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYprlK0a; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20230059241so23086655ad.3;
        Fri, 23 Aug 2024 22:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724478664; x=1725083464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6Sg2wDuV70PjHjfBL6ApHgYUIE/Vxr5uqqwJxQtROc=;
        b=AYprlK0agQUqQqqn03D77XGeH6iyfY/P6EJN8Val94af8b775Y07SATSkhzKj8IUNE
         Hf8fYL+iJ9olDom1h+in4uLbFqnCQ7463bRoFE1ze6ht2+zAbIpaa7JykhsLwepTE6ZW
         B/e0DWUHcWdmOqXcrR5xo//lXwSaSxDlAJQL5tm5Ou8SuZwNKxA9lVB6tbSbq4ZlEFq8
         5rdhVKfvcDNDKyx5wtI6VkjOVz1+FeileaDuk4YgT5ykcDQdTMs4E4ZAPA3nmByxtn5f
         woyYP3xjlSQwQgHg+qLzNWkXkZZ199jhqwm/acyGwcIiFYXm2xFbVX5xe0Nxqev23BCD
         BmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724478664; x=1725083464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A6Sg2wDuV70PjHjfBL6ApHgYUIE/Vxr5uqqwJxQtROc=;
        b=egUnGLHorHTXztYsAMLTI2pbvBXUjkVxu2ZhweXvY4WgrYJdIAk+f/Xqk7DBXdp7Dx
         54c4djN+/U4Reva8bCY+3hogetZG52B1fQwcd1cnOlZVVgYMd4Kqj+x6L2PWCMLYM+ck
         ufn635ljHwTlRD2SsmuvmAlHa8X19UVqe+ddY8OHfVT2y+QZv88Vqu9cw7JlsMxvvexg
         mZVQcPECsMEOlh2t64hPv7/BfZWPa66WsR96lWww4fK2JuGiVpuiknWuQ5+3ToIFeDpV
         /7CqGPxFP/V5dSGKzGHgH2Laui1vGNlRRdWbCidfK4RTem6T4avkZMtlrq2beJG42pw5
         7aMg==
X-Forwarded-Encrypted: i=1; AJvYcCWxJVxke2xrIMWymceEgEq0tc6j8NLKcsgr36ebPKNlNniyKIiA8R97TK6sgD8EZeiJuto6KGKlmHo7xQ==@vger.kernel.org, AJvYcCXUFjbd1WaY7SSSTclBddYZimki1eUjKf/uG8wk2dmzFUuWb7VFMRtiy/tlKz4eUbEqNV9AVJYVnIjY4VnD@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/GKqYasfx75dKZOXo9zBn94iDABGiNdtfOJe56rysDt+bFvnv
	8XQMRxEU6BoL6lrMxJRjyZa+d45BTEXVG2w4K6t6kelPDsSwtXBW
X-Google-Smtp-Source: AGHT+IFDkbfV3uN3rli45qhKMMnb/dSuaj8Bs5wgbk4xEv2M2AC0KO4uleN1CMVQTA3sbxb45Wkkjg==
X-Received: by 2002:a17:902:d511:b0:1fb:82f5:6641 with SMTP id d9443c01a7336-2039e47b214mr51258395ad.23.1724478664137;
        Fri, 23 Aug 2024 22:51:04 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:75c:5a5a:d7dc:18f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20395ef904dsm23398615ad.31.2024.08.23.22.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 22:51:03 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	linux-input@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/18] Input: zforce_ts - switch to using get_unaligned_le16
Date: Fri, 23 Aug 2024 22:50:33 -0700
Message-ID: <20240824055047.1706392-10-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240824055047.1706392-1-dmitry.torokhov@gmail.com>
References: <20240824055047.1706392-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of doing conversion from little-endian data to CPU endianness
by hand use existing helpers.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/zforce_ts.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
index 0dea389594bd..32f3d74bd339 100644
--- a/drivers/input/touchscreen/zforce_ts.c
+++ b/drivers/input/touchscreen/zforce_ts.c
@@ -22,6 +22,7 @@
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
+#include <asm/unaligned.h>
 
 #define WAIT_TIMEOUT		msecs_to_jiffies(1000)
 
@@ -327,10 +328,8 @@ static int zforce_touch_event(struct zforce_ts *ts, u8 *payload)
 	}
 
 	for (i = 0; i < count; i++) {
-		point.coord_x =
-			payload[9 * i + 2] << 8 | payload[9 * i + 1];
-		point.coord_y =
-			payload[9 * i + 4] << 8 | payload[9 * i + 3];
+		point.coord_x = get_unaligned_le16(&payload[9 * i + 1]);
+		point.coord_y = get_unaligned_le16(&payload[9 * i + 3]);
 
 		if (point.coord_x > ts->prop.max_x ||
 		    point.coord_y > ts->prop.max_y) {
@@ -521,14 +520,15 @@ static irqreturn_t zforce_irq_thread(int irq, void *dev_id)
 			 * Version Payload Results
 			 * [2:major] [2:minor] [2:build] [2:rev]
 			 */
-			ts->version_major = (payload[RESPONSE_DATA + 1] << 8) |
-						payload[RESPONSE_DATA];
-			ts->version_minor = (payload[RESPONSE_DATA + 3] << 8) |
-						payload[RESPONSE_DATA + 2];
-			ts->version_build = (payload[RESPONSE_DATA + 5] << 8) |
-						payload[RESPONSE_DATA + 4];
-			ts->version_rev   = (payload[RESPONSE_DATA + 7] << 8) |
-						payload[RESPONSE_DATA + 6];
+			ts->version_major =
+				get_unaligned_le16(&payload[RESPONSE_DATA]);
+			ts->version_minor =
+				get_unaligned_le16(&payload[RESPONSE_DATA + 2]);
+			ts->version_build =
+				get_unaligned_le16(&payload[RESPONSE_DATA + 4]);
+			ts->version_rev =
+				get_unaligned_le16(&payload[RESPONSE_DATA + 6]);
+
 			dev_dbg(&ts->client->dev,
 				"Firmware Version %04x:%04x %04x:%04x\n",
 				ts->version_major, ts->version_minor,
-- 
2.46.0.295.g3b9ea8a38a-goog


