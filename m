Return-Path: <linux-input+bounces-7284-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4558A9995B1
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 01:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE95DB2330F
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 23:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D331BE251;
	Thu, 10 Oct 2024 23:21:53 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E05463D;
	Thu, 10 Oct 2024 23:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728602513; cv=none; b=ZvhCzM+/sioS1dZUR2X6gI7PQP6cVokAiwrZLu2GgI1dpWndRZdj3ozSip6fzeM9JK5dIocO/Pmk4779dq9jfL8ADSWmFIixFJkksmPSkFqfx9fmRJs0JbMg20KOK7JrBAJCpnG9vaWIL5I4uVptpsjy7vx+vQ4NRSO7A4jjsp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728602513; c=relaxed/simple;
	bh=h447ird2RnSAEFnDOQoO2FOMrWPCyvKO7xO3qzchTLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UC90D7thIaPSB0D4DdgQpP59V6lVaHu9ju3OGTS2HFU7Rp/sx5Bbmk3AoyrFjEsih+au29506ggSLcchnEtboDcoaG2Mj06yddB33uvI2jJzrJ4RdSEtFHOhaIIyKz+Qr6T0OrHr7ugXrOIQyvDvx/sWD/AWqUD9FePCLPHQ2YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uejji.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uejji.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3e5c9026ea1so128695b6e.1;
        Thu, 10 Oct 2024 16:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728602510; x=1729207310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILg17cAFaMForjMTc6vKIqKwor/oDXUjafNG46r39fs=;
        b=MUcc8hYv/76eXQJvMiAEnHL0qFJUGFIjkvkItsC7WcQR6iIdkT5oEtmE9DYj+dkYwj
         o79+iFCC3ADYr4ECDgG5bAUvTKX1qfAnq1ry6iv8g2dJT6h05mGXWWZ4KstlUAgeDveL
         G7iPtB1pnEBNXNMRTpo+87ZzD1DWMmDOYHXgUzMLsIEcNL0Jvc5zU6YzjJUeJH2Kb0Fc
         XM4J40JlwzB0a8zI53RlIo3uems2WcE7vxb3khDMPmIjPx7LPBgRrtJ+dgHXMKCmFsM2
         DLV+fHysPWSQYFEl4oDa6apkgK9ugQjeDZNsi5SpffYpPyeygJGlmsxyECzFb03r8RxR
         q3HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTSrQHrLJx2ZYm4Oq46u/cidmsAhVm0PleQWUIRGf2e+RLoNdizJiBW/ljKNm9wmkRHv1CGFCxZFv7yDpA@vger.kernel.org, AJvYcCWYNuV1EQLjd80sHFQP0KKmeVu6zY4BvwMh9ux+mPwjQrYeZqMnulo2j5xpri8Z8jGBsJ7JInfUECfgDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/CJq1IFMr0W96yHJPfSQqhsZmovS+ayDkF84LMPvDanLXWqtu
	gAY0k4WCCXpnwXpeDJZkLLAB7frbk7p6noTbzEhk/Ak7m1450TEA
X-Google-Smtp-Source: AGHT+IHFO3/W/HVeN/A0hgfWroyDMjnr0nxy7dWo33N1vhQDB9jvZzWI5+p64oZdz57ZgKPnyxvLWA==
X-Received: by 2002:a05:6808:654b:b0:3e3:9762:7b74 with SMTP id 5614622812f47-3e5c8f60bcfmr493333b6e.18.1728602510536;
        Thu, 10 Oct 2024 16:21:50 -0700 (PDT)
Received: from muster.uejji.net ([47.188.205.107])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e515003353sm388549b6e.36.2024.10.10.16.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 16:21:49 -0700 (PDT)
From: John Edwards <uejji@uejji.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: John Edwards <uejji@uejji.net>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] Input: xpad - add support for MSI Claw A1M
Date: Thu, 10 Oct 2024 23:09:23 +0000
Message-ID: <20241010232020.3292284-4-uejji@uejji.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241010232020.3292284-2-uejji@uejji.net>
References: <20241010232020.3292284-2-uejji@uejji.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add MSI Claw A1M controller to xpad_device match table when in xinput mode.
Add MSI VID as XPAD_XBOX360_VENDOR.

Signed-off-by: John Edwards <uejji@uejji.net>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 4eda18f4f..9f44669df 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -218,6 +218,7 @@ static const struct xpad_device {
 	{ 0x0c12, 0x8810, "Zeroplus Xbox Controller", 0, XTYPE_XBOX },
 	{ 0x0c12, 0x9902, "HAMA VibraX - *FAULTY HARDWARE*", 0, XTYPE_XBOX },
 	{ 0x0d2f, 0x0002, "Andamiro Pump It Up pad", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX },
+	{ 0x0db0, 0x1901, "Micro Star International Xbox360 Controller for Windows", 0, XTYPE_XBOX360 },
 	{ 0x0e4c, 0x1097, "Radica Gamester Controller", 0, XTYPE_XBOX },
 	{ 0x0e4c, 0x1103, "Radica Gamester Reflex", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX },
 	{ 0x0e4c, 0x2390, "Radica Games Jtech Controller", 0, XTYPE_XBOX },
@@ -492,6 +493,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x07ff),		/* Mad Catz Gamepad */
 	XPAD_XBOXONE_VENDOR(0x0b05),		/* ASUS controllers */
 	XPAD_XBOX360_VENDOR(0x0c12),		/* Zeroplus X-Box 360 controllers */
+	XPAD_XBOX360_VENDOR(0x0db0),		/* Micro Star International X-Box 360 controllers */
 	XPAD_XBOX360_VENDOR(0x0e6f),		/* 0x0e6f Xbox 360 controllers */
 	XPAD_XBOXONE_VENDOR(0x0e6f),		/* 0x0e6f Xbox One controllers */
 	XPAD_XBOX360_VENDOR(0x0f0d),		/* Hori controllers */
-- 
2.43.0


