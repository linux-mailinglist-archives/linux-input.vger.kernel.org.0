Return-Path: <linux-input+bounces-3723-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC81F8C70AD
	for <lists+linux-input@lfdr.de>; Thu, 16 May 2024 05:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4617BB20B1C
	for <lists+linux-input@lfdr.de>; Thu, 16 May 2024 03:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A973FEF;
	Thu, 16 May 2024 03:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xl31iJpO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E91E1C2D
	for <linux-input@vger.kernel.org>; Thu, 16 May 2024 03:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715830201; cv=none; b=Z9C8XJ2b3fNiuj94+in5lllbTkIt9xpaPwZHUF67D3v8JoVDPyC6ZzcZQo/QDn15wBIuLGJ213/VlDv9mWGiXRajNbnoeYuBAWuTQ87HoE+VuUoRYIESQq8u3YMx2G6+5whKW1Am60LwnamKR6zuy8tjT3Zc/LEX9ZvyWTIOboU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715830201; c=relaxed/simple;
	bh=aouowdgCEp8Wr2DLYsyiVbYd1E9tcDBrCeTHySht0vE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PaEWDmQHnuy4fDu3SwIgt2g3DtAhxHBTZDXk0FywdiRrPqy0i3Tkus7JXX1TiR92IV8+FL4xxdeyJWmkpIlgz1v0jVVCSojWyrHFhIZ7CyRBTAD4FgredhOWKSpa0idKD92bYaTqLdFuAT0Mf8BYdLJofRm/Qj/74GTjIfEGmpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xl31iJpO; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e0b2ddc5d1so2709201fa.3
        for <linux-input@vger.kernel.org>; Wed, 15 May 2024 20:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715830197; x=1716434997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I+hFvwEjSEKy8gzJpfSj6Xr5rcEIZ9Io9z/EzPMPHqM=;
        b=Xl31iJpO8YKqUtKcKsESh/tg+bVAiIgCsaCkZiBkf5ebYUjvGIg1mIYSfpVQ7wz2Vc
         HrnECLJgd/Gcw2eO5Q/vvTkDTvEv7tD/3dWvvhlL4ANj7A2n4zImS2o0GUS/+v/+4uf+
         YCQS1IGhv5xMaEOwu7tiFWFE2CXvKqXKbuO30l4MOcFL54/9QpP/BrkW9uPCCHKPtwFQ
         upycKcXVfnRrkwegV+sTNhoOd+FehHN9ktKWtvvkSK/mVAUgczQMwUbIDGvxNqy4nT+R
         wJsGgv/y32DtxX8vZzQuDmv5XE65m3DR+klNmdnF7BSkQEaUV3svxmyEeGHRpVEqkHc8
         rLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715830197; x=1716434997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+hFvwEjSEKy8gzJpfSj6Xr5rcEIZ9Io9z/EzPMPHqM=;
        b=L3F/huMcbUrTorgbLdmqRgKBdAWojd/yrxsamZI2lBJljEqqaHez6B2UFC1oxzPP6T
         U+d0bTQ5J6OhdNJjhGZBWhFaVVX2FFg14/u1rxJV66DE/2CWH8t2qXQVDVSmjVdl2S9l
         ZSpZukUrb4ppL4yiVEjw78VTSW04KFbmC89Ej34vy99UD//dU8nHqp1CDYmXMwnElfRq
         Y0jld6j2vNa4eKWgAhLhxZQPdOmhJYBdA6fbZ0GZmNiDPepOeU2KHx3dXkBhj+XqaH9F
         kWaVkclIpIFImHX66JsJ7BixS88/Dc95LuxXOxEJneHRHQ4UneVTRP1aaKxtpcQXHJC6
         uaSA==
X-Gm-Message-State: AOJu0YxnbL2hnmh713N/5sVBwuCu0q4G3J/G47fWjwnIDACFR4+6Qa0x
	QJ+6O/7GRIZqRPfshK9fZhml0PFfmXWEAe21IWkRiSCEo14MgQZLPkcbJw==
X-Google-Smtp-Source: AGHT+IG5vu+NdBNWDaZVBe6RH2o9atBC951X95VlMjDJClwGadF+JlX6l/HYwj0nrnzlUEm4/l7jJg==
X-Received: by 2002:a2e:9d8c:0:b0:2e1:e0dd:3df with SMTP id 38308e7fff4ca-2e51ff5e3e1mr110514271fa.26.1715830197036;
        Wed, 15 May 2024 20:29:57 -0700 (PDT)
Received: from localhost.localdomain ([94.25.179.14])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e4d0ce9bc4sm23293791fa.56.2024.05.15.20.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 20:29:56 -0700 (PDT)
From: Kirill Artemev <artewar6767@gmail.com>
To: linux-input@vger.kernel.org
Cc: dmitry.torokhov@gmail.com,
	Kirill Artemev <artewar6767@gmail.com>
Subject: [PATCH v2] Input: xpad - add support for Machenike G5 Pro Controller
Date: Thu, 16 May 2024 08:29:27 +0500
Message-ID: <20240516032926.12501-2-artewar6767@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add VID and PID to the xpad_device and VID to the xpad_table
to allow driver to use Machenike G5 Pro Controller, which is
XTYPE_XBOX360 compatible in Xinput mode.

Signed-off-by: Kirill Artemev <artewar6767@gmail.com>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 1697ff90fe10..a2a2d014de0f 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -332,6 +332,7 @@ static const struct xpad_device {
 	{ 0x20d6, 0x2001, "BDA Xbox Series X Wired Controller", 0, XTYPE_XBOXONE },
 	{ 0x20d6, 0x2009, "PowerA Enhanced Wired Controller for Xbox Series X|S", 0, XTYPE_XBOXONE },
 	{ 0x20d6, 0x281f, "PowerA Wired Controller For Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x2345, 0xe00b, "Machenike G5 Pro Controller", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5000, "Razer Atrox Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5300, "PowerA MINI PROEX Controller", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5303, "Xbox Airflo wired controller", 0, XTYPE_XBOX360 },
@@ -497,6 +498,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x1bad),		/* Harmonix Rock Band guitar and drums */
 	XPAD_XBOX360_VENDOR(0x20d6),		/* PowerA controllers */
 	XPAD_XBOXONE_VENDOR(0x20d6),		/* PowerA controllers */
+	XPAD_XBOX360_VENDOR(0x2345),		/* Machenike Controllers */
 	XPAD_XBOX360_VENDOR(0x24c6),		/* PowerA controllers */
 	XPAD_XBOXONE_VENDOR(0x24c6),		/* PowerA controllers */
 	XPAD_XBOX360_VENDOR(0x2563),		/* OneXPlayer Gamepad */
-- 
2.45.1


