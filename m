Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 765BB240797
	for <lists+linux-input@lfdr.de>; Mon, 10 Aug 2020 16:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbgHJO3l (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Aug 2020 10:29:41 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:34023 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgHJO3k (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Aug 2020 10:29:40 -0400
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1k58nr-0008Q5-I6; Mon, 10 Aug 2020 14:29:32 +0000
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Balan <admin@kryma.net>,
        Daniel Playfair Cal <daniel.playfair.cal@gmail.com>,
        HungNien Chen <hn.chen@weidahitech.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        Aaron Ma <aaron.ma@canonical.com>,
        linux-input@vger.kernel.org (open list:HID CORE LAYER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] HID: i2c-hid: Add 60ms delay after SET_POWER ON
Date:   Mon, 10 Aug 2020 22:29:26 +0800
Message-Id: <20200810142928.12552-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Goodix touchpad fails to operate in I2C mode after system suspend.

According to the vendor, Windows is more forgiving and there's a 60ms
delay after SET_POWER ON command.

So let's do the same here, to workaround for the touchpads that depend
on the delay.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 294c84e136d7..7b24a27fad95 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -419,6 +419,9 @@ static int i2c_hid_set_power(struct i2c_client *client, int power_state)
 	if (ret)
 		dev_err(&client->dev, "failed to change power setting.\n");
 
+	if (!ret && power_state == I2C_HID_PWR_ON)
+		msleep(60);
+
 set_pwr_exit:
 	return ret;
 }
-- 
2.17.1

