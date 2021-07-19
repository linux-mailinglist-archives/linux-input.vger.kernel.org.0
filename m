Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 787EA3CF01A
	for <lists+linux-input@lfdr.de>; Tue, 20 Jul 2021 01:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344988AbhGSW6D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Jul 2021 18:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346541AbhGSUPS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Jul 2021 16:15:18 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0803C0613DE
        for <linux-input@vger.kernel.org>; Mon, 19 Jul 2021 13:54:23 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id y4so17641331pfi.9
        for <linux-input@vger.kernel.org>; Mon, 19 Jul 2021 13:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hj7k29MxTKJQR8WxrFkV2bIJPSosFcmcW1WgKY1tqjI=;
        b=SeMUAORWeR37L9hAKVh04ZZtqfngg0+FwYygl+wElRodajScCu48l87eeIOilPPUzg
         qe/N24+GDpKj0r9DUofAmTPRGyTmV3vI0b1yDg/aquLuDy6WljRK8pNjuU3i+EmvQGbo
         dwT/hAOBbLXXhza/wPn8z5VERDKhXv4shMTsM7J2lE/5LAKffKeFJCz81pU+TSiqWAyo
         ojibVU3YX9haf9L9ENRhYb6Bq6jL5/fGbg/jm+fTm/SI3UGVPls+TLcUnfbaRfeUiEh+
         +FvlJKrBH/zlWD/B7Gl2wjL5GCJ8/DmzduPTefzHfMD3Jdy6ZODQgqYgIw4nG/KtvlXO
         jEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hj7k29MxTKJQR8WxrFkV2bIJPSosFcmcW1WgKY1tqjI=;
        b=Cr9xmjuU7VhtXhBAtLUFgy3Yhyd1QQN2tlHdNWL2bzF17nyWNDJfCMFyEoAbw0pjqD
         GI+8S91Tro3PLP0YESW6NttAOYXucgDxoLxUXbLSgoBU0RZiZw8rcKR4SpNJVBY8sOa3
         jZXJoHVgE1rnOqr7PgZDAo1cYriuCmMr8L4RSpSbOWZVaMJfUVqRv25Em4nxMgmQns+A
         2q7SPrepQsjn9po9MhDpSMBrO9njMQLqWDS2WCcOmgHYcz08zZUJwCxT0LUK0+GQq6O4
         4CFC0gKJXh7alXCzQeqkNAldtIVdq6MIoNDVKVXdxdbP+XBeXxkWW7ZZuRQ7cH+9/sOD
         UmiA==
X-Gm-Message-State: AOAM532eyn2tMK2gH8w6SSMmi5P4tGZpSt6YM538DVj3vzECTYbTdhEy
        9TCFLMkfVzKe7D8DZFe9FFwLqvllcJo0gA==
X-Google-Smtp-Source: ABdhPJzI5K7MJEeOptvvTRX5nNSsmmgRMKf39vJOy8NgrSgFMc9N2jE32sDX9309FlcnfTDKDxz3Jw==
X-Received: by 2002:aa7:93ac:0:b029:32e:4fce:bde1 with SMTP id x12-20020aa793ac0000b029032e4fcebde1mr28158579pff.54.1626728148628;
        Mon, 19 Jul 2021 13:55:48 -0700 (PDT)
Received: from horus.lan (71-34-86-28.ptld.qwest.net. [71.34.86.28])
        by smtp.gmail.com with ESMTPSA id y82sm21451233pfb.121.2021.07.19.13.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 13:55:48 -0700 (PDT)
From:   Jason Gerecke <killertofu@gmail.com>
X-Google-Original-From: Jason Gerecke <jason.gerecke@wacom.com>
To:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Ping Cheng <pinglinux@gmail.com>,
        Jason Gerecke <jason.gerecke@wacom.com>
Subject: [PATCH 6/6] HID: wacom: Refactor touch input mute checks into a common function
Date:   Mon, 19 Jul 2021 13:55:33 -0700
Message-Id: <20210719205533.2189804-6-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210719205533.2189804-1-jason.gerecke@wacom.com>
References: <20210719205533.2189804-1-jason.gerecke@wacom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We perform this same set of tests to see if touch input is muted in
several places. We might as well replace these independent copies with
an inline function.

Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/hid/wacom_wac.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 3f992c9dca4d..fd51769d0994 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -824,6 +824,13 @@ static int wacom_intuos_inout(struct wacom_wac *wacom)
 	return 0;
 }
 
+static inline bool touch_is_muted(struct wacom_wac *wacom_wac)
+{
+	return wacom_wac->probe_complete &&
+	       wacom_wac->shared->has_mute_touch_switch &&
+	       !wacom_wac->shared->is_touch_on;
+}
+
 static inline bool report_touch_events(struct wacom_wac *wacom)
 {
 	return (touch_arbitration ? !wacom->shared->stylus_in_proximity : 1);
@@ -1525,11 +1532,8 @@ static int wacom_24hdt_irq(struct wacom_wac *wacom)
 	int byte_per_packet = WACOM_BYTES_PER_24HDT_PACKET;
 	int y_offset = 2;
 
-	if (wacom->shared->has_mute_touch_switch &&
-	    !wacom->shared->is_touch_on) {
-		if (!wacom->shared->touch_down)
-			return 0;
-	}
+	if (touch_is_muted(wacom) && !wacom->shared->touch_down)
+		return 0;
 
 	if (wacom->features.type == WACOM_27QHDT) {
 		current_num_contacts = data[63];
@@ -2536,8 +2540,7 @@ static void wacom_wac_finger_slot(struct wacom_wac *wacom_wac,
 	bool prox = hid_data->tipswitch &&
 		    report_touch_events(wacom_wac);
 
-	if (wacom_wac->shared->has_mute_touch_switch &&
-	    !wacom_wac->shared->is_touch_on) {
+	if (touch_is_muted(wacom_wac)) {
 		if (!wacom_wac->shared->touch_down)
 			return;
 		prox = false;
@@ -2593,10 +2596,7 @@ static void wacom_wac_finger_event(struct hid_device *hdev,
 	unsigned equivalent_usage = wacom_equivalent_usage(usage->hid);
 	struct wacom_features *features = &wacom->wacom_wac.features;
 
-	/* don't process touch events when touch is off */
-	if (wacom_wac->probe_complete &&
-	    !wacom_wac->shared->is_touch_on &&
-	    !wacom_wac->shared->touch_down)
+	if (touch_is_muted(wacom_wac) && !wacom_wac->shared->touch_down)
 		return;
 
 	if (wacom_wac->is_invalid_bt_frame)
@@ -2648,10 +2648,7 @@ static void wacom_wac_finger_pre_report(struct hid_device *hdev,
 	struct hid_data* hid_data = &wacom_wac->hid_data;
 	int i;
 
-	/* don't process touch events when touch is off */
-	if (wacom_wac->probe_complete &&
-	    !wacom_wac->shared->is_touch_on &&
-	    !wacom_wac->shared->touch_down)
+	if (touch_is_muted(wacom_wac) && !wacom_wac->shared->touch_down)
 		return;
 
 	wacom_wac->is_invalid_bt_frame = false;
-- 
2.32.0

