Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 085BD9A101
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2019 22:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393087AbfHVUT1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Aug 2019 16:19:27 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:53003 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387441AbfHVUTC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Aug 2019 16:19:02 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id A7E1321B6A;
        Thu, 22 Aug 2019 16:19:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 22 Aug 2019 16:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        pedrovanzella.com; h=from:to:cc:subject:date:message-id
        :in-reply-to:references:mime-version:content-transfer-encoding;
         s=fm3; bh=4AYGKsZjK6lV5gVZkcpia3kXkgKi2R2J1lgMhrGMRvc=; b=p4BMh
        2MMNJIF/anLj+ZlvOJhAzBVaGZWA9Uft4lN3TnfBJN6ZgSvvxYjRL8XmNw2Qsh/y
        kVSNQN8ELNHscjr5y4vQGbfwX0VDUqO7qagd8TVzyJKfV+fVHPxtPxQnfp9bgNXY
        AJDXwnJ+rFf9IAo7qaPHj6z9SN+fa/xeFpgb8xhr5i/Yo3MeCLrxVY4RNK9+1p9T
        xC2OrffkDrLc+cHiYvEEZNsO2HoBFBSP73BnLwQIZjU2nJrgfbAWqQcHy1AS9nIp
        1+RiFU8/zp87xYhso4ObJJvBONGiQRH7k9DxU6TgGu9VMaNGqc9J/YevY/n/DZnD
        JkUI8SJpnRz0K4CFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=4AYGKsZjK6lV5gVZkcpia3kXkgKi2R2J1lgMhrGMRvc=; b=GdAAh8cT
        emhjM0Lw+E1yCOOYtIrz1PUPgGl7f2gEfrMDlpw0lz9zjcNwjoa2A22Fi7W2mXr3
        mdy9UaxWBPojhwASRUwVH6rJwsztCL6d5f6INbi3beXLgEzO+AVmLVl+LKhrnCiy
        WYaQz3nlbsBjls5MOkAI6uqaf22wmDC62qlyXcrZ9FM5Z+l1KZz4pe7r2LI7tMrr
        Hyrd5SFceA4rI1bMW8IAguvxBCZfCKAgOaMp5cdCGoflQ7vj7nB4+G7++z8mj+Zv
        wnRnTUSBrquWnfBcNxt6UXv9DnNUiKW8Rudr/6zwqobG/HDDIWODI0a12tuuZTCu
        8lepU19F+AQSmQ==
X-ME-Sender: <xms:tfheXY9Wny7YL50KBth4SeDSzY7zXXG8u5aNzVJu2po1vQ3ReNpO7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudegiedguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgvughr
    ohcugggrnhiivghllhgruceophgvughrohesphgvughrohhvrghniigvlhhlrgdrtghomh
    eqnecukfhppedujeegrdekkedrledrudegleenucfrrghrrghmpehmrghilhhfrhhomhep
    phgvughrohesphgvughrohhvrghniigvlhhlrgdrtghomhenucevlhhushhtvghrufhiii
    gvpedt
X-ME-Proxy: <xmx:tfheXUO4CpR5EdRtqwdESrEO98fI4dciLCo_zEwMOaPMrpSCWqqiFg>
    <xmx:tfheXREf1fAoaYIKmZP3hYjpRVr5PKzbTxWdLgbVug3H7anq_WX7dw>
    <xmx:tfheXQa1HnPOR2CrmKdlOavQnPrRV498xPymsOrnTFEc1UJDVLXbYg>
    <xmx:tfheXdURchMeAp8vo2nAxfYGkzmENnSUb_bSm3Dr371Gzk_1ejdhXQ>
Received: from localhost (toroon020aw-lp130-07-174-88-9-149.dsl.bell.ca [174.88.9.149])
        by mail.messagingengine.com (Postfix) with ESMTPA id 44C7AD6005B;
        Thu, 22 Aug 2019 16:19:01 -0400 (EDT)
From:   Pedro Vanzella <pedro@pedrovanzella.com>
To:     linux-input@vger.kernel.org
Cc:     lains@archlinux.org, Pedro Vanzella <pedro@pedrovanzella.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] hid-logitech-hidpp: report battery voltage to the power supply
Date:   Thu, 22 Aug 2019 16:18:47 -0400
Message-Id: <20190822201849.28924-4-pedro@pedrovanzella.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190822201849.28924-1-pedro@pedrovanzella.com>
References: <20190822201849.28924-1-pedro@pedrovanzella.com>
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
index e1ddc9cdcc8b..06bee97d33b4 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -1319,6 +1319,7 @@ static enum power_supply_property hidpp_battery_props[] = {
 	POWER_SUPPLY_PROP_SERIAL_NUMBER,
 	0, /* placeholder for POWER_SUPPLY_PROP_CAPACITY, */
 	0, /* placeholder for POWER_SUPPLY_PROP_CAPACITY_LEVEL, */
+	0, /* placeholder for POWER_SUPPLY_PROP_VOLTAGE_NOW, */
 };
 
 static int hidpp_battery_get_property(struct power_supply *psy,
@@ -1356,6 +1357,9 @@ static int hidpp_battery_get_property(struct power_supply *psy,
 		case POWER_SUPPLY_PROP_SERIAL_NUMBER:
 			val->strval = hidpp->hid_dev->uniq;
 			break;
+		case POWER_SUPPLY_PROP_VOLTAGE_NOW:
+			val->intval = hidpp->battery.voltage;
+			break;
 		default:
 			ret = -EINVAL;
 			break;
@@ -3328,7 +3332,7 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 	if (!battery_props)
 		return -ENOMEM;
 
-	num_battery_props = ARRAY_SIZE(hidpp_battery_props) - 2;
+	num_battery_props = ARRAY_SIZE(hidpp_battery_props) - 3;
 
 	if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_MILEAGE)
 		battery_props[num_battery_props++] =
@@ -3338,6 +3342,10 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 		battery_props[num_battery_props++] =
 				POWER_SUPPLY_PROP_CAPACITY_LEVEL;
 
+	if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_VOLTAGE)
+		battery_props[num_battery_props++] =
+			POWER_SUPPLY_PROP_VOLTAGE_NOW;
+
 	battery = &hidpp->battery;
 
 	n = atomic_inc_return(&battery_no) - 1;
-- 
2.23.0

