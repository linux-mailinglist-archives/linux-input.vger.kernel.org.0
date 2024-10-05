Return-Path: <linux-input+bounces-7096-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F6F99169E
	for <lists+linux-input@lfdr.de>; Sat,  5 Oct 2024 14:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22A231C218E3
	for <lists+linux-input@lfdr.de>; Sat,  5 Oct 2024 12:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74FDA14D2AC;
	Sat,  5 Oct 2024 12:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lodewillems.com header.i=@lodewillems.com header.b="tkAvWn8V"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA70146592;
	Sat,  5 Oct 2024 12:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728129828; cv=none; b=ukNYd4ZJyHgUXAOdaAvFp8wmLSEvdS5WHAF6qdmPjy1gsx/XPMjzi0pCAT+6a3rSw2KPYTslG6QezTBOhesGLYgFMlqVeHqu7TKTUh0sAdEGgJUjAUaFZqeMsHDnog5Ism5MnfaKET+Xtb+o9lvVhOw5ZegfaYwvzwKZGasLbgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728129828; c=relaxed/simple;
	bh=lmeD9Qaj2zD+ZD0KAIuu/2/NgmkBpVCG1Dw4SXlNrT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nNJlQg7b3vTSFC/BMzvgsPzeUik8AyalQQHzJX1bnqHrZ/fZ3F1C30D6ABnuuF8bz+b0inNEbVlbVmJBea1gkxHzGFGynK4tzNkI+dGdtE8DivG9K0cduZYXsjdhwhzUb9om4ADbvrSBSqDuL+7C/waWlPxvXikjJIeWxGIAYoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lodewillems.com; spf=pass smtp.mailfrom=lodewillems.com; dkim=pass (2048-bit key) header.d=lodewillems.com header.i=@lodewillems.com header.b=tkAvWn8V; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lodewillems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lodewillems.com
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4XLPFp2qyWz9tV3;
	Sat,  5 Oct 2024 14:03:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lodewillems.com;
	s=MBO0001; t=1728129822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EfRavpUO6nQZ5ohUYARfB7BRubgVwCDpKb/oVP7T3RU=;
	b=tkAvWn8VBZBch4qXbaXOHGPvG6mbs3izBA1+mt19SUBUNyyshzGZaFjL2jradRLMJHAVvs
	ij7LEOL7lKieoPcfwsOJ4Ur/7rvUDZPY+I862NlL25HrS9uf3WvYqABGUukm9rusTMVUtr
	E68sUljBs8Gv4zuvpRP4spZc1aZUhYRyVgFy2YjCWY8ak4CIYxQh6zsgFVBpLTs1ljKrFU
	UZyhNjONf07qd85cUmuvVkeye2WZVfrKsh62gVH/+hcRGQR0c6l6fDvxJqioKlVsWJf8WZ
	lvCNY5cTXc0BbxOVkyImKjEv2MJ7awzKMf7mBR0TO9SbiNBbGvhyhhJyUjNFbg==
From: Lode Willems <me@lodewillems.com>
To: linux-input@vger.kernel.org
Cc: jikos@kernel.org,
	bentiss@kernel.org,
	linux-kernel@vger.kernel.org,
	Lode Willems <me@lodewillems.com>
Subject: [PATCH 1/4] HID: Add IDs for Kysona
Date: Sat,  5 Oct 2024 13:57:03 +0200
Message-ID: <20241005120256.13847-2-me@lodewillems.com>
In-Reply-To: <20241005120256.13847-1-me@lodewillems.com>
References: <20241005120256.13847-1-me@lodewillems.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4XLPFp2qyWz9tV3

Add the vendor ID for Kysona and the product IDs for the M600 mouse
(both the dongle and the mouse itself)

Signed-off-by: Lode Willems <me@lodewillems.com>
---
 drivers/hid/hid-ids.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 781c5aa29859..76052c653112 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -749,6 +749,10 @@
 #define USB_DEVICE_ID_KYE_MOUSEPEN_I608X_V2	0x501A
 #define USB_DEVICE_ID_KYE_PENSKETCH_T609A	0x501B
 
+#define USB_VENDOR_ID_KYSONA		0x3554
+#define USB_DEVICE_ID_KYSONA_M600_DONGLE	0xF57C
+#define USB_DEVICE_ID_KYSONA_M600_WIRED	0xF57D
+
 #define USB_VENDOR_ID_LABTEC		0x1020
 #define USB_DEVICE_ID_LABTEC_WIRELESS_KEYBOARD	0x0006
 #define USB_DEVICE_ID_LABTEC_ODDOR_HANDBRAKE	0x8888
-- 
2.46.1


