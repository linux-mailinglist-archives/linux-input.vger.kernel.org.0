Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9D531ED33A
	for <lists+linux-input@lfdr.de>; Wed,  3 Jun 2020 17:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgFCPVy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Jun 2020 11:21:54 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56096 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbgFCPVx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 3 Jun 2020 11:21:53 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jgVDD-0003Xh-UE; Wed, 03 Jun 2020 15:21:52 +0000
From:   Colin King <colin.king@canonical.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][V2] input: ims-pcu: return error code rather than -ENOMEM
Date:   Wed,  3 Jun 2020 16:21:51 +0100
Message-Id: <20200603152151.139337-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the assignment of -ENOMEM to error is redudant because error
is not being read and -ENOMEM is being hard coded as an error return.
Fix this by returning the error code in variable 'error'; this also
allows the error code from a failed call to input_register_device to
be preserved and returned to the caller rather than just returning
a possibly inappropriate -ENOMEM.

Kudos to Dan Carpenter for the suggestion of an improved fix.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>

---

V2: change subject line and return the error code rather than
    removing the ENOMEM assignment to error. Thanks to Dan Carpenter
    for explaining a better fix.

---
 drivers/input/misc/ims-pcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/ims-pcu.c b/drivers/input/misc/ims-pcu.c
index d8dbfc030d0f..08b9b5cdb943 100644
--- a/drivers/input/misc/ims-pcu.c
+++ b/drivers/input/misc/ims-pcu.c
@@ -335,7 +335,7 @@ static int ims_pcu_setup_gamepad(struct ims_pcu *pcu)
 err_free_mem:
 	input_free_device(input);
 	kfree(gamepad);
-	return -ENOMEM;
+	return error;
 }
 
 static void ims_pcu_destroy_gamepad(struct ims_pcu *pcu)
-- 
2.25.1

