Return-Path: <linux-input+bounces-7180-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7394D995F21
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 07:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5E221C23C5E
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 05:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78C6155316;
	Wed,  9 Oct 2024 05:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="peGBpV4y"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8152F13CFAD;
	Wed,  9 Oct 2024 05:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728452537; cv=none; b=tYXsGtBPrnUy/r65P5y2P780qDxbAzRwent8LlyrYSCDVTcmBSlG+n9O8BV2awcu0w9f/iQpjmKTg8/xNKyJyF4xHpkUbuoSot/wih5skngGDzLOtvdThvc2+h/dtuMNC17PaY1Bz/ERU5uBrKJolp1E0Dbhw+wwvoxzdnuFfoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728452537; c=relaxed/simple;
	bh=Lxgp/rSE9UhxKcum2AYKZrpsOKdT4QfLqPo3XKoz63c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qcoU0cEkTm8pP/bjJF5ol/GFTn7sW1GybRQHG33vLzuQmX0/F0PjRPQd3xMD3VLNqHU18qRLcQ7UIe6Ui+5WKv+F+G3J81krLAOAThHkaRBWEXiKuUAxqpkh7MhMmgtqiKl9xZwxb3HNKESIamFf7EAF2EjbSHseTmGc3jn4ygw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=peGBpV4y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95560C4CECE;
	Wed,  9 Oct 2024 05:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728452537;
	bh=Lxgp/rSE9UhxKcum2AYKZrpsOKdT4QfLqPo3XKoz63c=;
	h=From:To:Cc:Subject:Date:From;
	b=peGBpV4yaoLp0imkWIeDPPQiFsjpKcBF35Q9P4PJ5h60XvLv7nsFlm5txPSPSS4NE
	 ZlRG3gYnotnaZyihN6shzylMEEV3EvkP83TmlHFP255TP8/F1Z210wHVTq4IYY00DF
	 +JDkWupsikjPSXh+ogQv8JyhFf9ZlcDyTc3aOgZ5O3S6kgLkeMHXhTU/nhOthI4Rlh
	 cGdfQCURrakNEi32tT68nbajUihuvI2TRUTWXBnYYhcnr2ial/uOM4Aw7oyp/iFyxa
	 TaukQcNmz634EbYqGXgPTvfvFDiV8rvclrGDcJG8IWKr3EX3sSJxm8+hUyD6y5lq4O
	 TTIPHCJR9nJMQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org,
	sashal@kernel.org
Cc: tzungbi@kernel.org,
	nick@shmanahar.org,
	cheiny@synaptics.com,
	dmitry.torokhov@gmail.com,
	torsten.hilbrich@secunet.com,
	minipli@grsecurity.net,
	linux-input@vger.kernel.org
Subject: [PATCH 5.4.y] Input: synaptics-rmi4 - fix UAF of IRQ domain on driver removal
Date: Wed,  9 Oct 2024 05:42:12 +0000
Message-ID: <20241009054212.3815858-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mathias Krause <minipli@grsecurity.net>

commit fbf8d71742557abaf558d8efb96742d442720cc2 upstream.

Calling irq_domain_remove() will lead to freeing the IRQ domain
prematurely. The domain is still referenced and will be attempted to get
used via rmi_free_function_list() -> rmi_unregister_function() ->
irq_dispose_mapping() -> irq_get_irq_data()'s ->domain pointer.

With PaX's MEMORY_SANITIZE this will lead to an access fault when
attempting to dereference embedded pointers, as in Torsten's report that
was faulting on the 'domain->ops->unmap' test.

Fix this by releasing the IRQ domain only after all related IRQs have
been deactivated.

Fixes: 24d28e4f1271 ("Input: synaptics-rmi4 - convert irq distribution to irq_domain")
Reported-by: Torsten Hilbrich <torsten.hilbrich@secunet.com>
Signed-off-by: Mathias Krause <minipli@grsecurity.net>
Link: https://lore.kernel.org/r/20240222142654.856566-1-minipli@grsecurity.net
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 
Commit 24d28e4f1271 ("Input: synaptics-rmi4 - convert irq distribution to
irq_domain") was first seen in v4.18-rc3.  While the fix fbf8d7174255 ("Input:
synaptics-rmi4 - fix UAF of IRQ domain on driver removal") was first seen in
v6.8.

In the field test, we observed the UAF which was triggered via re-probing
hid_rmi driver.

linux-6.6.y, linux-6.1.y, linux-5.15.y, linux-5.10.y, linux-5.4.y, and
linux-4.19.y haven't backported commit fbf8d7174255.  Let's backport it.

---

 drivers/input/rmi4/rmi_driver.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
index aa32371f04af..ef9ea295f9e0 100644
--- a/drivers/input/rmi4/rmi_driver.c
+++ b/drivers/input/rmi4/rmi_driver.c
@@ -978,12 +978,12 @@ static int rmi_driver_remove(struct device *dev)
 
 	rmi_disable_irq(rmi_dev, false);
 
-	irq_domain_remove(data->irqdomain);
-	data->irqdomain = NULL;
-
 	rmi_f34_remove_sysfs(rmi_dev);
 	rmi_free_function_list(rmi_dev);
 
+	irq_domain_remove(data->irqdomain);
+	data->irqdomain = NULL;
+
 	return 0;
 }
 
-- 
2.47.0.rc0.187.ge670bccf7e-goog


