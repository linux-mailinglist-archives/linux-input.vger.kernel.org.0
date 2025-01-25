Return-Path: <linux-input+bounces-9511-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8610A1C05F
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 03:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1757B167506
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 02:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB44323774;
	Sat, 25 Jan 2025 02:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3VFpJKz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF1B5672
	for <linux-input@vger.kernel.org>; Sat, 25 Jan 2025 02:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737770422; cv=none; b=Hn+R8DFrjykH4PN6qoN8Vog01SsYGeUg/3b9mVTqC1A4Tg3WXY3iPgYKH+psmSKZnNuzsaXP713Fh3Nj38Grs+CWY3bIjmzUuGd5yKQWqVlkwpiRBvAr7AlHE9KpVShZ2OuWP6rPpGcC+O/tSloe+58QE0dsITpjgz/vxUJFpA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737770422; c=relaxed/simple;
	bh=ukNOJT9iqsx3T2W/yFXbXWTseJ1NQHZGD5nRKFr/CUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oj+8o8q8oj/Hrdit8lvAGSWSgdOjsKE20mFLxIdHET0Lz/VIDYILc+8uiVHBT32zeizRh4TPxwx7p6vZxXFOVMGmelXVSx/ehN+HtM8N5K06wKzvTaToROn373CwOTG8kojuwOX9gyLkrZ9EUL6c2GSdincdU1JDkfICJg3bcxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3VFpJKz; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2f45244a81fso591606a91.1
        for <linux-input@vger.kernel.org>; Fri, 24 Jan 2025 18:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737770420; x=1738375220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tG1TBF6ugPWkpYkWL0I6gwB6ocRkaiDmrj54rqAxmk=;
        b=O3VFpJKzQqwA4k6ZTKDNA4gIE5OU1pW1jMDxuLbS1p+KXRkimBoOQBnsx/KHcjwo3k
         enUwucgRdCD0gbx/1CJehB0SjroJbj6cqQhsor1DXLroCkcVSyuu06J8gfpbGdm3raYL
         hiVBOiPRB8227OQ7oJfurOuu3Tb8IwM+k7kV3RFspszKIIyTHSu0rrmnLVYZBfSZDkpZ
         v7IZ7C2cDNVirB7hfuWQAqfrPPRec5Gu0bmDYFjqB59p1eZ7GiemNwePUhcQbOnVKaKL
         hIBVYVAjshbIlDwlZ10q0wgnBWD5gBCmbBWNZ5VDVIm5pv5P3QF2DJeIO1zcrWyY3JMG
         3bqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737770420; x=1738375220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5tG1TBF6ugPWkpYkWL0I6gwB6ocRkaiDmrj54rqAxmk=;
        b=ldnrHpRVomWjrcvMyRnPC2eOcsyZdZBv6AWGB180KXyApbInFaHxjXHuIViHwMPuvl
         0Tt0EzPh3ZQAZaGjohcvMVnu2jWsesi2iz9mDEbuuoRPPFMSpHvZ/enTctht+IfcGMA0
         UEbJdptXWR92IejEP6Qt6xqfDCs+MfTPqnLwNfonU2yWG8EfJTBECPlsugPdfFuLj0pU
         jpk9AQKXK3qcVDv33yRrKgBh2GPsHrl39QSdOWSCyOOUiiXSNXa81S8REsoRihRqy2Wd
         cjpBrJ+Ps0ZQ1UoWCAEumxZ8g89vxFArG05e/e+Xq06Ey5myfzlCAZvuFQoG8kZpz0BZ
         hdQQ==
X-Gm-Message-State: AOJu0YxDYbp6a4OpJ2SpzHFox7LGLXoVG194Tp4hN6soZC5IWT2sQc5A
	xKG2nzkOyfrVAdBs2y+3ka1R2DuhVZOAy4JY2xiYVJewKRY/GNvXfbndnQ==
X-Gm-Gg: ASbGncu/lrwrYVepoP6zkcBq7ovy6DycAJZ9pOOtDMOfwh62kI0atleZGJ5+iQFw5oS
	DBlO/IQnaJ06Dkh38ZVe2H8Xz2Mqoo4EPEMw6gcQRlNDTQuCn9HCX0NHFjQRO7GK7icVqQ+4mkF
	hl8xYat0NMQaKgst3MGfkxPz/DlWOU5QgSn/CNg5693t7cr0NpkP0RfIlYF3L7OsmjvVck8JWeP
	eZLomq7k73OdNYh2rX+Y6xpi2Iw8Z3HsxaXzWFr/6kdxXQzt/Wm0NoTWj7iQGOtGYyD/+DGKDzT
	Bz5S5+rFuoKDTF72PdSx
X-Google-Smtp-Source: AGHT+IGE1XVarUg96uiJKY9H3/K0jtp43JnATdfWVJ2P8pVkwyodZJ0LKGW/76kLyy3ktuaMglCtvQ==
X-Received: by 2002:a05:6a00:21c3:b0:725:f1f2:43eb with SMTP id d2e1a72fcca58-72dafb35d1amr16268147b3a.6.1737770420211;
        Fri, 24 Jan 2025 18:00:20 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:bba6:4b7d::1f4b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6d2ca5sm2629342b3a.81.2025.01.24.18.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 18:00:19 -0800 (PST)
From: Nilton Perim Neto <niltonperimneto@gmail.com>
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Nilton Perim Neto <niltonperimneto@gmail.com>
Subject: [PATCH 2/2 v2] Input: xpad - changed VIDs to better describe them
Date: Fri, 24 Jan 2025 22:57:34 -0300
Message-ID: <20250125015857.33002-4-niltonperimneto@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125015857.33002-2-niltonperimneto@gmail.com>
References: <20250125015857.33002-2-niltonperimneto@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changed VIDs descriptions to better describe them

Signed-off-by: Nilton Perim Neto <niltonperimneto@gmail.com>
---
 drivers/input/joystick/xpad.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index ecc74b260e29..dc17ee099b0b 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -531,12 +531,12 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOXONE_VENDOR(0x24c6),		/* PowerA controllers */
 	XPAD_XBOX360_VENDOR(0x2563),		/* OneXPlayer Gamepad */
 	XPAD_XBOX360_VENDOR(0x260d),		/* Dareu H101 */
-       XPAD_XBOXONE_VENDOR(0x294b),            /* Snakebyte */
+	XPAD_XBOXONE_VENDOR(0x294b),            /* Snakebyte */
 	XPAD_XBOX360_VENDOR(0x2c22),		/* Qanba Controllers */
-	XPAD_XBOX360_VENDOR(0x2dc8),            /* 8BitDo Pro 2 Wired Controller */
-	XPAD_XBOXONE_VENDOR(0x2dc8),		/* 8BitDo Pro 2 Wired Controller for Xbox */
-	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke Xbox One pad */
-	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir controllers */
+	XPAD_XBOX360_VENDOR(0x2dc8),            /* 8BitDo Controllers */
+	XPAD_XBOXONE_VENDOR(0x2dc8),		/* 8BitDo Controllers */
+	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Controllers */
+	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir Controllers */
 	XPAD_XBOX360_VENDOR(0x31e3),		/* Wooting Keyboards */
 	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
 	XPAD_XBOXONE_VENDOR(0x3285),		/* Nacon Evol-X */
-- 
2.48.1


