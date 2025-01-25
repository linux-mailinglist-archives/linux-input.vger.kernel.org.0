Return-Path: <linux-input+bounces-9510-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A4FA1C05E
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 03:00:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A3CF3A99E7
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 02:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DBEA17C219;
	Sat, 25 Jan 2025 02:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVkQOYwY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8C58632C
	for <linux-input@vger.kernel.org>; Sat, 25 Jan 2025 02:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737770419; cv=none; b=T0Ww6snso49cERJPWkFwLfR6q+FIDPxSw6ji6loRUVvBv3AdtgkNct40XdOyUaoTrTph7AoV787kD9sh8t/x5CVICCVP9GV5DpjD69mryr6bHlY66lT8Hh/tyNC4FzuTDhb37jbrhTVspYzdXaCyosyxD2gTPLNmvxSMweOzxzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737770419; c=relaxed/simple;
	bh=RxtFhmHu/gV23HXOdVsCy2Mrhf5hfTd0ctfdhLeHrJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sqsUM2WhtTPjvZL6frblX/+XHaloz3rqV4e2iV74W6zdKGEEb9wSCCyI9PSMhbI0ZSNQwGJdnnq6aF+MEhtTM99kJMQSPK+V90wI86AZyagESfcQZ5xSrHffZ3VQQE4jkTd1h0qtZiRH40imeLBoGgFCxJgmlrFIr5hAgB3ffLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVkQOYwY; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2161a4f86a3so5567755ad.1
        for <linux-input@vger.kernel.org>; Fri, 24 Jan 2025 18:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737770417; x=1738375217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGGg8JEKvshMAHkqbshYUPmPAeSGw+7qjRuc7YVj2HU=;
        b=BVkQOYwYlSgIBgj29Bq0jJ3SWMdx2AcHs04isbZ0RtnMzGsbGr7i1Nf6Qr+SuMKrXv
         8PBihT2qVksQtIvS8wWEoZ6Q1WAG/FfVKIHZIooWVtlpaEZFn9NkCUe+wylBy2MSlIqM
         7Cr8RejjvUECfAoJ+41qj1so3cZb1YBFaAiCKbLxFEDpWme+EXyflYNxhGuV3nXowN4z
         xU3aZO1EEfHiA3Tpzvgsc0RsgDTEajovTekwu3IzrhrMi48hSPXrPbyeQBUa4E5LuY1+
         kmHYov3fjFJ/7rBZmjSIg/34FIAy3eJhPRO/bAPdPbB7eV5AgGN1H4nW/mOuvxSGIPVv
         mzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737770417; x=1738375217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BGGg8JEKvshMAHkqbshYUPmPAeSGw+7qjRuc7YVj2HU=;
        b=YoaOzWxZaT2h7VlidDOEKEBdE+gP+WO76cq9Qlr8RmB1kZbhjezkoL2duYrePKOcyv
         bLTdSaEAs2GjbPccO6lSoLwbWQ+cwQNZTUaviHZZV5yzyUz2jLiETUySx5pOUpa04pA1
         MuWSmrfxhJplR60xSjv79M1B/oLkd9DeSUdfgOqABRSal5x97UjkULXNVFAi+B9hI/AI
         Nz5kPbOK2ua2giTkhA5vi43cOqYSeWox2bCirC3KrTnx0N0QLE3onRB8V0eCoKBxyV6C
         /11UZqr5XRwA2G1xJrY72/Dh2CVanxQd0NK3SFiINyUCS98QJOaVntIUXAmJJdRPHxsw
         sowA==
X-Gm-Message-State: AOJu0YySEGkJ8Thph60kfi2bWV6CBlGPaYeqWAL+GhD1XR7QaPT7eMpR
	Sl2l0KyDBhfvQqQmZhT0z8ABPOB3AzWeDAP9bwsfIpVEN/C4R9rV7y8ObjSa
X-Gm-Gg: ASbGncvc0vukPp9eiVD1+ZBJTsWs1gvoEah8WRUNYVFLm5VvN08TQilv3Dk/7uloLC0
	Q3+4fg9zeoJmV3HUC3uVnNhFLP12XjbFnFXqrfxaxVR/6l2ILNma4MX7OD+GgkO9GGlUVjh5HWS
	96pf1iBGLznih8AYbsEYuBr4KGViq74y3KsshZ9mcavv2WhHqF1tUejMB5+w0hbWS3XUf1O461H
	LthqSYNxb9f1/uaOUaTITGR3yfZI9WxZpUKSyoCWgQw8O5q+15Njr9l9BHBXb03n+jRuWOZRUNP
	I98xO+wH2g==
X-Google-Smtp-Source: AGHT+IFY046g3GbynDNuG+VCuDhXMFkbvtUjW+/9HCkjFdsDA9GRGUuUQr+pz3cNgmJJeIVlw4KQlg==
X-Received: by 2002:a05:6a20:9e46:b0:1cf:4dae:2258 with SMTP id adf61e73a8af0-1eb5d1a230dmr8420863637.2.1737770416830;
        Fri, 24 Jan 2025 18:00:16 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:bba6:4b7d::1f4b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6d2ca5sm2629342b3a.81.2025.01.24.18.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 18:00:16 -0800 (PST)
From: Nilton Perim Neto <niltonperimneto@gmail.com>
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Nilton Perim Neto <niltonperimneto@gmail.com>
Subject: [PATCH 1/2 v2] Input- xpad - Three devices added to the xpad Added to the xpad driver the following controllers: 8BitDo SN30 Pro, Hyperkin X91 and Gamesir G7 SE
Date: Fri, 24 Jan 2025 22:57:33 -0300
Message-ID: <20250125015857.33002-3-niltonperimneto@gmail.com>
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

Signed-off-by: Nilton Perim Neto <niltonperimneto@gmail.com>
---
 drivers/input/joystick/xpad.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 8fe2a51df649..ecc74b260e29 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -377,7 +377,9 @@ static const struct xpad_device {
 	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
 	{ 0x2dc8, 0x3106, "8BitDo Ultimate Wireless / Pro 2 Wired Controller", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x310a, "8BitDo Ultimate 2C Wireless Controller", 0, XTYPE_XBOX360 },
+	{ 0x2dc8, 0x6001, "8BitDo SN30 Pro", 0, XTYPE_XBOX360 },
 	{ 0x2e24, 0x0652, "Hyperkin Duke X-Box One pad", 0, XTYPE_XBOXONE },
+	{ 0x2e24, 0x1688, "Hyperkin X91 X-Box One pad", 0, XTYPE_XBOXONE },
 	{ 0x31e3, 0x1100, "Wooting One", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1200, "Wooting Two", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1210, "Wooting Lekker", 0, XTYPE_XBOX360 },
@@ -389,6 +391,7 @@ static const struct xpad_device {
 	{ 0x3285, 0x0646, "Nacon Pro Compact", 0, XTYPE_XBOXONE },
 	{ 0x3285, 0x0663, "Nacon Evol-X", 0, XTYPE_XBOXONE },
 	{ 0x3537, 0x1004, "GameSir T4 Kaleid", 0, XTYPE_XBOX360 },
+	{ 0x3537, 0x1010, "GameSir G7 SE", 0, XTYPE_XBOXONE },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
 	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
 	{ 0x0000, 0x0000, "Generic X-Box pad", 0, XTYPE_UNKNOWN }
-- 
2.48.1


