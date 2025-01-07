Return-Path: <linux-input+bounces-9013-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 603DEA04A38
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 20:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71A997A2BC8
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 19:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F881F63C8;
	Tue,  7 Jan 2025 19:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQxm2p2p"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424421F543B
	for <linux-input@vger.kernel.org>; Tue,  7 Jan 2025 19:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736278122; cv=none; b=fzggBBgODjDQDt1z/sNnTnIzQDwpvZ9Ra5cjQpEzZ6VSVZwIgKIxF1xwhjcIfmGrmKHiN4hx2FprJRw8XXngi/Lwm+bD2azbGIKgYOHfOkBtuJ77gyFQzoqa0KpUSL4A1ezKOLUu+0KIbQbW0qz1AuVP1Z5MUmGuWSyqwfyhoKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736278122; c=relaxed/simple;
	bh=k5cmGzAmnHN2qHQFNU6+xaL4/UkteFhAZ39Pfm1KcN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GmHbo+/TLFrF49P0Yhz65dQglnjJrATpXqPyVlHkGAfX8Ztc0zCaQ6BNo+4SgXfTkKuXjCngCygZtcWgiIxds8Yj6jShjMQkcOlqpuQzajpZ4yPTeD7UOeODDlZxqjdCY4zSHTnbs7pPPCBGLJrx52q1+6cJy+UqsgIVOAAcDsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQxm2p2p; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso110138955e9.3
        for <linux-input@vger.kernel.org>; Tue, 07 Jan 2025 11:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736278119; x=1736882919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4T4t2rfz5lqd69gRJpi1dCv0E2oXtx3Cac4RxzrHcAI=;
        b=JQxm2p2pcR9py8Ahz1D095xBpeSo99bDvSj9VS42IvhibY8gMlEvvsV+OSaO5hqqh1
         96cXhPOjl/O15nKnPivGL3ZdN0sUJDXByYVRFfV5Ep+QguRyrR6Yxk/cxATczIkE8qW8
         YltUrW2oEcBwXdkv0pzTPO5Gl/Zzv24TPAr2tzkxUYFQW7PBDBYycfKsGc1zVV/5pc7C
         WTTIXpgU0MwdR83NRmCu3rp8v5TXoxCCebZz05P3RIblhrTomR5P9pK2jFsLshXU2QQ3
         of3t6HP70xv8tzALkTEepsq5mHHVF4BRYAAfxpDCaBv/65UQ71EvW2iMJJWTMwnnYQRU
         Utaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736278119; x=1736882919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4T4t2rfz5lqd69gRJpi1dCv0E2oXtx3Cac4RxzrHcAI=;
        b=lGNvYJOPC+PtZ66IT78RSISnpSqFw1tdMbHBrUwXiekWPyGO+CRQm5Cstc8IFOa8Rt
         rAmUruGdP0M/WEzB5KtI5ILbo4FmMzOx4+DBRTNH905lw71mFFYQfyagMzg4kyY482ZM
         DSPb8zPylG6pdhNs+bzodf+hAW+/gGCSGYQ7uJCCqcnN687Q5FmMjkTv+h2HtZO0OZut
         e7tfK2Zsm5pY72vRbyXfrMuQPEmhVpN5RS0gzdMt7chWz+Yb2TV+huT+mXI/ONZyOIbV
         NtcgF4DNSrgNdScTlLiUgIfpBxwYgkSaB6q1Cnf3hynzOyZQ3nxIWucPlzJp9c+P6dtP
         UPig==
X-Gm-Message-State: AOJu0Yz92u7wJQUXSqCFu+w3JglFwcBhKOrch0xoqapCr5qe0LaglEjd
	Z/i3yhhVMgB5969nzckAXkhEErbNuL5MTHoUz2XM40kcHhMJOQvGgb18swTysqB02Q==
X-Gm-Gg: ASbGncu5nJrS1srGopx4Fp9mV+yn2u6oUc6lVAZMPSu0wfNi0/6NgGeemcfiGBuTxdk
	R1hUpx+fLVzg3b01OunEKrqlNBSurYUcdNjTIbJn+L7Mf3gwEWTd/jIM9waD91nGiGLSJFIc+b5
	deGH8mYRGseodIB+8mjYZF2M2OP1Tsz3eI9yLxhylIsuFz1LyqwOP22HNnDok8xVuvwAIDtzG5c
	ytQzWXkS+xOmfFG2SaVsqgCVN01mHI84la0oSZj7lfnhUmbuHtZwCNN/oq6Uh/HXUmI
X-Google-Smtp-Source: AGHT+IFvGiRiyVxVU8mt9Nvt83xgLs6YIA7mC8Vi6pyLxbaNZy80zVYzoH+zB+fvQf9oZElbGGMO+Q==
X-Received: by 2002:a05:600c:4691:b0:434:9c1b:b36a with SMTP id 5b1f17b1804b1-436cf8e3b67mr121025785e9.13.1736278119467;
        Tue, 07 Jan 2025 11:28:39 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b4a8:4000:2867:420d:1978:6fdd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acb17sm50456700f8f.97.2025.01.07.11.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 11:28:39 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Martin Stolpe <martin.stolpe@gmail.com>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH v3 06/11] Input: xpad - add USB ID for Nacon Revolution5 Pro
Date: Tue,  7 Jan 2025 20:28:25 +0100
Message-ID: <20250107192830.414709-7-rojtberg@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107192830.414709-1-rojtberg@gmail.com>
References: <20250107192830.414709-1-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Martin Stolpe <martin.stolpe@gmail.com>

Signed-off-by: Martin Stolpe <martin.stolpe@gmail.com>
Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index b2716b49d3b6..1cd946b26451 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -390,6 +390,7 @@ static const struct xpad_device {
 	{ 0x3285, 0x0603, "Nacon Pro Compact controller for Xbox", 0, XTYPE_XBOXONE },
 	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
 	{ 0x3285, 0x0614, "Nacon Pro Compact", 0, XTYPE_XBOXONE },
+	{ 0x3285, 0x0662, "Nacon Revolution5 Pro", 0, XTYPE_XBOX360 },
 	{ 0x3537, 0x1004, "GameSir T4 Kaleid", 0, XTYPE_XBOX360 },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
 	{ 0x413d, 0x2104, "Black Shark Green Ghost Gamepad", 0, XTYPE_XBOX360 },
-- 
2.43.0


