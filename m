Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F14021175E0
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2019 20:30:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbfLITax (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 14:30:53 -0500
Received: from frisell.zx2c4.com ([192.95.5.64]:52293 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726342AbfLITaw (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 9 Dec 2019 14:30:52 -0500
X-Greylist: delayed 400 seconds by postgrey-1.27 at vger.kernel.org; Mon, 09 Dec 2019 14:30:52 EST
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f7c4703
        for <linux-input@vger.kernel.org>;
        Mon, 9 Dec 2019 18:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :from:date:message-id:subject:to:cc:content-type; s=mail; bh=211
        g6BPOlMn2VL7a75A4ur0B78o=; b=onl4eZ6deTC6TBpEea536jU3o1S4yvFvfoM
        s1c/a07loIETZxrCpaSj4JN9DaRnaijMykRJ8HQ0cjgL2uRLbHFbB4pwdJ5rkH4/
        RBJWEJE+y78fx76Rx+IkmRbrtk6SMgEkMIi6rI9wevo4FGy/4K0qQp1NOQeTZx3I
        F/OplpdH9J3ogfAg9YcoUBAM/c9dkPm2hmmKL9lWaa49qEWW/bWHe5ovkaeE29da
        IKvkSyVXMOWZJd5wlzF7HhLavUozOW4yusw+ANoaVWR3ojXGgeFR17A03T+zJR4k
        2UtHtmdD4yZkfI0DBouA3I9JvK4dpqn0hhSmArEPTpT/eZg1qtg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bde08968 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
        for <linux-input@vger.kernel.org>;
        Mon, 9 Dec 2019 18:28:44 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id i15so13247588oto.7
        for <linux-input@vger.kernel.org>; Mon, 09 Dec 2019 11:24:11 -0800 (PST)
X-Gm-Message-State: APjAAAX0em50XEgYF3DoJnd/soEMVMxodEbe8VvliYH3W3c9GxXCnGM3
        zd9T7teWzd3PwfDcU7Kpr68hECiBdXuQkd7EhvQ=
X-Google-Smtp-Source: APXvYqwt7AkpO8mmAcY6wjfpATDjsH4XqJkItRjPsaQEfGVpEhKP0PPUQx1bwEXqTq4R5EO/LKy4hFpIKkvtQOy6IfE=
X-Received: by 2002:a05:6830:1141:: with SMTP id x1mr23222250otq.120.1575919450582;
 Mon, 09 Dec 2019 11:24:10 -0800 (PST)
MIME-Version: 1.0
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Mon, 9 Dec 2019 20:23:59 +0100
X-Gmail-Original-Message-ID: <CAHmME9ox9x67LsYV8-6NmSPWgGgPPAvDu1EPF5rE-ub+N5aPeg@mail.gmail.com>
Message-ID: <CAHmME9ox9x67LsYV8-6NmSPWgGgPPAvDu1EPF5rE-ub+N5aPeg@mail.gmail.com>
Subject: RMI4 for Thinkpad X1 Extreme Gen 2 / P1 Gen 2
To:     lyude@redhat.com
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hey Lyude,

I see that you almost enabled RMI4 on the X1E Gen 2 recently, but
reverted after seeing the touchpad mouse buttons didn't work. I was
wondering if you had any more insight as to what's going on. I briefly
looked, and saw that the version the bootloader is returning is an 8
instead of a 7. I tried the below hack, to see if things would work
with the existing v7 driver, but no luck. Do you usually implement
these by reverse engineering the Windows driver, or does Synaptics
release specs, or something else? Currently, not having access to the
Trackpoint speed parameters in serio3 is quite a pain for me, so I'm
interested in fixing this.

Thanks,
Jason

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 1ae6f8bba9ae..b611cd8384a1 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -178,6 +178,7 @@ static const char * const smbus_pnp_ids[] = {
  "LEN0096", /* X280 */
  "LEN0097", /* X280 -> ALPS trackpoint */
  "LEN009b", /* T580 */
+ "LEN0402", /* X1 Extreme 2nd Generation */
  "LEN200f", /* T450s */
  "LEN2054", /* E480 */
  "LEN2055", /* E580 */
diff --git a/drivers/input/rmi4/rmi_f34.c b/drivers/input/rmi4/rmi_f34.c
index e5dca9868f87..4f258909cc1d 100644
--- a/drivers/input/rmi4/rmi_f34.c
+++ b/drivers/input/rmi4/rmi_f34.c
@@ -370,7 +370,7 @@ static int rmi_firmware_update(struct rmi_driver_data *data,

  f34 = dev_get_drvdata(&data->f34_container->dev);

- if (f34->bl_version == 7) {
+ if (f34->bl_version == 7 || f34->bl_version == 8) {
  if (data->pdt_props & HAS_BSR) {
  dev_err(dev, "%s: LTS not supported\n", __func__);
  return -ENODEV;
@@ -382,7 +382,7 @@ static int rmi_firmware_update(struct rmi_driver_data *data,
  }

  /* Enter flash mode */
- if (f34->bl_version == 7)
+ if (f34->bl_version == 7 || f34->bl_version == 8)
  ret = rmi_f34v7_start_reflash(f34, fw);
  else
  ret = rmi_f34_enable_flash(f34);
@@ -413,7 +413,7 @@ static int rmi_firmware_update(struct rmi_driver_data *data,
  f34 = dev_get_drvdata(&data->f34_container->dev);

  /* Perform firmware update */
- if (f34->bl_version == 7)
+ if (f34->bl_version == 7 || f34->bl_version == 8)
  ret = rmi_f34v7_do_reflash(f34, fw);
  else
  ret = rmi_f34_update_firmware(f34, fw);
diff --git a/drivers/input/rmi4/rmi_f34v7.c b/drivers/input/rmi4/rmi_f34v7.c
index 74f7c6f214ff..13b59fb9200e 100644
--- a/drivers/input/rmi4/rmi_f34v7.c
+++ b/drivers/input/rmi4/rmi_f34v7.c
@@ -1364,6 +1364,8 @@ int rmi_f34v7_probe(struct f34_data *f34)
  f34->bl_version = 6;
  } else if (f34->bootloader_id[1] == 7) {
  f34->bl_version = 7;
+ } else if (f34->bootloader_id[1] == 8) {
+ f34->bl_version = 8;
  } else {
  dev_err(&f34->fn->dev, "%s: Unrecognized bootloader version\n",
  __func__);
