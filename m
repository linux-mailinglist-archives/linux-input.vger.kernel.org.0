Return-Path: <linux-input+bounces-8135-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C799D0A44
	for <lists+linux-input@lfdr.de>; Mon, 18 Nov 2024 08:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0762E2821F3
	for <lists+linux-input@lfdr.de>; Mon, 18 Nov 2024 07:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66CF115098A;
	Mon, 18 Nov 2024 07:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WOVk2pdU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F9818C34B
	for <linux-input@vger.kernel.org>; Mon, 18 Nov 2024 07:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731914996; cv=none; b=D4xldO7qgM822kutdKRcTL45cRZ8nLTeOHbjSRJU1BOnpryg/CzvL75DX+/rXUsL4vOXDptbkJmqsodwyhPWDwNJTPv2VMIh0cStK1IxEVqg32m7FoX8gAHIGFqoiYP4EmP4O/bIWQ2MbFFDGGQ4EDfmX2bbFcxe+zz39bwzSEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731914996; c=relaxed/simple;
	bh=kfG0y9K+O0idmwwz3aV0NXnyQm6c+F/DJ73QLT35W9w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r5dTILWF5/aI1bMqdwqS4cTY2d1YeojAWcqpo5/HmGKbM0n6dBw3OBSzVDDahKDLmrpbPC9kiloRnaoSeY+gasZXiF76MRrB+Jv7431zdyA7kMZXXBkbeEGJ5FbF+czu0aC5geV1ESSFee4utOZ8hhxEXUxgDAb/ImazHsu8ZDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WOVk2pdU; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=aAd/+tR/6amb3iC4y9aIm0hPICd8LWcv5HI4xQzRV/c=; b=WOVk2p
	dUoujkGOyrKFrqsvR767kNsLYhPt+wyZFiZbpLM9wjTE6mQGSaWnJo9tUvK8W8xj
	5BW/0k+Muhwq21b/HjtmDzce+eyKIdLGm6LTdGu0/vAX27RV9e6vpg0JJs85EbJM
	qcoFSkfXzTMXlTcvCRLEvqMfGj9PB/M8S5265ESzDZG+av0P0Hhgv71gew7yE9Pf
	Oucie6QaZ5XnM/7DpUa1qIqq3rv0WiQ6SsIUHCT4kkY8OHcnD32C/vSmfoO3xk8w
	lqyryIpg2WwKcZeQZ6pKUh1g7pEw99qaK7E+DzEsXFGu9ZWb0mKx1fMeLPcv1O2q
	9uxbre/f6DNFc62Q==
Received: (qmail 112434 invoked from network); 18 Nov 2024 08:29:38 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Nov 2024 08:29:38 +0100
X-UD-Smtp-Session: l3s3148p1@0+IT4Son8tUujntT
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 06/15] Input: sun4i-lradc-keys - don't include 'pm_wakeup.h' directly
Date: Mon, 18 Nov 2024 08:29:05 +0100
Message-Id: <20241118072917.3853-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241118072917.3853-1-wsa+renesas@sang-engineering.com>
References: <20241118072917.3853-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header clearly states that it does not want to be included directly,
only via 'device.h'. 'platform_device.h' works equally well. Remove the
direct inclusion.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/input/keyboard/sun4i-lradc-keys.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c b/drivers/input/keyboard/sun4i-lradc-keys.c
index f304cab0ebdb..9a4fdef2650e 100644
--- a/drivers/input/keyboard/sun4i-lradc-keys.c
+++ b/drivers/input/keyboard/sun4i-lradc-keys.c
@@ -24,7 +24,6 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_wakeirq.h>
-#include <linux/pm_wakeup.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
-- 
2.39.2


