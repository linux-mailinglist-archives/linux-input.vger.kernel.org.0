Return-Path: <linux-input+bounces-53-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B250B7EAFFD
	for <lists+linux-input@lfdr.de>; Tue, 14 Nov 2023 13:40:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 541E91F226C4
	for <lists+linux-input@lfdr.de>; Tue, 14 Nov 2023 12:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7568C168CF;
	Tue, 14 Nov 2023 12:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7598168D5
	for <linux-input@vger.kernel.org>; Tue, 14 Nov 2023 12:40:09 +0000 (UTC)
X-Greylist: delayed 576 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 14 Nov 2023 04:40:08 PST
Received: from harvie.cz (harvie.cz [77.87.242.242])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 342BD130
	for <linux-input@vger.kernel.org>; Tue, 14 Nov 2023 04:40:07 -0800 (PST)
Received: from anemophobia.amit.cz (unknown [31.30.84.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by harvie.cz (Postfix) with ESMTPSA id 2C964180251;
	Tue, 14 Nov 2023 13:30:29 +0100 (CET)
From: Tomas Mudrunka <tomas.mudrunka@gmail.com>
To: jeff@labundy.com
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tomas.mudrunka@gmail.com
Subject: [PATCH v6] Fix freeze in lm8333 i2c keyboard driver
Date: Tue, 14 Nov 2023 13:30:23 +0100
Message-ID: <20231114123023.95570-1-tomas.mudrunka@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <ZF53JVcb8UJQFmfP@nixie71>
References: <ZF53JVcb8UJQFmfP@nixie71>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LM8333 uses gpio interrupt line which is active-low.
When interrupt is set to FALLING edge and button is pressed
before driver loads, driver will miss the edge and never respond.
To fix this we should handle ONESHOT LOW interrupt rather than edge.

Rather than hardcoding this, we simply remove the override from
driver by calling request_threaded_irq() with IRQF_TRIGGER_NONE flag.
This will keep interrupt trigger configuration as per devicetree. eg.:

	lm8333@51 {
		compatible = "ti,lm8333";
		interrupt-parent = <&gpio1>;
		interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
		...
	}

Signed-off-by: Tomas Mudrunka <tomas.mudrunka@gmail.com>
---
 drivers/input/keyboard/lm8333.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/lm8333.c b/drivers/input/keyboard/lm8333.c
index 7457c3220..c5770ebb2 100644
--- a/drivers/input/keyboard/lm8333.c
+++ b/drivers/input/keyboard/lm8333.c
@@ -179,7 +179,7 @@ static int lm8333_probe(struct i2c_client *client)
 	}
 
 	err = request_threaded_irq(client->irq, NULL, lm8333_irq_thread,
-				   IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+				   IRQF_TRIGGER_NONE | IRQF_ONESHOT,
 				   "lm8333", lm8333);
 	if (err)
 		goto free_mem;
-- 
2.40.0

