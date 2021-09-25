Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A8C14184F8
	for <lists+linux-input@lfdr.de>; Sun, 26 Sep 2021 00:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbhIYWaw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 25 Sep 2021 18:30:52 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:36114
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230024AbhIYWaw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 25 Sep 2021 18:30:52 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 8B6AE41300;
        Sat, 25 Sep 2021 22:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632608955;
        bh=FVGeqnEgyMleC6sn0Ws28qWQcVVfK0CJvV5kQ6UxFIo=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=YGD1e5CXoqJ16RoqSvLfkI9bxQrvTs9cbYGrQ/DLgo5+tnGFkBNVPCojma9BX7cE1
         N8JOyerFdtP0z+TqsxP4dShQGUWmdNCw2rfLulCj4ZgxwjDXI3FHJIrO3Ayq53PVu8
         rbOr38b54JMfEGVXh4tdmV+HHO3jDUIUiPmlrShADoobdatxszWmh6cjSjhHA6BMjN
         OoCqgqHLsfaqEChRJi8iz8iEaG1cFPLPfUiQG4mzRIvZ/1ADOPSjOZp4GWRIYRSdjy
         GkbN9MejD5YRmP17q79tq16D9WrhldiuM0XgiNlloTrjNllmhWtJNeU7h1ougKFlQm
         z0YXTDYeIPYww==
From:   Colin King <colin.king@canonical.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][V2] HID:Thrustmaster: Initialized pointers with NULL rather than 0
Date:   Sat, 25 Sep 2021 23:29:15 +0100
Message-Id: <20210925222915.182365-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointers twi and tm_wheel should be initialized with NULL rather than 0.
Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
V2: Fix tm_wheel too
---
 drivers/hid/hid-thrustmaster.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index d44550aa8805..5bc9b7756183 100644
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
@@ -272,7 +272,7 @@ static void thrustmaster_remove(struct hid_device *hdev)
 static int thrustmaster_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	int ret = 0;
-	struct tm_wheel *tm_wheel = 0;
+	struct tm_wheel *tm_wheel = NULL;
 
 	ret = hid_parse(hdev);
 	if (ret) {
-- 
2.32.0

