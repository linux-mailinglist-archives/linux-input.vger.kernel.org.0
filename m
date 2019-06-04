Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 341F6353DB
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2019 01:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbfFDX2x (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Jun 2019 19:28:53 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:54653 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726707AbfFDX2u (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 4 Jun 2019 19:28:50 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 67ACF22254;
        Tue,  4 Jun 2019 19:28:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 04 Jun 2019 19:28:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        pedrovanzella.com; h=from:to:cc:subject:date:message-id
        :in-reply-to:references:mime-version:content-transfer-encoding;
         s=fm3; bh=DsACNtiGvfC/Ki2npzczHrtAo6mekGtphSEjso81n5M=; b=jH/Bt
        t6sJlXT2vgCGQ3KCSy0AIaeaY706gokPGiRdJQnLtAi3aD+oMuRZBDpwmk8SMZeK
        K/vZrPeal891ZObtW2/C2OH2BtJvNenyPV/Q6rkp7eV7XGFXVvEEwiK+aG+JybEq
        Ec6CC09BSqrlBxKtpsg+9ruCmevv4EyujsNreXMzw38hREdBQNP8INcUvp5CoW1A
        gpNksmjqcGeUMmkRW5GLZA217P4rXP89dq4oexSZfTY3GrYZXzXRKe+KCw06cpfG
        OnTtSJiGUvnSnVA9VSfhlbmiWruqc2zSxEsmHi65qR2cEgkxrrAgAv+NmTwPZVTS
        8suLu3OYLnLOQ95CA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=DsACNtiGvfC/Ki2npzczHrtAo6mekGtphSEjso81n5M=; b=8Y1t13kf
        F5/SL504krbm6dERJ9tihtWVSdDW0vyYIUlvqt3tXfI3tNMcqCTiRYLwBI/GLSBf
        9LhbGVNrpQzeIDFWusOO9ih6ks7ivpFUKH28hPi8fL+Gb7xgh1mzsj0yjbegcW48
        0LsK3WifgBZn4ra36R5YL79+tt4c74Vc8pmuQI6KNOJQzhb9hJLeqZSnRpXujctC
        x8P7u2T9K/AzPBzB3xQv9zYgGTjeAwPVQEZ9uP6LW6EpPMcMTI/JCbp0XqAKwAaf
        eC3KO2nhEktIwUXFAAJtWY+Xn/T/C70JohTmf+QgOznX4iuwmJ/iprUGdCo2Vxvu
        80XhLc3GryrYgA==
X-ME-Sender: <xms:sf72XCQcsmGG77Ss3qLC_vmfjFVYteyoKEs0RhAEeEp3X9tx6Bt3Ug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeguddgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefrvggurhho
    ucggrghniigvlhhlrgcuoehpvggurhhosehpvggurhhovhgrnhiivghllhgrrdgtohhmqe
    enucfkphepjedtrddvjedrvdejrddugeelnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
    vggurhhosehpvggurhhovhgrnhiivghllhgrrdgtohhmnecuvehluhhsthgvrhfuihiivg
    epud
X-ME-Proxy: <xmx:sf72XKH3R2RLif6qzhSqYefDyk9CtbX1v0JxOq-277P11zVzVnT7Tw>
    <xmx:sf72XOhyXl4Tj0VvZHc1TOjjvVNMCRQ3yxSjM15eWur0W5_umNehWg>
    <xmx:sf72XK9ygKAa1rZ5dGnaSFR4pw41TRGLeuEVLZnDFegMfKMSmnqXrA>
    <xmx:sf72XHWceCXmZGz5IofXWLAU8pXxfmw-880J4Ta79XuucB2iFvZ2xA>
Received: from localhost (toroon020aw-lp130-02-70-27-27-149.dsl.bell.ca [70.27.27.149])
        by mail.messagingengine.com (Postfix) with ESMTPA id EE2AC380083;
        Tue,  4 Jun 2019 19:28:48 -0400 (EDT)
From:   Pedro Vanzella <pedro@pedrovanzella.com>
To:     linux-input@vger.kernel.org
Cc:     Pedro Vanzella <pedro@pedrovanzella.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] HID: hid-logitech-hidpp: subscribe to battery voltage change events
Date:   Tue,  4 Jun 2019 19:28:27 -0400
Message-Id: <20190604232827.26008-2-pedro@pedrovanzella.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190604232827.26008-1-pedro@pedrovanzella.com>
References: <20190604232827.26008-1-pedro@pedrovanzella.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Same as with the other ways of reporting battery status,
fetch the battery voltage on raw hidpp events.

Signed-off-by: Pedro Vanzella <pedro@pedrovanzella.com>
---
 drivers/hid/hid-logitech-hidpp.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index e68ea44b0d24..1eee206a0aed 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -1313,6 +1313,35 @@ static int hidpp20_query_battery_voltage_info(struct hidpp_device *hidpp)
 	return 0;
 }
 
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
@@ -3181,6 +3210,9 @@ static int hidpp_raw_hidpp_event(struct hidpp_device *hidpp, u8 *data,
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

