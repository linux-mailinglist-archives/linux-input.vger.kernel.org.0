Return-Path: <linux-input+bounces-15144-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21856BA77E0
	for <lists+linux-input@lfdr.de>; Sun, 28 Sep 2025 23:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1A14162936
	for <lists+linux-input@lfdr.de>; Sun, 28 Sep 2025 21:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF82288C96;
	Sun, 28 Sep 2025 21:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MDp6O9gc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D650245022
	for <linux-input@vger.kernel.org>; Sun, 28 Sep 2025 21:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759093331; cv=none; b=F1HzR0VBVOEKJvqp+G18z1WZQxMy+Y3Z8dYF+hX99IxNgHqHaLR2jXp/XFUl+rxF8jwIfaDnttuxRBMbbIVOXsJZb51QO+tlEbHQwGFQzFzO9Do7wseooMpZRiBe6Na46cGSj37t+ibq7CWfX/wP+gR8RbmmJ+Obwo/6fMIInGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759093331; c=relaxed/simple;
	bh=7gRqA1lzDomVvZ9HdJ5xM3tJEYy4qZM4Tf1HKy4xaKE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YsYmCUgsxGQLSTUPJbWiYQJF547x3EMNihmz3zgAzxVkz3TTIBKu/See3+rf/zpikfFx8qlbOdQ8P1aFZaIW7eYxcAaRL2TT4qzsQNZsMY8oKZaCiet16Repea6OnnkuLfz9b+LPvqkHHl32nd/v8HkcX61ljYbn/xicowOp/Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MDp6O9gc; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ee155e0c08so2013928f8f.2
        for <linux-input@vger.kernel.org>; Sun, 28 Sep 2025 14:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759093328; x=1759698128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sxkm8jE9ToiUS31/wtNowypDOUu8isLYkTQLRPslSVU=;
        b=MDp6O9gctyCkzhG2JANeh0QornOvlUp1gnGb91FKsoLnB93AVLOQ73QBg47oZKhnlM
         +G+QHc2RaGPDfZ0WW9RxUnX8fgOT8boLlthN0zCjsaeE7D5W8b4dYBA5PcmY2mCVj4cq
         bHMw1xiY8ccffu8engHLoR3tBGQNbWZbD0e2CwAAh6jZuO0Q7AgTvSY9moANdqzxQ7DQ
         m0YfbLsCWXxxzRZnxsUEO6UFfD2AxJFead2y0Ks/koaydi8c8w1RhqjMBkl5Ykd9nCqL
         TkQAu4QMtI0x9onMWM9uNZuT01TM/NTDoEBLn+EoupWM012lwTVKMzIu0B5zrUeyn5Jg
         s9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759093328; x=1759698128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxkm8jE9ToiUS31/wtNowypDOUu8isLYkTQLRPslSVU=;
        b=dgwbtAojFQTIQtogzMUzzfaa9VB+nm4XKyGTomDxeVPioF4E0NcPK6cun5fedxU1RF
         cX0WRlru0/2/GjPI44MKipgaws/hBagxPWhywyk525UMxJuOuSqcL1XYVOGWzEaK3NOt
         cWxAdteDXm8K+KyXS8FIFLXbmuwJSEREKIuZIXrxafJj/BCS8Ef4wTbjeySJ/UtTrQTI
         bbI1ehZuOzTP5IYrqUqowt+adeDl0Uk7JAygX0XmTT8QXJW75i25EiLB6WbDdRAtCW5q
         LoGvlSKaN1OJ+H6pUUMvFJL0UW9ILr1J56PWO7BGp6tF637W+wIo0mYhrqTjhv9o0+lD
         iFHA==
X-Forwarded-Encrypted: i=1; AJvYcCUzTcKPYDsM/RxmjVbbmtdelC+H5vKrKu9ElDRFhwpc4pJ5atcKnFToNEIruCgUyuq8lJPykMBODxyUdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNqzbRukK7WpwKetfbiM+l2sq/y+25Ab+d9xU89k9iYdvlGh0p
	vuiCRRJEMCLuN1JvwM2x1BWkJCOu+3Jb77JlgIbXNzcxvuypXOs12Mw5
X-Gm-Gg: ASbGncvqeqnd2gv/ZfIYoi6vWNU1Zj4HgLzN95nN4Fp1BgXPRtnYqGn2OZuX/zcq/iW
	Csa/GfoJ2/YNed9RXY7wdkyt86UDAGyt+cheCurYpLP/eV+kNAxN2FGojjyFyrQUSw4y6xGRzqi
	mf7z24R04kTkTVpwfeH3DXyI+AJ80GuCi5iwAyFSsrg7W78yFXWW3F81vZKLe9pWqOdV6pqYWHj
	YNqHqpjB0BejuwFz7sgMu0RQLvDN2YM9nBTZ5TRhrceDSQAMcIZPm9r/GCB/bY6wti88DW4Wq0v
	ZAlhuK/s9CytHbqZMUyb/WC2uqNnxMimS4hoA6ejSNSWU48O8Oav6CEUyD+SsC2veOqaskeKWAa
	BQulWYrflgIdLQj4Fhtp4zg==
X-Google-Smtp-Source: AGHT+IE9CTRtnxkm6JMDZSimOuYV/5weeNvzrjUJ+0Z0yRZI1GfxssHnK7NaXTSzkYrHfFKdvuTsjw==
X-Received: by 2002:adf:e6ce:0:b0:411:f07a:67fb with SMTP id ffacd0b85a97d-411f07a6bb4mr7969797f8f.55.1759093328488;
        Sun, 28 Sep 2025 14:02:08 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-40fb89fb2fcsm16366786f8f.22.2025.09.28.14.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 14:02:08 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] HID: hid-debug: Fix spelling mistake "Rechargable" -> "Rechargeable"
Date: Sun, 28 Sep 2025 22:01:18 +0100
Message-ID: <20250928210118.242631-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in HID description. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/hid/hid-debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index 7107071c7c51..438a12046e86 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -2523,7 +2523,7 @@ static const struct hid_usage_entry hid_usage_table[] = {
 		{ 0x85, 0x0088, "iDeviceName" },
 		{ 0x85, 0x0089, "iDeviceChemistry" },
 		{ 0x85, 0x008a, "ManufacturerData" },
-		{ 0x85, 0x008b, "Rechargable" },
+		{ 0x85, 0x008b, "Rechargeable" },
 		{ 0x85, 0x008c, "WarningCapacityLimit" },
 		{ 0x85, 0x008d, "CapacityGranularity1" },
 		{ 0x85, 0x008e, "CapacityGranularity2" },
-- 
2.51.0


