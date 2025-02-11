Return-Path: <linux-input+bounces-9954-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEFAA30DA3
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 15:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF9247A376E
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 14:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECBF024FC03;
	Tue, 11 Feb 2025 14:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DxIEjZlZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C2724CEE4;
	Tue, 11 Feb 2025 14:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282591; cv=none; b=ofXEw8SUWFulghdLMgTciK+AEes2Kq00XXNUdkY3jahLZdxrNS/e36g7eOm13yYbaiyjB8nwGIUYHAtlrK2VrmdRXoePIDc7pyYUt1sL6ryUgiYX18hybR4xDkByKDJvKN/fZ6fl55g/p2Tg7RukmdkRHMc4qlgdMhoQQ3F1G0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282591; c=relaxed/simple;
	bh=WiU2yqu46XQLx8UhQf+E8j+pvd7+tZjLoi4sx8jhKrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V+MBUgVTbO0LC4Jssv43XFJfsk2SfVubOhQfYYuuP+ePdCjMGbZFT9tvA6DR6It62Y+T2jLQh9u/VFHdamcN3mHXc6Wt9MrNfUxv5KI1DakpbjaCQypq5jVdDVnHqn8px/lBpD2bGX+O0Vv1Ohp0zmIZ/oU2SDtmNqK+ktqWVV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DxIEjZlZ; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5450268e513so557411e87.3;
        Tue, 11 Feb 2025 06:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739282588; x=1739887388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJIT5gm5Fkeir9qgPIT3wEjMUvphUfF3iLU1bg6b6Vk=;
        b=DxIEjZlZ/3IKLgczxWoWz/WEupty5YtmDkz/8xR+uvol4ZePusGK1gtsNTd0FUOJoO
         dEwrifckhJWPU0evsW/3xGwNNbzVoOaKwsvBXxnzvAc4MGibcpOYZfchSCkEZygfGfWs
         RlNr8QHc42SsmIse1Mk6sCCcx2Jv1k0PVSz9DM6O+DfBpfw/kOB2vY4RCCabEmBLaT9w
         pTVX2BfnHPA+BONnFGhMSLQSaQiW+JZv0y6zEP2ve5mMHqxch3mj3lzhKPv2zDrSHXmj
         IDoNTld1DGvMXmjQ7OEUFGiwQJRYfa8CxeVPn6vwO1D4cmA7kS9Th2/lMsP5IXPYF5cn
         5Img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739282588; x=1739887388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJIT5gm5Fkeir9qgPIT3wEjMUvphUfF3iLU1bg6b6Vk=;
        b=T+m1jshlCZwvKMTiiLWsLBiOWu2KRFB7bywRy9mwMy7sm2pagvuIPKs/ceNQKMLaea
         ARBbLNpPkNuoYXC39fJRNpOpuHWP0HnZkyxkiUmiMCYdkDT/EGRc/kPnVtmCS5gAR9T+
         tXX+PdDLOWzsckE9Zht0FFc1TNFPtgp0FpwCmBw7/n7Mg26YysBTlVPY9st5tCokseMB
         UjjZknkgbWWxV0IWiGGBbI4TBMnSmRvmk5puTi+d0qykT0FCQ2oxwEIfc1cfTOdyTg2p
         W/pFQLC/bDDEG7gQxMHpe/sFRVDL16dPjDoTgbSgX31PnLkXjeKiCT96PVwXTCDm/SAV
         LRbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfFO+9f14zEk8cwi1VBpFePp8adAwhq07Yik2XpNOQCzml18kO8fjzcFyRLPMcTnoiU/qtjR+Mlw4bWA==@vger.kernel.org, AJvYcCVYhEJTWhsOhtdU8YW/JjtVSIpYz/Di3jPUXZxkxLWVHA2OpEr5G+7FzyAuybRuCwPG09uiMBiCGWJ0@vger.kernel.org
X-Gm-Message-State: AOJu0YxxDiQN4UwP9Wun1gY+fORjY0GpLh6bUY9Q/tha3J128u/84eSr
	6QfQCcVDugHigTiIU2wxrEkxYLEn5liwGnlO5KXWTpW5+YTfpw0D
X-Gm-Gg: ASbGncuXbVoWvdVxm+eshjlVp8qnrNDVo+Q+9nZsuVxtk3M2vP3f/DiNYfMLCUbkd71
	8NBCQndP/mEc2bcB1ZCbO0JxqRE6mofZdvexab69T9wWBqbWOHdP/Ak8HxZKX3xJKPP1M8qauJf
	85ZArfvbEdjdrkAa5HUztw4u3EKg726zA2LIbIQLD4zKFF++ocvoc42cnLvOoAueYTG6Kq6BSSa
	2lUduFa1rE5vg84kJqkr9mOjlLW3st4K4E9edslI6tQxv0BhwIL1NS7yPqYNOknB/oNCM+mTScQ
	i8K7LtYCE+83VRx+K9K5H9523fXr2PLPs38SWBwIA0nspC4n5QMFWN2BD6mLWQ==
X-Google-Smtp-Source: AGHT+IFzFlOWkNa5ydaof8tikiAB44S1unXQPHm/P2AAyEalcpIgJkFY3cf8TCG6dFojlELSDedg/g==
X-Received: by 2002:a05:6512:2252:b0:545:6f8:232a with SMTP id 2adb3069b0e04-54513b5179dmr328757e87.13.1739282588081;
        Tue, 11 Feb 2025 06:03:08 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545014af0d0sm1118721e87.184.2025.02.11.06.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 06:03:07 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 6/6] HID: pidff: Remove redundant call to pidff_find_special_keys
Date: Tue, 11 Feb 2025 15:02:52 +0100
Message-ID: <20250211140252.702104-7-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211140252.702104-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250211140252.702104-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Probably left out as a mistake after Anssi created the helper macro

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index d5734cbf745d..6f6c47bd57ea 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -1159,10 +1159,6 @@ static int pidff_find_special_fields(struct pidff_device *pidff)
 		return -1;
 	}
 
-	pidff_find_special_keys(pidff->control_id, pidff->device_control,
-				pidff_device_control,
-				sizeof(pidff_device_control));
-
 	PIDFF_FIND_SPECIAL_KEYS(control_id, device_control, device_control);
 
 	if (!PIDFF_FIND_SPECIAL_KEYS(type_id, create_new_effect_type,
-- 
2.48.1


