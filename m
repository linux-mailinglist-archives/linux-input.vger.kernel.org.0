Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E208A3011D
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2019 19:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbfE3RhX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 May 2019 13:37:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:34586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726280AbfE3RhX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 May 2019 13:37:23 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1928A20644;
        Thu, 30 May 2019 17:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559237842;
        bh=wQKK3l2c7JjJ2uCsqAXoKCIKXYMc7HnMy5u3awvrXf8=;
        h=From:To:Cc:Subject:Date:From;
        b=oa3E3qmDjpRmKDPLuk/sH2HP689fQrmofARJcxp+7KDU9L0NWKl3OhKgiW+xVM59K
         SSjVEIJ0occnl5Eq3QSR3+ivUHJEQCIg2zeFvlbFqfjUCouZgLciAKd43mYbxApF97
         ldy5w4CFO5MEGDcor9cDiycGJ5FiOz7ggvOYK4v4=
From:   Sasha Levin <sashal@kernel.org>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: hid: Add a module description line to the hid_hyperv driver
Date:   Thu, 30 May 2019 13:37:20 -0400
Message-Id: <20190530173720.17994-1-sashal@kernel.org>
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
 drivers/hid/hid-hyperv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-hyperv.c b/drivers/hid/hid-hyperv.c
index 704049e62d58a..d3311d714d359 100644
--- a/drivers/hid/hid-hyperv.c
+++ b/drivers/hid/hid-hyperv.c
@@ -614,5 +614,7 @@ static void __exit mousevsc_exit(void)
 }
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Microsoft Hyper-V Synthetic HID Driver");
+
 module_init(mousevsc_init);
 module_exit(mousevsc_exit);
-- 
2.20.1

