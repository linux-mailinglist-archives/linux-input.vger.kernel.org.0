Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 092081D2DF4
	for <lists+linux-input@lfdr.de>; Thu, 14 May 2020 13:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbgENLOp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 May 2020 07:14:45 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:56941 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725925AbgENLOp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 May 2020 07:14:45 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 13B6DA1B;
        Thu, 14 May 2020 07:14:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Thu, 14 May 2020 07:14:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:mime-version:content-type; s=
        fm3; bh=s6s9rnpDYOlF02yVD/mAxonYkIbfAn0JipJDZvTCwo8=; b=iYvGPnlT
        ynYHxBqdRRYEwN+Sk+vlf38i8t349+fhbs9AgymQvYZRKgP3ndAuwSjnx4Tb9GT/
        0A9c67WcKTq31DmqThyhNMQ0ZJyfRP1X57JZWMuPxAZzOIejELyoJPAU8NkrKwZI
        r9MM+gnltzqxCxEQMV/eAvZA0YHIP1y0gZ4CnHUof1bh9Es9tsNIF4RFY/jFyB0m
        43bA9y9viONoq1R5p2VrczwYyzQVuHbPpkVI6ixaqdOdD07xINhcPQgSlgz/bBqt
        kBa5rECTFPxkMbSA0/ArGSg1QPgrPYSnZqVxYYsJDEW/3tI7u5QA4H7nF0ViuxlC
        Z2J46d2gU+D7wQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm2; bh=s6s9rnpDYOlF02yVD/mAxonYkIbfA
        n0JipJDZvTCwo8=; b=ZvGnJ04pWj/C8HUPMQVgrZ6ePdPXzyzGtotp6/C1KrY3K
        9CGjZ8Sb3RmhT3xnHKEvmbtagcfR09tIRi5j3YxpvD1VjpWX8z8NBwTHUVFVVEg9
        8o0L/Qf4yM+8a7UUAg3a0b7dt7dqd1lDN5HGj9VxCqkWLJPLujWHuxEa5yuLMXw2
        b5b9CzhFTj4RYGaRW64OIIRy5TFz1Z0VUKv8qn7xl5XtAOIdB0PP8GUp8WSACHBc
        wva/Qon/IdgwmZUgPF9jYVMSxQZYdPHNMlze8ACqXcGTFeLgqwygM9G10adZWMEp
        2QXzaNuymRP07eOQS4xvaOAz5UPuaildCbqNpa4LA==
X-ME-Sender: <xms:Iyi9Xq75_0SY1C8-hdrgG6UqV38jn3PXGx2rPQEe0bYVnV_ELUvdzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleeigdefhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkgggtugesthdtredttddtvdenucfhrhhomheprfgvthgvrhcujfhu
    thhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvghtqeenuc
    ggtffrrghtthgvrhhnpefgleeiteeufeetvdffgfdvleelkeetvdefuedtvdeifeefteei
    tedvtdekvdfggeenucfkphepuddujedrvddtrdejuddruddtleenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrrdhhuhhtthgvrhgv
    rhesfihhohdqthdrnhgvth
X-ME-Proxy: <xmx:Iyi9Xj6_rbNsLBYPXo36b942tFxYeQMXg_dhnGkVzjuDk9Cc_O2eNw>
    <xmx:Iyi9Xpd5VKMPtvi9ZOXENCs0rMccaQLtZiHp7CU1rD8ZEdTH1BmWOQ>
    <xmx:Iyi9XnLbTL5rGaAAh2zWnkjkgB_qD5dRBdhHxjgLVSrru0nDu08-7w>
    <xmx:Iyi9XoySiAlF-67p9Yaa1j6_Kln0Azg_qb_BF2YQ7RRZSHkBJzjYNg>
Received: from jelly (117-20-71-109.751447.bne.nbn.aussiebb.net [117.20.71.109])
        by mail.messagingengine.com (Postfix) with ESMTPA id C94073280063;
        Thu, 14 May 2020 07:14:41 -0400 (EDT)
Date:   Thu, 14 May 2020 21:14:48 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Wen He <wen.he_1@nxp.com>
Subject: [PATCH] HID: input: do not run GET_REPORT unless there's a
 Resolution Multiplier
Message-ID: <20200514111448.GA855579@jelly>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

hid-multitouch currently runs GET_REPORT for Contact Max and again to
retrieve the Win8 blob. If both are within the same report, the
Resolution Multiplier code calls GET_FEATURE again and this time,
possibly due to timing, it causes the ILITEK-TP device interpret the
GET_FEATURE as an instruction to change the mode and effectively stop
the device from functioning as expected.

Notably: the device doesn't even have a Resolution Multiplier so it
shouldn't be affected by any of this at all. 

Fix this by making sure we only execute GET_REPORT if there is 
a Resolution Multiplier in the respective report.

Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
Tested-by: Wen He <wen.he_1@nxp.com>
---
 drivers/hid/hid-input.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git drivers/hid/hid-input.c drivers/hid/hid-input.c
index dea9cc65bf80..a54824d451bf 100644
--- drivers/hid/hid-input.c
+++ drivers/hid/hid-input.c
@@ -1560,21 +1560,12 @@ static bool __hidinput_change_resolution_multipliers(struct hid_device *hid,
 {
 	struct hid_usage *usage;
 	bool update_needed = false;
+	bool get_report_completed = false;
 	int i, j;
 
 	if (report->maxfield == 0)
 		return false;
 
-	/*
-	 * If we have more than one feature within this report we
-	 * need to fill in the bits from the others before we can
-	 * overwrite the ones for the Resolution Multiplier.
-	 */
-	if (report->maxfield > 1) {
-		hid_hw_request(hid, report, HID_REQ_GET_REPORT);
-		hid_hw_wait(hid);
-	}
-
 	for (i = 0; i < report->maxfield; i++) {
 		__s32 value = use_logical_max ?
 			      report->field[i]->logical_maximum :
@@ -1593,6 +1584,17 @@ static bool __hidinput_change_resolution_multipliers(struct hid_device *hid,
 			if (usage->hid != HID_GD_RESOLUTION_MULTIPLIER)
 				continue;
 
+			/*
+			 * If we have more than one feature within this report we
+			 * need to fill in the bits from the others before we can
+			 * overwrite the ones for the Resolution Multiplier.
+			 */
+			if (!get_report_completed && report->maxfield > 1) {
+				hid_hw_request(hid, report, HID_REQ_GET_REPORT);
+				hid_hw_wait(hid);
+				get_report_completed = true;
+			}
+
 			report->field[i]->value[j] = value;
 			update_needed = true;
 		}
-- 
2.26.2

