Return-Path: <linux-input+bounces-11849-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8629BA94560
	for <lists+linux-input@lfdr.de>; Sat, 19 Apr 2025 22:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E568177E35
	for <lists+linux-input@lfdr.de>; Sat, 19 Apr 2025 20:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403C51E3774;
	Sat, 19 Apr 2025 20:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5Q899BP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED5F1922F6;
	Sat, 19 Apr 2025 20:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745093100; cv=none; b=OHMmQCVgNfV6vkE083ThfVodrDKs/95y2WEG6y/hlMMcGPQez/swZqo+8vh8xRBa8UJuA2sbFrE4Rngv+FUJuOAaO53F6Jwh0lazi0ybEdlqWavIYA68n5U0Wbh28L9CyKcBw05n4LbEm4y6yvWlvA3j8I8+bUpJV5aPkFoShPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745093100; c=relaxed/simple;
	bh=u5FJ7O/Bk4zWHpep5CMeQFngie6H5PQbHNqajSf2QBo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RbQ4evJnMxxSPNoUnoiYy1uxH/vdj9pKpDyLxMXhxnPzwjCRoIihAyFxw3p9AhiKvi+iTDwDz5hhAr+E+blAN7jWL6xGNxvj8sT2OXiIqBViiHhcre+1URg/tv1Qx4y4yBL1P0E6Oe8wL9j/8AC5DSlmnk159WOIA2objZFSx7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5Q899BP; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2260c91576aso25199045ad.3;
        Sat, 19 Apr 2025 13:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745093098; x=1745697898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=slCeZF2FANQQmUO1DaJwFXxYa64miWm1wNaU56U8m40=;
        b=X5Q899BPpjyBjftPW1aijzxXbmGq/ZC3s/V1GBIYObg2OLFXceEIIE6BwHT4fCZm8B
         SKGzp6d4i9QFJ4I/s2TV3v2I+TzNqTqEIwxTTZ2hLJN+ew1qzsExiU2o+LTWGeopYif2
         /6x2PLYRw/FP1e8xswX3oufQlwebi9y7eGCPy+CozJmbNlZAz0iiRBLiJaBfGnLIUaUP
         3raqvjwlbD0T2IoE69UEa5uW5DBtvbyFF4YoPkqS+bhZRshE/CO5wpD7Z02f3uGOItYh
         QwrrHA+KlEuYkj5Kc+hN7Brq19z48z1nlo/jQgA8Vc3HBxkrvoSdEuXj1qUKCzMFx/22
         7n2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745093098; x=1745697898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=slCeZF2FANQQmUO1DaJwFXxYa64miWm1wNaU56U8m40=;
        b=V9CaoBC0FjRAiSVV2i7stAJt1/AF/owsxiV4jAG+6T+INgBK35IZMA64aiJ51cprjg
         T+injlKVlakKLr6tvfmVqozGEwAonOCGN1q2ACeAEi08cUr/Q48Vol6I6teurKyUiwie
         s+9b9K2Nac6LQULH01RRPopMLqudsD9LcrY7oLoAIWOr6l0jtjwRXizbci/pWFR4aeqs
         FEKjCJASeI4S9X0pVfFpd7isHH2C827ZT62YxgiSkD9dQSVKn6S73OHYbRGbqYjksiXP
         3hgsSa3FCE+kin28VmE/kM3DIOprHNmWXZClVSLmSnNIirsv8TEzbiLkdMUISwzehhbH
         i+xg==
X-Forwarded-Encrypted: i=1; AJvYcCUzZbh8AqWyOqyMPBh81RRBGlfpHQi7GCPPjvHYRPC1J+OPxXWj04+brrTsbyc+gU/rbIAoyxWPmIUbKA==@vger.kernel.org, AJvYcCWV6BFsyDGZBQW53TP/nX9/dsnTqG4SqZbWNcgic/Ix2uwqQX4Ix0ACRBjKZcILCFFLkXxGuJ2Qzc2NF/81@vger.kernel.org
X-Gm-Message-State: AOJu0YwiIX1rYdkRJFe2obO0mIoDn+yKgvNNLGfO1VbF04yacUkb+DEh
	fygVPhiLJp1kU4mtiWPG72qU3wZrNKdRAZwcIXf6561zDqqh7nJe
X-Gm-Gg: ASbGncuKdDqqZYR4pcpm2nPXW5eXCaCaLkbILn0QIJzxRCZCjbA1FEpUGI03JLljdzt
	DsKftiHYw76dvfs/PlSwMEpv/GyiskSZ9gSRj5KFAHv5sZQWSbaZpgeqN/gea73QEQc3gC2Gae9
	N4QKm+k/CiHDcGUDJ5NxQCa0c5y3fYINjzY965KhwEs9ICZM96LLmaQ/50xnetOzqNNTjfMflU+
	6lAeb3jBupCLnSjlL6HVRagOpbnXxQXRwpQuRQvJFC8Fn5JUbW0YnaE/6vRtFbSccrpwjlB51oV
	3CD9OShZus07vjlXf9vpVsM45s3WHRH0d/qRL2GEoTlEK9kvMwZKxD00rK8ZWEumEzIYsFyFt1x
	to74K6xaVhA==
X-Google-Smtp-Source: AGHT+IFcuHh1TgIZlauZRXMqg+RwPDUribzs6XJTkNntA9GZO2aGFSa2Ha/BySFu6FyTzglT3vZKVw==
X-Received: by 2002:a17:902:e88a:b0:223:f9a4:3fa8 with SMTP id d9443c01a7336-22c5359e645mr101597215ad.19.1745093097857;
        Sat, 19 Apr 2025 13:04:57 -0700 (PDT)
Received: from purva-IdeaPad-Gaming-3-15IHU6.. ([2409:4080:1187:dd2:ee65:709f:56e9:9560])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bd9963sm37752925ad.34.2025.04.19.13.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 13:04:57 -0700 (PDT)
From: Purva Yeshi <purvayeshi550@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Purva Yeshi <purvayeshi550@gmail.com>
Subject: [PATCH] input: iqs5xx: Fix incorrect argument passed to hex2bin
Date: Sun, 20 Apr 2025 01:34:34 +0530
Message-Id: <20250419200434.39661-1-purvayeshi550@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix Smatch-detected issue:
drivers/input/touchscreen/iqs5xx.c:747 iqs5xx_fw_file_parse()
error: hex2bin() 'rec->len' too small (2 vs 4)

Fix incorrect second argument to hex2bin() when parsing firmware records.

Pass a pointer to the ASCII hex data instead of the u8 record length to
hex2bin(), which expects a pointer, not an integer. The previous code
passed rec->len as the second argument, leading to undefined behavior
as hex2bin() attempted to read from an unintended memory address.

Cast the entire rec structure to a const char * using a new pointer
rec_bytes. Skip the initial ':' character in the Intel HEX format by
passing rec_bytes + 1 to hex2bin(). This allows the function to decode
the 4-byte record header (length, address high, address low, and type)
correctly from its ASCII hex representation into binary form.

Preserve the original code flow while ensuring correctness and resolving
the issue detected by Smatch.

Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
---
 drivers/input/touchscreen/iqs5xx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index 4ebd7565ae6e..e8140a54685f 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -744,7 +744,9 @@ static int iqs5xx_fw_file_parse(struct i2c_client *client,
 			break;
 		}
 
-		error = hex2bin(rec_hdr, rec->len, sizeof(rec_hdr));
+		const char *rec_bytes = (const char *)rec;
+
+		error = hex2bin(rec_hdr, rec_bytes + 1, sizeof(rec_hdr));
+
 		if (error) {
 			dev_err(&client->dev, "Invalid header at record %u\n",
 				rec_num);
-- 
2.34.1


