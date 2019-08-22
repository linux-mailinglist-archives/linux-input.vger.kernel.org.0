Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2998B9A0FF
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2019 22:19:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393015AbfHVUTP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Aug 2019 16:19:15 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:47373 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2392859AbfHVUTD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Aug 2019 16:19:03 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 5DC2F21F4C;
        Thu, 22 Aug 2019 16:19:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 22 Aug 2019 16:19:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        pedrovanzella.com; h=from:to:cc:subject:date:message-id
        :in-reply-to:references:mime-version:content-transfer-encoding;
         s=fm3; bh=dJnrPuaV25ABykzS4FLNIsBUys6IgKfAK34wtssm9ns=; b=ljLXx
        fEEMW22wAPO67cdymHSP1ujN73zY9csukL3ZPBLtgNjFmIOkSlkaTPoJqcpgHmGw
        uHlp5PwUmloNJWR8amT2eIa/KTbtcSsmHYPSUJiyZFPJALPz6Vj3k5jaxWB3qFNH
        IPtG/s9/IvQU59rshFpJDpxTAIIXyJcNFE4XtD0BVrqOlpRFJD0Zu7hPFpJZ2g5a
        KNYaBK5yiwYXqrQQdrPmfQyBdXhD4Hw8oEZpx/aEnXCZH9l8YziUED+2YmF/bOFz
        amBiW/Jf2ybhKVZWXb6KU0W+k6Lbj2BI9xkKWUrCwVDpvSLFVvDAjKmYiyiKDUYN
        hS5zzglzziKlndVqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=dJnrPuaV25ABykzS4FLNIsBUys6IgKfAK34wtssm9ns=; b=P3m3D40b
        uZw9fNhdPu+G1c911m0LD78EN+vfLnvOlQ/QZEA+EXzSFr3pWKZQ0E4uH7ZggnLS
        tY7CBxR0cEqXVuVbWAVvTF9hS+oSDEBE3w/paTq5oy1Fpl/ipoTTvAlvXKZINBdX
        UUAtwqzpAKIRgL+pi9SIZSTXvJ/FJFzxEPx7wlaeCLITsT44X4X3pYuqDxUcTn8U
        m8OmVRMIrrsHH6tgQ9db7qrwIGwO+zmmvt2bY/vQBXOtv7uxw5IF0efXnN0G5c+U
        TxWE/NGHCPtImXdiO9gGGKzbhyAfQ5KYcBAZRuI7ooxtZAyYa8YSbMLwN+4loYKl
        iPP19lRYLE7K4A==
X-ME-Sender: <xms:tvheXUGGTfZsXvt2R4I-Y2iganKuva5MQrABt3Pd6k92CIe1W1Mkyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudegiedguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgvughr
    ohcugggrnhiivghllhgruceophgvughrohesphgvughrohhvrghniigvlhhlrgdrtghomh
    eqnecukfhppedujeegrdekkedrledrudegleenucfrrghrrghmpehmrghilhhfrhhomhep
    phgvughrohesphgvughrohhvrghniigvlhhlrgdrtghomhenucevlhhushhtvghrufhiii
    gvpedt
X-ME-Proxy: <xmx:tvheXekQZkNsFTM5E66rnNLg06H7rqBmG1mmAQNZZ5IEtSiX-4ZRBw>
    <xmx:tvheXTdEElgRPkSso6xVxpufKz9DwDPOWtVy-uBOQmBOXEgm2nZ1WQ>
    <xmx:tvheXUAH_Uzgb9tE6qMqTk_N9lHdVRHFZ8dtsrA3EHBFIeV51aW2dQ>
    <xmx:tvheXUe7JurA7wMaKlcjE9rtF1Hmumz-4QxYdqvhOREnWYrKjRnPVg>
Received: from localhost (toroon020aw-lp130-07-174-88-9-149.dsl.bell.ca [174.88.9.149])
        by mail.messagingengine.com (Postfix) with ESMTPA id E8A768005B;
        Thu, 22 Aug 2019 16:19:01 -0400 (EDT)
From:   Pedro Vanzella <pedro@pedrovanzella.com>
To:     linux-input@vger.kernel.org
Cc:     lains@archlinux.org, Pedro Vanzella <pedro@pedrovanzella.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] hid-logitech-hidpp: subscribe to battery voltage events
Date:   Thu, 22 Aug 2019 16:18:48 -0400
Message-Id: <20190822201849.28924-5-pedro@pedrovanzella.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190822201849.28924-1-pedro@pedrovanzella.com>
References: <20190822201849.28924-1-pedro@pedrovanzella.com>
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
 drivers/hid/hid-logitech-hidpp.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 06bee97d33b4..9f09ed6abbad 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -1310,6 +1310,35 @@ static int hidpp20_query_battery_voltage_info(struct hidpp_device *hidpp)
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
@@ -3178,6 +3207,9 @@ static int hidpp_raw_hidpp_event(struct hidpp_device *hidpp, u8 *data,
 		ret = hidpp_solar_battery_event(hidpp, data, size);
 		if (ret != 0)
 			return ret;
+		ret = hidpp20_battery_voltage_event(hidpp, data, size);
+		if (ret != 0)
+			return ret;
 	}
 
 	if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP10_BATTERY) {
-- 
2.23.0

