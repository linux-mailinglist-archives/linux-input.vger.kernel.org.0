Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C09D4364EC
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2019 21:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbfFETqI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Jun 2019 15:46:08 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:35313 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726421AbfFETqH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 Jun 2019 15:46:07 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id F056322540;
        Wed,  5 Jun 2019 15:46:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 05 Jun 2019 15:46:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        pedrovanzella.com; h=from:to:cc:subject:date:message-id
        :in-reply-to:references:mime-version:content-transfer-encoding;
         s=fm3; bh=QFKxJy5PGENCCn9dVCrpJ+BMRLGxrV0Lyoq85TRWT9g=; b=fUGgS
        27WDhC9RPGqb4wZD5aIu6hoiDxQF6NMV/upY2BmZMYF2wVYuhxEQoEFEbLu/Vmf/
        U29SNYEYre4aEwTwaaXBMHycRdS5HDBHC0QSjjC3EF3U6cweTvjulQ5YVz7/mEje
        ZezahuPK+ESaqAiUhIgVZ0xNLrDQSOEbE2WmFqrAvpEEaFJNiWeCfTSrewnsTl0f
        BlLbJdG1EvvU3wjsfwomVYpS71oTHXRbEW0ClAiBRnd7++GvkAMKFCp1lYmp/GUD
        JnL3RxJNLSAhk1VSDYjZmk34c6cEI89OwgYjpJ9dUTPdOVeDjvnaltRlWb7ChkEz
        36hceT1B6u5qV9TBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=QFKxJy5PGENCCn9dVCrpJ+BMRLGxrV0Lyoq85TRWT9g=; b=cn7j8e5Z
        LbNxZo/n6HbuNLitZg5m1LEKZNWu73aX30/wbMMMHqAQkgL2eoPgJyQY10MEK9s/
        2qMelfvTijdmoF6iJWLHFEtOudHVZ1JCZawROsasLxdV+jkVOT15hRi5FU4a1B59
        O1i/bnKZDPpsybQCyoxuxp8NhMY2PMxRADmwwV0o5Qr0hWvOYkVt75WpbD6F6Ntm
        H8j8CNklzNN08c5DmjJwgUHwtd+r/DlL/ubAyaxNBvenv0ymhXtBdujmQVpmJkoZ
        JwA9drwKc4HhcfjdegCOIMSkEf7+AuQyLC1jq2iqB6eyb7TTetyMNYyr2ap1WPVc
        OG+hxhnVDiXs4g==
X-ME-Sender: <xms:_Rv4XMCIfixlKcrNYXJN7rLTOH8KodXtuc0UI87ajMdBzB9sUbx3aw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudegvddgudeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgvughr
    ohcugggrnhiivghllhgruceophgvughrohesphgvughrohhvrghniigvlhhlrgdrtghomh
    eqnecukfhppeejtddrvdejrddvjedrudegleenucfrrghrrghmpehmrghilhhfrhhomhep
    phgvughrohesphgvughrohhvrghniigvlhhlrgdrtghomhenucevlhhushhtvghrufhiii
    gvpedt
X-ME-Proxy: <xmx:_Rv4XOs-ZvqLH05SVXxSfPkJ6DAFd-Opy61ZMCYBIqDr7H7gFryN0w>
    <xmx:_Rv4XJFVU3F-3vbkO5wsL2SKzp2OM7StN0CzF_R7qT73tEals-AiVQ>
    <xmx:_Rv4XB1q3_TK4fyKJToOcaakZOUuiPgZGiH1YGr2KOKn31M2GEaALA>
    <xmx:_Rv4XD2qMYzpm1DUBsZkHuml_SHcwgKjPgYJoN3KlUVk8uqB0rRtHw>
Received: from localhost (toroon020aw-lp130-02-70-27-27-149.dsl.bell.ca [70.27.27.149])
        by mail.messagingengine.com (Postfix) with ESMTPA id 848FC38008A;
        Wed,  5 Jun 2019 15:46:05 -0400 (EDT)
From:   Pedro Vanzella <pedro@pedrovanzella.com>
To:     linux-input@vger.kernel.org
Cc:     Pedro Vanzella <pedro@pedrovanzella.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] HID: hid-logitech-hidpp: subscribe to battery voltage events
Date:   Wed,  5 Jun 2019 15:45:33 -0400
Message-Id: <20190605194533.18717-5-pedro@pedrovanzella.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190605194533.18717-1-pedro@pedrovanzella.com>
References: <20190605194533.18717-1-pedro@pedrovanzella.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Like we do for other ways of interacting with the battery for other
devices, refresh the battery status and notify the power supply
subsystem of the changes in voltage and status.

Signed-off-by: Pedro Vanzella <pedro@pedrovanzella.com>
---
 drivers/hid/hid-logitech-hidpp.c | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index d6c59b11b9d2..a37bd0834335 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -1313,6 +1313,36 @@ static int hidpp20_query_battery_voltage_info(struct hidpp_device *hidpp)
 
 	return 0;
 }
+
+static int hidpp20_battery_voltage_event(struct hidpp_device *hidpp,
+					 u8 *data, int size)
+{
+	struct hidpp_report *report = (struct hidpp_report *)data;
+	int status, voltage;
+	bool changed;
+
+	if (report->fap.feature_index != hidpp->battery.voltage_feature_index ||
+	    report->fap.funcindex_clientid !=
+		    EVENT_BATTERY_LEVEL_STATUS_BROADCAST)
+		return 0;
+
+	status = hidpp20_battery_map_status_voltage(report->fap.params,
+						    &voltage);
+
+	hidpp->battery.online = status != POWER_SUPPLY_STATUS_NOT_CHARGING;
+
+	changed = voltage != hidpp->battery.voltage ||
+		  status != hidpp->battery.status;
+
+	if (changed) {
+		hidpp->battery.voltage = voltage;
+		hidpp->battery.status = status;
+		if (hidpp->battery.ps)
+			power_supply_changed(hidpp->battery.ps);
+	}
+	return 0;
+}
+
 static enum power_supply_property hidpp_battery_props[] = {
 	POWER_SUPPLY_PROP_ONLINE,
 	POWER_SUPPLY_PROP_STATUS,
@@ -3181,6 +3211,9 @@ static int hidpp_raw_hidpp_event(struct hidpp_device *hidpp, u8 *data,
 		ret = hidpp_solar_battery_event(hidpp, data, size);
 		if (ret != 0)
 			return ret;
+		ret = hidpp20_battery_voltage_event(hidpp, data, size);
+		if (ret != 0)
+			return ret;
 	}
 
 	if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP10_BATTERY) {
-- 
2.21.0

