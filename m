Return-Path: <linux-input+bounces-7071-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2779901BC
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 13:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 082331F233C2
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 11:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCDB413B792;
	Fri,  4 Oct 2024 11:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m63XBjAH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825BA149C4F;
	Fri,  4 Oct 2024 11:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728039643; cv=none; b=li3E/fI2xeE5zphtSLysfuNoRm7tMomGW6Rhk99BOqoyUEwZNYwxEN4gcMJeDRHW3JKCicr5OSQcmVtmL5LFqXx8Vz3lL8WzGkGwHtjgJ9RX3V1MSHiMhnh7oF3NqjjdwyX/rFLnrIKDaMADJXggu0HYZ9GLNotIQLDy1TuCPs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728039643; c=relaxed/simple;
	bh=Ub50/5ocM2e8m0GvABi80QfltncQNkqUarBuDPXJEsE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=THFzCFsyEPACnCoVx11f07QDJIgCKPLTJ8Whla/vmWhXWDVuO9X6vY927BwmXSu0L/Lz5Nr1rBKo0BvYHabuvnxBrJ7IXkG24DJ/de0QEc6PhFXEDA0+Z5s0y7Kq3oG9ArYqq4XdHx4VH8zZtuM3QmK2uEx8+FyxqZsaKuUgI8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m63XBjAH; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20b7eb9e81eso22851095ad.2;
        Fri, 04 Oct 2024 04:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728039642; x=1728644442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oqaUgzy9WyXZ72F+Wn2bCgjOdUtG0/DRzPe+PZoOtWc=;
        b=m63XBjAHDX6wRMOlaJuLDdYCWlYzhFBvMYZlI6+gGxS/JTHMCEJbz9VykUxCeHHmnJ
         GQm7uBq579nnyPVMweJkks1mEryhFIbcXqE8mJnEqO75zplelReCTGKce2PKNwZREEOz
         P3HVDX1ZRKNz9cPlfPfNs+1KCsg9izUxUBvjqVXBV27OuvpK0C6lGKngPzHgRzjEht2q
         mlu1w/Gp9YgTaU6euE7igBWFSus/JkBmpsHp/eET8XlPgD1VGeVGrweqkyEZm+KoHy6h
         mG0GdCJkF6i3g1EDuAfA9POOrGiBw4NI1yU8UJe7yOO3PFPnYHV0jmZipLF3/+/NJHp6
         N0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728039642; x=1728644442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqaUgzy9WyXZ72F+Wn2bCgjOdUtG0/DRzPe+PZoOtWc=;
        b=FF3c+heveURd95DDW129I5Fb20/Y1moerwviK+Fy3NrvVZKpAFjY1HIoU4gBq+qkxG
         o+/SSR19B8EsZdWBbwjCWE0nh7qbfYdlJpJK24fPZsLtURUwqSAyKTJqGniaHKM2SH8a
         VWx0f5/xu2ynKzuK8YFTud0nBg6PUONE3I3j5Yqc5G3jLeUOs4LqHrYDCyulbqqMs4V2
         ACmwHyRONcB1gcJWeNM8J51z3e09UpM3f/e9DCoyZQ4ZMSbdrHpL8p4+5dIR+X+hSzel
         WNETsm51kgFJIUhQZZbChEYI4ucb5+dm7zM9eYny3YtU87h38KM3QoHB5SjFKCcBE1iz
         +ysw==
X-Forwarded-Encrypted: i=1; AJvYcCUJk/kkW0VTrECnOnEYrlcr9eSj8xCo3WV68udDiVjEHSO66HzKSf2Uzvynuiv16vaoowIuiD07A9KUXqE=@vger.kernel.org
X-Gm-Message-State: AOJu0YytwCJeQa0SLQGDoXk+8lcG8kBB8KDavUh1lZt5+SS+z38JAzVd
	lXZ3B+LgtZIOKEcf1akANvLnfu82rEGzyQWCJJwn9GT2goknBMY4
X-Google-Smtp-Source: AGHT+IF0pfvkmh2vNowtSGjSChTIOQXUameo+rLNVMZ1qFS36DJH+9F2+yQj5XcC4WnSYPyLVkzYsQ==
X-Received: by 2002:a05:6a20:9e4c:b0:1cf:4418:4517 with SMTP id adf61e73a8af0-1d6dfa48a63mr3282172637.29.1728039641610;
        Fri, 04 Oct 2024 04:00:41 -0700 (PDT)
Received: from purva-IdeaPad-Gaming-3-15IHU6.. ([2405:204:20:6275:2654:2317:92c7:7b80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d81537sm2939369b3a.71.2024.10.04.04.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 04:00:40 -0700 (PDT)
From: SurajSonawane2415 <surajsonawane0215@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	SurajSonawane2415 <surajsonawane0215@gmail.com>
Subject: [PATCH] hid: Fix inconsistent indentation in hid_add_device()
Date: Fri,  4 Oct 2024 16:30:29 +0530
Message-Id: <20241004110029.18946-1-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the indentation to ensure consistent code style and improve
readability, and to fix this warning:
drivers/hid/hid-core.c:2847 hid_add_device() warn: inconsistent indenting

Signed-off-by: SurajSonawane2415 <surajsonawane0215@gmail.com>
---
 drivers/hid/hid-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 612ee6ddf..8f08ca1ba 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2844,10 +2844,10 @@ int hid_add_device(struct hid_device *hdev)
 	/*
 	 * Check for the mandatory transport channel.
 	 */
-	 if (!hdev->ll_driver->raw_request) {
+	if (!hdev->ll_driver->raw_request) {
 		hid_err(hdev, "transport driver missing .raw_request()\n");
 		return -EINVAL;
-	 }
+	}
 
 	/*
 	 * Read the device report descriptor once and use as template
-- 
2.34.1


