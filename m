Return-Path: <linux-input+bounces-7752-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A109B3C07
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 21:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 020AA1F22BA5
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 20:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81D81DE4DC;
	Mon, 28 Oct 2024 20:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYOsFIMH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B96E190499;
	Mon, 28 Oct 2024 20:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730148060; cv=none; b=kKawG2LvJ4WHz2g/Wm7b2Ymher8N7zlH5vrWDI0VVvi4ZPQxIWRmBYoI3KzmS6J+64kvVs9t9jKJ/xyoBdXAQUypay3hC/ByNlK57XL9rYnFVwAj4QxmgxbWV0z2Ix/qpjqR8p/xEdH9aBwC3kUmU3Iz54DvcPqnc0QknneQfh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730148060; c=relaxed/simple;
	bh=AEvMktj1acoWJJaI39mfyu5cI7+ulIA+4PhzW7SZL/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gXdskAasaIjf0NN/XQHUoY6H73j4zeMow+4ZHkUSjytmFu6/zax94gwK7+OuVaAzgctqQcGt7immizuNufWJms4wJHE1pfCQQc6G3Cr0BHM0fGKGzGD9pQ14CX/i9il4ruDB+PnLV2IdPhzLZ4YReFuXmLTBbMH9OV2wLDgy5uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WYOsFIMH; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20c77459558so39240255ad.0;
        Mon, 28 Oct 2024 13:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730148058; x=1730752858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+dAa0Rynzld4ln8yK5Ljyy09lWJTIKoDE4g+tU1BIoo=;
        b=WYOsFIMHxgSYLcrWruAQcSL3lLAiwEWgxXFzncT+WWbuZdhm1nNakcO0yVsE5zdqSO
         TIy6KHnXDIl2/bWpMlC48k/AeZ/nzDQbx2Ewk6aDRWtOQBgFxq7XOYZm92OT/fyACuk6
         /HQ3alTNaiZg/uLyqjikW9l92GLhRMrn2cDHFdIdnQRZpFDwnxAVv+ylVWusww3TEOtQ
         6Exu5EpTFyRTFzK9up9FpGwJb9z4rSYB0Ac8ybR1iBNpluYJHyTT0XDqSLYjBogpCV3P
         Sf9jmXGJfKC0HVh2isqG5tONalS9cAOXL48Uqq8v3QiinhoAyvMcFB5B+VlUIPWZ+A0n
         QYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730148058; x=1730752858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dAa0Rynzld4ln8yK5Ljyy09lWJTIKoDE4g+tU1BIoo=;
        b=KvyrknzfRo8ht/Lo+FVMfSaYfLIhkJa2wDkOrV9DCaMV7EzQQUGAHaOi6iy+Lkwwne
         LQP3AYJGsRi4q52zgIv/ZfASZd4y1Von4mVTdNqX3GlSV7eHT5NyRVyB7yjxN1EM02Tv
         5FjbCpI/mWFoIjZ9eUEo5BrcK+BbMQByPFqL38+8w3XopTzY4StkkyIpf16kO01E2XgJ
         1YJt2SdmwlJPwO1gx7zlaaHfpWN/uJfoLqBpBL1PnrUrPurFXBBkVPLqyb4oC/bmCr7a
         h7kJ33ZcqzwG4E4zZ0P4WtBB84npNpTDdEQ25i1IxfwkBDk3V19ibbCQegToPUaCB6hZ
         Cq+w==
X-Forwarded-Encrypted: i=1; AJvYcCUFrBFzU3nvglkZQVtaWF+ofTiRO4hAdoc0ecVLPNe+J/j+x3aQgRrQGbMGvFfyBmUDeu/n3QU2yrmQPQ==@vger.kernel.org, AJvYcCVfS6lnlnh5tnFasqyvvh7RDgCs/02XYolqh8bxaKAaBMnPL+ZR1/7lVCyfupwnIFBLCM0lMme/35Q9XBYo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9e1s132rP4BmQ6eCLWYOaFqnpQUwPnOlZaCj/N5gcXn9hDrAJ
	92M3+zmEKEy4tS5KYNWi/J6r1Gr+afh+UnBocykZJ7Lvkf021rZ/do4lEBZKq10=
X-Google-Smtp-Source: AGHT+IEleIPC6GTL7LX4tKmlNp52NAUlk7DJLzPwBpqWVw7gouUg5tYZ/U5vQCTIcYdi5LZ7AKhb7g==
X-Received: by 2002:a17:902:e54c:b0:20c:f648:e39e with SMTP id d9443c01a7336-210c6cd6d4dmr134887255ad.58.1730148058255;
        Mon, 28 Oct 2024 13:40:58 -0700 (PDT)
Received: from localhost.localdomain ([27.7.141.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02e615sm54751305ad.190.2024.10.28.13.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 13:40:57 -0700 (PDT)
From: Shivam Chaudhary <cvam0000@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: u.kleine-koenig@pengutronix.de,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shivam Chaudhary <cvam0000@gmail.com>
Subject: [PATCH] Driver:input:misc:drv2667: Fix typo 'contol'
Date: Tue, 29 Oct 2024 02:10:48 +0530
Message-ID: <20241028204048.128542-1-cvam0000@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch will fix typo 'contol' to 'control'.

Signed-off-by: Shivam Chaudhary <cvam0000@gmail.com>
---
 drivers/input/misc/drv2667.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/drv2667.c b/drivers/input/misc/drv2667.c
index ad49845374b9..b53231d41b09 100644
--- a/drivers/input/misc/drv2667.c
+++ b/drivers/input/misc/drv2667.c
@@ -16,7 +16,7 @@
 #include <linux/delay.h>
 #include <linux/regulator/consumer.h>
 
-/* Contol registers */
+/* Control registers */
 #define DRV2667_STATUS	0x00
 #define DRV2667_CTRL_1	0x01
 #define DRV2667_CTRL_2	0x02
-- 
2.45.2


