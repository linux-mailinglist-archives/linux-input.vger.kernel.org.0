Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 451841C0D6
	for <lists+linux-input@lfdr.de>; Tue, 14 May 2019 05:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbfENDMS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 May 2019 23:12:18 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39703 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbfENDMS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 May 2019 23:12:18 -0400
Received: by mail-pg1-f193.google.com with SMTP id w22so7816930pgi.6
        for <linux-input@vger.kernel.org>; Mon, 13 May 2019 20:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0GDulMj3XG7J6SNVyHq7tr4H7yGNWhBU00X4VEgJSCk=;
        b=P2Kny7bVMHytS634Hz48ImWvwOkrCZTGt6IAiIzUK8Np5+vE5YEs7t1pefb4nmEuLn
         a/tSi8JH+qGW3JiJHcqqQZ/NUIAbdFcMBqtnLoixhaxikdMJL3gAompYxAsx9CKH6lTD
         A7WgiQlGWDwhvClIO+uLrAL1lMpgo/dy5EGEsw+z461dLxF2rnk36JofCr6WrfTnz9As
         bBtS64kW5sw00ZUELRvlodWegwPjdrAiCCt4qEUttb51wDO0iGCA4AQ2F10B2klNnrrY
         nKwAiv1m9Q8ZuIEMw1rfeckyhWlljHEfRhrzIC/uTVCSxzVnOemwtaMTigXZG7v7Hfkm
         9LKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0GDulMj3XG7J6SNVyHq7tr4H7yGNWhBU00X4VEgJSCk=;
        b=DzMyk55v5WasOAYrKwpaSLuyDqyMmf0xSVu+0vLdwyvm0jiARL2/QOIs35stQ6ALqm
         NsG8z6ryzrLORt/u+XCK9ZEYq+ff3UQiVh8dvNlLLsCpN7+5OzZszTj/70fjgHq/9aL0
         1YgpS1eQmOiHe92LW47AqpkRGphfeuP1TQaNcBblvCQnrwq65YJCjPTxVA63O7zCtxlp
         Z1lErOk5cGDDc93G7txYwtQOuZsjp8bF5xzSjSfETmEyptHpzzBO0qFZ3ssdvOP9m9Sz
         jhSqMe+R8jn3Q4hp4qsdm74muq4fwUyBV81NLSUgbvs2gmDYm5h81XQxa3r1i4zGUFUW
         rObQ==
X-Gm-Message-State: APjAAAU4/AN6ywoaGsfA+rdkxUqw1jrCzj7nBzLWgpGCQQxtzIB+209C
        xVhgGY/ioT0X0gJark5Pt8I=
X-Google-Smtp-Source: APXvYqwMliDqUyPz2NetbFC1sm4I9C4g9cFLMW3dHG/MXRYKDw7sAX6z47cMlg99KA3smkRCyheAfQ==
X-Received: by 2002:a65:480c:: with SMTP id h12mr34772905pgs.266.1557803536967;
        Mon, 13 May 2019 20:12:16 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id m6sm5792207pgr.18.2019.05.13.20.12.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 20:12:15 -0700 (PDT)
Date:   Mon, 13 May 2019 20:12:14 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Daniel Mack <daniel@zonque.org>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH v4 1/2] input: touch: eeti: move ISR code to own function
Message-ID: <20190514031214.GA59902@dtor-ws>
References: <20190429152411.12835-1-daniel@zonque.org>
 <3ed15369-f5cc-5ead-9ede-e543eb6ddcc2@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ed15369-f5cc-5ead-9ede-e543eb6ddcc2@zonque.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Daniel,

On Mon, May 06, 2019 at 04:52:19PM +0200, Daniel Mack wrote:
> Hi Dmitry,
> 
> Is this one good to go in? WDYT?

I wonder if we should combine the 2 and have something like below.

Thanks!


Input: eeti_ts -  read hardware state once after wakeup

From: Daniel Mack <daniel@zonque.org>

For systems in which the touch IRQ is acting as wakeup source, and that do
not support level-driven interrupts, the interrupt controller might not
latch the GPIO IRQ during sleep. In such cases, the interrupt will never
occur again after resume, hence the touch screen appears dead.

To fix this, check for the assertion of the attn gpio, and read form the
controller once in the resume path to read the hardware status and
to arm the IRQ again.

Introduce a mutex to guard eeti_ts_read() against parallel invocations
from different contexts.

Signed-off-by: Daniel Mack <daniel@zonque.org>
Reported-by: Sven Neumann <Sven.Neumann@teufel.de>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/eeti_ts.c |   71 ++++++++++++++++++++++++++++-------
 1 file changed, 56 insertions(+), 15 deletions(-)

diff --git a/drivers/input/touchscreen/eeti_ts.c b/drivers/input/touchscreen/eeti_ts.c
index 7fe41965c5d1..e3aee95344fc 100644
--- a/drivers/input/touchscreen/eeti_ts.c
+++ b/drivers/input/touchscreen/eeti_ts.c
@@ -41,6 +41,7 @@ struct eeti_ts {
 	struct input_dev *input;
 	struct gpio_desc *attn_gpio;
 	struct touchscreen_properties props;
+	struct mutex mutex;
 	bool running;
 };
 
@@ -75,42 +76,80 @@ static void eeti_ts_report_event(struct eeti_ts *eeti, u8 *buf)
 	input_sync(eeti->input);
 }
 
+static int eeti_ts_read(struct eeti_ts *eeti)
+{
+	int len, error;
+	char buf[6];
+
+	len = i2c_master_recv(eeti->client, buf, sizeof(buf));
+	if (len != sizeof(buf)) {
+		error = len < 0 ? len : -EIO;
+		dev_err(&eeti->client->dev,
+			"failed to read touchscreen data: %d\n",
+			error);
+		return error;
+	}
+
+	/* Motion packet */
+	if (buf[0] & 0x80)
+		eeti_ts_report_event(eeti, buf);
+
+	return 0;
+}
+
 static irqreturn_t eeti_ts_isr(int irq, void *dev_id)
 {
 	struct eeti_ts *eeti = dev_id;
-	int len;
 	int error;
-	char buf[6];
+
+	mutex_lock(&eeti->mutex);
 
 	do {
-		len = i2c_master_recv(eeti->client, buf, sizeof(buf));
-		if (len != sizeof(buf)) {
-			error = len < 0 ? len : -EIO;
-			dev_err(&eeti->client->dev,
-				"failed to read touchscreen data: %d\n",
-				error);
+		/*
+		 * If we have attention GPIO, trust it. Otherwise we'll read
+		 * once and exit. We assume that in this case we are using
+		 * level triggered interrupt and it will get raised again
+		 * if/when there is more data.
+		 */
+		if (eeti->attn_gpio &&
+		    !gpiod_get_value_cansleep(eeti->attn_gpio)) {
 			break;
 		}
 
-		if (buf[0] & 0x80) {
-			/* Motion packet */
-			eeti_ts_report_event(eeti, buf);
-		}
-	} while (eeti->running &&
-		 eeti->attn_gpio && gpiod_get_value_cansleep(eeti->attn_gpio));
+		error = eeti_ts_read(eeti);
+		if (error)
+			break;
+
+	} while (eeti->running && eeti->attn_gpio);
 
+	mutex_unlock(&eeti->mutex);
 	return IRQ_HANDLED;
 }
 
 static void eeti_ts_start(struct eeti_ts *eeti)
 {
+	mutex_lock(&eeti->mutex);
+
 	eeti->running = true;
-	wmb();
 	enable_irq(eeti->client->irq);
+
+	/*
+	 * Kick the controller in case we are using edge interrupt and
+	 * we missed our edge while interrupt was disabled. We expect
+	 * the attention GPIO to be wired in this case.
+	 */
+	if (eeti->attn_gpio && gpiod_get_value_cansleep(eeti->attn_gpio))
+		eeti_ts_read(eeti);
+
+	mutex_lock(&eeti->mutex);
 }
 
 static void eeti_ts_stop(struct eeti_ts *eeti)
 {
+	/*
+	 * Not locking here, just setting a flag and expect that the
+	 * interrupt thread will notice the flag eventually.
+	 */
 	eeti->running = false;
 	wmb();
 	disable_irq(eeti->client->irq);
@@ -153,6 +192,8 @@ static int eeti_ts_probe(struct i2c_client *client,
 		return -ENOMEM;
 	}
 
+	mutex_init(&eeti->mutex);
+
 	input = devm_input_allocate_device(dev);
 	if (!input) {
 		dev_err(dev, "Failed to allocate input device.\n");


-- 
Dmitry
