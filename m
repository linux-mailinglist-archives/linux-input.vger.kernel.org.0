Return-Path: <linux-input+bounces-7178-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A28995F1C
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 07:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BD741C23C2F
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 05:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4D0161313;
	Wed,  9 Oct 2024 05:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OkITHGAd"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D28156242;
	Wed,  9 Oct 2024 05:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728452517; cv=none; b=k4VgQPkaQwG+eBGfdVkWDOrnIjbfsVoeNaE9CmfprYVEE2ccUwqSERmqC1KtQRJECs6LmeZLwGjxI0dnmxE4gPXzGIkn8bvmy2ZmEDda6d7qyyKxSZUJZLi+/I2A9rVhIJnjulJNcvHJpbXSwLS5WTUkY69WXlwWSaBhTGMdtw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728452517; c=relaxed/simple;
	bh=Lxgp/rSE9UhxKcum2AYKZrpsOKdT4QfLqPo3XKoz63c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qy4Dioe4bA4inMZEZemlkKhGMUnZXkdLbWNcqesmlrDnbwSLAaBINVypB9XHS6LxlL5Lg6LAjHMHQGy4xQ+9XTypfIQVIyxXbQ93zkGPZW32zjo4DDIHHMPc5iq3sp/JC4/IUzhyLflhMEHWF4Rdp6UKOqo0hSzFLdgY3VnHyFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OkITHGAd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23495C4CEC5;
	Wed,  9 Oct 2024 05:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728452516;
	bh=Lxgp/rSE9UhxKcum2AYKZrpsOKdT4QfLqPo3XKoz63c=;
	h=From:To:Cc:Subject:Date:From;
	b=OkITHGAdsBEDwFGErIQP7mmFz/ptZNcpVAz80rDt16tdK/0Q+GosdHn46IdMwo0fJ
	 X3z0Y+SikeBJ5oxyqxWsUzE0pcDWRRo1EZiyVrcA4ds/+AdsVEvQjfAwpIXXF+Qd32
	 COwOS77kbVzDS2zNwAzCIg/RVdrnq2pIM84DDzSCId1XjvAGimd6EgcZ0FOHOSSbS7
	 /vAOjYJYjjiaX7zHC8D5veRWllt+/Z17A203bsj3nGzyJ2fOZyD621/7wtKEcek8Ci
	 5NInTILiVZSXeuCw5RBprubPVriO7yK7kqCS+fKB6o7gM9dGNeJnNP7fGZ8zXZXq0E
	 uofVceHffqg+Q==
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
Subject: [PATCH 5.15.y] Input: synaptics-rmi4 - fix UAF of IRQ domain on driver removal
Date: Wed,  9 Oct 2024 05:41:48 +0000
Message-ID: <20241009054148.3815799-1-tzungbi@kernel.org>
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


