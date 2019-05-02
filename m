Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5941243E
	for <lists+linux-input@lfdr.de>; Thu,  2 May 2019 23:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbfEBVnk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 May 2019 17:43:40 -0400
Received: from mx3.wp.pl ([212.77.101.10]:17873 "EHLO mx3.wp.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726053AbfEBVnk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 2 May 2019 17:43:40 -0400
Received: (wp-smtpd smtp.wp.pl 39377 invoked from network); 2 May 2019 23:36:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1556833016; bh=FUkkXb89M9Ju/1kq/ADsVeKz9TuN3gFh0/5qWIJyqMI=;
          h=From:To:Cc:Subject;
          b=RlBJrdS6MuaSJuLbf4MIN2cIzqbD3OoXOTFURjat2VMT37CSlBBypklfBAelYjAej
           WZrM5DIXYzYNiUH/lPxvz5WA967a4xnCJoGcYqoDoALXBT8hiwRGsCiRNTcywS3pB0
           qJoQ//XkzU5b0CN7GCtVhHx5ONYrWCPKeQPxgly8=
Received: from pc-201-108-240-185-static.strong-pc.com (HELO localhost.localdomain) (spaz16@wp.pl@[185.240.108.201])
          (envelope-sender <spaz16@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <igorkuo@gmail.com>; 2 May 2019 23:36:56 +0200
From:   =?UTF-8?q?B=C5=82a=C5=BCej=20Szczygie=C5=82?= <spaz16@wp.pl>
Cc:     igorkuo@gmail.com,
        =?UTF-8?q?B=C5=82a=C5=BCej=20Szczygie=C5=82?= <spaz16@wp.pl>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: fix A4Tech horizontal scrolling
Date:   Thu,  2 May 2019 23:36:39 +0200
Message-Id: <20190502213639.7632-1-spaz16@wp.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 75b21af65cda25fe36520aade8dfb94b
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [YfMH]                               
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Since recent high resolution scrolling changes the A4Tech driver must
check for the "REL_WHEEL_HI_RES" usage code.

Fixes: 2dc702c991e3774af9d7ce410eef410ca9e2357e (HID: input: use the
Resolution Multiplier for high-resolution scrolling)

Signed-off-by: Błażej Szczygieł <spaz16@wp.pl>
---
 drivers/hid/hid-a4tech.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-a4tech.c b/drivers/hid/hid-a4tech.c
index 9428ea7cdf8a..fafb9fa558e7 100644
--- a/drivers/hid/hid-a4tech.c
+++ b/drivers/hid/hid-a4tech.c
@@ -38,7 +38,7 @@ static int a4_input_mapped(struct hid_device *hdev, struct hid_input *hi,
 {
 	struct a4tech_sc *a4 = hid_get_drvdata(hdev);
 
-	if (usage->type == EV_REL && usage->code == REL_WHEEL)
+	if (usage->type == EV_REL && usage->code == REL_WHEEL_HI_RES)
 		set_bit(REL_HWHEEL, *bit);
 
 	if ((a4->quirks & A4_2WHEEL_MOUSE_HACK_7) && usage->hid == 0x00090007)
@@ -60,7 +60,7 @@ static int a4_event(struct hid_device *hdev, struct hid_field *field,
 	input = field->hidinput->input;
 
 	if (a4->quirks & A4_2WHEEL_MOUSE_HACK_B8) {
-		if (usage->type == EV_REL && usage->code == REL_WHEEL) {
+		if (usage->type == EV_REL && usage->code == REL_WHEEL_HI_RES) {
 			a4->delayed_value = value;
 			return 1;
 		}
@@ -77,7 +77,7 @@ static int a4_event(struct hid_device *hdev, struct hid_field *field,
 		return 1;
 	}
 
-	if (usage->code == REL_WHEEL && a4->hw_wheel) {
+	if (usage->code == REL_WHEEL_HI_RES && a4->hw_wheel) {
 		input_event(input, usage->type, REL_HWHEEL, value);
 		return 1;
 	}
-- 
2.21.0

