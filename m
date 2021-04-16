Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0B56362099
	for <lists+linux-input@lfdr.de>; Fri, 16 Apr 2021 15:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235631AbhDPNN7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Apr 2021 09:13:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58209 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235252AbhDPNN7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Apr 2021 09:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618578814;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k/EGcJH1KjzRFMCyD+pA4YdYmrTeRipoXkRuJQYvFZM=;
        b=Bs5kM+QArt3y3OEfZUxbZw8tup8cNT6D9vwswziFK1Hht0Fv6s2ManV1ZVzhrsOFBjiUJH
        sSngK5uhgosghkQZdhGhsJjlfE+Rm8MkP5xlfOxraKDCrsja9PJsV0IXeRT3PFwWoeBxot
        rpXkZH4sxJ/ENkfytjXhyWbb+gNw9fQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-buoBHjTtPBGHZzVnjfF3gw-1; Fri, 16 Apr 2021 09:13:32 -0400
X-MC-Unique: buoBHjTtPBGHZzVnjfF3gw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E23C102CB77;
        Fri, 16 Apr 2021 13:13:30 +0000 (UTC)
Received: from x1.localdomain (ovpn-113-102.ams2.redhat.com [10.36.113.102])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8D0865C3F8;
        Fri, 16 Apr 2021 13:13:29 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Peter Hoeg <peter@hoeg.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 1/6] HID: lg-g15: Remove unused size argument from lg_*_event() functions
Date:   Fri, 16 Apr 2021 15:13:18 +0200
Message-Id: <20210416131323.233184-2-hdegoede@redhat.com>
In-Reply-To: <20210416131323.233184-1-hdegoede@redhat.com>
References: <20210416131323.233184-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The report-size is already checked in lg_g15_raw_event() before calling
the lg_*_event() functions and these functions don't use the passed
in size at all, drop the unused parameter.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lg-g15.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
index bfbba0d41933..b887af72957c 100644
--- a/drivers/hid/hid-lg-g15.c
+++ b/drivers/hid/hid-lg-g15.c
@@ -464,7 +464,7 @@ static int lg_g15_get_initial_led_brightness(struct lg_g15_data *g15)
 /******** Input functions ********/
 
 /* On the G15 Mark I Logitech has been quite creative with which bit is what */
-static int lg_g15_event(struct lg_g15_data *g15, u8 *data, int size)
+static int lg_g15_event(struct lg_g15_data *g15, u8 *data)
 {
 	int i, val;
 
@@ -510,7 +510,7 @@ static int lg_g15_event(struct lg_g15_data *g15, u8 *data, int size)
 	return 0;
 }
 
-static int lg_g15_v2_event(struct lg_g15_data *g15, u8 *data, int size)
+static int lg_g15_v2_event(struct lg_g15_data *g15, u8 *data)
 {
 	int i, val;
 
@@ -542,7 +542,7 @@ static int lg_g15_v2_event(struct lg_g15_data *g15, u8 *data, int size)
 	return 0;
 }
 
-static int lg_g510_event(struct lg_g15_data *g15, u8 *data, int size)
+static int lg_g510_event(struct lg_g15_data *g15, u8 *data)
 {
 	bool game_mode_enabled;
 	int i, val;
@@ -586,7 +586,7 @@ static int lg_g510_event(struct lg_g15_data *g15, u8 *data, int size)
 	return 0;
 }
 
-static int lg_g510_leds_event(struct lg_g15_data *g15, u8 *data, int size)
+static int lg_g510_leds_event(struct lg_g15_data *g15, u8 *data)
 {
 	bool backlight_disabled;
 
@@ -613,18 +613,18 @@ static int lg_g15_raw_event(struct hid_device *hdev, struct hid_report *report,
 	switch (g15->model) {
 	case LG_G15:
 		if (data[0] == 0x02 && size == 9)
-			return lg_g15_event(g15, data, size);
+			return lg_g15_event(g15, data);
 		break;
 	case LG_G15_V2:
 		if (data[0] == 0x02 && size == 5)
-			return lg_g15_v2_event(g15, data, size);
+			return lg_g15_v2_event(g15, data);
 		break;
 	case LG_G510:
 	case LG_G510_USB_AUDIO:
 		if (data[0] == 0x03 && size == 5)
-			return lg_g510_event(g15, data, size);
+			return lg_g510_event(g15, data);
 		if (data[0] == 0x04 && size == 2)
-			return lg_g510_leds_event(g15, data, size);
+			return lg_g510_leds_event(g15, data);
 		break;
 	}
 
-- 
2.31.1

