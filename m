Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D83C4184EF
	for <lists+linux-input@lfdr.de>; Sun, 26 Sep 2021 00:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbhIYWXx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 25 Sep 2021 18:23:53 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:34398
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230024AbhIYWXx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 25 Sep 2021 18:23:53 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id F2D914049E;
        Sat, 25 Sep 2021 22:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632608537;
        bh=KqfzOAU9rH+MFeq0GoYgMDIMmLolH9PE7uCZ+3pFhB4=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=WBJHDA2COZIgumOa5LcS9hV6S6aafp95dVa/yF2z3vYirsEwGccP3VgwsbRgbFQ+O
         6i/S8bAW0M65MmcIjNsSc/lxD3INNkWR8qYakDWSvJY9eeS7SMaGlW/QDKkUpZtfQH
         1FHvy7Bc55we5rBGlnhJXQcJ27le4DrKROejRJe+f4Po6k+pdyTtTL5AB3r6Nxj8b9
         cZkwgYKEpwK/IbfDn5M5TwhP4kckSHxJGIIutLonci/mddHGV+GDpdmu4RNXq8TvA9
         GdivW6VZhmyIZnCChMFVo/sTRBUFPNBW23k3mmm6svpQNDPIIG1BIlSzh4Xz4yrbro
         DweE0YHkSTLvw==
From:   Colin King <colin.king@canonical.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: thrustmaster: Initialized pointer twi with NULL rather than 0
Date:   Sat, 25 Sep 2021 23:22:16 +0100
Message-Id: <20210925222216.182099-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointers should be initialized with NULL rather than 0. Fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hid/hid-thrustmaster.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index d44550aa8805..aa874f075bf9 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -205,7 +205,7 @@ static void thrustmaster_model_handler(struct urb *urb)
 	struct tm_wheel *tm_wheel = hid_get_drvdata(hdev);
 	uint16_t model = 0;
 	int i, ret;
-	const struct tm_wheel_info *twi = 0;
+	const struct tm_wheel_info *twi = NULL;
 
 	if (urb->status) {
 		hid_err(hdev, "URB to get model id failed with error %d\n", urb->status);
-- 
2.32.0

