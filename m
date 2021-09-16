Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC0A40E9EC
	for <lists+linux-input@lfdr.de>; Thu, 16 Sep 2021 20:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344320AbhIPSdo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 14:33:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243747AbhIPSdR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 14:33:17 -0400
X-Greylist: delayed 1032 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 16 Sep 2021 09:50:44 PDT
Received: from cambridge.shadura.me (cambridge.shadura.me [IPv6:2a00:1098:0:86:1000:13:0:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38984C0ABB59;
        Thu, 16 Sep 2021 09:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=shadura.me;
         s=a; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:
        From:Content-Type:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
        References; bh=LUgAXnOs3wg6YYGfup/G6E2ZLznwcFknP60Ddf9yAUY=; b=ihI0XvmXcPXM3S
        rsVZQP/tZsLpjhJn62SbKgPcD1ynN3mMTnS8BGyz7QBfKtcG9QSyRmbCPyd6wnYnuiPvoj/rjYfFO
        e5MGGqEhPMaAXiArMuzpwIAKpu0NzlpSoj9OzlcxSW36z2yxPVGikUQ4ZLpOOhFK/VepRf1I2N+kF
        EwM=;
Received: from 85-237-234-36.dynamic.orange.sk ([85.237.234.36] helo=localhost)
        by cambridge.shadura.me with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <andrew@shadura.me>)
        id 1mQuKG-0002qR-B5; Thu, 16 Sep 2021 18:33:28 +0200
From:   Andrej Shadura <andrew.shadura@collabora.co.uk>
To:     =?UTF-8?q?Ji=C5=99=C3=AD=20Kosina?= <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel@collabora.com,
        Benjamin Tissoires <benjamin.tissoires@gmail.com>
Subject: [PATCH] HID: u2fzero: ignore incomplete packets without data
Date:   Thu, 16 Sep 2021 17:33:11 +0100
Message-Id: <20210916163311.11968-1-andrew.shadura@collabora.co.uk>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Since the actual_length calculation is performed unsigned, packets
shorter than 7 bytes (e.g. packets without data or otherwise truncated)
or non-received packets ("zero" bytes) can cause buffer overflow.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=214437
Fixes: 42337b9d4d958("HID: add driver for U2F Zero built-in LED and RNG")
Signed-off-by: Andrej Shadura <andrew.shadura@collabora.co.uk>
---
 drivers/hid/hid-u2fzero.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-u2fzero.c b/drivers/hid/hid-u2fzero.c
index 95e0807878c7..d70cd3d7f583 100644
--- a/drivers/hid/hid-u2fzero.c
+++ b/drivers/hid/hid-u2fzero.c
@@ -198,7 +198,9 @@ static int u2fzero_rng_read(struct hwrng *rng, void *data,
 	}
 
 	ret = u2fzero_recv(dev, &req, &resp);
-	if (ret < 0)
+
+	/* ignore errors or packets without data */
+	if (ret < offsetof(struct u2f_hid_msg, init.data))
 		return 0;
 
 	/* only take the minimum amount of data it is safe to take */
-- 
2.31.1

