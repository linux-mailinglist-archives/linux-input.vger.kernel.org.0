Return-Path: <linux-input+bounces-4964-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1599E92E280
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 10:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4D441F218FE
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 08:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E621514F4;
	Thu, 11 Jul 2024 08:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qz/R//zg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A66684DFF;
	Thu, 11 Jul 2024 08:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720686918; cv=none; b=NHQf9ENUhREdGh6N+nmAznitYGgF4Aw3Wu1LE7bdso7S/uniw3laa1RuNaKQbWM/bFPDm6bWlrCF+Hw8NiNbIldGSZbGCWpMChMt+BkxoMamzgbO6Or9gwI+EDNjB/sBgkYeiPjkhj2rvaTRYckPGlQjrJCsVRQDKX0/Vxgh2UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720686918; c=relaxed/simple;
	bh=/sRKFgmsDsZIzpYRaVug4Mi4NZRhZ/7HAM2acJMAb6M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ezDwsQ6I338c3iCjnxli1UUqSeRC5efFh6ODg5iUCLFHwlaI7vYsXMFH3+UtdD1PNCaV7eHyMA3frSJUBRk0ibgJRqaAaqarhr5x27TWVRR1HPsiXC784RTs5IrS99rdnD+dJwG0xOlljEDxDeL53iz/NYafq1rTuBY2ko1/HJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qz/R//zg; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42660b8dd27so3814115e9.3;
        Thu, 11 Jul 2024 01:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720686915; x=1721291715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XRdelXRPrYArCb0SO4NlJ297ukxQ1Ul5Gq5hQ4uFaDA=;
        b=Qz/R//zg7Ldz9gU4zUy1v0vqrRf8+B4G97zdoJc1/yN5ZqLTCTC2lACn7/Jw9ir5pV
         9ntaSYGWoSJKam0hXLJ09UbfUe4gBkrZ30z7M2TbJu4T7uQcoGJAvvLOQF9jv54Rsq3L
         YBYC4zOLPhAvnTH3WjIulkfsqdD6TB6RKcFqU5QdJk03IklUQgytM68A8CHN4YcNQmW9
         cdL6gYuijD6sxn0Xe35DIFlAtNFgHp1i1tT5KhuqUZ4nCq6neM7kyas+YproAbTtHD8E
         HzejYsYRpmOiHsYdS0B77abmpcYXQJPBIiKjSrjtUnALMYgu38y+khjr/FVc5lxC/Ngq
         arNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720686915; x=1721291715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XRdelXRPrYArCb0SO4NlJ297ukxQ1Ul5Gq5hQ4uFaDA=;
        b=VFXKPOd/Z82lkUXx1BJFwlWDKghIBfkwuOANbjWNeMkGy2JoQKT0Ycir42YZ1n4Ml4
         yjKfsjcukiB3nwlEC6OW1DizqfMW6KbmxZbu44VfP+TzvbSjzAqvQF0PPQ0f6g6kc9ai
         DyFZ/dRxbpnnMRx47j5JJc2nC6NEi1V5Yj9PP3vYpZpndaHogFQq8/ixsW1LoJYnVQry
         zwgsPngFH7+G12Unglo9SI97eLVmishe9R5zgtpdVBMtj9257hmLoZDsyYgf8h3Y5a7m
         E26BJQyy4PRr+1BkFAJ54kFpnYc57eNj15Cqq8VcCVq1RORDDHPxwk9ogPYgHs49o7r7
         DY8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnSIqBOcTPoz30A8Q2a1X8xRE7zZ2wzf8BPP52Taw5/qfLxe0R9LkyiIxv2/jJzqk2DXb91sTfimZmuqy8IFx7Un7UuLNc4HD/LFmhSHq+4EtChXQ1oheB3z6OHCXZIpy/d0tDzh2jLxA=
X-Gm-Message-State: AOJu0YytM7WAtWeUtEgJmAYzl9i1Qg5EBHaty0iwhB0/e9dteO+Mp6YD
	huqwgqIfOLvui5dy9w1WffHAz+Oz7jElWgaUajWA/ukzq1+BtoB0tgZMHA==
X-Google-Smtp-Source: AGHT+IHvedUvC6o9qAq1eGQZ5ALhsjKnN3PtlkJahY1fTvi8O/oyo+CmYeV6XOuyBnIJqCpZn8l7pQ==
X-Received: by 2002:a05:600c:12d5:b0:426:629f:1550 with SMTP id 5b1f17b1804b1-426707d8a6dmr52591585e9.9.1720686914702;
        Thu, 11 Jul 2024 01:35:14 -0700 (PDT)
Received: from localhost (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6e0b4bsm108667675e9.8.2024.07.11.01.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 01:35:13 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: Fix spelling mistakes "Kensigton" -> "Kensington"
Date: Thu, 11 Jul 2024 09:35:13 +0100
Message-Id: <20240711083513.282724-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There are spelling mistakes in a comment and in the module description.
Fix these.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/hid/hid-kensington.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-kensington.c b/drivers/hid/hid-kensington.c
index 99e79b42047c..16839027981f 100644
--- a/drivers/hid/hid-kensington.c
+++ b/drivers/hid/hid-kensington.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *  HID driver for Kensigton Slimblade Trackball
+ *  HID driver for Kensington Slimblade Trackball
  *
  *  Copyright (c) 2009 Jiri Kosina
  */
@@ -46,5 +46,5 @@ static struct hid_driver ks_driver = {
 };
 module_hid_driver(ks_driver);
 
-MODULE_DESCRIPTION("HID driver for Kensigton Slimblade Trackball");
+MODULE_DESCRIPTION("HID driver for Kensington Slimblade Trackball");
 MODULE_LICENSE("GPL");
-- 
2.39.2


