Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 481B6115EC3
	for <lists+linux-input@lfdr.de>; Sat,  7 Dec 2019 22:28:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbfLGV2C (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Dec 2019 16:28:02 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44710 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbfLGV2C (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 7 Dec 2019 16:28:02 -0500
Received: by mail-pf1-f194.google.com with SMTP id d199so5179597pfd.11;
        Sat, 07 Dec 2019 13:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=7QgLAr54tGOQW12CjdWK9YktM6aEfGz9qXMtuVDlq9g=;
        b=NyJhulfYmPdj7HKprRXsHVskPh7P27hTxhtbI6DFcXvCUb/51NK0e+SSWw1x9utR8D
         ScQqTaHmssTJy4vldU+YjmWOdHQscb9eFJD/KiSlDXghNnajY3gIBn4s/QL/U4mZ+AZQ
         AYNLzw1Qudb+WV4ZjK7USdB5euE4QX/7syBuRbTzsdBB6btC+NRBcyS2JYXsutMP2AiC
         t6M+3rokj140i3YCZpFx9b7+1ySUYISlziShW7/9clQq5V3srlEE3XyscKGT5zVQmaHH
         t1GmZVJCzgYsI0RGwY7uiKvVVTYsc9WYWGx6Y5oRuDCu2G5e/OmqE3Jn+mqKH5Vp8gWI
         /JMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=7QgLAr54tGOQW12CjdWK9YktM6aEfGz9qXMtuVDlq9g=;
        b=GUc0yRyR7Dp8SVaXfUAvaoFqw8IEiNbtP2sehpsLRAzozApRjjQt3z3tgBAodnjfgN
         ec3dIm3F5UkkaJmqJZwR/0+FbAbM4RhysPlVSyZVWtFRganIlF4D5bI7IuBAvGuFAPO4
         vkK1yqLJzFpBFJmE3FdH5ns5CQ6l1ZT49E2yG+L81iwsGRnq6qXApDOaFL/qPbDPdYNR
         gQFFAG4zTdZyWY/Sn4lMt75t/oaNSugvFPu+fmyTlBOruMQ5N1YYzrzewoVD+ilmSlvx
         tOKtKayBDvt+ZtVOdUoxAGdXRSSP705PfrJBNNiF1BgNQf4vyD/xdsqlYdsLjExjFe6F
         g1wg==
X-Gm-Message-State: APjAAAX6BI5ZVOtek+EbSN/OGD2W3H6ISjAmbZbqzZFJOsVAUir80jqC
        /8RgF4oQ7l38Cqnq5FIH4AsqHkRf
X-Google-Smtp-Source: APXvYqwhe4ujjXC5uq5o8NemBUi5Ng+G9I71V00uZ7/HhhYIa9EGemCkj5wR8QAYlF1fJBf5+i+UNQ==
X-Received: by 2002:a65:6088:: with SMTP id t8mr3677244pgu.329.1575754080959;
        Sat, 07 Dec 2019 13:28:00 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id a22sm22659292pfk.108.2019.12.07.13.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 13:28:00 -0800 (PST)
Date:   Sat, 7 Dec 2019 13:27:57 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: add safety guards to input_set_keycode()
Message-ID: <20191207212757.GA245964@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If we happen to have a garbage in input device's keycode table with values
too big we'll end up doing clear_bit() with offset way outside of our
bitmaps, damaging other objects within an input device or even outside of
it. Let's add sanity checks to the returned old keycodes.

Reported-by: syzbot+c769968809f9359b07aa@syzkaller.appspotmail.com
Reported-by: syzbot+76f3a30e88d256644c78@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/input.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index 55086279d044..ee6c3234df36 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -878,16 +878,18 @@ static int input_default_setkeycode(struct input_dev *dev,
 		}
 	}
 
-	__clear_bit(*old_keycode, dev->keybit);
-	__set_bit(ke->keycode, dev->keybit);
-
-	for (i = 0; i < dev->keycodemax; i++) {
-		if (input_fetch_keycode(dev, i) == *old_keycode) {
-			__set_bit(*old_keycode, dev->keybit);
-			break; /* Setting the bit twice is useless, so break */
+	if (*old_keycode <= KEY_MAX) {
+		__clear_bit(*old_keycode, dev->keybit);
+		for (i = 0; i < dev->keycodemax; i++) {
+			if (input_fetch_keycode(dev, i) == *old_keycode) {
+				__set_bit(*old_keycode, dev->keybit);
+				/* Setting the bit twice is useless, so break */
+				break;
+			}
 		}
 	}
 
+	__set_bit(ke->keycode, dev->keybit);
 	return 0;
 }
 
@@ -943,9 +945,13 @@ int input_set_keycode(struct input_dev *dev,
 	 * Simulate keyup event if keycode is not present
 	 * in the keymap anymore
 	 */
-	if (test_bit(EV_KEY, dev->evbit) &&
-	    !is_event_supported(old_keycode, dev->keybit, KEY_MAX) &&
-	    __test_and_clear_bit(old_keycode, dev->key)) {
+	if (old_keycode > KEY_MAX) {
+		dev_warn(dev->dev.parent ?: &dev->dev,
+			 "%s: got too big old keycode %#x\n",
+			 __func__, old_keycode);
+	} else if (test_bit(EV_KEY, dev->evbit) &&
+		   !is_event_supported(old_keycode, dev->keybit, KEY_MAX) &&
+		   __test_and_clear_bit(old_keycode, dev->key)) {
 		struct input_value vals[] =  {
 			{ EV_KEY, old_keycode, 0 },
 			input_value_sync
-- 
2.24.0.393.g34dc348eaf-goog


-- 
Dmitry
