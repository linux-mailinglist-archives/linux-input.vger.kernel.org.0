Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE0ABAAA17
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2019 19:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730537AbfIERg6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Sep 2019 13:36:58 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41789 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727143AbfIERg5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Sep 2019 13:36:57 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1i5vgl-00017A-FQ; Thu, 05 Sep 2019 17:36:55 +0000
From:   Colin King <colin.king@canonical.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] input: sidewinder: make array seq static const, makes object smaller
Date:   Thu,  5 Sep 2019 18:36:55 +0100
Message-Id: <20190905173655.5621-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array seq on the stack but instead make it
static const. Makes the object code smaller by 30 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  22284	   3184	      0	  25468	   637c	drivers/input/joystick/sidewinder.o

After:
   text	   data	    bss	    dec	    hex	filename
  22158	   3280	      0	  25438	   635e	drivers/input/joystick/sidewinder.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/input/joystick/sidewinder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/joystick/sidewinder.c b/drivers/input/joystick/sidewinder.c
index 0284da874a2b..1777e68c9f02 100644
--- a/drivers/input/joystick/sidewinder.c
+++ b/drivers/input/joystick/sidewinder.c
@@ -223,7 +223,7 @@ static __u64 sw_get_bits(unsigned char *buf, int pos, int num, char bits)
 
 static void sw_init_digital(struct gameport *gameport)
 {
-	int seq[] = { 140, 140+725, 140+300, 0 };
+	static const int seq[] = { 140, 140+725, 140+300, 0 };
 	unsigned long flags;
 	int i, t;
 
-- 
2.20.1

