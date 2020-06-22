Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F417203C98
	for <lists+linux-input@lfdr.de>; Mon, 22 Jun 2020 18:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729769AbgFVQbr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Jun 2020 12:31:47 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:44778 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729438AbgFVQbr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Jun 2020 12:31:47 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jnPMG-0007Yj-Pc; Mon, 22 Jun 2020 16:31:44 +0000
From:   Colin King <colin.king@canonical.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rajat Jain <rajatja@google.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-input@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] input: i8042: remove redundant assignment to variable retval
Date:   Mon, 22 Jun 2020 17:31:44 +0100
Message-Id: <20200622163144.107815-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable retval is being initialized with a value that is
never read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/input/serio/i8042.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index 0dddf273afd9..cbaae80065e1 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -796,7 +796,7 @@ static int __init i8042_toggle_aux(bool on)
 
 static int __init i8042_check_aux(void)
 {
-	int retval = -1;
+	int retval;
 	bool irq_registered = false;
 	bool aux_loop_broken = false;
 	unsigned long flags;
-- 
2.27.0

