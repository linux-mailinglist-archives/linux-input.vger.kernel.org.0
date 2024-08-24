Return-Path: <linux-input+bounces-5829-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBE295E05B
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 01:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44CBB2828B0
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 23:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A61A3BBF5;
	Sat, 24 Aug 2024 23:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="niPwGZRh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF91E143C65;
	Sat, 24 Aug 2024 23:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724540950; cv=none; b=L/h33VTeu/5O0uoO7p7iUJC8kOaG7mNdZ3jWUdtGbzLmUBbLIqg4lNNsC9YNPOjHpU28V0WO2BYIFS+jX5zTqn4/TTEi6O/N+m3oRbWeb7uPGZcC6PfTVDZLD6UVLncGclkJPQmrleGY709hNb3SOmQ0pYetUetcjjpqF75HBOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724540950; c=relaxed/simple;
	bh=ZrOC1zUVkdiXHcbr59SrdaqtM61fTnQ7JIWJyeyssj0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eVck2CO0Q5nL4MfRWROLqQMaoIcm1meeDevBR9JDrhSHQbeOfkY4mu6ytJTYxpxXjenp/feHho0P0y8BeK2JSYOZsbTTjtYs7bBeyWVlsq6vTp5GuGO1yhcnnoj56JyCfuPJX40QdonIHr3h7PPghC4b1+hgvvTXtTPIFjQulUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=niPwGZRh; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7141b04e7b5so1903653b3a.2;
        Sat, 24 Aug 2024 16:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724540948; x=1725145748; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SXYoPzhjpgs6hzrUIhXBQFs0Z9C75BOqJyhpBr67TLc=;
        b=niPwGZRhdX8z3Eiw/hhDIxU5nKbT0ZRFFdZ8tJO3tbpx++6pxb0En9EFjbMdL2zWmT
         w+EW/PwhOAitwASE1pJfhn/23j6+EwvWyiCZGLzvmpasMlbIFbNo/DN3l1zvUn0hlEgQ
         pppi3Ld250TBlD8Wszz7D3Ye9sKT0aANNHjzaOHftc5ee0VlQftsqrYguKtTPYHx++PA
         vDurG8uprNNIoBv7ADorQcjXJLVcSF8aTXZFIxE7c5mJCR645YD6BdNCwZSU4sPjCH1Y
         RQpmI9seKbWSkhyYfdxFYh2arQ8kuuNna0VlonfOfEca0Osd6Y2gVywboWowbkuIXwSn
         eUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724540948; x=1725145748;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SXYoPzhjpgs6hzrUIhXBQFs0Z9C75BOqJyhpBr67TLc=;
        b=sK2D7Pnm7j26C3GrgFYlTmGVb1FN2Pzz8nF+NAkiPb49TI0SoV6MjIe3FL8hrFzib3
         cicp9ZfcmKce16SOJtZ+x2FUHGHAfVOTZOG7IbIjQVu7KJdc/tH4rFEZTAMO3lpPtXfb
         J+RYaz4iLrbobi9rO6bZjn3sMj4jZO128NouNPWAoW3uEKjPZSVIA7CxUAHTpvkQJpKB
         /sxDSU0vL2ZfKv+6G56S5gZbSuBIeK3cpN8/SHJpXNSX6/ZSjTw+pVBdDQVgV/pKwiAs
         4V6I1hv2QQ007j930yEGcSteE4C36jCANhxPiPRayLXyZtlQAse4rJ6hYyguc01COL96
         CVmw==
X-Gm-Message-State: AOJu0YyAjifrsuBYFaGmkH6bbcP/XotLYJsO7cLeIMExxXU5UuTKvjGL
	I+NtUnrmKljX1W6J/tMRd+kLSTjnC5Og+ZADOzwrD7FlX9zy2qJBp3jF5A==
X-Google-Smtp-Source: AGHT+IGHQRF40PF5BNOEbA78HaTRgHY1QZd0uTIAr1jrza/C1UbY8PP4K9enV1s0ZqDvvE1mmbU9iw==
X-Received: by 2002:a05:6a21:1191:b0:1c6:fa64:e5bc with SMTP id adf61e73a8af0-1cc89ee96ffmr8999824637.34.1724540947440;
        Sat, 24 Aug 2024 16:09:07 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d613a58fdbsm6733295a91.29.2024.08.24.16.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 16:09:07 -0700 (PDT)
Date: Sat, 24 Aug 2024 16:09:04 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] Input: matrix-keymap - switch to using __free() cleanup
 facility
Message-ID: <ZspoEPdTcH-hpciy@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use __free(kfree) cleanup facility in matrix_keypad_parse_keymap() to
automatically free temporarily allocated memory.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/matrix-keymap.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/input/matrix-keymap.c b/drivers/input/matrix-keymap.c
index 5d93043bad8e..3bea3575a0a9 100644
--- a/drivers/input/matrix-keymap.c
+++ b/drivers/input/matrix-keymap.c
@@ -73,10 +73,9 @@ static int matrix_keypad_parse_keymap(const char *propname,
 	struct device *dev = input_dev->dev.parent;
 	unsigned int row_shift = get_count_order(cols);
 	unsigned int max_keys = rows << row_shift;
-	u32 *keys;
 	int i;
 	int size;
-	int retval;
+	int error;
 
 	if (!propname)
 		propname = "linux,keymap";
@@ -94,30 +93,24 @@ static int matrix_keypad_parse_keymap(const char *propname,
 		return -EINVAL;
 	}
 
-	keys = kmalloc_array(size, sizeof(u32), GFP_KERNEL);
+	u32 *keys __free(kfree) = kmalloc_array(size, sizeof(*keys), GFP_KERNEL);
 	if (!keys)
 		return -ENOMEM;
 
-	retval = device_property_read_u32_array(dev, propname, keys, size);
-	if (retval) {
+	error = device_property_read_u32_array(dev, propname, keys, size);
+	if (error) {
 		dev_err(dev, "failed to read %s property: %d\n",
-			propname, retval);
-		goto out;
+			propname, error);
+		return error;
 	}
 
 	for (i = 0; i < size; i++) {
 		if (!matrix_keypad_map_key(input_dev, rows, cols,
-					   row_shift, keys[i])) {
-			retval = -EINVAL;
-			goto out;
-		}
+					   row_shift, keys[i]))
+			return -EINVAL;
 	}
 
-	retval = 0;
-
-out:
-	kfree(keys);
-	return retval;
+	return 0;
 }
 
 /**
-- 
2.46.0.295.g3b9ea8a38a-goog


-- 
Dmitry

