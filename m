Return-Path: <linux-input+bounces-12547-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD42AAC30C1
	for <lists+linux-input@lfdr.de>; Sat, 24 May 2025 19:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF450189C474
	for <lists+linux-input@lfdr.de>; Sat, 24 May 2025 17:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844F71EFF81;
	Sat, 24 May 2025 17:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTpNv3Oe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6B01AAA2F;
	Sat, 24 May 2025 17:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748108851; cv=none; b=T7Lxwvg4lssA+BVjJYbrzJfQWMWZ0J5bwfCXiBlTPrzF/XikTYIM4dVecUzFCYk1EpYTenefyoxNi3WgV1BF+zb22TPBcjMUBSH0miMC4+KrFOfCD3Aih8g7GobYSig09MaggoGDspsCXDJaaOpIjDsHWmEu6biTDcFMCWMPlFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748108851; c=relaxed/simple;
	bh=NhBkhbd6Jx1E/IsoUCmL2IYd5aSujjB3D21WKaqMGwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HsTPonRsQvlk2mIEudyjFO0RhA4fgiQGjGEVMApJemNv5Ytrwv4T5bwKlC9sUR+0/7KId4FxzdxSSJR2HYRxyGdbhNYFd+ch/TnbWH0v5dzotDiSqxDjsJmH3ZEbUUHNon9zs7Bo+Rg3zvq6DwJF/PnlvF3n2HcnygJjH92YGew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTpNv3Oe; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad55ded6e84so27213966b.1;
        Sat, 24 May 2025 10:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748108848; x=1748713648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+B8SXb+B8sy5Xky/hco7BeIXUH9k3KLsimAeMLmsIs=;
        b=RTpNv3OeobDGdqvSivG0TPp/AEUXRS49+VJyRRDEq+z4K/5GY4Df+FHcZcx1dbuHB5
         Oe9RQne41JBnoWSWcUaZnLMnjDjnd2Ey7MalSmp1NrjW2KokqFT1hj84ngqAzBReuMIa
         AqPLewBe5N5S9+Fa+Skr47Q62mrBitMyc+l3UuL3LFFK12TIeUWrEZPrqtpSzU2E37Z4
         Nd+IzSpEUWm1HLPnmELYFJM52XoREP90rCFTBvv1Bud4UR8MxRzLdMndvxEMpuhBG+pE
         9r7jHSSaI11XhPFhFk/lQZJZWdzq/kNAhvtZP4iyHn5IvN45xXf/lvnX6GyzOzEzHc0/
         0iAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748108848; x=1748713648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+B8SXb+B8sy5Xky/hco7BeIXUH9k3KLsimAeMLmsIs=;
        b=qMoKRy+NkJFlENjGMFi+qUJ9a5D7GduwqwBmgpIGxpDCJTDrlmmzZ73pR15Y5knNb9
         NbPR2gcHJgnf4+BjAnEV8fjp6Y74Ugtgtg3MIBdMyZFYLmVRjbtIcKn/j0X2b+3PAW9v
         /BSei5Tzl26Ivbh53fmEQzU5EtkforAyN3KFP6KZ7MYX3932vuVw/g3Z39VIFpFLrbgj
         Fe6UlpYj1t1UIjS9Fi7M7go2nAC8a+5D4Co/AHerZ6OsvTiW+W6+xwDHyh/xAHqT3P0m
         oEe1RZ+UxYsPntiNrf3E0IvXFGbIfLU8A4xpo66ZWUoMjYy6j/MWMJxyM/zhy0tcfnSg
         DUMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDkvVamRKOVldGrOaIXGAQO0DbsLi7dyWD6o4Qj8w2vo7yzCDvVnyEUkaasIy/O7/tBrxRDlEGSax4@vger.kernel.org, AJvYcCWCtJIb9AHP28281UBvTVZyZ4eLjGzJgbi8RCNGo1vHMs9gxV6+KB3T+Hjal6WDStbUYk608kzLytt7Dg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIWl2YtJX4SbYaob/nQEXthFuYlYZtoqL/TYaW5wvqMLfyXIcz
	PRt78EtScGOey/H2pGxUN4lDXdJQgttfPYuHkGszq1hEfe94UaubSKzUN0qCgw==
X-Gm-Gg: ASbGncv8mg4D+jWehhAfuaw8WVW1qGpp/ilI9PRDyXw3HPykiDS7uWaRvf/1DRPyKDX
	cP3yhv1wOvkgo7WGb4ixuqITnnZlSkIP6XxdxBoG6XJ4bQx9cy/v2OKYQ7rb/vVENDlwVoT3F4v
	+cxTc0D/9Z2gO5eyqlV4vCE8vsZaFpvCsfws+6X2aYK+KAuoMT2rEGO2O9/R/nxOHpdq4D9Zy1s
	ggg6I7pFkq+x7l9vF1n+4FZtLWVZB0FJuun8rQ6TrXxd+VzZf2/gLjK7lVp9ZceGY+qztoyopHa
	01vmCJGNUG1PsKl8SQXx4vt3ZIP5ufpGNnEc2L+yl0bepy6lWFofdvbpfGWAdj79KA==
X-Google-Smtp-Source: AGHT+IHBa02mxNXKHlSILIA6BZRqpsrCzJbbD9gGhOYzSSZIECNdcg8PHFkqbP+bRmIDAfhKgNEBkw==
X-Received: by 2002:a05:6402:2743:b0:602:14f8:9a10 with SMTP id 4fb4d7f45d1cf-602dabc4fd8mr1052135a12.9.1748108848014;
        Sat, 24 May 2025 10:47:28 -0700 (PDT)
Received: from laptok.lan ([89.64.31.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-602f11a0e0fsm1138789a12.13.2025.05.24.10.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 10:47:27 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 01/11] HID: universal-pidff: Fix missing blank lines
Date: Sat, 24 May 2025 19:47:14 +0200
Message-ID: <20250524174724.1379440-2-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250524174724.1379440-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250524174724.1379440-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes errors from checkpatch script

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


