Return-Path: <linux-input+bounces-13823-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F67B1BAE2
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 21:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 492D017DDE0
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 19:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD1429994C;
	Tue,  5 Aug 2025 19:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPDs0qn3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C1226E70B;
	Tue,  5 Aug 2025 19:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754421680; cv=none; b=IO9WU3eh0RhqzOh0nEXZtWKy1slSFWDzCT9vsU0GOl9kLz7RFPxm8I7x4zQZFZQsuSFhAjzZtKe4DIhh6DRm5KnvuvzFk2TmzxRuZg423YHoLuCk+a7XjLNYH+WngoHRCSwwDY4yKo9dwX8fDNB5UZNjK/76I3v5G38A0YwrSBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754421680; c=relaxed/simple;
	bh=ZwjQRWYfwc9skmRPIa6MTaoCmy1KGtTkrWqFILxCLu4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cqLIcuu9x/7M3jObKbOYC5Y1XC2AD5geiljWQwrWxGT2oHhbBD8voAZUocPFLAvgiF8/pNab84yBG1cmQhQgfpM6LrjB4g0acVmRKJknF5klezXbpmvzpUgkKQoKdVlPK5d3MMHojV9E0jgQDttND1unGXq5N17mkCS9IvFpWTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPDs0qn3; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3324e6a27a0so34193621fa.1;
        Tue, 05 Aug 2025 12:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754421677; x=1755026477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5BzVYtNR1pAHV5QAtukF50SMj24UbVioNyneCkS6L+Y=;
        b=SPDs0qn3ivt6rJQ8v7KKgzZHodTaJ0ktxTb7HcSoBKO9d9sI9VDMV8ndXH+DKFMtvk
         SbJqoUF/lV8BErXvpJaZJsGUPBBjVT58pqXleqz5Xcds5mtiNRVPRjpjRm5J8sK1Tfsl
         FA1oxXqfGFs41F+mc5v15N16JYwIiSsTUamBQZncR1QD3rpSOYSW4p4huYJDwizGMNuI
         +AXPElT2+4j8CUm5iqpIhXqpj0JxhAWBg9hBB0OB2ePABRVnL78OWCUM+fjeKbfkplIy
         uzklt57OHNI2yvI6oi3iEo5LLIwqygGVipURhNPrzMXyTFrnf12BpJcQhvlky0toY8v/
         6ZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754421677; x=1755026477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5BzVYtNR1pAHV5QAtukF50SMj24UbVioNyneCkS6L+Y=;
        b=khJBaqXNQolAFb6uV3iKdhC7gUuDeQRLz9/ScQ7nQD7rrJvzKyuozjHjt04jmACDlr
         jusa82f1a8awYyXHoff7gAw91q+2+nM2GaSGai0XM/CslgYCrHyAMbvMG6R/3OzXv/Nr
         9J313xa5wc7tnZHUw76WBOa9EV+eBh2OXkRaHYPwmUF1uJPx+T0mMk1itmSUhFByZPuQ
         QjT4P9UW/voR4fQsiO181Sn6KaDQ0JvF1yfz21OvJZ8h7kbI4zIWNOi5zJoukgP8s6vf
         Z+mKgBVJfavs3p72SiyekpIeHLDFlbozSaPfZKEE61NBIpZbm78wMsGDCnegoeHGUnyw
         UgNw==
X-Forwarded-Encrypted: i=1; AJvYcCVYc3+4VoJqMZykN106/38cHWky4AxQRM3CxXYuigi4gPHhKHSwPyxKFWAqv8ED3mSPV9prFdvZdcwHPw==@vger.kernel.org, AJvYcCVZInBk54J/4NBTfMNx4VlEHT0bcQjmAJ3ZTZAPVJ9mxt9qIyocJHDMM9An6Emfke8D6Sy33UyQupc+77q5@vger.kernel.org
X-Gm-Message-State: AOJu0YzQK5GMOWfHYZGAF3sNIrMiFA9FAxIFcVD3t2QtbECBXZxBYIS7
	ZmEmfWTlzjPdJ/6OcIWtHW7IcTnICFf248qwU8LBIOCHHFWgjidPQGw=
X-Gm-Gg: ASbGncsB3RlTgIfB0F8KhZT1mT/HPa7fvsM/3Y2atn1pL4I+xWyjxPnamglfEE4q+1q
	bXBDwHmATW0/ouGO0rPmu0bPo8w8jHyApYM3d7+TnEHGpECCZEeGJfpawhsyjx/y8Vb+w19a4Wg
	1gkipI8rutJ7fC3vhF2uwrIf9OZ5U4WYMvc4o4sx6TqM5LIcmukt+OCau54dN23VLbRnVXWbQYZ
	Slx1ufQuZvTZtF7bcrAdmMTSL5LnbEgNon5COqK4coKwL9ZxEPhb5ypK7zNwcvGrQfxOUEE3wUx
	bBF0fXDcVTi6IpvjALSum8pIWl4Uo8GOFkcXhVC7mIGkkXVWg/XCbEruZIV0cgHhfwarN/j282f
	YZlNi52R0GFs=
X-Google-Smtp-Source: AGHT+IEVWLxVD8gbqmr1drBNcqv56HbrFyASJzULrVtZRUssJ5ezVg6k7Pp929dR3SDNfsvSzu9QvQ==
X-Received: by 2002:a2e:a98b:0:b0:332:5fd5:e3c7 with SMTP id 38308e7fff4ca-3325fd5f754mr39907131fa.33.1754421676977;
        Tue, 05 Aug 2025 12:21:16 -0700 (PDT)
Received: from frylock.hermans.pl ([2001:9b1:dfa:6c00::f02])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-33262ac17casm10258271fa.82.2025.08.05.12.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 12:21:16 -0700 (PDT)
From: =?UTF-8?q?P=C3=A4r=20Eriksson?= <parherman@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Vicki Pfau <vi@endrift.com>,
	Pavel Rojtberg <rojtberg@gmail.com>,
	Nilton Perim Neto <niltonperimneto@gmail.com>,
	Antheas Kapenekakis <lkml@antheas.dev>,
	=?UTF-8?q?P=C3=A4r=20Eriksson?= <parherman@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] Input: xpad - Add Thrustmaster Ferrari 458 Spider (044f:b671) device entry
Date: Tue,  5 Aug 2025 21:20:29 +0200
Message-ID: <20250805192036.53918-3-parherman@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805192036.53918-1-parherman@gmail.com>
References: <20250805192036.53918-1-parherman@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the USB ID for the Thrustmaster Ferrari 458 Spider (044f:b671) to the
device table, using the MAP_FERRARI_458_CUSTOM_AXES mapping flag.

Signed-off-by: Pär Eriksson <parherman@gmail.com>
---
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 51e285efac79..fdd70f256be7 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -147,6 +147,7 @@ static const struct xpad_device {
 	{ 0x044f, 0x0f07, "Thrustmaster, Inc. Controller", 0, XTYPE_XBOX },
 	{ 0x044f, 0x0f10, "Thrustmaster Modena GT Wheel", 0, XTYPE_XBOX },
 	{ 0x044f, 0xb326, "Thrustmaster Gamepad GP XID", 0, XTYPE_XBOX360 },
+	{ 0x044f, 0xb671, "Thrustmaster, Inc. Ferrari 458 Spider Racing Wheel", MAP_FERRARI_458_CUSTOM_AXES, XTYPE_XBOXONE },
 	{ 0x044f, 0xd01e, "ThrustMaster, Inc. ESWAP X 2 ELDEN RING EDITION", 0, XTYPE_XBOXONE },
 	{ 0x045e, 0x0202, "Microsoft X-Box pad v1 (US)", 0, XTYPE_XBOX },
 	{ 0x045e, 0x0285, "Microsoft X-Box pad (Japan)", 0, XTYPE_XBOX },
-- 
2.50.1


