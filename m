Return-Path: <linux-input+bounces-11378-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF649A762A6
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 10:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38B02188A3D7
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 08:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18441D90AD;
	Mon, 31 Mar 2025 08:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5cWeMZI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165241D54E2;
	Mon, 31 Mar 2025 08:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743410696; cv=none; b=glqE+6lCmawyEGuG6I+/vSIhoxVbyDZd37B+zVHXbjfopIXU6WzOn1Dlz7zPXykO+dgphPK9Rkp585sNIYUNgh/jYHdVu0ur2a3SdCkXs6bkFT1a8tsv7kuWZqU1n1WX2Q78tglsEnXGWaILViqj/0cnMLufAmJiswRX8+nCODQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743410696; c=relaxed/simple;
	bh=8BDweUZzXvNYhRxeyw9bbMn32yeiI2f5IRmfJ0vYeMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jAhKOSoq51cNwvxKfnuYxpDBKvnKg+NsqiS2Ds3Ue0vICFKtjrGdDW2qekBX02/xg17lF1dh9cJjiTRTvrIBnxV46R1h60Ql9S2o11+T2VIK+W+Y5Dy3SWZ+oP0aO2ReSzaQlIwGV358NvlgWFmJ+ST7jQd5JTfijK7FPOmLhZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5cWeMZI; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5b736b3fcso773608a12.1;
        Mon, 31 Mar 2025 01:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743410693; x=1744015493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95LDWkIGhBAq1t5/xq7nznfxfGcicmeXa9Sx76Fwz4c=;
        b=h5cWeMZIVjz++lD4Ir+GcbAba5Lt32KprW5QJJvdOZBZlFFKmAUmCHmqqxo0XgUqci
         e3i27NdmM9AZFSjqQr2+jlCVJx0G0pGku8coL9Bbw9WVBkk2T4tUhJ90mL+KyysN7dMw
         kYK8F+dsPWN24q+n8eeiRnolINLjV/XrTfjK7aR5acbDrV2k/WjdkhpkPqShUN/pK/ZP
         xryHHEt9RrK/YPktvdH6NPcyKyU6GC1gAQ6c5juqatCZjAnYBxZGhIiTLN8T6OxuZviq
         Gz6l0UPvFVLfHTFOis7Z+dLRLTFJ/hHztNN9IX33PwYvaqWBuaPJjQHCuz5938Kaz7PD
         srbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743410693; x=1744015493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95LDWkIGhBAq1t5/xq7nznfxfGcicmeXa9Sx76Fwz4c=;
        b=JRIAOoXZTqqArKtUKa2gaSrdQXZTRljdLXzbIR4pzXG9QLAcA1pe2UMUgMacdt8GL5
         KMjOPczAcjlHTgdC/P+lLw248/HYGLMxrtqgQtynyRP7DbiKJEegBY510z9+LDzfzOmZ
         wtWQh9IVrHUHueiQvzpLu1z5UODVWXxo3U8jFuUrU92nDb7Y/Bu15feO5PIXefBpx5lg
         BxVde2kC8mL95lBySnm2wGI0QyF+lK/KILiXrHk8UE8z4M4AGiujs6kXpakCtjwrX/24
         mYHAQWRY8F8xFlGVtfHXft+QjD/4dnJv6JGj5SRhsacfMUOvM5Qegy8NeMsgodbTGg+v
         9lDA==
X-Forwarded-Encrypted: i=1; AJvYcCUMak3aQL9Di1YTa6v2Nb+X7YeL+LXFWyFJFDA2+qyXv03GlVHUULbmkZ6+x19HNnW6OKNij+F0zR0d@vger.kernel.org, AJvYcCXsd1HxdYsg4ZLCMK6ZUbyj7nRKP6Ii9go5WzvWHPTm5hw76449OELeqsEuauamOObZ+wS/Ie//uFxqjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywji6Za6Fjv3o0C9mXn+Cy7KVXTX1bkovoL2SyyMYOyNuksjtOC
	JQy1wQenWq3GzbxLs/DS4hjtUWxSwr77xdXwURreji+CeRnJ3R6c
X-Gm-Gg: ASbGncsylXeEWq+aTi2l5OHEBuHH/QgbXz9QrFgY7DbJBVPiHZ2ALofdejuaOd2KN5I
	FCg/2VTQpgqj/6ICHamUks+yxWspH5nbK0ynGvUxPCnBvvAXpJ5guRwg4f0c3wGfeHXXCj/9bqR
	sxZupL5G0v38T4Uo9OroN5sRBCMstUOND2LN01kUDLmQi7oaEfpZGmMmo88GyqS2HOblmp/i2T+
	xp1KFX4hZ9duRrzncEUjvoW4CvoyIDOJwdXqXLi23Yw86NEs806HBMMmwh9nr6dPmKLPHU+G8yL
	0zJQkqWL4fKS7B0vj2XQgvK9t2tnLz0ljKA6G/aUEMfbhdWTh212GA4jS1RplUPzmlFnPTTbMdG
	UCxILGU1nWHsSVJkSJUlngzoMQA==
X-Google-Smtp-Source: AGHT+IGXjNIwqUI5mS3kZ3YVhwOdS2EBAgO6YnuGdasZYVELUsa2r1Ptq08vt9Yt5Hej4m/mp4TsDw==
X-Received: by 2002:a05:6402:40cf:b0:5e5:e98:1a28 with SMTP id 4fb4d7f45d1cf-5edfdd2604fmr2490869a12.8.1743410693084;
        Mon, 31 Mar 2025 01:44:53 -0700 (PDT)
Received: from laptok.lan (89-64-31-184.dynamic.chello.pl. [89.64.31.184])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e05d8sm5236216a12.74.2025.03.31.01.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 01:44:52 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 1/2] HID: hid-universal-pidff: Fix errors from checkpatch
Date: Mon, 31 Mar 2025 10:44:48 +0200
Message-ID: <20250331084449.61082-2-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331084449.61082-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250331084449.61082-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/hid-universal-pidff.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-universal-pidff.c b/drivers/hid/hid-universal-pidff.c
index 001a0f5efb9d..dad6c5a6e2df 100644
--- a/drivers/hid/hid-universal-pidff.c
+++ b/drivers/hid/hid-universal-pidff.c
@@ -57,6 +57,7 @@ static int universal_pidff_probe(struct hid_device *hdev,
 				 const struct hid_device_id *id)
 {
 	int i, error;
+
 	error = hid_parse(hdev);
 	if (error) {
 		hid_err(hdev, "HID parse failed\n");
@@ -91,8 +92,8 @@ static int universal_pidff_probe(struct hid_device *hdev,
 
 	/* Check if HID_PID support is enabled */
 	int (*init_function)(struct hid_device *, u32);
-	init_function = hid_pidff_init_with_quirks;
 
+	init_function = hid_pidff_init_with_quirks;
 	if (!init_function) {
 		hid_warn(hdev, "HID_PID support not enabled!\n");
 		return 0;
-- 
2.49.0


