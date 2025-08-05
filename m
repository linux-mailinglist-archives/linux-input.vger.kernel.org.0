Return-Path: <linux-input+bounces-13822-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 644EFB1BADD
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 21:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 303C918A7615
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 19:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92FC721CA08;
	Tue,  5 Aug 2025 19:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GntXL8C9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC7621D5B6;
	Tue,  5 Aug 2025 19:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754421677; cv=none; b=rCIj9iJyZF2YzfwAYVpnc84+IufhvbFiOjRiyd3TVyptKokFpZBSy/s7OJL/X0wI0Qyr1N/cK06sAkouTN53hxsSzXxJqE12cvfdnt/3LUSqYHKoyTAIcpz23aDNOSCeey+BNMNlZfGNnP9xy4GNyHJmZTqRp5jOuWTtRiMf/s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754421677; c=relaxed/simple;
	bh=YVEUTS11ts658pKpdfpH3D5AJpuXULayJVkA7E+HFYM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IoDqzrJizqUA/hErJEV8eGFTtn9oxGQb17GxJQlMmP2WCBSwfa8Y6FZ70lOWCTaWgfhcSyfpQw2gQjG/iOeMfUnwAWuZVSIQAnKOBHKNNpJGduah9nn7y2hLYCyUrIHqyoxwVuiZGQ3JFl+RBRVGDUV5YzBKFmBlsbfKg/yU2mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GntXL8C9; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-33245e653bbso32432581fa.1;
        Tue, 05 Aug 2025 12:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754421674; x=1755026474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rwxm+29m+vC2nSU3Hx47xSx1Do1W9sGMjp59rfZVT4Q=;
        b=GntXL8C9C+u+MftN7ybJTWDlqJmFXX19cu3+lz76SAJ4gGXEJdVgi/YmzDoYcvm860
         m3fxjizS/1porkrsR0WYuEiJHO3augCokZykYTcrJ7PCxvlpMq75RTRL2M9TdpKAGO1F
         Bq66IPWLMbyTFF7YG4T/w5Gf19Ch/5D0Q3YIZC85uprip+6dkIG8RP9KO0+idy1VfAmL
         5kkPjjez0iujYdKtiEH/bFSLKTqBQoBhT01ClJlkoS6E8fL/Q1yg0B3vXjX49XjhltJj
         RnrwhOqHa1Z3Mt9WsY1/bSnoS8Lt5A5/IAwcajzRh997Hw81NC6xvCK2JXeCDQRcduOI
         UESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754421674; x=1755026474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwxm+29m+vC2nSU3Hx47xSx1Do1W9sGMjp59rfZVT4Q=;
        b=nyjSoZDDAIUciN3dP9iHUDX8lAqvFt1VMwTMGyKO4uSQTi7mPpTnT+koIvxvh0IEh+
         1sM4PUL/CphgtbsI/g1kTbxhegnIou1JfbJqIb52nFsHlRq1X998VR9yxVXfFfzUTtLb
         QrDEuY4Gk03WsPLHfi7f1xpujM6FllQi5xv6apulXuJ1w75LGV19waWaVPHqG37XGTqJ
         oeMWFEjmT44asVnum5IIPjSUgGbT4c8+VP7GnGIdqfSadM0cQuCx21I+meClIc/yTcTK
         EgJeZlCjqf3YAVlacWWJjw2Lui5tBHWKleVoUUEQ/dpf39iGuOS44Pppk8V2SDd1BwG7
         Mvpw==
X-Forwarded-Encrypted: i=1; AJvYcCURi6PptDwoNLO5/BgGaz2sOF1SSCb/swgI79LpaF8ebvmM2pv5I5cFQZPjHw3AY0c82DLysWl0l5QCgw==@vger.kernel.org, AJvYcCVuz04LeNXObT4IyaasBZldsn3heNfzW3qMUrKkRPgCgTLsuRWAJztYCziypxyz4ZzJPEORMvy6LBtYJhsf@vger.kernel.org
X-Gm-Message-State: AOJu0YxYr0ZmvjIgow/dV67PhrpHehHc7unMn/8YF1NuVtLDVnh8rlY5
	YYwVfCh7Eks++Tg2uXuR/dDWwfdUR9FYOfySJI2jQTGNwLcWMD+hyu8=
X-Gm-Gg: ASbGncvuSbp1wBydm5cBkxXkgZNMVGDgXl7eOltovahsm5sLkYIX2WInCBkR3wjDVlE
	nlfpwXrYoHA3EcW6M1WYl8uAqRWadUrOF0MdHEMv8dPhtWN6TT2ZJvqKPUqr+Jk7c+njCTubo8P
	FJLpXxfw6TDSxtsyvl3/r4SRSRCnDEI6xaWJoef5jFhSN5y7HopgAmm0CNA6W52jIwjQRc+fTuC
	EPP/TcWPlHaw29DCUzEPS/ajLA1P/tJuGFQOUeFkGXZPktUXO4QEoCeFkBcl2m/SjBJiukTb16P
	uBNognMoJyNnJK/DRoti6goESHJkuRrCL/kTzP+PA6xyb/IDsQUAW3Xfciby7jG5N3ay65HaS/y
	aTd0V1LLLf94=
X-Google-Smtp-Source: AGHT+IHHvfBbvW792GJesU16ZosUoDGJmwAH0HfpMV5vEj/0KoaVRp1swdgvc8WGMdWP5GB5YEpguQ==
X-Received: by 2002:a05:651c:1a0a:b0:332:5ce1:1fd5 with SMTP id 38308e7fff4ca-3325ce124f0mr36420981fa.31.1754421673794;
        Tue, 05 Aug 2025 12:21:13 -0700 (PDT)
Received: from frylock.hermans.pl ([2001:9b1:dfa:6c00::f02])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-33262ac17casm10258271fa.82.2025.08.05.12.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 12:21:13 -0700 (PDT)
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
Subject: [PATCH 1/3] Input: xpad - Add MAP_FERRARI_458_CUSTOM_AXES mapping flag
Date: Tue,  5 Aug 2025 21:20:28 +0200
Message-ID: <20250805192036.53918-2-parherman@gmail.com>
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

Introduce MAP_FERRARI_458_CUSTOM_AXES to support custom axis mapping for
the Thrustmaster Ferrari 458 Spider wheel and pedals.

Signed-off-by: Pär Eriksson <parherman@gmail.com>
---
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 1d8c579b5433..51e285efac79 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -84,6 +84,7 @@
 #define MAP_PADDLES			BIT(4)
 #define MAP_PROFILE_BUTTON		BIT(5)
 #define MAP_SHARE_OFFSET		BIT(6)
+#define MAP_FERRARI_458_CUSTOM_AXES		BIT(7)
 
 #define DANCEPAD_MAP_CONFIG	(MAP_DPAD_TO_BUTTONS |			\
 				MAP_TRIGGERS_TO_BUTTONS | MAP_STICKS_TO_NULL)
-- 
2.50.1


