Return-Path: <linux-input+bounces-13782-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F392B194C3
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 20:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5D8F3B6A2F
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 18:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448781E1DFC;
	Sun,  3 Aug 2025 18:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WEI+Ilvo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35221DF742
	for <linux-input@vger.kernel.org>; Sun,  3 Aug 2025 18:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754244850; cv=none; b=KwbJp6D5sH04InudgakZJTa82I7t9U24NnwQEwfuVmgSQ9nfigOAwD8fXT7kVjsOAAF2+y8BkFXE3jEyHxk/dKGsOIWKwYGzKbsy35HRPeEDuU3j7LydlS8/+xiPBFqrCcIP5s2i9e8+GHvMGsNABHn1d6uMI+AkotwsFpDDgjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754244850; c=relaxed/simple;
	bh=I19PfO2UxPXkUmsFSm8/QBrCCRr8ThJ952QKIIi/t7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QgUi5wkjswBEVty1NAzKep2ey/JkSV0MB/3952K6sBhkYeTvWyKlkr3V33tYd2KZ7FMG6ZjDH+/KmNMM799lZM+VYKRTR1CfeuWLJZiy1D0b00H+7Ro65GkosBH28UICu7GuEu3FCPNjlNfrYNi/7CI2VHKC+mcaeKFZb4H8als=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WEI+Ilvo; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-af94440f4ecso26191666b.1
        for <linux-input@vger.kernel.org>; Sun, 03 Aug 2025 11:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754244846; x=1754849646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fw6YTYzP6TeXxjfrPLfYs/o7am5hq49RWRkk3XI3RPA=;
        b=WEI+IlvonnwoWGFWr7tqeePLSWsB3FIYvDn2nzMVeIqnuPtSnWLS93moqOpNxBCC7O
         /Ge/rMeXydY9JTr5jDOp2APWmz/s25ilG+j0Uxwp5dARm6WQJMCXM0geDLnfbTmpiKgf
         o41d+wNMV6sRw8HKBxY3CdV9AwIiRNA077W2jRILe3kkkdGBPYTiQ5Yjfqw5VHMmc2Ll
         UWOI4jhXy6XzeNU2CzO+cwI0+DVEmswOHybD1mhGBFLU6DCil0/Om2c7Pnc/irfvouFO
         9Db07vOUztPMwlnb/CXnvHuOMXsDvEKJNbuV28/O1F6C7qrSFwY9J9puD2wS0P+LPEBv
         Tysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754244846; x=1754849646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fw6YTYzP6TeXxjfrPLfYs/o7am5hq49RWRkk3XI3RPA=;
        b=LXyKRNwydfA1wPRUPozsWMiepsgN517fzxHc0icr/BoRXpAsoPnJRWesB1qzoQiitW
         FW1q3nMZh1KLSv7QOM07pYrpir3+BWr75ibSk+siH/Ywhdoz0wx5gyIKX/mUqHpldbPk
         /g90P0XiSXVolHktoRanwakD64NztvwzHws5N3S6NrtfDowxXWvaEAcgKWzzJFWcjoAi
         lafi1qZAszL1HF6aHkTD6LcS01ha2HVTUm/8mi/Qczqdlr6E05MMMgv15UQ9vRdPDnbY
         7LzWpDf327SMZm8ZRcFXBPP48AHnpPIvHxpXrFMDrkVdP5BfIDs/1+cXHI2pyzt1ezRQ
         LUhw==
X-Forwarded-Encrypted: i=1; AJvYcCWsOfzDzTrDyqQj3bzrTV6uYzxiRYQKQfWqNxDzqhZUQQD6EKQiA6H1o1JYT7CCtIghkvbNwHDLYJmzIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEzK3yeQ7dLfemOlKqlUqWnWO0R0nDfWoFx3O2r7JFaPCTpedG
	DwhxtzRjRGAFNGMCkosml8q0NcjrhT/vjlalcbqEbSdYl5s8bdddIEGL
X-Gm-Gg: ASbGncuSdSPciOErP755DyVFZF+RmJQiGTIqjmwH445Le5lvOlC50TZ/RUw+X7s6jd9
	O/bEbqKTWmiT/f1tjxOQOCEcx9FCGdQLyDWyGakvopvcN6KVsH6xqyju2OKyV93XBz8JN62sU5S
	cx2VJmU7iv8pHjCg38YILwavjicA3biO1J98grgtFNlear8XxC6Kq/J4pF5RCpvhSev50X/PMmp
	0KKVThxoC1wHozW5VKX+3IHtlpCeZRsyV6uvxuxQadqOnHPLkPKR7bcMoeLxRvTZR4PwPUjAHy6
	d8qUaualuVtK3CgltddGXnMXTuVvXdhYLD2oHfiXFh8O4xxHGMWHNbZYNqsh7wBVrfbFiEl5AYr
	gSkuVQLOF4FWULZyeM98VMLrzvv21kVNBG6Dutt6BOvJvdv4cDW+QFbZKeP7hQazE7Cr1yl3Dk5
	66eaSeXMK0Gg==
X-Google-Smtp-Source: AGHT+IEGLlpdvF2pv5svBJr6BReHyxgNNJOL8w9fUio2He/X7eBBpTO6kVvm7QowJdkLUxUEdGGI2A==
X-Received: by 2002:a17:907:98b:b0:ae3:617a:c52 with SMTP id a640c23a62f3a-af93ffd4788mr297683866b.2.1754244846186;
        Sun, 03 Aug 2025 11:14:06 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a750253sm614570366b.86.2025.08.03.11.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 11:14:05 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH 11/17] HID: pidff: Separate check for infinite duration
Date: Sun,  3 Aug 2025 20:13:48 +0200
Message-ID: <20250803181354.60034-12-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803181354.60034-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250803181354.60034-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It will be used in a few more places so this makes sure it will always
work the same.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 32d42792c95a..534fb28f6e55 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -242,6 +242,11 @@ static int pidff_is_effect_conditional(struct ff_effect *effect)
 	       effect->type == FF_FRICTION;
 }
 
+static int pidff_is_duration_infinite(u16 duration)
+{
+	return duration == FF_INFINITE || duration == PID_INFINITE;
+}
+
 /*
  * Get PID effect index from FF effect type.
  * Return 0 if invalid.
@@ -374,12 +379,8 @@ static void pidff_set_time(struct pidff_usage *usage, u16 time)
 
 static void pidff_set_duration(struct pidff_usage *usage, u16 duration)
 {
-	/* Infinite value conversion from Linux API -> PID */
-	if (duration == FF_INFINITE)
-		duration = PID_INFINITE;
-
 	/* PID defines INFINITE as the max possible value for duration field */
-	if (duration == PID_INFINITE) {
+	if (pidff_is_duration_infinite(duration)) {
 		usage->value[0] = (1U << usage->field->report_size) - 1;
 		return;
 	}
-- 
2.50.1


