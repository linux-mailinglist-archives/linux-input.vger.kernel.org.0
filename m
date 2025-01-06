Return-Path: <linux-input+bounces-8976-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ACCA032F0
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 23:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC94E162684
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 22:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363B61DFE38;
	Mon,  6 Jan 2025 22:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVQpiRbF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD1F1DF977
	for <linux-input@vger.kernel.org>; Mon,  6 Jan 2025 22:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736204100; cv=none; b=lD2lMMEMqGFZ3Ls/L1vghg20VsxK9SkRAUmvV+bjsTcAkZKae/yBw4Lb8Qm20+hJv3pQtxKOqv3XOiW8WLpbRA7qZkWQIdo4ayhFqzJRunhD7amBIQVJ5LB66FjekTTnJsuEIygJMTmnX1sv6pNcCvtYgeiv7LtwISc7+Cjq7OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736204100; c=relaxed/simple;
	bh=Yu9yCkA+UOJMXDwtWF50LMg/tD9DkGHmJULAmS9CiYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tmRhMcuYuaIhCCej/p7D8xKR/8yHQlW2TIfqwBf9YNJjtb06xMz0eqf3hDIJKYethBGYDRH9uBPUJL3Sdd0H7SKQj1+AtAjnFkFNpDgdYkqfYCSHVVc4o1cTGCai0wjMNNG9LUn0l6YYmhZvHXQvuhoP87E5DYmt/TYu9DZTdjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVQpiRbF; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso107790055e9.2
        for <linux-input@vger.kernel.org>; Mon, 06 Jan 2025 14:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736204097; x=1736808897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndwmU0J4pLCGs4MoS4mBEuG5U/h37YO2kpDNLlJnjn8=;
        b=jVQpiRbFI0ILZxravHUC5o6irWpV1GnS9CTwlJAQyr32Y7k7+K0h7/VnEIovZDZEhG
         d9Oe68XI0t5fPQWyTw1fd0yeMZX7Ku31Hs7SBtpnIxrowCnodwhkJH9fXVcvlmDX45ha
         fqjJiwPea3ZoJphZUMnlu2lQULqVtWx4yGVZiYJgRg/aHWT9I2kph6fPWNY369WtLJEc
         vZZaMCQonNhmFOD6pam7Ej6Jqbez2x6lhfEmtvyppjzWNmBxAOsTGIMsO1JDnfAxPB/1
         G9JgM/eNGAPPcwfgEjLTCiGa43ClqzeA/6DegpZyVwyZNyGcpYea5UO0huWEMglkrz9T
         BG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736204097; x=1736808897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndwmU0J4pLCGs4MoS4mBEuG5U/h37YO2kpDNLlJnjn8=;
        b=IAfWqeI4rUQ+/QhEDqLPj5a3UdjwQ233FhKMuODXYF/i5SqBgBr+VLAxaxwPItxkjz
         nuHgBrKJqJwJm8LZpx7j/cVyDL4E0tjO0AlXUcTMaPhgKBlq3esv5rYAm3VPUZqo2ILE
         Hbk1hWrpXDyJB9Pu6rVrmHbaU8m0EPzy2OF9K5JC2aLNnIphOplCkdA/cUQsQltMbI4C
         sW6YAEtwzTcnWeau7mRGJtYxQSUA/0F1xTCUY7MaIVO3wAama4L74bZTKrFdc9y74FmV
         qpLmU+YnuFykSKIJ6EDX+rShbVHiqUBiaLRdjD+OU2UkDl4uHX3y6hS6EE30DUI5kvRn
         RvUw==
X-Gm-Message-State: AOJu0YyVeykEN0P/HkTiJ6KivsBEeAmBocTgSGEN4L2ZVYWGY0BoPvMn
	NWxsdbSnSmD0XSGTIzWa2DL8Fa7uP/Qmol2wz+uq86vi5zYiLeAWGp0N9W0iPKZmtw==
X-Gm-Gg: ASbGncuCHYb6I9Njbv8NgLmIeZDOMIPiXrgOftOlK5ipfar8PtDA/J/NHIyYkdRC3j7
	nD+mHtvO3ESB1oUEGrUtc5bJ3qIrs24GpzvdzNtBrUZegHuECiMqdZa+u2SA9ZNUOM+0md2c3mC
	3k8FYQDt+PuY61G11zTgpS7PGqWD8fCubIqgXrtw55etlteh9Sft/pNuxsE3eq5AoGV0BPLfXhs
	/5rLlh1Yjh8qQD8hB0dFST1zVqnI1wEhj/ZcZRTh5c/NpIjJl6I/TqSGK0NuRmecaS9
X-Google-Smtp-Source: AGHT+IHZbRB2KSd7ajyw63e2AJqpbuVW+XNymjSb49Y+gBVRbFbWxr8uS8js25xEQTAm0lpL8yZelA==
X-Received: by 2002:a05:600c:a0a:b0:434:f0df:9f6 with SMTP id 5b1f17b1804b1-4366854737fmr533524895e9.3.1736204096580;
        Mon, 06 Jan 2025 14:54:56 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b48c:8600:daac:3967:7eaf:8e73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea387sm586000725e9.6.2025.01.06.14.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 14:54:56 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Jocelyne Jones <bumpycarrot@gmail.com>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 03/10] Input: xpad - add support for SCUF Instinct
Date: Mon,  6 Jan 2025 23:54:30 +0100
Message-ID: <20250106225437.211312-4-rojtberg@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250106225437.211312-1-rojtberg@gmail.com>
References: <20250106225437.211312-1-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jocelyne Jones <bumpycarrot@gmail.com>

Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index ceb08c541b18..7985b7a5cf0e 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -376,6 +376,7 @@ static const struct xpad_device {
 	{ 0x2dc8, 0x3106, "8BitDo Ultimate Wireless / Pro 2 Wired Controller", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x310a, "8BitDo Ultimate 2C Wireless Controller", 0, XTYPE_XBOX360 },
 	{ 0x2e24, 0x0652, "Hyperkin Duke X-Box One pad", 0, XTYPE_XBOXONE },
+	{ 0x2e95, 0x0504, "SCUF Gaming Controller", MAP_SELECT_BUTTON, XTYPE_XBOXONE },
 	{ 0x31e3, 0x1100, "Wooting One", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1200, "Wooting Two", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1210, "Wooting Lekker", 0, XTYPE_XBOX360 },
@@ -529,6 +530,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOXONE_VENDOR(0x2dc8),		/* 8BitDo Pro 2 Wired Controller for Xbox */
 	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke Xbox One pad */
 	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir controllers */
+	XPAD_XBOXONE_VENDOR(0x2e95),		/* SCUF Gaming Controller */
 	XPAD_XBOX360_VENDOR(0x31e3),		/* Wooting Keyboards */
 	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
 	XPAD_XBOX360_VENDOR(0x3537),		/* GameSir Controllers */
-- 
2.43.0


