Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 586EA15E3C6
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2020 17:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406204AbgBNQZq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Feb 2020 11:25:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:35674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406197AbgBNQZp (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Feb 2020 11:25:45 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 423AB247D0;
        Fri, 14 Feb 2020 16:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581697545;
        bh=T1ZKD43Hoi0VlEAm4qsLbLuTAyNG1fwLV0FTSp5WMTQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=zFhJTgmuketWb8/eBZ+nELYOaPL7ct6LZqdv3nRPFMtGtB+iTaUJLnyDbGTxv4aTU
         Hm9NT1dqBlCO9ir3KbSqxi0w0Kf8qGB55oYoPB63tLkFhzfbPcM/Urys1EGFMdObY8
         YVZzssrNq+JCExmaTit6N0IW5ooTyo8VGLL9dcgg=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sasha Levin <sashal@kernel.org>, linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 064/100] Input: edt-ft5x06 - work around first register access error
Date:   Fri, 14 Feb 2020 11:23:48 -0500
Message-Id: <20200214162425.21071-64-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214162425.21071-1-sashal@kernel.org>
References: <20200214162425.21071-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Philipp Zabel <p.zabel@pengutronix.de>

[ Upstream commit e112324cc0422c046f1cf54c56f333d34fa20885 ]

The EP0700MLP1 returns bogus data on the first register read access
(reading the threshold parameter from register 0x00):

    edt_ft5x06 2-0038: crc error: 0xfc expected, got 0x40

It ignores writes until then. This patch adds a dummy read after which
the number of sensors and parameter read/writes work correctly.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/input/touchscreen/edt-ft5x06.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 0b0f8c17f3f7e..a9d97d577a7e9 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -880,6 +880,7 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 {
 	const struct edt_i2c_chip_data *chip_data;
 	struct edt_ft5x06_ts_data *tsdata;
+	u8 buf[2] = { 0xfc, 0x00 };
 	struct input_dev *input;
 	unsigned long irq_flags;
 	int error;
@@ -949,6 +950,12 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 		return error;
 	}
 
+	/*
+	 * Dummy read access. EP0700MLP1 returns bogus data on the first
+	 * register read access and ignores writes.
+	 */
+	edt_ft5x06_ts_readwrite(tsdata->client, 2, buf, 2, buf);
+
 	edt_ft5x06_ts_set_regs(tsdata);
 	edt_ft5x06_ts_get_defaults(&client->dev, tsdata);
 	edt_ft5x06_ts_get_parameters(tsdata);
-- 
2.20.1

