Return-Path: <linux-input+bounces-12549-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BE4AC30C6
	for <lists+linux-input@lfdr.de>; Sat, 24 May 2025 19:47:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D6D5189CC34
	for <lists+linux-input@lfdr.de>; Sat, 24 May 2025 17:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0C81F1301;
	Sat, 24 May 2025 17:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C4aQHu3w"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D1F1F0E20;
	Sat, 24 May 2025 17:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748108854; cv=none; b=grt2Ei2tKp2t0jx/YVVCZwvdgbAZObzJmg4cOeRYcMIsGNvWmNs5XzSj9/vK/ave/lamI/ehhdnFrAAxtAR1pMwoKFnZ/mIt1YseWNbI3sxZhoWNiDm+6FdtEleAlKheNu20JFiWlr83R92yulSE4vaeB1tLHDqnamHJ84FFA5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748108854; c=relaxed/simple;
	bh=MbDkQEfeDnF/QckM9qsGWZG70NmMoHW9yiS/9RkPAvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZHJ28XvHraScFWsjeX8F0KVaKjGpP88i2gm5ZXI9iZWSdZ1shlCPd6ZBccwLL30V1aPeQRWY+imzBqLQluY7E4563YBsBrmt07QJ5BHeXpjDqpq7LT4NQibv+UUApbhpsFxjc5FljV4iHGgeMn4ZqtZGfk57bOfohHcVZwEjMm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C4aQHu3w; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5fb55d8671dso161499a12.3;
        Sat, 24 May 2025 10:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748108850; x=1748713650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EneHRzgAB0PIdlA41lyuKTVYUMWqkGFRPPWOHMxE/4w=;
        b=C4aQHu3wWxCzEcE26hQS5YYaFcQL1x7dCB+gT8hdhrVuUWwAtWyKg9sAc436ENn913
         6xTDx1UEpI4asPtkycaSzwINKlAHTlrA7eMDYoxXSb8WWcA4oekVmUw+NhYECV1jW/Of
         umeMstMs9VMWaa2PqsphmoZ5iw2yA8CG/kjXXQZjc0sWQbm75LSp2JHIeg5nAQgUEbrc
         Gq+oz9l7Vbh/K4E0eWfZgCi5BJ3V/IFTSMlxNSs422qnum12G39sXFeW9939kr+t5Ggw
         o95HHRbaPqdpvYzhMjFGunUSOQe/72ZF7dfeOSHq3GJGmY6JQZpp8UQvD8D1Y+/Rb4J6
         Sr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748108850; x=1748713650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EneHRzgAB0PIdlA41lyuKTVYUMWqkGFRPPWOHMxE/4w=;
        b=Q/CwT9hY6x8q2ZOOoF0i1cKuLQaw/x/bHSdkaHNWBDbZT6d8zWqAGrMMU6GBcG0Kds
         mBe586V4hQfBt6NTnWNz5LPBc3Tl+l7nZxufDFvxfcm1XnDiKIX4hRC2ehhl4M0nOTrj
         NnK7WLoCDy7ViJL5an3+LsF9NfT+5synmmBfeFPa7PCFOibJ0UjfVR4PHSUjrud/1IlP
         QUQXwFG4bLmfm6UYmgHkTJxxl1ELb4QIc6FdMfn1Y5ig6ENwFja2CisD1mGKgZpvjHDr
         gpULGWyfc4oD0G7e+RjtjQ2a1zWM6W8m5TXqtn4co0xekVi7Jh3W9yQ7UrIdrfPXFQHl
         3d4g==
X-Forwarded-Encrypted: i=1; AJvYcCVoeDobd8vylh5Y39WJ1nMJs9872t77RWYdmEpHpBrvx3VjWMXs1rr88cgNX1sb/OfD8IgXKc0czmBz@vger.kernel.org, AJvYcCXo96MsziuRSkPZNIiIKObn1BNf2Kt8tnwDbhmyotDzrkWMU8ebBMyq1DjPKlnT0zyvokD0psTSDrNJWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2a4pSi/g3C25dADPLoaPiwubBH+H0IJkImoXy6okubMOHSSfi
	9pI27kk3/TUEJWnKFqAgCqmZH8oLfHg7+5EL1rg2zwBiicrqQU9VUlvj
X-Gm-Gg: ASbGncs4oV9Aqtz/c6cD8seauhacX4P6/uAfWxhHiiTpmUII8J5WxxsRLYcQexthuNa
	VeIYNgxCJEzoUriQn4o5WS/OOwTvmAU42I/3asfMFZxFeh5WnSuAyU1pJpnUzkAaewzrCheIdyd
	lQKLmklYWEcs9yqoGct+E6SZVrsQCDcRM9WrZcUY8h6TKos9YziNRc881hwePpMvDhRTCiMH2Z6
	0/LvGmwXpX0xrTXp6amrNTP36eO/VshOUTy/dw+CKFM7jWdLlmlSiTF3t6GEU8GPT1NBhqOEoAe
	TH8YBKvZJA2q3MtH1HwDldZiA8+/nZI9BnCvRDvQbg9hcYnppFWowPHdOKkSxuECm79WJOYiCgi
	8
X-Google-Smtp-Source: AGHT+IHrM16dUKZKHqjXf6jOFuaz8P7OPA80LYQiSO9hm7y7BYSGECXlDWOEdBODs1hYijl6JZk15g==
X-Received: by 2002:a05:6402:3592:b0:601:f92e:70b with SMTP id 4fb4d7f45d1cf-602dafc0f1fmr1097042a12.9.1748108849901;
        Sat, 24 May 2025 10:47:29 -0700 (PDT)
Received: from laptok.lan ([89.64.31.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-602f11a0e0fsm1138789a12.13.2025.05.24.10.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 10:47:29 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 03/11] HID: hid-pidff.h: Fix comment styling
Date: Sat, 24 May 2025 19:47:16 +0200
Message-ID: <20250524174724.1379440-4-tomasz.pakula.oficjalny@gmail.com>
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

Fixes checkpatch.pl warnings

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.h b/drivers/hid/usbhid/hid-pidff.h
index dda571e0a5bd..a53a8b436baa 100644
--- a/drivers/hid/usbhid/hid-pidff.h
+++ b/drivers/hid/usbhid/hid-pidff.h
@@ -9,8 +9,7 @@
 /* Delay field (0xA7) missing. Skip it during set effect report upload */
 #define HID_PIDFF_QUIRK_MISSING_DELAY		BIT(0)
 
-/* Missing Paramter block offset (0x23). Skip it during SET_CONDITION
-   report upload */
+/* Missing Paramter block offset (0x23). Skip it during SET_CONDITION upload */
 #define HID_PIDFF_QUIRK_MISSING_PBO		BIT(1)
 
 /* Initialise device control field even if logical_minimum != 1 */
-- 
2.49.0


