Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 405621FBEBC
	for <lists+linux-input@lfdr.de>; Tue, 16 Jun 2020 21:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729988AbgFPTGu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jun 2020 15:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730034AbgFPTGt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jun 2020 15:06:49 -0400
Received: from mail.halogenos.org (halogenos.org [IPv6:2a02:c207:2037:5246::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DC71C0613ED
        for <linux-input@vger.kernel.org>; Tue, 16 Jun 2020 12:06:49 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 789641500CE1;
        Tue, 16 Jun 2020 21:01:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=superboring.dev;
        s=dkim; t=1592334073;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=odCaLXpvlUszfTFuzcpO8n7Br8wmp9OsetmSmIjTFig=;
        b=Jwy1mVcgK1mKMslt0bFLLR0xZkM/s7Nlorfg740+JgPWkxJFEFAMA35ldSrc45QoSF15VS
        gB702CuQy+s9YseWMsK0yxptBxU7E+GQc48eKUFd389wHXuhd9ZzdbSwZEIyGwGUudGhgE
        ZYyZqSxk0Z+C1dZcrZofukQPW7uYjG3veGxTNbyqrAIrClP7ksHrb3BUvMTxu4GhGD1gdu
        ItTPxN8azzXmjy5ZrYcBnaLXgx4DKV3YyTwY8PEWoA7J8a9vdnnkkFHilIrhhiQcFc3kWG
        q3aYCmx3PaoJP76Wh3yRX01Q/XvMM9xzZXihQa/F15LXKcflY+YP7pR/BChf6A==
From:   Simao Gomes Viana <devel@superboring.dev>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Simao Gomes Viana <devel@superboring.dev>,
        linux-input@vger.kernel.org
Subject: [PATCH 3/4] drivers: hid: change unsigned to unsigned int
Date:   Tue, 16 Jun 2020 21:00:43 +0200
Message-Id: <20200616190044.126928-3-devel@superboring.dev>
In-Reply-To: <20200616190044.126928-1-devel@superboring.dev>
References: <20200616190044.126928-1-devel@superboring.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

as per scripts/checkpatch.pl
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

