Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56A672027FE
	for <lists+linux-input@lfdr.de>; Sun, 21 Jun 2020 04:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729127AbgFUCfd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Jun 2020 22:35:33 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:50086 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728992AbgFUCfc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Jun 2020 22:35:32 -0400
Date:   Sun, 21 Jun 2020 02:35:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1592706929;
        bh=QW9ewN/1sB9YnCSdAY/4KXAHg15lQesdKv93SXK471k=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=vdkWaM0L9I/ZhuYSMwHqGFfb2B4XPdSOaXjotXanqXbBO22qYw4EZIoOIbwp7/6Mg
         79PAoBHdP2zZkrz2gN8VRXh8xb9quZ8K9WMR8vBOkaJj9movzO5qEGNPC1V7IQ+D+S
         XSNTqsTUIrW0tk5iTVoNfjxdD6HdKto0TMLem+io=
To:     linux-input@vger.kernel.org
From:   Rob Gill <rrobgill@protonmail.com>
Cc:     Rob Gill <rrobgill@protonmail.com>
Reply-To: Rob Gill <rrobgill@protonmail.com>
Subject: [PATCH] hid Add MODULE_DESCRIPTION entries to input modules
Message-ID: <20200621023507.28772-1-rrobgill@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The user tool modinfo is used to get information on kernel modules, includi=
ng a
description where it is available.

This patch adds a brief MODULE_DESCRIPTION to several hid modules.
(Descriptions taken from source comments)

Signed-off-by: Rob Gill <rrobgill@protonmail.com>
---
 drivers/hid/hid-core.c           | 1 +
 drivers/hid/hid-elo.c            | 1 +
 drivers/hid/hid-keytouch.c       | 1 +
 drivers/hid/hid-logitech-dj.c    | 1 +
 drivers/hid/hid-logitech-hidpp.c | 1 +
 drivers/hid/hid-primax.c         | 1 +
 drivers/hid/hid-sjoy.c           | 2 +-
 drivers/hid/hid-steam.c          | 1 +
 drivers/hid/hid-tivo.c           | 1 +
 drivers/hid/hid-uclogic-core.c   | 1 +
 10 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 359616e3e..677e991cd 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2612,3 +2612,4 @@ MODULE_AUTHOR("Andreas Gal");
 MODULE_AUTHOR("Vojtech Pavlik");
 MODULE_AUTHOR("Jiri Kosina");
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("HID support for Linux");
diff --git a/drivers/hid/hid-elo.c b/drivers/hid/hid-elo.c
index 0d22713a3..629d6cda6 100644
--- a/drivers/hid/hid-elo.c
+++ b/drivers/hid/hid-elo.c
@@ -311,3 +311,4 @@ module_exit(elo_driver_exit);
=20
 MODULE_AUTHOR("Jiri Slaby <jslaby@suse.cz>");
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("HID driver for ELO usb touchscreen 4000/4500");
diff --git a/drivers/hid/hid-keytouch.c b/drivers/hid/hid-keytouch.c
index 73bf8642d..da7bfdafc 100644
--- a/drivers/hid/hid-keytouch.c
+++ b/drivers/hid/hid-keytouch.c
@@ -50,3 +50,4 @@ module_hid_driver(keytouch_driver);
=20
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Jiri Kosina");
+MODULE_DESCRIPTION("HID driver for Keytouch devices");
diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 48dff5d6b..d8c4383a7 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -1910,3 +1910,4 @@ MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Logitech");
 MODULE_AUTHOR("Nestor Lopez Casado");
 MODULE_AUTHOR("nlopezcasad@logitech.com");
+MODULE_DESCRIPTION("HID driver for Logitech receivers");
diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hi=
dpp.c
index 1e1cf8eae..d48f04971 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -30,6 +30,7 @@
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Benjamin Tissoires <benjamin.tissoires@gmail.com>");
 MODULE_AUTHOR("Nestor Lopez Casado <nlopezcasad@logitech.com>");
+MODULE_DESCRIPTION("HIDPP protocol for Logitech receivers");
=20
 static bool disable_raw_mode;
 module_param(disable_raw_mode, bool, 0644);
diff --git a/drivers/hid/hid-primax.c b/drivers/hid/hid-primax.c
index 1e6413d07..8efbb1f3a 100644
--- a/drivers/hid/hid-primax.c
+++ b/drivers/hid/hid-primax.c
@@ -71,3 +71,4 @@ module_hid_driver(px_driver);
=20
 MODULE_AUTHOR("Terry Lambert <tlambert@google.com>");
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("HID driver for primax and similar keyboards");
diff --git a/drivers/hid/hid-sjoy.c b/drivers/hid/hid-sjoy.c
index 49971be7c..248d6300d 100644
--- a/drivers/hid/hid-sjoy.c
+++ b/drivers/hid/hid-sjoy.c
@@ -170,4 +170,4 @@ module_hid_driver(sjoy_driver);
=20
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Jussi Kivilinna");
-
+MODULE_DESCRIPTION("Force feedback support for SmartJoy PLUS PS2->USB adap=
ter");
diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index 6286204d4..5a5770b57 100644
--- a/drivers/hid/hid-steam.c
+++ b/drivers/hid/hid-steam.c
@@ -46,6 +46,7 @@
=20
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Rodrigo Rivas Costa <rodrigorivascosta@gmail.com>");
+MODULE_DESCRIPTION("HID driver for Valve Steam Controller");
=20
 static bool lizard_mode =3D true;
=20
diff --git a/drivers/hid/hid-tivo.c b/drivers/hid/hid-tivo.c
index 68eb08b63..e31cb946d 100644
--- a/drivers/hid/hid-tivo.c
+++ b/drivers/hid/hid-tivo.c
@@ -75,3 +75,4 @@ module_hid_driver(tivo_driver);
=20
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Jarod Wilson <jarod@redhat.com>");
+MODULE_DESCRIPTION("HID driver for TiVo Slide Bluetooth remote");
diff --git a/drivers/hid/hid-uclogic-core.c b/drivers/hid/hid-uclogic-core.=
c
index 86b568037..c5e86a58c 100644
--- a/drivers/hid/hid-uclogic-core.c
+++ b/drivers/hid/hid-uclogic-core.c
@@ -420,3 +420,4 @@ module_hid_driver(uclogic_driver);
 MODULE_AUTHOR("Martin Rusko");
 MODULE_AUTHOR("Nikolai Kondrashov");
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("HID driver for UC-Logic devices");
--=20
2.17.1


