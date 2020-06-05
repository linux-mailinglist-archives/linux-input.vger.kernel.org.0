Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59DCB1EF762
	for <lists+linux-input@lfdr.de>; Fri,  5 Jun 2020 14:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbgFEM0B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Jun 2020 08:26:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:57900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727017AbgFEM0A (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 5 Jun 2020 08:26:00 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1013920820;
        Fri,  5 Jun 2020 12:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591359959;
        bh=+/l/HKb94QJ1fLl/aY9Ci1ZVow5m6nAWV0fLci86yno=;
        h=From:To:Cc:Subject:Date:From;
        b=ai8AfOaRun5UtE8+K3s7ii5XJMsBhy584xcYCUEDfzBwykR7TGVqvlYBwWcYvvPhT
         InI0aeWp6+n0y69FmfFo6Vx3ehtjUyI4kI9aUSTaKpmhO113/BcQ9O1pl+j3BVLBbU
         uIGLueetq4xw39kG+Cai96bpI9LHy3KT+sObhPHo=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Andi Shyti <andi@etezian.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sasha Levin <sashal@kernel.org>, linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 1/9] Input: mms114 - fix handling of mms345l
Date:   Fri,  5 Jun 2020 08:25:49 -0400
Message-Id: <20200605122558.2882712-1-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Stephan Gerhold <stephan@gerhold.net>

[ Upstream commit 3f8f770575d911c989043d8f0fb8dec96360c41c ]

MMS345L is another first generation touch screen from Melfas,
which uses the same registers as MMS152.

However, using I2C_M_NOSTART for it causes errors when reading:

	i2c i2c-0: sendbytes: NAK bailout.
	mms114 0-0048: __mms114_read_reg: i2c transfer failed (-5)

The driver works fine as soon as I2C_M_NOSTART is removed.

Reviewed-by: Andi Shyti <andi@etezian.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
Link: https://lore.kernel.org/r/20200405170904.61512-1-stephan@gerhold.net
[dtor: removed separate mms345l handling, made everyone use standard
transfer mode, propagated the 10bit addressing flag to the read part of the
transfer as well.]
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/input/touchscreen/mms114.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/input/touchscreen/mms114.c b/drivers/input/touchscreen/mms114.c
index a5ab774da4cc..fca908ba4841 100644
--- a/drivers/input/touchscreen/mms114.c
+++ b/drivers/input/touchscreen/mms114.c
@@ -91,15 +91,15 @@ static int __mms114_read_reg(struct mms114_data *data, unsigned int reg,
 	if (reg <= MMS114_MODE_CONTROL && reg + len > MMS114_MODE_CONTROL)
 		BUG();
 
-	/* Write register: use repeated start */
+	/* Write register */
 	xfer[0].addr = client->addr;
-	xfer[0].flags = I2C_M_TEN | I2C_M_NOSTART;
+	xfer[0].flags = client->flags & I2C_M_TEN;
 	xfer[0].len = 1;
 	xfer[0].buf = &buf;
 
 	/* Read data */
 	xfer[1].addr = client->addr;
-	xfer[1].flags = I2C_M_RD;
+	xfer[1].flags = (client->flags & I2C_M_TEN) | I2C_M_RD;
 	xfer[1].len = len;
 	xfer[1].buf = val;
 
@@ -428,10 +428,8 @@ static int mms114_probe(struct i2c_client *client,
 	const void *match_data;
 	int error;
 
-	if (!i2c_check_functionality(client->adapter,
-				I2C_FUNC_PROTOCOL_MANGLING)) {
-		dev_err(&client->dev,
-			"Need i2c bus that supports protocol mangling\n");
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		dev_err(&client->dev, "Not supported I2C adapter\n");
 		return -ENODEV;
 	}
 
-- 
2.25.1

