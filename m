Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC698B32AB
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2019 01:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728826AbfIOXcN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Sep 2019 19:32:13 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:42170 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfIOXcN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Sep 2019 19:32:13 -0400
Received: by mail-io1-f67.google.com with SMTP id n197so74674282iod.9
        for <linux-input@vger.kernel.org>; Sun, 15 Sep 2019 16:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rmjpMC6xDRTA9GKXzqnCvEiDnrYwokeaJPMkgATpMQw=;
        b=CIGQpKlgLqeKvx+49mUmf0es7q7htpQFKe4NpzVYvvncRJoQuGoMMQXWxSA4Oi5bUe
         mOP+d8uHwOGnVm6j4pj23ZyK3tgwm/FqRKSOaz+0q2bCxZcWSX/PTvekZW9C7vxhWa7v
         IkQbkUD2iyZdOxyokPFrBt5ZoQWYCLXYDeUit16Mxwwgxns6UDlyEYbukGA/bK2LJo2f
         OPnWhYTQDZ47Ld+y2E1PPcNFqgmTsKPtzkVw3rxmHJEI155AsFo61QGBRnMXN4y0VQQF
         fY/Mx7Jmlv+uW3ABEVqnIoiJNj9twTvyUPBo8Q81+yg8VJshKLEgFUZnNrQyp0wKGFf+
         oh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rmjpMC6xDRTA9GKXzqnCvEiDnrYwokeaJPMkgATpMQw=;
        b=ipFTcTuZX/nsf6Kx4ISub/zkw6lk1seBdWCzajnrwfAVdcKTSLYY72LaQgih9wI7A6
         h1rZ+oTkfn+f+AVGyLiJpgKpi4CSUhJs+eTEmcz4gIy8sv9WD0ORLv2Q3UCZiPX5jW4F
         kbEsL9tofBeX5t6T0ACZQg5eyMF1e0gjwyT3Y6U3ca64ZxaLJtKQvvb5pHERxkLaEeDP
         FCxWpmErPZuJNkR0Vh+HbxKVJXN0RaYb/EC6e22VvCooCa+rs1mvt0IUdrNuf7tAVrNX
         4EfUiHGX3uJJYwFdjw9n+QNGuWTx/U33bF8j/Gs1Fo1u1FNponj73FW1+8GRZ0QoLWj+
         sV3Q==
X-Gm-Message-State: APjAAAVv+nRfZ5n7jp9S9BnbyhVsBhlTgkiXUptFloaaZyRVcujBQ/0a
        f4K3oy8Ej2ZipXLhUeQ8myUWADntcXQ=
X-Google-Smtp-Source: APXvYqwFw8Wj4sf8QV43Osh4Na4NxUVCsFTrooWQRwpLDUlblzAMB3xWOflfKX/Xh1df1EuIejxMig==
X-Received: by 2002:a02:9009:: with SMTP id w9mr935949jaf.112.1568590331393;
        Sun, 15 Sep 2019 16:32:11 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.61.189.81])
        by smtp.gmail.com with ESMTPSA id c12sm22620245ioo.67.2019.09.15.16.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2019 16:32:10 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, jbrandst@2ds.eu0, svv@google.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v6 5/6] HID: joycon: add rumble support
Date:   Sun, 15 Sep 2019 18:31:39 -0500
Message-Id: <20190915233140.244347-6-djogorchock@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190915233140.244347-1-djogorchock@gmail.com>
References: <20190915233140.244347-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for controller rumble.

The ff_effect weak magnitude is associated with the pro controller's
right motor (or with a right joy-con). The strong magnitude is
associated with the pro's left motor (or a left joy-con).

The rumble data is sent periodically (currently configured for every 50
milliseconds). If the controller receives no rumble data for too long a
time period, it will stop vibrating. The data is also sent every time
joycon_set_rumble is called to avoid latency of up to 50ms.

Because the rumble subcommands are sent in a deferred workqueue (they
can't be sent in the play_effect function due to the hid send sleeping),
the effects are queued. This ensures that no rumble effect is missed due
to them arriving in too quick of succession.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/Kconfig      |  10 ++
 drivers/hid/hid-joycon.c | 337 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 346 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 54a1a6e068f6..6d916c58ed72 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -477,6 +477,16 @@ config HID_JOYCON
 	To compile this driver as a module, choose M here: the
 	module will be called hid-joycon.
 
+config JOYCON_FF
+	bool "Nintendo Switch controller force feedback support"
+	depends on HID_JOYCON
+	select INPUT_FF_MEMLESS
+	help
+	Say Y here if you have a Nintendo Switch controller and want to enable
+	force feedback support for it. This works for both joy-cons and the pro
+	controller. For the pro controller, both rumble motors can be controlled
+	individually.
+
 config HID_TWINHAN
 	tristate "Twinhan IR remote control"
 	depends on HID
diff --git a/drivers/hid/hid-joycon.c b/drivers/hid/hid-joycon.c
index 920a1894b6ce..7b995fd62ac5 100644
--- a/drivers/hid/hid-joycon.c
+++ b/drivers/hid/hid-joycon.c
@@ -9,6 +9,7 @@
  *   https://gitlab.com/pjranki/joycon-linux-kernel (Peter Rankin)
  *   https://github.com/FrotBot/SwitchProConLinuxUSB
  *   https://github.com/MTCKC/ProconXInput
+ *   https://github.com/Davidobot/BetterJoyForCemu
  *   hid-wiimote kernel hid driver
  *   hid-logitech-hidpp driver
  *   hid-sony driver
@@ -26,6 +27,7 @@
 #include <linux/device.h>
 #include <linux/hid.h>
 #include <linux/input.h>
+#include <linux/jiffies.h>
 #include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/power_supply.h>
@@ -105,6 +107,120 @@ static const u16 JC_MAX_STICK_MAG		= 32767;
 static const u16 JC_STICK_FUZZ			= 250;
 static const u16 JC_STICK_FLAT			= 500;
 
+/* frequency/amplitude tables for rumble */
+struct joycon_rumble_freq_data {
+	u16 high;
+	u8 low;
+	u16 freq; /* Hz*/
+};
+
+struct joycon_rumble_amp_data {
+	u8 high;
+	u16 low;
+	u16 amp;
+};
+
+/*
+ * These tables are from
+ * https://github.com/dekuNukem/Nintendo_Switch_Reverse_Engineering/blob/master/rumble_data_table.md
+ */
+static const struct joycon_rumble_freq_data joycon_rumble_frequencies[] = {
+	/* high, low, freq */
+	{ 0x0000, 0x01,   41 }, { 0x0000, 0x02,   42 }, { 0x0000, 0x03,   43 },
+	{ 0x0000, 0x04,   44 }, { 0x0000, 0x05,   45 }, { 0x0000, 0x06,   46 },
+	{ 0x0000, 0x07,   47 }, { 0x0000, 0x08,   48 }, { 0x0000, 0x09,   49 },
+	{ 0x0000, 0x0A,   50 }, { 0x0000, 0x0B,   51 }, { 0x0000, 0x0C,   52 },
+	{ 0x0000, 0x0D,   53 }, { 0x0000, 0x0E,   54 }, { 0x0000, 0x0F,   55 },
+	{ 0x0000, 0x10,   57 }, { 0x0000, 0x11,   58 }, { 0x0000, 0x12,   59 },
+	{ 0x0000, 0x13,   60 }, { 0x0000, 0x14,   62 }, { 0x0000, 0x15,   63 },
+	{ 0x0000, 0x16,   64 }, { 0x0000, 0x17,   66 }, { 0x0000, 0x18,   67 },
+	{ 0x0000, 0x19,   69 }, { 0x0000, 0x1A,   70 }, { 0x0000, 0x1B,   72 },
+	{ 0x0000, 0x1C,   73 }, { 0x0000, 0x1D,   75 }, { 0x0000, 0x1e,   77 },
+	{ 0x0000, 0x1f,   78 }, { 0x0000, 0x20,   80 }, { 0x0400, 0x21,   82 },
+	{ 0x0800, 0x22,   84 }, { 0x0c00, 0x23,   85 }, { 0x1000, 0x24,   87 },
+	{ 0x1400, 0x25,   89 }, { 0x1800, 0x26,   91 }, { 0x1c00, 0x27,   93 },
+	{ 0x2000, 0x28,   95 }, { 0x2400, 0x29,   97 }, { 0x2800, 0x2a,   99 },
+	{ 0x2c00, 0x2b,  102 }, { 0x3000, 0x2c,  104 }, { 0x3400, 0x2d,  106 },
+	{ 0x3800, 0x2e,  108 }, { 0x3c00, 0x2f,  111 }, { 0x4000, 0x30,  113 },
+	{ 0x4400, 0x31,  116 }, { 0x4800, 0x32,  118 }, { 0x4c00, 0x33,  121 },
+	{ 0x5000, 0x34,  123 }, { 0x5400, 0x35,  126 }, { 0x5800, 0x36,  129 },
+	{ 0x5c00, 0x37,  132 }, { 0x6000, 0x38,  135 }, { 0x6400, 0x39,  137 },
+	{ 0x6800, 0x3a,  141 }, { 0x6c00, 0x3b,  144 }, { 0x7000, 0x3c,  147 },
+	{ 0x7400, 0x3d,  150 }, { 0x7800, 0x3e,  153 }, { 0x7c00, 0x3f,  157 },
+	{ 0x8000, 0x40,  160 }, { 0x8400, 0x41,  164 }, { 0x8800, 0x42,  167 },
+	{ 0x8c00, 0x43,  171 }, { 0x9000, 0x44,  174 }, { 0x9400, 0x45,  178 },
+	{ 0x9800, 0x46,  182 }, { 0x9c00, 0x47,  186 }, { 0xa000, 0x48,  190 },
+	{ 0xa400, 0x49,  194 }, { 0xa800, 0x4a,  199 }, { 0xac00, 0x4b,  203 },
+	{ 0xb000, 0x4c,  207 }, { 0xb400, 0x4d,  212 }, { 0xb800, 0x4e,  217 },
+	{ 0xbc00, 0x4f,  221 }, { 0xc000, 0x50,  226 }, { 0xc400, 0x51,  231 },
+	{ 0xc800, 0x52,  236 }, { 0xcc00, 0x53,  241 }, { 0xd000, 0x54,  247 },
+	{ 0xd400, 0x55,  252 }, { 0xd800, 0x56,  258 }, { 0xdc00, 0x57,  263 },
+	{ 0xe000, 0x58,  269 }, { 0xe400, 0x59,  275 }, { 0xe800, 0x5a,  281 },
+	{ 0xec00, 0x5b,  287 }, { 0xf000, 0x5c,  293 }, { 0xf400, 0x5d,  300 },
+	{ 0xf800, 0x5e,  306 }, { 0xfc00, 0x5f,  313 }, { 0x0001, 0x60,  320 },
+	{ 0x0401, 0x61,  327 }, { 0x0801, 0x62,  334 }, { 0x0c01, 0x63,  341 },
+	{ 0x1001, 0x64,  349 }, { 0x1401, 0x65,  357 }, { 0x1801, 0x66,  364 },
+	{ 0x1c01, 0x67,  372 }, { 0x2001, 0x68,  381 }, { 0x2401, 0x69,  389 },
+	{ 0x2801, 0x6a,  397 }, { 0x2c01, 0x6b,  406 }, { 0x3001, 0x6c,  415 },
+	{ 0x3401, 0x6d,  424 }, { 0x3801, 0x6e,  433 }, { 0x3c01, 0x6f,  443 },
+	{ 0x4001, 0x70,  453 }, { 0x4401, 0x71,  462 }, { 0x4801, 0x72,  473 },
+	{ 0x4c01, 0x73,  483 }, { 0x5001, 0x74,  494 }, { 0x5401, 0x75,  504 },
+	{ 0x5801, 0x76,  515 }, { 0x5c01, 0x77,  527 }, { 0x6001, 0x78,  538 },
+	{ 0x6401, 0x79,  550 }, { 0x6801, 0x7a,  562 }, { 0x6c01, 0x7b,  574 },
+	{ 0x7001, 0x7c,  587 }, { 0x7401, 0x7d,  600 }, { 0x7801, 0x7e,  613 },
+	{ 0x7c01, 0x7f,  626 }, { 0x8001, 0x00,  640 }, { 0x8401, 0x00,  654 },
+	{ 0x8801, 0x00,  668 }, { 0x8c01, 0x00,  683 }, { 0x9001, 0x00,  698 },
+	{ 0x9401, 0x00,  713 }, { 0x9801, 0x00,  729 }, { 0x9c01, 0x00,  745 },
+	{ 0xa001, 0x00,  761 }, { 0xa401, 0x00,  778 }, { 0xa801, 0x00,  795 },
+	{ 0xac01, 0x00,  812 }, { 0xb001, 0x00,  830 }, { 0xb401, 0x00,  848 },
+	{ 0xb801, 0x00,  867 }, { 0xbc01, 0x00,  886 }, { 0xc001, 0x00,  905 },
+	{ 0xc401, 0x00,  925 }, { 0xc801, 0x00,  945 }, { 0xcc01, 0x00,  966 },
+	{ 0xd001, 0x00,  987 }, { 0xd401, 0x00, 1009 }, { 0xd801, 0x00, 1031 },
+	{ 0xdc01, 0x00, 1053 }, { 0xe001, 0x00, 1076 }, { 0xe401, 0x00, 1100 },
+	{ 0xe801, 0x00, 1124 }, { 0xec01, 0x00, 1149 }, { 0xf001, 0x00, 1174 },
+	{ 0xf401, 0x00, 1199 }, { 0xf801, 0x00, 1226 }, { 0xfc01, 0x00, 1253 }
+};
+
+static const u16 joycon_max_rumble_amp = 1003;
+static const struct joycon_rumble_amp_data joycon_rumble_amplitudes[] = {
+	/* high, low, amp */
+	{ 0x00, 0x0040,    0 },
+	{ 0x02, 0x8040,   10 }, { 0x04, 0x0041,   12 }, { 0x06, 0x8041,   14 },
+	{ 0x08, 0x0042,   17 }, { 0x0a, 0x8042,   20 }, { 0x0c, 0x0043,   24 },
+	{ 0x0e, 0x8043,   28 }, { 0x10, 0x0044,   33 }, { 0x12, 0x8044,   40 },
+	{ 0x14, 0x0045,   47 }, { 0x16, 0x8045,   56 }, { 0x18, 0x0046,   67 },
+	{ 0x1a, 0x8046,   80 }, { 0x1c, 0x0047,   95 }, { 0x1e, 0x8047,  112 },
+	{ 0x20, 0x0048,  117 }, { 0x22, 0x8048,  123 }, { 0x24, 0x0049,  128 },
+	{ 0x26, 0x8049,  134 }, { 0x28, 0x004a,  140 }, { 0x2a, 0x804a,  146 },
+	{ 0x2c, 0x004b,  152 }, { 0x2e, 0x804b,  159 }, { 0x30, 0x004c,  166 },
+	{ 0x32, 0x804c,  173 }, { 0x34, 0x004d,  181 }, { 0x36, 0x804d,  189 },
+	{ 0x38, 0x004e,  198 }, { 0x3a, 0x804e,  206 }, { 0x3c, 0x004f,  215 },
+	{ 0x3e, 0x804f,  225 }, { 0x40, 0x0050,  230 }, { 0x42, 0x8050,  235 },
+	{ 0x44, 0x0051,  240 }, { 0x46, 0x8051,  245 }, { 0x48, 0x0052,  251 },
+	{ 0x4a, 0x8052,  256 }, { 0x4c, 0x0053,  262 }, { 0x4e, 0x8053,  268 },
+	{ 0x50, 0x0054,  273 }, { 0x52, 0x8054,  279 }, { 0x54, 0x0055,  286 },
+	{ 0x56, 0x8055,  292 }, { 0x58, 0x0056,  298 }, { 0x5a, 0x8056,  305 },
+	{ 0x5c, 0x0057,  311 }, { 0x5e, 0x8057,  318 }, { 0x60, 0x0058,  325 },
+	{ 0x62, 0x8058,  332 }, { 0x64, 0x0059,  340 }, { 0x66, 0x8059,  347 },
+	{ 0x68, 0x005a,  355 }, { 0x6a, 0x805a,  362 }, { 0x6c, 0x005b,  370 },
+	{ 0x6e, 0x805b,  378 }, { 0x70, 0x005c,  387 }, { 0x72, 0x805c,  395 },
+	{ 0x74, 0x005d,  404 }, { 0x76, 0x805d,  413 }, { 0x78, 0x005e,  422 },
+	{ 0x7a, 0x805e,  431 }, { 0x7c, 0x005f,  440 }, { 0x7e, 0x805f,  450 },
+	{ 0x80, 0x0060,  460 }, { 0x82, 0x8060,  470 }, { 0x84, 0x0061,  480 },
+	{ 0x86, 0x8061,  491 }, { 0x88, 0x0062,  501 }, { 0x8a, 0x8062,  512 },
+	{ 0x8c, 0x0063,  524 }, { 0x8e, 0x8063,  535 }, { 0x90, 0x0064,  547 },
+	{ 0x92, 0x8064,  559 }, { 0x94, 0x0065,  571 }, { 0x96, 0x8065,  584 },
+	{ 0x98, 0x0066,  596 }, { 0x9a, 0x8066,  609 }, { 0x9c, 0x0067,  623 },
+	{ 0x9e, 0x8067,  636 }, { 0xa0, 0x0068,  650 }, { 0xa2, 0x8068,  665 },
+	{ 0xa4, 0x0069,  679 }, { 0xa6, 0x8069,  694 }, { 0xa8, 0x006a,  709 },
+	{ 0xaa, 0x806a,  725 }, { 0xac, 0x006b,  741 }, { 0xae, 0x806b,  757 },
+	{ 0xb0, 0x006c,  773 }, { 0xb2, 0x806c,  790 }, { 0xb4, 0x006d,  808 },
+	{ 0xb6, 0x806d,  825 }, { 0xb8, 0x006e,  843 }, { 0xba, 0x806e,  862 },
+	{ 0xbc, 0x006f,  881 }, { 0xbe, 0x806f,  900 }, { 0xc0, 0x0070,  920 },
+	{ 0xc2, 0x8070,  940 }, { 0xc4, 0x0071,  960 }, { 0xc6, 0x8071,  981 },
+	{ 0xc8, 0x0072, joycon_max_rumble_amp }
+};
+
 /* States for controller state machine */
 enum joycon_ctlr_state {
 	JOYCON_CTLR_STATE_INIT,
@@ -182,6 +298,12 @@ struct joycon_input_report {
 
 #define JC_MAX_RESP_SIZE	(sizeof(struct joycon_input_report) + 35)
 #define JC_NUM_LEDS		4
+#define JC_RUMBLE_DATA_SIZE	8
+#define JC_RUMBLE_QUEUE_SIZE	8
+
+static const u16 JC_RUMBLE_DFLT_LOW_FREQ = 160;
+static const u16 JC_RUMBLE_DFLT_HIGH_FREQ = 320;
+static const u16 JC_RUMBLE_PERIOD_MS = 50;
 
 /* Each physical controller is associated with a joycon_ctlr struct */
 struct joycon_ctlr {
@@ -214,6 +336,17 @@ struct joycon_ctlr {
 	u8 battery_capacity;
 	bool battery_charging;
 	bool host_powered;
+
+	/* rumble */
+	u8 rumble_data[JC_RUMBLE_QUEUE_SIZE][JC_RUMBLE_DATA_SIZE];
+	int rumble_queue_head;
+	int rumble_queue_tail;
+	struct work_struct rumble_worker;
+	unsigned int rumble_msecs;
+	u16 rumble_ll_freq;
+	u16 rumble_lh_freq;
+	u16 rumble_rl_freq;
+	u16 rumble_rh_freq;
 };
 
 static int __joycon_hid_send(struct hid_device *hdev, u8 *data, size_t len)
@@ -270,6 +403,12 @@ static int joycon_send_subcmd(struct joycon_ctlr *ctlr,
 			      size_t data_len)
 {
 	int ret;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ctlr->lock, flags);
+	memcpy(subcmd->rumble_data, ctlr->rumble_data[ctlr->rumble_queue_tail],
+	       JC_RUMBLE_DATA_SIZE);
+	spin_unlock_irqrestore(&ctlr->lock, flags);
 
 	subcmd->output_id = JC_OUTPUT_RUMBLE_AND_SUBCMD;
 	subcmd->packet_num = ctlr->subcmd_num;
@@ -422,6 +561,19 @@ static int joycon_set_report_mode(struct joycon_ctlr *ctlr)
 	return joycon_send_subcmd(ctlr, req, 1);
 }
 
+static int joycon_enable_rumble(struct joycon_ctlr *ctlr, bool enable)
+{
+	struct joycon_subcmd_request *req;
+	u8 buffer[sizeof(*req) + 1] = { 0 };
+
+	req = (struct joycon_subcmd_request *)buffer;
+	req->subcmd_id = JC_SUBCMD_ENABLE_VIBRATION;
+	req->data[0] = enable ? 0x01 : 0x00;
+
+	hid_dbg(ctlr->hdev, "%s rumble\n", enable ? "enabling" : "disabling");
+	return joycon_send_subcmd(ctlr, req, 1);
+}
+
 static s32 joycon_map_stick_val(struct joycon_stick_cal *cal, s32 val)
 {
 	s32 center = cal->center;
@@ -448,10 +600,15 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr, u8 *data)
 	u32 btns;
 	u32 id = ctlr->hdev->product;
 	struct joycon_input_report *rep = (struct joycon_input_report *) data;
+	unsigned long msecs = jiffies_to_msecs(jiffies);
+
+	spin_lock_irqsave(&ctlr->lock, flags);
+	if (IS_ENABLED(CONFIG_JOYCON_FF) && rep->vibrator_report &&
+	    (msecs - ctlr->rumble_msecs) >= JC_RUMBLE_PERIOD_MS)
+		schedule_work(&ctlr->rumble_worker);
 
 	/* Parse the battery status */
 	tmp = rep->bat_con;
-	spin_lock_irqsave(&ctlr->lock, flags);
 	ctlr->host_powered = tmp & BIT(0);
 	ctlr->battery_charging = tmp & BIT(4);
 	tmp = tmp >> 5;
@@ -554,6 +711,161 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr, u8 *data)
 	input_sync(dev);
 }
 
+static void joycon_rumble_worker(struct work_struct *work)
+{
+	struct joycon_ctlr *ctlr = container_of(work, struct joycon_ctlr,
+							rumble_worker);
+	unsigned long flags;
+	bool again = true;
+	int ret;
+
+	while (again) {
+		mutex_lock(&ctlr->output_mutex);
+		ret = joycon_enable_rumble(ctlr, true);
+		mutex_unlock(&ctlr->output_mutex);
+		if (ret < 0)
+			hid_warn(ctlr->hdev, "Failed to set rumble; e=%d", ret);
+
+		spin_lock_irqsave(&ctlr->lock, flags);
+		ctlr->rumble_msecs = jiffies_to_msecs(jiffies);
+		if (ctlr->rumble_queue_tail != ctlr->rumble_queue_head) {
+			if (++ctlr->rumble_queue_tail >= JC_RUMBLE_QUEUE_SIZE)
+				ctlr->rumble_queue_tail = 0;
+		} else {
+			again = false;
+		}
+		spin_unlock_irqrestore(&ctlr->lock, flags);
+	}
+}
+
+#if IS_ENABLED(CONFIG_JOYCON_FF)
+static struct joycon_rumble_freq_data joycon_find_rumble_freq(u16 freq)
+{
+	const size_t length = ARRAY_SIZE(joycon_rumble_frequencies);
+	const struct joycon_rumble_freq_data *data = joycon_rumble_frequencies;
+	int i = 0;
+
+	if (freq > data[0].freq) {
+		for (i = 1; i < length - 1; i++) {
+			if (freq > data[i - 1].freq && freq <= data[i].freq)
+				break;
+		}
+	}
+
+	return data[i];
+}
+
+static struct joycon_rumble_amp_data joycon_find_rumble_amp(u16 amp)
+{
+	const size_t length = ARRAY_SIZE(joycon_rumble_amplitudes);
+	const struct joycon_rumble_amp_data *data = joycon_rumble_amplitudes;
+	int i = 0;
+
+	if (amp > data[0].amp) {
+		for (i = 1; i < length - 1; i++) {
+			if (amp > data[i - 1].amp && amp <= data[i].amp)
+				break;
+		}
+	}
+
+	return data[i];
+}
+
+static void joycon_encode_rumble(u8 *data, u16 freq_low, u16 freq_high, u16 amp)
+{
+	struct joycon_rumble_freq_data freq_data_low;
+	struct joycon_rumble_freq_data freq_data_high;
+	struct joycon_rumble_amp_data amp_data;
+
+	freq_data_low = joycon_find_rumble_freq(freq_low);
+	freq_data_high = joycon_find_rumble_freq(freq_high);
+	amp_data = joycon_find_rumble_amp(amp);
+
+	data[0] = (freq_data_high.high >> 8) & 0xFF;
+	data[1] = (freq_data_high.high & 0xFF) + amp_data.high;
+	data[2] = freq_data_low.low + ((amp_data.low >> 8) & 0xFF);
+	data[3] = amp_data.low & 0xFF;
+}
+
+static const u16 JOYCON_MAX_RUMBLE_HIGH_FREQ	= 1253;
+static const u16 JOYCON_MIN_RUMBLE_HIGH_FREQ	= 82;
+static const u16 JOYCON_MAX_RUMBLE_LOW_FREQ	= 626;
+static const u16 JOYCON_MIN_RUMBLE_LOW_FREQ	= 41;
+
+static void joycon_clamp_rumble_freqs(struct joycon_ctlr *ctlr)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&ctlr->lock, flags);
+	ctlr->rumble_ll_freq = clamp(ctlr->rumble_ll_freq,
+				     JOYCON_MIN_RUMBLE_LOW_FREQ,
+				     JOYCON_MAX_RUMBLE_LOW_FREQ);
+	ctlr->rumble_lh_freq = clamp(ctlr->rumble_lh_freq,
+				     JOYCON_MIN_RUMBLE_HIGH_FREQ,
+				     JOYCON_MAX_RUMBLE_HIGH_FREQ);
+	ctlr->rumble_rl_freq = clamp(ctlr->rumble_rl_freq,
+				     JOYCON_MIN_RUMBLE_LOW_FREQ,
+				     JOYCON_MAX_RUMBLE_LOW_FREQ);
+	ctlr->rumble_rh_freq = clamp(ctlr->rumble_rh_freq,
+				     JOYCON_MIN_RUMBLE_HIGH_FREQ,
+				     JOYCON_MAX_RUMBLE_HIGH_FREQ);
+	spin_unlock_irqrestore(&ctlr->lock, flags);
+}
+
+static int joycon_set_rumble(struct joycon_ctlr *ctlr, u16 amp_r, u16 amp_l,
+			     bool schedule_now)
+{
+	u8 data[JC_RUMBLE_DATA_SIZE];
+	u16 amp;
+	u16 freq_r_low;
+	u16 freq_r_high;
+	u16 freq_l_low;
+	u16 freq_l_high;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ctlr->lock, flags);
+	freq_r_low = ctlr->rumble_rl_freq;
+	freq_r_high = ctlr->rumble_rh_freq;
+	freq_l_low = ctlr->rumble_ll_freq;
+	freq_l_high = ctlr->rumble_lh_freq;
+	spin_unlock_irqrestore(&ctlr->lock, flags);
+
+	/* right joy-con */
+	amp = amp_r * (u32)joycon_max_rumble_amp / 65535;
+	joycon_encode_rumble(data + 4, freq_r_low, freq_r_high, amp);
+
+	/* left joy-con */
+	amp = amp_l * (u32)joycon_max_rumble_amp / 65535;
+	joycon_encode_rumble(data, freq_l_low, freq_l_high, amp);
+
+	spin_lock_irqsave(&ctlr->lock, flags);
+	if (++ctlr->rumble_queue_head >= JC_RUMBLE_QUEUE_SIZE)
+		ctlr->rumble_queue_head = 0;
+	memcpy(ctlr->rumble_data[ctlr->rumble_queue_head], data,
+	       JC_RUMBLE_DATA_SIZE);
+	spin_unlock_irqrestore(&ctlr->lock, flags);
+
+	/* don't wait for the periodic send (reduces latency) */
+	if (schedule_now)
+		schedule_work(&ctlr->rumble_worker);
+
+	return 0;
+}
+
+static int joycon_play_effect(struct input_dev *dev, void *data,
+						     struct ff_effect *effect)
+{
+	struct joycon_ctlr *ctlr = input_get_drvdata(dev);
+
+	if (effect->type != FF_RUMBLE)
+		return 0;
+
+	return joycon_set_rumble(ctlr,
+				 effect->u.rumble.weak_magnitude,
+				 effect->u.rumble.strong_magnitude,
+				 true);
+}
+#endif /* IS_ENABLED(CONFIG_JOYCON_FF) */
 
 static const unsigned int joycon_button_inputs[] = {
 	BTN_SELECT, BTN_Z, BTN_THUMBL,
@@ -621,6 +933,19 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 		input_set_capability(ctlr->input, EV_KEY,
 				     joycon_button_inputs[i]);
 
+#if IS_ENABLED(CONFIG_JOYCON_FF)
+	/* set up rumble */
+	input_set_capability(ctlr->input, EV_FF, FF_RUMBLE);
+	input_ff_create_memless(ctlr->input, NULL, joycon_play_effect);
+	ctlr->rumble_ll_freq = JC_RUMBLE_DFLT_LOW_FREQ;
+	ctlr->rumble_lh_freq = JC_RUMBLE_DFLT_HIGH_FREQ;
+	ctlr->rumble_rl_freq = JC_RUMBLE_DFLT_LOW_FREQ;
+	ctlr->rumble_rh_freq = JC_RUMBLE_DFLT_HIGH_FREQ;
+	joycon_clamp_rumble_freqs(ctlr);
+	joycon_set_rumble(ctlr, 0, 0, false);
+	ctlr->rumble_msecs = jiffies_to_msecs(jiffies);
+#endif
+
 	ret = input_register_device(ctlr->input);
 	if (ret)
 		goto err;
@@ -971,10 +1296,13 @@ static int joycon_hid_probe(struct hid_device *hdev,
 
 	ctlr->hdev = hdev;
 	ctlr->ctlr_state = JOYCON_CTLR_STATE_INIT;
+	ctlr->rumble_queue_head = JC_RUMBLE_QUEUE_SIZE - 1;
+	ctlr->rumble_queue_tail = 0;
 	hid_set_drvdata(hdev, ctlr);
 	mutex_init(&ctlr->output_mutex);
 	init_waitqueue_head(&ctlr->wait);
 	spin_lock_init(&ctlr->lock);
+	INIT_WORK(&ctlr->rumble_worker, joycon_rumble_worker);
 
 	ret = hid_parse(hdev);
 	if (ret) {
@@ -1031,6 +1359,13 @@ static int joycon_hid_probe(struct hid_device *hdev,
 		goto err_mutex;
 	}
 
+	/* Enable rumble */
+	ret = joycon_enable_rumble(ctlr, true);
+	if (ret) {
+		hid_err(hdev, "Failed to enable rumble; ret=%d\n", ret);
+		goto err_mutex;
+	}
+
 	mutex_unlock(&ctlr->output_mutex);
 
 	ret = joycon_input_create(ctlr);
-- 
2.23.0

