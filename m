Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F69A1ED191
	for <lists+linux-input@lfdr.de>; Wed,  3 Jun 2020 15:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbgFCN5p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Jun 2020 09:57:45 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:51950 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgFCN5p (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 3 Jun 2020 09:57:45 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jgTtm-000436-HO; Wed, 03 Jun 2020 13:57:42 +0000
From:   Colin King <colin.king@canonical.com>
To:     =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] input: alps: remove redundant assignment to variable ret
Date:   Wed,  3 Jun 2020 14:57:42 +0100
Message-Id: <20200603135742.130852-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is
never read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/input/mouse/alps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
index 34700eda0429..b067bfd2699c 100644
--- a/drivers/input/mouse/alps.c
+++ b/drivers/input/mouse/alps.c
@@ -1929,7 +1929,7 @@ static int alps_monitor_mode(struct psmouse *psmouse, bool enable)
 static int alps_absolute_mode_v6(struct psmouse *psmouse)
 {
 	u16 reg_val = 0x181;
-	int ret = -1;
+	int ret;
 
 	/* enter monitor mode, to write the register */
 	if (alps_monitor_mode(psmouse, true))
-- 
2.25.1

