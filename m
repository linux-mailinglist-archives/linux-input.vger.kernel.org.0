Return-Path: <linux-input+bounces-8134-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 959B59D0A41
	for <lists+linux-input@lfdr.de>; Mon, 18 Nov 2024 08:31:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0692FB232FE
	for <lists+linux-input@lfdr.de>; Mon, 18 Nov 2024 07:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54AED1917D9;
	Mon, 18 Nov 2024 07:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hKQL4X0I"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616E9185B62
	for <linux-input@vger.kernel.org>; Mon, 18 Nov 2024 07:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731914995; cv=none; b=Ly7shuQw1/3vQQtPzmJOH2aBh3PCd9raBZ4/YoJ/fS3NLkCkvuh5IOQZrHPCnzO0G7ADnqQRLyJdb4VGiblyfVr+u+Vd4rJ05WzG3GuNj6k+WAuw+iy7Uim9NBfOcqlw1X72/U2OB68JYijdE2T6oq67SJ9hfiAP0TRUkceuOfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731914995; c=relaxed/simple;
	bh=PQQMBjS8QmOiIG5o75lciAdQR6IQRb8LTR4vBfyIZeY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c7mBJgVpbqo/HRONnD8CCFvMEkfJwWFMuQ1gescx+kWjbhuZ090XDEeWztmDqK4MPppP218O64Vkfsc+iO2iWBfANww8f3KpDx/LEjkMkE69PBcr8LB758jUuOCCPMosrzQQI2B+jL6q3IPLzhk8+PSier0ZuzHBhQvTAlcPHD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hKQL4X0I; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=/B5+b9h1RKJWs4xVmneZ+OTMCDtH4czfzo/ktYrdiWU=; b=hKQL4X
	0IzAcua757FBInORoUyMQyLWQmPIJJJzEH//PESQjSn58Or6diUAsuoVIgbdJmLM
	r+GANBG/7cy5hxR8rxdis5qYTjNtGDQYbkpospviEzAzzRMeAF8eP0xhFWfDoZe5
	2ZVnMEGYpHQxTIKtNpR/BMWDls49tR5L8fcWJ/uREUVni4zI9JUoAIdbmEUFrZpG
	qoTmCbo2K1t4aejDBP/jxKeapCSOwLSRBrMvktxzd63qxQO5BmZtkgBNoILlHs1Z
	mMZLyLA9ekSuhIOEcpTbwT4NPlSvC8j6MdYAHZ1Kwy282EWH2wjb0IUU4FWUffRG
	+jsgMiktrkrh9BAA==
Received: (qmail 112404 invoked from network); 18 Nov 2024 08:29:38 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Nov 2024 08:29:38 +0100
X-UD-Smtp-Session: l3s3148p1@P3gK4Son5NUujntT
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Subject: [PATCH 05/15] Input: spear-keyboard - don't include 'pm_wakeup.h' directly
Date: Mon, 18 Nov 2024 08:29:04 +0100
Message-Id: <20241118072917.3853-6-wsa+renesas@sang-engineering.com>
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
 drivers/input/keyboard/spear-keyboard.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/keyboard/spear-keyboard.c b/drivers/input/keyboard/spear-keyboard.c
index 1df4feb8ba01..18417ba19fdb 100644
--- a/drivers/input/keyboard/spear-keyboard.c
+++ b/drivers/input/keyboard/spear-keyboard.c
@@ -20,7 +20,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/pm_wakeup.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/platform_data/keyboard-spear.h>
-- 
2.39.2


