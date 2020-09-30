Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0DD27E797
	for <lists+linux-input@lfdr.de>; Wed, 30 Sep 2020 13:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgI3LYz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Sep 2020 07:24:55 -0400
Received: from mail.zx2c4.com ([192.95.5.64]:53263 "EHLO mail.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725776AbgI3LYz (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Sep 2020 07:24:55 -0400
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a12748f;
        Wed, 30 Sep 2020 10:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=from:to:cc
        :subject:date:message-id:in-reply-to:references:mime-version
        :content-transfer-encoding; s=mail; bh=erWTKugYs2nRKi1F84yhcavVh
        i0=; b=fqNhjUANTUyiv47D1yKmQgo5uQdCnY9iTgjXGf8UOs/OCMrHQ3wS9pjcV
        2Pxdl7l719aXkufCPBYWk4b758oPVVgtKfWMe7G1lCf70+uzahAKYmssJuxTC528
        KNJzYR8p+TqFLMbs9WHT31hQAHw/Le4EiyMVrlaUCiqOirjbXo3d88AIUugoenfS
        KJgrRJn2Y1XRxvEDHl5gOHmQNxEQPXqnCDM7dRH3VQesz4Jht/D8UN4gQUGaTdns
        LdKkov/pkLLuzNw68ktCvD33a1bmMIuDdVddSjWiO8AqBWkcZZP9pWkcmtcmoP7n
        LlK6DRGhMnv6q75KGfSAczhCywRSw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0e7119de (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Wed, 30 Sep 2020 10:53:09 +0000 (UTC)
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     linux-input@vger.kernel.org,
        Vincent Huang <vincent.huang@tw.synaptics.com>,
        Lyude Paul <lyude@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Chris Heiny <chris.heiny@synaptics.com>
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH v2] Input: synaptics - enable InterTouch for ThinkPad X1E/P1 2nd gen
Date:   Wed, 30 Sep 2020 13:24:37 +0200
Message-Id: <20200930112437.13705-1-Jason@zx2c4.com>
In-Reply-To: <CAHmME9pqrEW5CQbdSm6ckvB0b81ZBZ77CJC45BOqpiuZcgRnXQ@mail.gmail.com>
References: <CAHmME9pqrEW5CQbdSm6ckvB0b81ZBZ77CJC45BOqpiuZcgRnXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

With the new RMI4 F3A support posted yesterday, this appears to maybe
work, but requires us to add support for the newer bootloader, which
this commit does.

Cc: Lyude Paul <lyude@redhat.com>
Cc: Vincent Huang <vincent.huang@tw.synaptics.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 drivers/input/mouse/synaptics.c | 1 +
 drivers/input/rmi4/rmi_f34v7.c  | 7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 8a54efd6eb95..9d6fec84047b 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -180,6 +180,7 @@ static const char * const smbus_pnp_ids[] = {
 	"LEN0096", /* X280 */
 	"LEN0097", /* X280 -> ALPS trackpoint */
 	"LEN0099", /* X1 Extreme 1st */
+	"LEN0402", /* X1 Extreme 2nd */
 	"LEN009b", /* T580 */
 	"LEN200f", /* T450s */
 	"LEN2044", /* L470  */
diff --git a/drivers/input/rmi4/rmi_f34v7.c b/drivers/input/rmi4/rmi_f34v7.c
index 74f7c6f214ff..8cfaa2f19ed5 100644
--- a/drivers/input/rmi4/rmi_f34v7.c
+++ b/drivers/input/rmi4/rmi_f34v7.c
@@ -1364,9 +1364,12 @@ int rmi_f34v7_probe(struct f34_data *f34)
 		f34->bl_version = 6;
 	} else if (f34->bootloader_id[1] == 7) {
 		f34->bl_version = 7;
+	} else if (f34->bootloader_id[1] == 8) {
+		f34->bl_version = 8;
 	} else {
-		dev_err(&f34->fn->dev, "%s: Unrecognized bootloader version\n",
-				__func__);
+		dev_err(&f34->fn->dev, "%s: Unrecognized bootloader version: %d (%c) %d (%c)\n",
+				__func__, f34->bootloader_id[0], f34->bootloader_id[0],
+				f34->bootloader_id[1], f34->bootloader_id[1]);
 		return -EINVAL;
 	}
 
-- 
2.28.0

