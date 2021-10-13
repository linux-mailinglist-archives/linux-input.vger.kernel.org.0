Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3E9142BEEC
	for <lists+linux-input@lfdr.de>; Wed, 13 Oct 2021 13:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbhJMLcS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Oct 2021 07:32:18 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.22]:10195 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbhJMLcR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Oct 2021 07:32:17 -0400
X-Greylist: delayed 356 seconds by postgrey-1.27 at vger.kernel.org; Wed, 13 Oct 2021 07:32:17 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1634124254;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=FCtuDE1u80YNiJ8AFJazorwhZZNNWexK1KT82oYrAqo=;
    b=K7QYoU2pdc3ZIgCJcgcd2ZmQdtrwZV2DEiLgSZayG2pheNDmKyfG3QvRAL3caZt94c
    Yuz2ISl205/cQMDPbfzThIw8qAGcAk6qAZ/ePnNyMkBmtmtsDOP2GCoCz1wh8Q6U6hvl
    eJDHEhYIbUO50duQ+4aOZGW/Qw2bOyrG2QB4UP2zLLtx9BS0vw1hjNGO/y2BYvpBSm6Q
    SMdDyyKSmYRvECdlEmDBOrGFIvtWwejP+f0E3320ADad4bOyqVJvQ8zjeuijdE/dahy1
    BCGihumwFxfaG3JlzrO3fubtaSFMEIrdQ2RT10+gnwJq5M/M3LksyXBWARcklufj6dTl
    hmsw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL2ZP6Q"
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 AUTH)
    with ESMTPSA id 301038x9DBOD7gI
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 13 Oct 2021 13:24:13 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/2] Input: tm2-touchkey - report scan codes
Date:   Wed, 13 Oct 2021 13:23:04 +0200
Message-Id: <20211013112305.41574-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Report the index of pressed touch key as MSC_SCAN code to userspace
so it is possible to identify which of the keys was pressed (not
just the function that is currently assigned to the key).

This is done similarly also in mcs_touchkey and mpr121_touchkey.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/input/keyboard/tm2-touchkey.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/keyboard/tm2-touchkey.c b/drivers/input/keyboard/tm2-touchkey.c
index 6218b1c682ef..ce40ea2d940f 100644
--- a/drivers/input/keyboard/tm2-touchkey.c
+++ b/drivers/input/keyboard/tm2-touchkey.c
@@ -156,6 +156,8 @@ static irqreturn_t tm2_touchkey_irq_handler(int irq, void *devid)
 		goto out;
 	}
 
+	input_event(touchkey->input_dev, EV_MSC, MSC_SCAN, index);
+
 	if (data & TM2_TOUCHKEY_BIT_PRESS_EV) {
 		for (i = 0; i < touchkey->num_keycodes; i++)
 			input_report_key(touchkey->input_dev,
@@ -250,6 +252,7 @@ static int tm2_touchkey_probe(struct i2c_client *client,
 	touchkey->input_dev->name = TM2_TOUCHKEY_DEV_NAME;
 	touchkey->input_dev->id.bustype = BUS_I2C;
 
+	input_set_capability(touchkey->input_dev, EV_MSC, MSC_SCAN);
 	for (i = 0; i < touchkey->num_keycodes; i++)
 		input_set_capability(touchkey->input_dev, EV_KEY,
 				     touchkey->keycodes[i]);
-- 
2.33.0

