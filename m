Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE79C220D55
	for <lists+linux-input@lfdr.de>; Wed, 15 Jul 2020 14:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731285AbgGOMss (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Jul 2020 08:48:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60160 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731283AbgGOMsr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Jul 2020 08:48:47 -0400
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AAA75DC3;
        Wed, 15 Jul 2020 14:48:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594817326;
        bh=BsaljdVngQRTZfNNDbn0O3nvdotAlMlg3qGbI/5J+bM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KJQcC+6nPrl0RH/Wo12sFtbgyrSoB0REhf+/PoNSDHMDmT3e8i7KEFzsrpOI74RXJ
         bWCq5pB5gcLutAo32RpXEYT9pEkly3wwS3kseAq0i50uFwnndUMSBuxyHXu+8tbmqV
         O9dfHijm+ONTHkyuPno3b/rq8NGH0bHXACErWowQ=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     trivial@kernel.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK
        , TOUCHSCREEN)...), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/8] drivers: input: joystick: Fix trivial spelling
Date:   Wed, 15 Jul 2020 13:48:33 +0100
Message-Id: <20200715124839.252822-3-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200715124839.252822-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200715124839.252822-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The word 'descriptor' is misspelled throughout the tree.

Fix it up accordingly:
    decriptor -> descriptor

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

---
v2:
 Fix commit message to reflect actual word replaced
---
 drivers/input/joystick/spaceball.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/joystick/spaceball.c b/drivers/input/joystick/spaceball.c
index 429411c6c0a8..dc9c1475229e 100644
--- a/drivers/input/joystick/spaceball.c
+++ b/drivers/input/joystick/spaceball.c
@@ -124,7 +124,7 @@ static void spaceball_process_packet(struct spaceball* spaceball)
 }
 
 /*
- * Spaceball 4000 FLX packets all start with a one letter packet-type decriptor,
+ * Spaceball 4000 FLX packets all start with a one letter packet-type descriptor,
  * and end in 0x0d. It uses '^' as an escape for CR, XOFF and XON characters which
  * can occur in the axis values.
  */
-- 
2.25.1

