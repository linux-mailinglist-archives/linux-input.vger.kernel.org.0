Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF6330134
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2019 19:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbfE3Rqr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 May 2019 13:46:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:42254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725961AbfE3Rqr (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 May 2019 13:46:47 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 72F5925EA2;
        Thu, 30 May 2019 17:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559238406;
        bh=MDRHN3oiGSWxzqVI+2qCH0ZE7uUl6PNvpqbyhaqmMNs=;
        h=From:To:Cc:Subject:Date:From;
        b=q9spEw85dT/YRiGo02ciR42KO8dzRxuPW6eXOTPUut8RAP6yYOyas9L1WLzr+47lb
         EN1/ISCYcYJgv1463T3M1pITof9rKfjCPkyJgeF0XU9a9ZPIQHXBAsst7qZFNQSLcl
         shzcqsR02akFR8Mh5AYZghWjwDM0k+yBUz8Uy7ho=
From:   Sasha Levin <sashal@kernel.org>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: input: serio: Add a module desription to the hyperv_keyboard driver
Date:   Thu, 30 May 2019 13:46:45 -0400
Message-Id: <20190530174645.18147-1-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Joseph Salisbury <Joseph.Salisbury@microsoft.com>

This patch only adds a MODULE_DESCRIPTION statement to the driver.
This change is only cosmetic, so there should be no runtime impact.

Signed-off-by: Joseph Salisbury <joseph.salisbury@microsoft.com>
Reviewed-by: Michael Kelley <mikelley@microsoft.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/input/serio/hyperv-keyboard.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/serio/hyperv-keyboard.c b/drivers/input/serio/hyperv-keyboard.c
index a8b9be3e28db7..7935e52b54358 100644
--- a/drivers/input/serio/hyperv-keyboard.c
+++ b/drivers/input/serio/hyperv-keyboard.c
@@ -440,5 +440,7 @@ static void __exit hv_kbd_exit(void)
 }
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Microsoft Hyper-V Synthetic Keyboard Driver");
+
 module_init(hv_kbd_init);
 module_exit(hv_kbd_exit);
-- 
2.20.1

