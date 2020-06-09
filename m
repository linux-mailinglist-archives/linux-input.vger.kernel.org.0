Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A775C1F33EA
	for <lists+linux-input@lfdr.de>; Tue,  9 Jun 2020 08:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbgFIGD1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Jun 2020 02:03:27 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:57439 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726886AbgFIGD0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 9 Jun 2020 02:03:26 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 6DEEB5A6;
        Tue,  9 Jun 2020 02:03:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Tue, 09 Jun 2020 02:03:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:mime-version:content-type
        :in-reply-to; s=fm3; bh=4jEJ2Hlix1v4XGxLEv85Yjs2WTG6QXKyyWDB3CUS
        NGg=; b=JKATVjgHuMMwqWRS8znw0nYWOXVbYAgC2cUih1J04BM2+OwIwVhjHT6l
        rdg56suoNWXZIShaE2/vG+AlytKeBUYI4sPTDDnZS6yVCUULtaFk9GQtB1EKPAAb
        aS92ebRoF1O0PmvVml/t0E02ZEZvgBeim5h7h4LwZXj/yhL54Y3zqvLhnM80bg+n
        fGtJvbPKFzPGg8ACDWj/cZq1p565cTPfU9MSLNXXMy9n4Q+BeP0zOeG7HejF0JE5
        Ottfz6ZYZa6COMh4QKyOd0mLIOpcNmI35p7FUFfbitAfJme8F8gJxe6dVJErLuDF
        okkJizmWBLQ2UGPcq52Yh17GVYt7mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4jEJ2Hlix1v4XGxLE
        v85Yjs2WTG6QXKyyWDB3CUSNGg=; b=t0WUC320oHm2GjfhRSIrGPr1RhROlGDPE
        f3lML2W/37Fz6uGLsQPU5zLgRGWpiEykJ6y2y8hiOfmsrSUWTyS2urFLAwZRWe2E
        8AJqKtEaW/9l5cWFQ1Dk+RUYq06PnkGNJXmugVGn7VxPjyXYmzCeoYIry4TNVncj
        d8c2Dwl5IP+yBta9WXnByvCOn2WGwv/oAsJdEVVaGGkB7G8yxGuseigZvUlEKCtw
        F1spdaGPrlPidGl+/YgcSJqCiCTJLseNvKtNSOQkX+2zTnGYXWmYPm3oCVvlzYU8
        gfmhjEPP7S8fzjTFwbZGXmej8dd7qco5x4UA45XFOvVpqXYFnlmaQ==
X-ME-Sender: <xms:LCbfXkycuRq9_dd5mbhMBzG_j7bKp1-Z1ppmXEpJd_ijuBHu-hzG8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudehfedguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkgggtuggjsehttdertddttddvnecuhfhrohhmpefrvghtvghr
    ucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
    eqnecuggftrfgrthhtvghrnhepheegveefieejhfdukeeuudetvdfhtdejffevvdeutdfg
    hefffedthfdvffdtveeknecukfhppeduudejrddvtddrieekrddufedvnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhdrhhhuthht
    vghrvghrseifhhhoqdhtrdhnvght
X-ME-Proxy: <xmx:LCbfXoTweWk3ZYT0ElexawxnPgwsN5TIEZIkRU4QIe0_kNN7qZvmww>
    <xmx:LCbfXmVYEqAgPN1W2S6EMv1wLAyuL_vxWKH2PQxyShw12HTa4NLIqA>
    <xmx:LCbfXijNOfuNKQRgQwV64pSpy0xYFm3lq9sDM2KvCbTH2yRCzaHAZQ>
    <xmx:LSbfXho9KrEakwFTlRiAFw4Ks5p--ZxmWJg0a0XCNBfJpbac1ekfaA>
Received: from jelly (117-20-68-132.751444.bne.nbn.aussiebb.net [117.20.68.132])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2AEE03280065;
        Tue,  9 Jun 2020 02:03:22 -0400 (EDT)
Date:   Tue, 9 Jun 2020 16:03:19 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Wen He <wen.he_1@nxp.com>
Subject: [PATCH v2] HID: input: do not run GET_REPORT unless there's a
 Resolution Multiplier
Message-ID: <20200609060319.GA36844@jelly>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514111448.GA855579@jelly>
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
a Resolution Multiplier in the respective report. Where the
HID_QUIRK_NO_INIT_REPORTS field is set we just bail out immediately. This
shouldn't be triggered by any real device anyway.

Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
Tested-by: Wen He <wen.he_1@nxp.com>
---
Changes to v1:
- bail out in case of HID_QUIRK_NO_INIT_REPORTS

 drivers/hid/hid-input.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index dea9cc65bf80..c8633beae260 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
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
@@ -1593,6 +1584,25 @@ static bool __hidinput_change_resolution_multipliers(struct hid_device *hid,
 			if (usage->hid != HID_GD_RESOLUTION_MULTIPLIER)
 				continue;
 
+			/*
+			 * If we have more than one feature within this
+			 * report we need to fill in the bits from the
+			 * others before we can overwrite the ones for the
+			 * Resolution Multiplier.
+			 *
+			 * But if we're not allowed to read from the device,
+			 * we just bail. Such a device should not exist
+			 * anyway.
+			 */
+			if (!get_report_completed && report->maxfield > 1) {
+				if (hid->quirks & HID_QUIRK_NO_INIT_REPORTS)
+					return update_needed;
+
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

