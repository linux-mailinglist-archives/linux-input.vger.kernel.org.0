Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A03B1FBF62
	for <lists+linux-input@lfdr.de>; Tue, 16 Jun 2020 21:49:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730466AbgFPTsL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jun 2020 15:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730393AbgFPTsL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jun 2020 15:48:11 -0400
Received: from mail.halogenos.org (halogenos.org [IPv6:2a02:c207:2037:5246::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0FF3C061573
        for <linux-input@vger.kernel.org>; Tue, 16 Jun 2020 12:48:10 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D58A15002EC;
        Tue, 16 Jun 2020 21:48:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=superboring.dev;
        s=dkim; t=1592336887;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=x0kWbrGT5BaUDxNgj7dfJpgvQVw4kCHSdV7zxQd3NHo=;
        b=0vSFVeWXWHvRqvlnaWxMFQLYi70ptL2Z9UEy1KYJcYJKZCSx4eZTez6V9WvZS1zYC+bZne
        BB5ze+vZv73fc0lcEIts65rgscAjh9Ey4eizRlAS7B1IVp7xBuBLGBzV/YeizuoNK17hIw
        RwA+Qqm40GHF+ZtYbdJnERomz4evYtJ8HqKZK1k9Hi6eLUzJuadcwATl9/XeHEx6z4DfF7
        nvKv99U9RUqlSqagT4pPZTVtRffi9v84bQZgMUgsRi/2EDxgtDAQ4INoXwkrsb9AACV7H8
        53Ufcf6nELfnVkkM9bucdygA1DcoNV8/cN/P3GU/cw7M7oZ1NPx4QZ6O8QtlcQ==
From:   Simao Gomes Viana <devel@superboring.dev>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Simao Gomes Viana <devel@superboring.dev>,
        linux-input@vger.kernel.org
Subject: [PATCH v2] drivers: hid: change unsigned to unsigned int
Date:   Tue, 16 Jun 2020 21:47:27 +0200
Message-Id: <20200616194727.152490-1-devel@superboring.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

as per scripts/checkpatch.pl

Signed-off-by: Simao Gomes Viana <devel@superboring.dev>
---
 drivers/hid/hid-input.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index e70066e4c545..ef077da7485d 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -322,9 +322,9 @@ static const struct hid_device_id hid_battery_quirks[] = {
 	{}
 };
 
-static unsigned find_battery_quirk(struct hid_device *hdev)
+static unsigned int find_battery_quirk(struct hid_device *hdev)
 {
-	unsigned quirks = 0;
+	unsigned int quirks = 0;
 	const struct hid_device_id *match;
 
 	match = hid_match_id(hdev, hid_battery_quirks);
@@ -428,11 +428,11 @@ static int hidinput_get_battery_property(struct power_supply *psy,
 	return ret;
 }
 
-static int hidinput_setup_battery(struct hid_device *dev, unsigned report_type, struct hid_field *field)
+static int hidinput_setup_battery(struct hid_device *dev, unsigned int report_type, struct hid_field *field)
 {
 	struct power_supply_desc *psy_desc;
 	struct power_supply_config psy_cfg = { .drv_data = dev, };
-	unsigned quirks;
+	unsigned int quirks;
 	s32 min, max;
 	int error;
 
@@ -541,7 +541,7 @@ static void hidinput_update_battery(struct hid_device *dev, int value)
 	}
 }
 #else  /* !CONFIG_HID_BATTERY_STRENGTH */
-static int hidinput_setup_battery(struct hid_device *dev, unsigned report_type,
+static int hidinput_setup_battery(struct hid_device *dev, unsigned int report_type,
 				  struct hid_field *field)
 {
 	return 0;
@@ -1300,7 +1300,7 @@ static void hidinput_handle_scroll(struct hid_usage *usage,
 void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct hid_usage *usage, __s32 value)
 {
 	struct input_dev *input;
-	unsigned *quirks = &hid->quirks;
+	unsigned int *quirks = &hid->quirks;
 
 	if (!usage->type)
 		return;
-- 
2.27.0

I added the missing Signed-off-by, sorry about that.

