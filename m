Return-Path: <linux-input+bounces-9961-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11391A30E7A
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 15:36:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5FA73A84D3
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 14:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6192512D1;
	Tue, 11 Feb 2025 14:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHBdrb0Y"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E80250C13;
	Tue, 11 Feb 2025 14:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739284527; cv=none; b=avUGZjtynd/WiTKnBrDlDe2b+wnqXAZ16dzIaAqB3oRoC/P9xnfFdjzlZ+2gKjNN/sh0Pf1qaTKftz+FCvSG7RX/HY5SOUQIQTxYJmW28GeF+f9hVv/Z60zxNcygq1fgLsxAIQW4tpNBPAIv/1jk4Th4Rp0qAkYq9AAUDsZksCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739284527; c=relaxed/simple;
	bh=kNGRVi3mkE4Ik7DuVSzb0dE3caW/bhvIv27XtZ4uEmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=msrIsFMhmWniyKx7yAqTmy+aHOYEBwoH48uW6kTjT8azYbXxTXNekTZk7xnP88o6kjkvX3XNAtBRtCOT6jhHowOJLsTX4fZI+cPr79BXZ0DfCtyB8NFcf2Zq/vmAozzB6TssJaac3B9wmo1j+eHLsfbn9HuPPbkhOaoLYWS+kiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHBdrb0Y; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-308e13e5e9bso1760371fa.0;
        Tue, 11 Feb 2025 06:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739284523; x=1739889323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2CWaXsm/K/mNvLz1mhLGG+mDBgTiXMcIaNXAmCgOmw=;
        b=BHBdrb0YRCoWnQ781G8bomRhLrbp6Tq/6zsri1vW0LgsKDzG17u3zgp36grJdBrFWz
         +LUNDd5GFtwJDt9wpfArz90YiPjrr4YDwl/ip0cUtxhUlWVV4GPOsSpn+kVOycu5em5j
         bNMJHJpYiNJfSMOkTLNQcA3hSOPgJTtqtoIY1WBi0Vaco4qPDpKPYnBBujEECclj0azS
         J58Suq5v7kN0j2qUrO8mCBrZurhsjuzZsH3apWxpja5d/LKCLTAHvfxOYFkfXTnWVBNl
         LrzSPu+TXRhMjIGE8GKLQVkTSeDn6bTLeEiy7g1Zizye0rlRnehEIU9fv8W1SmwfhgwD
         9I7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739284523; x=1739889323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w2CWaXsm/K/mNvLz1mhLGG+mDBgTiXMcIaNXAmCgOmw=;
        b=aDHXdU8RZd2YmzG9JUL6mr2KJDC7oOnR18rBjn2kGmCa6PvPKtTq6f5xyXJ+BFCKnK
         7oezHV02vnzs2Wajwl37kcBlrGpgfv+7O8QvsE14Lmu1kvqbKco0qShJpfoci6F90nxd
         Co8+Dk3vjBY4Du46zL2JOozFbB2cPp+hrMi1qqPSqqr63DtEUQ+GuSIkHhXbGBumlHlN
         rSvUgBuWW9Xb74PdKK/P1qdoj5uDDn764z7Ohlq9qPlPPQ/7Gn9HED7KEgTwKPwJih05
         HxrCiUyO2dgk+hLkRand56fecKKpMAeuD50vaBgpGA3eod5sIKrKQe2CxPoFhPXJkyAm
         tyUA==
X-Forwarded-Encrypted: i=1; AJvYcCXLEB5cOXbVMeuIaJW6diy15+Gcjvj2dwQ7n1EAbJSoosxicLY44OwR1ZQAwAEFRQnoCMujnTyVJQFv2A==@vger.kernel.org, AJvYcCXi1Xh2RncLFlmNAA9s+79I37RN+trJRADXBTPQazkr+LLH4dbBYaIuN/um4R1nRO/ZIg6SQmc16E9U@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt4mjFwrLEf5MvgiiWtryMeHsPSiZmvarS2dmmcl3CrlQ5CXrk
	ZEV3PAnT85Y4pNWmAAsSxfT82iHr1VKfm9MVuTcPGECLgWyrk6UM
X-Gm-Gg: ASbGncuiMH3OUdOnY6aF8nJQ7OrKjXvmd28C/56Np87DeMxwnZ/qOEP5fzzvn7U5QVl
	uO0vdJ+zIA3OAnIK/uJx8sSjTEU2PqPthlHWwF/uInSJbZVnQ5WHOoWYJKUGQ9XN+wpSwxDS6y0
	VGUX4UjR7vO43xspT5Ya4djL8/VMQ8XkXIwfZzZJiBbf6gHbhNTLtrNxcn59pX7CqbI+lutqmMk
	PzRGFDxzp1GeNFICADFbfF650RPInesDShObEMeXglfHYRbDebwaFnFrD2eEZXXkVdbo26fHHZ+
	VT/QWc5cF/WDA/B7CjuUdFVSx70HGqPqy4bPQlvwJE7b5R1YWwSGuWP+JVaIrA==
X-Google-Smtp-Source: AGHT+IG2Rfg0SAnGo3nILEQO9fk+OZuBcfkOKhljstX+OhUXxYAa4lArhdIpDHV5kKyPe3PEmakW7A==
X-Received: by 2002:a2e:bc21:0:b0:300:17a3:7ae1 with SMTP id 38308e7fff4ca-308fbeb2296mr3260311fa.9.1739284523395;
        Tue, 11 Feb 2025 06:35:23 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-308ee4173edsm6132191fa.0.2025.02.11.06.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 06:35:23 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 5/6] HID: pidff: Support device error response from PID_BLOCK_LOAD
Date: Tue, 11 Feb 2025 15:35:11 +0100
Message-ID: <20250211143512.720818-6-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211143512.720818-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250211143512.720818-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If an error happens on the device, the driver will no longer fall
into the trap of reading this status 60 times before it decides that
this reply won't change to success/memory full.

Greatly reduces communication overhead during device error situation.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index e2508a4d754d..d5734cbf745d 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -138,7 +138,8 @@ static const u8 pidff_effect_types[] = {
 
 #define PID_BLOCK_LOAD_SUCCESS	0
 #define PID_BLOCK_LOAD_FULL	1
-static const u8 pidff_block_load_status[] = { 0x8c, 0x8d };
+#define PID_BLOCK_LOAD_ERROR	2
+static const u8 pidff_block_load_status[] = { 0x8c, 0x8d, 0x8e};
 
 #define PID_EFFECT_START	0
 #define PID_EFFECT_STOP		1
@@ -666,6 +667,11 @@ static int pidff_request_effect_upload(struct pidff_device *pidff, int efnum)
 				pidff->block_load[PID_RAM_POOL_AVAILABLE].value[0] : -1);
 			return -ENOSPC;
 		}
+		if (pidff->block_load_status->value[0] ==
+		    pidff->status_id[PID_BLOCK_LOAD_ERROR]) {
+			hid_dbg(pidff->hid, "device error during effect creation\n");
+			return -EREMOTEIO;
+		}
 	}
 	hid_err(pidff->hid, "pid_block_load failed 60 times\n");
 	return -EIO;
-- 
2.48.1


