Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0B551346B
	for <lists+linux-input@lfdr.de>; Fri,  3 May 2019 22:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbfECUa1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 May 2019 16:30:27 -0400
Received: from mx3.wp.pl ([212.77.101.9]:5928 "EHLO mx3.wp.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726932AbfECUa0 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 3 May 2019 16:30:26 -0400
Received: (wp-smtpd smtp.wp.pl 29685 invoked from network); 3 May 2019 22:30:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1556915423; bh=NIQ+j+7oa4YIxrpJk39a3s2NoeAcMQONM4fdfhdM/t4=;
          h=From:To:Cc:Subject;
          b=W/esS6+4CyaPvWJZlF7kXW0TS7TQC4JYTvMs0sq04B7AuCSKa/w7KfxWV60UV+vQO
           5e9N6g3CWbyy7HRoAebg4jsmpect4ETHn9KI/0eQsq5UJ4alS+r1ZQurOWH6i05jEu
           5TNAnotN+aihDc7BdDmHi9uM0QfdJbI6Pa/7m/Wk=
Received: from pc-201-108-240-185-static.strong-pc.com (HELO localhost.localdomain) (spaz16@wp.pl@[185.240.108.201])
          (envelope-sender <spaz16@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <igorkuo@gmail.com>; 3 May 2019 22:30:23 +0200
From:   =?UTF-8?q?B=C5=82a=C5=BCej=20Szczygie=C5=82?= <spaz16@wp.pl>
Cc:     igorkuo@gmail.com, peter.hutterer@who-t.net,
        =?UTF-8?q?B=C5=82a=C5=BCej=20Szczygie=C5=82?= <spaz16@wp.pl>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] HID: fix A4Tech horizontal scrolling
Date:   Fri,  3 May 2019 22:28:36 +0200
Message-Id: <20190503202836.12127-1-spaz16@wp.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <AO-hwJKNH7WoJV-X+egK5cJNNtxamh0L0e1er5dkiTt6KvrmSQ@mail.gmail.com>
References: <AO-hwJKNH7WoJV-X+egK5cJNNtxamh0L0e1er5dkiTt6KvrmSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: fa2c728b9c3f7b3eb3c544a4fc1507b9
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000B [cfMU]                               
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

