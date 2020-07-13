Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE12021CC68
	for <lists+linux-input@lfdr.de>; Mon, 13 Jul 2020 02:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728816AbgGMAZE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Jul 2020 20:25:04 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:55301 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728198AbgGMAY6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Jul 2020 20:24:58 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4B4ktc4MHzzwr;
        Mon, 13 Jul 2020 02:24:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1594599896; bh=2weffcFDLYZ+KKtI5FuHWep8Oh6R4G1C8jam17qttu0=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=i0Xde1zHcW4bdV8nIJDb6Lux+3+IH2rlLXshhTqtYqaGofZaGUVbxlAhVpXvub8K1
         5xRl3LcfbbSRpV3bdeevt1uYI1b2vizEZ9aRjgDU8LZ5ypMiTRI2wK/zheAe/ssaKV
         o5dZBDfY5ngfRQTBI/L6TEPcM01g8bkmb95Nmzq71GezH5mnIPYuPVWoaWB5hpYuC1
         eMQ5Qdja7Kh1uSwTnuolsmd+vZkQ8A7BYg1NAsoCDzxTgpYzpoV9lm0JtSPhbxKSEd
         wwy4QuKE1HwgbrP/eUABz0RBFdw1+l2p/e7KBNljHelbFLf8ZH6Fw65qv3cM8dsmbg
         sPWOrl9HF2W4w==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.3 at mail
Date:   Mon, 13 Jul 2020 02:24:55 +0200
Message-Id: <cf1dda3a372896cb01033ce084a7deb9620df7aa.1594599118.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1594599118.git.mirq-linux@rere.qmqm.pl>
References: <cover.1594599118.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v6 5/5] input: mt: cleanup open-coded __set_bit()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Henrik Rydberg <rydberg@bitmath.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Scott Liu <scott.liu@emc.com.tw>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Replace open-coded __set_bit() with the function.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/input/input-mt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/input-mt.c b/drivers/input/input-mt.c
index a81e14148407..f699538bdac4 100644
--- a/drivers/input/input-mt.c
+++ b/drivers/input/input-mt.c
@@ -16,7 +16,7 @@ static void copy_abs(struct input_dev *dev, unsigned int dst, unsigned int src)
 	if (dev->absinfo && test_bit(src, dev->absbit)) {
 		dev->absinfo[dst] = dev->absinfo[src];
 		dev->absinfo[dst].fuzz = 0;
-		dev->absbit[BIT_WORD(dst)] |= BIT_MASK(dst);
+		__set_bit(dst, dev->absbit);
 	}
 }
 
-- 
2.20.1

