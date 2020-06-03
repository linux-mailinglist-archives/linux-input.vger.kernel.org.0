Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 631E21ED163
	for <lists+linux-input@lfdr.de>; Wed,  3 Jun 2020 15:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbgFCNvE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Jun 2020 09:51:04 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:51798 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbgFCNvE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 3 Jun 2020 09:51:04 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jgTnK-0003NW-JC; Wed, 03 Jun 2020 13:51:02 +0000
From:   Colin King <colin.king@canonical.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] input: ims-pcu: remove redundant assignment to variable 'error'
Date:   Wed,  3 Jun 2020 14:51:02 +0100
Message-Id: <20200603135102.130436-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable error is being initialized with a value that is
never read and the -ENOMEM error return is being returned anyhow
by the error exit path to label err_free_mem.  The assignment is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/input/misc/ims-pcu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/misc/ims-pcu.c b/drivers/input/misc/ims-pcu.c
index d8dbfc030d0f..4ba68aa3d281 100644
--- a/drivers/input/misc/ims-pcu.c
+++ b/drivers/input/misc/ims-pcu.c
@@ -292,7 +292,6 @@ static int ims_pcu_setup_gamepad(struct ims_pcu *pcu)
 	if (!gamepad || !input) {
 		dev_err(pcu->dev,
 			"Not enough memory for gamepad device\n");
-		error = -ENOMEM;
 		goto err_free_mem;
 	}
 
-- 
2.25.1

