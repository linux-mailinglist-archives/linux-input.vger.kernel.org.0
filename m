Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB051F0483
	for <lists+linux-input@lfdr.de>; Sat,  6 Jun 2020 06:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbgFFEAl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 6 Jun 2020 00:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbgFFEAk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 6 Jun 2020 00:00:40 -0400
X-Greylist: delayed 401 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 05 Jun 2020 21:00:40 PDT
Received: from gnutoo.cyberdimension.org (cyberdimension.org [IPv6:2001:910:1314:ffff::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F176C08C5C2
        for <linux-input@vger.kernel.org>; Fri,  5 Jun 2020 21:00:39 -0700 (PDT)
Received: from gnutoo.cyberdimension.org (localhost [127.0.0.1])
        by cyberdimension.org (OpenSMTPD) with ESMTP id 5a29ae10;
        Sat, 6 Jun 2020 03:50:12 +0000 (UTC)
Received: from primarylaptop.localdomain (localhost.localdomain [::1])
        by gnutoo.cyberdimension.org (OpenSMTPD) with ESMTP id a97d4652;
        Sat, 6 Jun 2020 03:50:12 +0000 (UTC)
From:   Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Henrik Rydberg <rydberg@bitmath.org>,
        Andi Shyti <andi@etezian.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-input@vger.kernel.org,
        Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>,
        Javi Ferrer <javi.f.o@gmail.com>
Subject: [PATCH] Input: mms114: don't report 0 pressure while still tracking contact(s)
Date:   Sat,  6 Jun 2020 05:50:17 +0200
Message-Id: <20200606035017.7271-1-GNUtoo@cyberdimension.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In the middle of a sliding gesture, we manage to have events
that look like that:
    Event: time 1571859641.595517, -------------- SYN_REPORT ------------
    Event: time 1571859641.606593, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 1193
    Event: time 1571859641.606593, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR), value 21
    Event: time 1571859641.606593, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), value 0
    Event: time 1571859641.606593, type 3 (EV_ABS), code 1 (ABS_Y), value 1193
    Event: time 1571859641.606593, type 3 (EV_ABS), code 24 (ABS_PRESSURE), value 0
    Event: time 1571859641.606593, -------------- SYN_REPORT ------------

In such cases, we still have a valid ABS_MT_TRACKING_ID along
with an ABS_MT_TOUCH_MAJOR that is > 0, which both indicates
that the sliding is still in progress.

However in Documentation/input/multi-touch-protocol.rst, we
have:
    ABS_MT_PRESSURE
        The pressure, in arbitrary units, on the contact
        area. May be used instead of TOUCH and WIDTH for
        pressure-based devices or any device with a spatial
        signal intensity distribution.

Because of that userspace may consider an ABS_MT_PRESSURE
of 0 as an indication that the sliding stopped. This has
side effects such as making it difficult to unlock the
screen under Android.

This fix was tested on the following devices:
- GT-I9300 with a glass screen protection
- GT-I9300 without any screen protection
- GT-N7105 with a glass screen protection

Reported-by: Javi Ferrer <javi.f.o@gmail.com>
Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
---
 drivers/input/touchscreen/mms114.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/mms114.c b/drivers/input/touchscreen/mms114.c
index 2ef1adaed9af..adc18cd9a437 100644
--- a/drivers/input/touchscreen/mms114.c
+++ b/drivers/input/touchscreen/mms114.c
@@ -183,7 +183,10 @@ static void mms114_process_mt(struct mms114_data *data, struct mms114_touch *tou
 	if (touch->pressed) {
 		touchscreen_report_pos(input_dev, &data->props, x, y, true);
 		input_report_abs(input_dev, ABS_MT_TOUCH_MAJOR, touch->width);
-		input_report_abs(input_dev, ABS_MT_PRESSURE, touch->strength);
+		if (touch->strength) {
+			input_report_abs(input_dev, ABS_MT_PRESSURE,
+					 touch->strength);
+		}
 	}
 }
 
-- 
2.26.2

