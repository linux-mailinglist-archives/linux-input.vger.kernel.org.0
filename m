Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40E72364EB
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2019 21:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbfFETqH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Jun 2019 15:46:07 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:48495 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726606AbfFETqG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 Jun 2019 15:46:06 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 3569422548;
        Wed,  5 Jun 2019 15:46:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 05 Jun 2019 15:46:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        pedrovanzella.com; h=from:to:cc:subject:date:message-id
        :in-reply-to:references:mime-version:content-transfer-encoding;
         s=fm3; bh=2DpTOsTJa2MB+z1tE4VqIlyqBP9G7xMPMrSMVWIZCW4=; b=DlIJ3
        qoqYY0nhFFnT68RXF7ljmX2fXVXZ0SBTNmUoOPwpSM32ERszKdHhNMEeimht+2wY
        rYiYaVlZo1whr9lZzoGYb1ebCVGEG5xeB+3ugqI4LM3EMWsIBVMOnpLn1UUOdcVr
        VUoYSnkUo3hQZ2CtjW/S+K+lhaxur+J/1jMQYall+29xdfnveANLvd/TaTIbJ5k9
        GfpVgAf1g3QtEqgiZF8v8a2Y302jG2uEfYn7CKrrbbncmGFJy7SRQpfhbO8hOq7D
        +7ULms67QPnq7Nv4an809OSSB30mbrKOVaVTphuZ6fll76kUvYUzEs0tFlNZTwzy
        MPQnZ/uyvWap7Sj1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=2DpTOsTJa2MB+z1tE4VqIlyqBP9G7xMPMrSMVWIZCW4=; b=FSGkUu+W
        dQ/dhUiQnQncct3VaTDF2iEsR1hed80QjvGYAPWgza5zjY4f2R21FTPDJ8LEXKVx
        b0qhQYXLdFz/c4LJ+Fwc+03rEMXpF+LNxVdh7md7DpLg+xtdashMqyFKm0ujNRxt
        XvieBjvbji+cQkIJUkT4pB27khClqezuCOePjZkDg87DmfJTsl/VvhlrxlHl9OWs
        1CRnl7OtoLZbdRbIslcS1faGN9weNVWZ0TBFCDWZx/omzLIOofueMCQQ7C4vLDwu
        MJo+1GMl3486uRmmtx5065Xz+BZrwxHz+NgdKu++al/L3yRBwP7pPOTvJ8z0oiti
        XZyFU0UrSeXs9w==
X-ME-Sender: <xms:_Rv4XAwHgJAWoGyMs7Wr0GK5ODC2Caf6n8j8luaBalJP5icVTfjniw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudegvddgudeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgvughr
    ohcugggrnhiivghllhgruceophgvughrohesphgvughrohhvrghniigvlhhlrgdrtghomh
    eqnecukfhppeejtddrvdejrddvjedrudegleenucfrrghrrghmpehmrghilhhfrhhomhep
    phgvughrohesphgvughrohhvrghniigvlhhlrgdrtghomhenucevlhhushhtvghrufhiii
    gvpedt
X-ME-Proxy: <xmx:_Rv4XPFZIEMOko7dW40beJSjOPZDz7cs8FoxdQuxhhkn699raddAAg>
    <xmx:_Rv4XAme6F8SnDCKBPTf-ppsBwOAyZzpyNCIvVQ3Dw9jRyOXTsvfiA>
    <xmx:_Rv4XOEXO1yxqPV0C8Cy1jkoEK6DOJelnNQ3RUSTaZV4qVH3ZgPyzg>
    <xmx:_hv4XOZBCtDwcpzzMXHI0xWveyVBDetuPkCdo_goTNPsx6dw9eXIHA>
Received: from localhost (toroon020aw-lp130-02-70-27-27-149.dsl.bell.ca [70.27.27.149])
        by mail.messagingengine.com (Postfix) with ESMTPA id 07D07380088;
        Wed,  5 Jun 2019 15:46:04 -0400 (EDT)
From:   Pedro Vanzella <pedro@pedrovanzella.com>
To:     linux-input@vger.kernel.org
Cc:     Pedro Vanzella <pedro@pedrovanzella.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] HID: hid-logitech-hidpp: report battery voltage to the power supply
Date:   Wed,  5 Jun 2019 15:45:32 -0400
Message-Id: <20190605194533.18717-4-pedro@pedrovanzella.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190605194533.18717-1-pedro@pedrovanzella.com>
References: <20190605194533.18717-1-pedro@pedrovanzella.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If we know the device supports reading its voltage, report that.

Note that the protocol only gives us the current voltage in millivolts.

Signed-off-by: Pedro Vanzella <pedro@pedrovanzella.com>
---
 drivers/hid/hid-logitech-hidpp.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 31e99363ab65..d6c59b11b9d2 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -1322,6 +1322,7 @@ static enum power_supply_property hidpp_battery_props[] = {
 	POWER_SUPPLY_PROP_SERIAL_NUMBER,
 	0, /* placeholder for POWER_SUPPLY_PROP_CAPACITY, */
 	0, /* placeholder for POWER_SUPPLY_PROP_CAPACITY_LEVEL, */
+	0, /* placeholder for POWER_SUPPLY_PROP_VOLTAGE_NOW, */
 };
 
 static int hidpp_battery_get_property(struct power_supply *psy,
@@ -1359,6 +1360,9 @@ static int hidpp_battery_get_property(struct power_supply *psy,
 		case POWER_SUPPLY_PROP_SERIAL_NUMBER:
 			val->strval = hidpp->hid_dev->uniq;
 			break;
+		case POWER_SUPPLY_PROP_VOLTAGE_NOW:
+			val->intval = hidpp->battery.voltage;
+			break;
 		default:
 			ret = -EINVAL;
 			break;
@@ -3331,7 +3335,7 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 	if (!battery_props)
 		return -ENOMEM;
 
-	num_battery_props = ARRAY_SIZE(hidpp_battery_props) - 2;
+	num_battery_props = ARRAY_SIZE(hidpp_battery_props) - 3;
 
 	if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_MILEAGE)
 		battery_props[num_battery_props++] =
@@ -3341,6 +3345,10 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 		battery_props[num_battery_props++] =
 				POWER_SUPPLY_PROP_CAPACITY_LEVEL;
 
+	if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_VOLTAGE)
+		battery_props[num_battery_props++] =
+			POWER_SUPPLY_PROP_VOLTAGE_NOW;
+
 	battery = &hidpp->battery;
 
 	n = atomic_inc_return(&battery_no) - 1;
-- 
2.21.0

