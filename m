Return-Path: <linux-input+bounces-1332-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A77832544
	for <lists+linux-input@lfdr.de>; Fri, 19 Jan 2024 08:48:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1523B1C2368A
	for <lists+linux-input@lfdr.de>; Fri, 19 Jan 2024 07:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14DE8D53F;
	Fri, 19 Jan 2024 07:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dtqw5KNs"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7425DD51A
	for <linux-input@vger.kernel.org>; Fri, 19 Jan 2024 07:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705650520; cv=none; b=dHsCliYXBNT/e9Adgm4QlXNOi8hKuA4xLCJ4ls35x03kETDncpaaYbuXHGXIijubq2t7myoCnVwu1pD0bfL1it9kE+J1FctZqr3+qkRr3ROvZh/vdD7KNVdToVEPbsSORX1c1pUvMBR7JYpyhPnTjE0lIle7998gNBuV+3UAFfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705650520; c=relaxed/simple;
	bh=ebbJ6bA1dlgy/6ZtQSvyFQkwF2mZTYLPxjDz3eZfPdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rpd6bqhWLMh04/O6TzC04FZiuZQ3Lq7FUe8CFuUNrOFO/3wtHo+n4vqKO+VocqGKKrOor80Nf9Mk/rcFSqpOdYEcK4fTZIHnoipyylW6tsuZGlf7ZP0bZu80IS0+gsU3UGriVMYGQUHeWcxdOXTy8vm2XoGvGt1OBJ8H5a+9zCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dtqw5KNs; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5cf495b46caso287036a12.1
        for <linux-input@vger.kernel.org>; Thu, 18 Jan 2024 23:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705650517; x=1706255317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nXGjBm0+HOq1i2RiP/xgovqiQd2Jx9NrE+bGhtMDLmQ=;
        b=dtqw5KNsbDefq64UP+wgTUqnsEAn4ScsQRHKp80TQ+WpAAAH8cOTxN/Aq8rsafVS4y
         r9aRkUwks1e7cnbxnlc1thPavmNOLrTbaXJRxjuoIof2exp3SctAM4SWgnysMx906EuJ
         aCTlAILQK7+FAi8A2gK0Hhz6ZHfA623kPKCKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705650517; x=1706255317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXGjBm0+HOq1i2RiP/xgovqiQd2Jx9NrE+bGhtMDLmQ=;
        b=vLMeKIm2+6z+wnJkC5uK438ANHYzu2c0FQkx6w7Uhr/7H3fAhMsv18Tq9KIBtBGs3X
         k45BKtmOftP4tYVR/5BOnQUY8ZuNGPOOH3BWwReboxhil3LrsFjR5aHuEqsm5X2PU/WF
         EvufpQy9ra2jNuaZt7rZitocM3aSPcXAst/mW3X4sNKlBQzQL88tO5h+0zAu/u5+TYFk
         rbkWlPtE/R/FPwe/pEnOvDuvRSgLSfkwzwD7GKnZHLn20OsAE0VTMjufO2Feu4oSm1M3
         cQ5+1MEy6EoLjdwxxOXfppDf53H90lQnMYAxhUosPttO/pV+0n8EgdTzIpxLnlPv1Vzz
         pXvQ==
X-Gm-Message-State: AOJu0Yw7hVJS24wRocdZi95bKJj8wVGbj1NfZMEb2wmlP1fR0z9I1/fF
	SV+9Ih06jDe9pFCZnkHGzcRxTB3Aaqcm0pteO+iQ58WeOLkogPif5BnTJh1HIQ==
X-Google-Smtp-Source: AGHT+IHQna9e3X42lqrWFOSQZQYMAmVaV6Zoi5bSDcbYwGwoWzErrSZ7syFdmAt05s4X8B7fmLNpGw==
X-Received: by 2002:a05:6a20:9154:b0:19a:e212:46c with SMTP id x20-20020a056a20915400b0019ae212046cmr1736163pzc.95.1705650516771;
        Thu, 18 Jan 2024 23:48:36 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:a5a9:5dbc:778d:db07])
        by smtp.gmail.com with UTF8SMTPSA id j14-20020a170902da8e00b001d4b1d190e3sm2435533plx.58.2024.01.18.23.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 23:48:36 -0800 (PST)
From: Ting Shen <phoenixshen@chromium.org>
X-Google-Original-From: Ting Shen <phoenixshen@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: fshao@chromium.org,
	Ting Shen <phoenixshen@google.com>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	chrome-platform@lists.linux.dev,
	=?UTF-8?q?joewu=20=28=E5=90=B3=E4=BB=B2=E6=8C=AF=29?= <joewu@msi.com>,
	linux-input@vger.kernel.org
Subject: [PATCH v2] Input: cros_ec_keyb: add support for base attached event
Date: Fri, 19 Jan 2024 15:48:17 +0800
Message-ID: <20240119074831.2979671-1-phoenixshen@google.com>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a new type of ChromeOS detachable keyboard that talks to
the host via CrOS EC host command interface, rather than the USB
interface.

To trigger the firmware update daemon (hammerd) on this keyboard, a
signal is required to replace the typical USB hotplug event. This patch
addresses this by mapping the EC's BASE_ATTACHED event to SW_DOCK.

Signed-off-by: Ting Shen <phoenixshen@google.com>
---

Changes in v2:
- update commit message

 drivers/input/keyboard/cros_ec_keyb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 30678a34cf647..d2e0d89d4ffdf 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -128,6 +128,11 @@ static const struct cros_ec_bs_map cros_ec_keyb_bs[] = {
 		.code		= SW_TABLET_MODE,
 		.bit		= EC_MKBP_TABLET_MODE,
 	},
+	{
+		.ev_type	= EV_SW,
+		.code		= SW_DOCK,
+		.bit		= EC_MKBP_BASE_ATTACHED,
+	},
 };
 
 /*
-- 
2.43.0.429.g432eaa2c6b-goog


