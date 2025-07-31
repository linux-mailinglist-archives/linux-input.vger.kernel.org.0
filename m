Return-Path: <linux-input+bounces-13728-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF44B169B7
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 02:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E7023AF811
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 00:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A862745E;
	Thu, 31 Jul 2025 00:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dkor+TAP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C8AEAF1;
	Thu, 31 Jul 2025 00:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753922408; cv=none; b=DYpvfdYkbjEMUOXBB3OGVLNrOV5hz2AW1k3pVCthmckAz/wso8zEO2irRK/pxnbQzzAVHkOUERwRF76eGMdrsusIdDDEpkscYtiucuBSdvNLTSsFfQ5LffHbB6d3PbP/OaCF9+dFh5IWwE3h35+9/Xh0QMOp4ViEOHb/gsFEJXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753922408; c=relaxed/simple;
	bh=YFqrM//DiDSufkHT6/8PzBNI6rSgk/CKtILqnpzshIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PzM+m1fdEVM1rvZxLySmrzNthhXFVYCY3SsdS97YOh/4GAP/LXpiKPJe5yOvCzDVs++TrLjqpqXCf0OB62avySUVRBCu7ePL+H/Fj3otZJ9JMu2YMfGRejVfthVq+AFppMNKmv/5RjhpepWdA0XhodPG3Nec84pxatI4vKMNlX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dkor+TAP; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3137c20213cso522898a91.3;
        Wed, 30 Jul 2025 17:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753922405; x=1754527205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RHP+0SACw47dRZq5OFGnkXBtjxEvwIqg5sVwcoYBiog=;
        b=Dkor+TAPcvwV67mhK+M0DD3Ywfbwtq29xAcw+Bppjtb8BPlYkSgXXT7PxF93awy4TZ
         8lAWyEryvlaYD51BLWEfExg0NtXBH0F0cd0VvdPeP+suJRl6KOuRQC3y8SkLBQnF6FrV
         BwSTkxq/kHKkbgAc8Xw9fuA+k+1pvJHSI+MQQRjityWvgSd8w3XVgwNK1D8+QbZ3Ov6f
         qXBpg+sg6EYCGz4fgMYhgLTe8WRWP8QHJ61xFzIo39SUnJemhlLGx7l4DTRygFVFtLla
         3EVzlU40dW1H04hLBdwtpJKuvd6xXm8mpT84CnCc33f+/pim4WWrfY4Ae/X3NpZdePaI
         Vd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753922405; x=1754527205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RHP+0SACw47dRZq5OFGnkXBtjxEvwIqg5sVwcoYBiog=;
        b=dFEMevjiZ/laN4iAQaFsn8g6fD6AhAzH873H9UqoqQgBwLIVtqffLSPDkJlseLeMR2
         QRI2pCycBSq3O+hRsOU1v3gihLgWaP6L0LYUxPkeN/F3mhYyKsfUFvILMQ3q9E/zIOVT
         GdEcIkiUNeGRESn3rXV4f/zoW2/VtMZANaY1xy9sPRaKmUxiWyaSkDyQZ5znwD+QpN9u
         PbIy6mE+XP4qmU9ZSrKcuxy/SW6pM4V9HpKvcB0w6ipHToOzua8jZfemkQfYIa0QigSG
         9S09i9asln2eBhWY7mBYBwEgMfbtbynYzL/Uow0DWppeHN+6+v5Gf4YvfVh4wTZdmNlG
         z7mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLt4rTpNdP6XwMXvhQjWdOlFMlouHFGJlrK0eJ7etzgpEbUhCduft6beZ0KasPw106c4a7elwMha4=@vger.kernel.org, AJvYcCWdDmJvVoyT5NsO0MlWn/kf0AC53VGBrW1fCy6lnGktu2y0kno7JfCzifBJOWaGwEEF7mL+VQQ+VMAhpUZ/@vger.kernel.org, AJvYcCXFi5m2ur17S0xUP7x55SWxP6Ekwd6MzJ39eEAjRQ2x9LNuY3AYbHrTNf8IPkd3BcoMAyhh0P8qmbP57fA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfWbLLA+3sODbLXAY8kkzWJmexXFPK+veGwz+OGJ7cGtQ8/y3Z
	gDQJevb90Czvi9C/dgJmLtrryQcf0wl9+StSyc/eZGoss8t1k/sr21WFoJJexA==
X-Gm-Gg: ASbGnct7xC8x35u5ZN5EgvuiTrOQgH8RqWPipBu91qKX+0e5XL57F+TqKobwz0bvkOt
	7F7Arqe8bQ19LehcTDTw6Y58hM/DGQkYXTdyMAoIQk9K+SA9SxEbZaqNAxuq2RSPEb75mQTSHwA
	1dYoEC/QjspkkY77Yw58YojiyOOWiHoZhGDDileR9/vhm7zGvSxD2PVIiN99SMQ2zokIf+oz3aT
	T540LsS8Th1nOXuSkPp/Ijnq/3V52hSXO74O3iec+W+p8xZ0yKZXVgZZfO4hwvDH2A8BZh041m/
	RABcDmOW+QqM6FJY+p+MZUCWiTsDuKtssVyz/qTpoNUkqBqzU6h6OnbUYScgU/uR+WLieOjBmHi
	BaYM+TxF/5stOfo3KywPXjZ7twNgWbX4Djwgw0QpbviskB6fDI9dUYUF2NApuRGZ+smkDkHUTDR
	fPEwX23Y+Xzg3O
X-Google-Smtp-Source: AGHT+IFsePyZ2gqGD7UiSxRMsEOvAoTwD29rJ9f6eSbQK8JD+vZtL8JUOCxubUsoMKlY0+CsiTzB0A==
X-Received: by 2002:a17:90b:4b09:b0:31e:ff94:3fa0 with SMTP id 98e67ed59e1d1-31f5ddb7e8fmr8448390a91.6.1753922405065;
        Wed, 30 Jul 2025 17:40:05 -0700 (PDT)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3207eba6b69sm338301a91.2.2025.07.30.17.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 17:40:04 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Xino Ni <nijs1@lenovo.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] input: (xpad) Add New Legion Go Controller PID
Date: Wed, 30 Jul 2025 17:39:54 -0700
Message-ID: <20250731004000.11331-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds additional PID for the Lenovo Legion Go detachable controllers.

A recent firmware update for the Lenovo Legion Go Controller MCU enabled
interoperability between it and the upcoming Lenovo Legion Go 2
controllers. As part of this change the PID was changed to 0x61eb. This is
the same PID that will be used by the Legion Go 2 when it ships.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index c066a4da7c14..0baceea33a26 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -318,6 +318,7 @@ static const struct xpad_device {
 	{ 0x1689, 0xfd01, "Razer Onza Classic Edition", 0, XTYPE_XBOX360 },
 	{ 0x1689, 0xfe00, "Razer Sabertooth", 0, XTYPE_XBOX360 },
 	{ 0x17ef, 0x6182, "Lenovo Legion Controller for Windows", 0, XTYPE_XBOX360 },
+	{ 0x17ef, 0x61eb, "Lenovo Legion Controller for Windows", 0, XTYPE_XBOX360 },
 	{ 0x1949, 0x041a, "Amazon Game Controller", 0, XTYPE_XBOX360 },
 	{ 0x1a86, 0xe310, "Legion Go S", 0, XTYPE_XBOX360 },
 	{ 0x1bad, 0x0002, "Harmonix Rock Band Guitar", 0, XTYPE_XBOX360 },
-- 
2.50.1


