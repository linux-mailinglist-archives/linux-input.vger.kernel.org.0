Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DDEF1AE20
	for <lists+linux-input@lfdr.de>; Sun, 12 May 2019 22:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbfELUdf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 May 2019 16:33:35 -0400
Received: from mx4.wp.pl ([212.77.101.11]:32238 "EHLO mx4.wp.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726664AbfELUdf (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 May 2019 16:33:35 -0400
Received: (wp-smtpd smtp.wp.pl 31684 invoked from network); 12 May 2019 22:33:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1557693213; bh=xftwkTDo9SZxI2rru91s0TaDpgswdOqrM0zB8nAN/T4=;
          h=From:To:Cc:Subject;
          b=m3F9XCpEoccrlOWHgrE9z3WPkKgP80gonvIC+NOIqT7JxF82vsuvDI4CcLvsUrcmw
           Rj8b5Ixbe0Uql701ZknYgvtv8Y3UaedN/yUVZa0TF5pCDNGn2z73qwXSb3oxAqtoCc
           UBAtP4TNcesBZ398QWFaudRmFS+OxyDGTWj+UE5U=
Received: from pc-201-108-240-185-static.strong-pc.com (HELO localhost.localdomain) (spaz16@wp.pl@[185.240.108.201])
          (envelope-sender <spaz16@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <igorkuo@gmail.com>; 12 May 2019 22:33:33 +0200
From:   =?UTF-8?q?B=C5=82a=C5=BCej=20Szczygie=C5=82?= <spaz16@wp.pl>
Cc:     igorkuo@gmail.com, peter.hutterer@who-t.net,
        =?UTF-8?q?B=C5=82a=C5=BCej=20Szczygie=C5=82?= <spaz16@wp.pl>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] HID: fix A4Tech horizontal scrolling
Date:   Sun, 12 May 2019 22:33:13 +0200
Message-Id: <20190512203313.18756-1-spaz16@wp.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190507050029.GA5197@jelly>
References: <20190507050029.GA5197@jelly>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 5384286f20c59aca34f956a0e2b44469
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000B [QUPk]                               
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Since recent high resolution scrolling changes the A4Tech driver must
check for the "REL_WHEEL_HI_RES" usage code.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=203369
Fixes: 2dc702c991e3774af9d7ce410eef410ca9e2357e ("HID: input: use the
Resolution Multiplier for high-resolution scrolling")

Signed-off-by: Błażej Szczygieł <spaz16@wp.pl>
---
Changes in v2:
- changed commit message

Changes in v3:
- send also high resolution events

 drivers/hid/hid-a4tech.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-a4tech.c b/drivers/hid/hid-a4tech.c
index 9428ea7cdf8a..c3a6ce3613fe 100644
--- a/drivers/hid/hid-a4tech.c
+++ b/drivers/hid/hid-a4tech.c
@@ -38,8 +38,10 @@ static int a4_input_mapped(struct hid_device *hdev, struct hid_input *hi,
 {
 	struct a4tech_sc *a4 = hid_get_drvdata(hdev);
 
-	if (usage->type == EV_REL && usage->code == REL_WHEEL)
+	if (usage->type == EV_REL && usage->code == REL_WHEEL_HI_RES) {
 		set_bit(REL_HWHEEL, *bit);
+		set_bit(REL_HWHEEL_HI_RES, *bit);
+	}
 
 	if ((a4->quirks & A4_2WHEEL_MOUSE_HACK_7) && usage->hid == 0x00090007)
 		return -1;
@@ -60,7 +62,7 @@ static int a4_event(struct hid_device *hdev, struct hid_field *field,
 	input = field->hidinput->input;
 
 	if (a4->quirks & A4_2WHEEL_MOUSE_HACK_B8) {
-		if (usage->type == EV_REL && usage->code == REL_WHEEL) {
+		if (usage->type == EV_REL && usage->code == REL_WHEEL_HI_RES) {
 			a4->delayed_value = value;
 			return 1;
 		}
@@ -68,6 +70,8 @@ static int a4_event(struct hid_device *hdev, struct hid_field *field,
 		if (usage->hid == 0x000100b8) {
 			input_event(input, EV_REL, value ? REL_HWHEEL :
 					REL_WHEEL, a4->delayed_value);
+			input_event(input, EV_REL, value ? REL_HWHEEL_HI_RES :
+					REL_WHEEL_HI_RES, a4->delayed_value * 120);
 			return 1;
 		}
 	}
@@ -77,8 +81,9 @@ static int a4_event(struct hid_device *hdev, struct hid_field *field,
 		return 1;
 	}
 
-	if (usage->code == REL_WHEEL && a4->hw_wheel) {
+	if (usage->code == REL_WHEEL_HI_RES && a4->hw_wheel) {
 		input_event(input, usage->type, REL_HWHEEL, value);
+		input_event(input, usage->type, REL_HWHEEL_HI_RES, value * 120);
 		return 1;
 	}
 
-- 
2.21.0

