Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5098E1D4153
	for <lists+linux-input@lfdr.de>; Fri, 15 May 2020 00:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728848AbgENWt0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 May 2020 18:49:26 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:33955 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728229AbgENWt0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 May 2020 18:49:26 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id B6E1A5C0032;
        Thu, 14 May 2020 18:49:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Thu, 14 May 2020 18:49:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:mime-version:content-type
        :in-reply-to; s=fm3; bh=Uu0LSaAeQPGfZddmxdXhswyxbnsQrZ3AYOkrJxax
        WNI=; b=AiI4BYV7ekNlqn/s25gmsIpba5KsDc6JKPQpGv0SEGol3xkJAoQ12dmX
        pAzE8QOlOllyp1zi72b7Cc1NHh10CYuf7d4IpJnCE6Klp3nxaN5yndAZNTjR3WwE
        ye5tDf58Lu/HbeZQPAbjHXYZDIGcC5bRRKsU74uABbVvdTHIEN2C8NEEmEYQMdPO
        5i03depepsZdyrgRIkuaewVjnuo2zTfpj2tJq483+lfmBRhjvbcJgn2+8n3ScIuF
        d2W0S2DJiTFOP1ZZ3R3oa/CPomR5F6OMLu0+u8R8t7hyLiNTkTWBZCW1sZw30aTj
        ipqFomHIWv6lYOaD27pMyR+6JzRASg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Uu0LSaAeQPGfZddmx
        dXhswyxbnsQrZ3AYOkrJxaxWNI=; b=lmnXegNpcikzRGK5v8piD+zbZ5cSJfq3g
        D4C+iBk0bU3AxN1KGBNH1RSf4FoQ7xDvnJNLDtx7ThRll8qOr0vx3ykObA8LZXl8
        8/gPGUErQUUy5TL97I6tLxhdfQhDQ66y/VE18hKrz1Hds18e7r3DAy06VBrSRUoo
        JG+H+V4ExtzjmNUfeljfWDCI4fyod/xtU8+WDNlLijf1yzaSFfSx2osLZ6CIXxcF
        HRrirWYEqbwvffKpHJf54JL2DCHMnCofcSC6Bm2Z5nm9gOQvfYyTTUFz32nJ7Zd3
        v0InACOfwk0LxU0rPJfHqMMjhvX8c850yhLYi5NyWw/iY92Fsls1Q==
X-ME-Sender: <xms:88q9Xosf1WX5pBvLWmevC538974UFehUSvoQzxqecTOKtd0QeBh-Gw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleejgddtkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkgggtuggjsehttdertddttddvnecuhfhrohhmpefrvghtvghrucfj
    uhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvtheqne
    cuggftrfgrthhtvghrnhepheegveefieejhfdukeeuudetvdfhtdejffevvdeutdfgheff
    fedthfdvffdtveeknecukfhppeduudejrddvtddrjedurddutdelnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhdrhhhuthhtvghr
    vghrseifhhhoqdhtrdhnvght
X-ME-Proxy: <xmx:9Mq9XldsL7zXesfeSoTC-kP4ZQETktYUbnDzihL7bocDLNbao7HDAQ>
    <xmx:9Mq9XjyjGwXcWLX7J76iBccVLCoRzy37lXEbCzXjzAU7nlrrloNcYg>
    <xmx:9Mq9XrPUn8kdkCbne_jqTPiQ55gA1QCvZOMd8i73R9aNN4_pQIg4nw>
    <xmx:9Mq9XtFr69bJsXX2hJm7vXDs90RFkghiWYQCuGdKaMMrx-jYemrKbg>
Received: from jelly (117-20-71-109.751447.bne.nbn.aussiebb.net [117.20.71.109])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6475E30611F2;
        Thu, 14 May 2020 18:49:22 -0400 (EDT)
Date:   Fri, 15 May 2020 08:49:29 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Wen He <wen.he_1@nxp.com>
Subject: [PATCH RESEND] HID: input: do not run GET_REPORT unless there's a
 Resolution Multiplier
Message-ID: <20200514224929.GA1026616@jelly>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO-hwJJjoEyoKokK6DS_Kb0su2bkC2wzMx-gzaWQcG+dn5vVdw@mail.gmail.com>
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
Same patch as before, but this time with diff.noprefix set to false again.
Too bad that setting messes up format-patch :( Apologies for the broken
one.

 drivers/hid/hid-input.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index dea9cc65bf80..a54824d451bf 100644
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

