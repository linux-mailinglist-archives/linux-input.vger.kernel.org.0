Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 666935FCF5
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2019 20:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbfGDSa7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Jul 2019 14:30:59 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41184 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727040AbfGDSa6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 4 Jul 2019 14:30:58 -0400
Received: by mail-pf1-f196.google.com with SMTP id m30so3243101pff.8;
        Thu, 04 Jul 2019 11:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=paC7XP+MGJ6PoJ3R2NPttyVKxGnJcIpnnAdo5a1VLqY=;
        b=qMNxVsXijxwND/UqXJfqS/oBGWHUropl/OwukheuI3W9d4410d+JFkE8WJWOs+4Ypw
         xToWI/ux1Jb2V+a2NKnXh57QNIfY8/QpRGuM63hustZvo/zhiRLvrFKRLFll9WPIz2en
         KOTmUDz2BYdkXZ3S58VzcJSwk6le1uXydU/P5/0Px3RAnKTZQc55Ak2dms5A5eXQ/OZJ
         Z1Q0px6hbTX/meC+0yivTVX1MqkahnVgtBsDreWxS6NfVIUz4QxnOWWKH5mTmaa6NC7P
         1Exx1xj82bJu2lAccKgoz9bYazeEQj0u5UTHx2/rSmM1p5sLOaYFQVgb3Kv0XsMDcfMJ
         zTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=paC7XP+MGJ6PoJ3R2NPttyVKxGnJcIpnnAdo5a1VLqY=;
        b=bd92EonqJX9JL1CxDi7aTBqApjJ4RNF5PYFsG9Ts6GwFIC/s24q6B0LqjvQE+gtf62
         rORoxGp3vHHNySQ3wP482YlqWqchLrJR6Jdq3EfNy+eK/SwwBdXLd80APCqF5+HOOIUk
         03Fo9gYkkFIlKON0uII2C1k0pOlMy77EhFH76bkKoH91q2twpDd7t5x1kVZsf2RJX92W
         9NIToZQhKBDhsjolobZYPycPQyfRHUfZFFwkQT1hu9/WNonUSkv6LBBEFIIeGPMuMtGI
         RkaS7Pz7sxD+YnxTsqMfpvGjoa46LcZ38S2JO0KZ07PFuTL+3183fPbHBgvoxxa741XW
         DtQQ==
X-Gm-Message-State: APjAAAUBiLSUaXpHcyI0aHyaUMLbVNRZ12kbEepSaGxVrsSS8v7cgjf9
        HTTS9+3GuaOen+DBQ989pKgD3Da0DDU=
X-Google-Smtp-Source: APXvYqzVAjljoOwjzQAoXjFrqhRotkklVdawn+tvLn6IgOmDmtN1NGbAymDCZf2NgbJ2BgCEuNkHFg==
X-Received: by 2002:a63:724f:: with SMTP id c15mr16567263pgn.257.1562265057796;
        Thu, 04 Jul 2019 11:30:57 -0700 (PDT)
Received: from localhost.localdomain ([49.34.169.150])
        by smtp.gmail.com with ESMTPSA id f10sm6699177pfd.151.2019.07.04.11.30.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jul 2019 11:30:57 -0700 (PDT)
From:   Shreeya Patel <shreeya.patel23498@gmail.com>
To:     skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        dmitry.torokhov@gmail.com, corbet@lwn.net,
        gregkh@linuxfoundation.org, linux-input@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH] Documentation: input: Add HID gadget driver's docs to Input subsystem
Date:   Fri,  5 Jul 2019 00:00:48 +0530
Message-Id: <20190704183048.32360-1-shreeya.patel23498@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Convert gadget_hid file to ReST format, in order to allow it to
be parsed by Sphinx.
Also move the file in the Input subsystem documentation so as to
put it in the right place.

Signed-off-by: Shreeya Patel <shreeya.patel23498@gmail.com>
---
 .../devices/gadget_hid.rst}                        | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)
 rename Documentation/{usb/gadget_hid.txt => input/devices/gadget_hid.rst} (96%)

diff --git a/Documentation/usb/gadget_hid.txt b/Documentation/input/devices/gadget_hid.rst
similarity index 96%
rename from Documentation/usb/gadget_hid.txt
rename to Documentation/input/devices/gadget_hid.rst
index 098d563040cc..132a8d6719f0 100644
--- a/Documentation/usb/gadget_hid.txt
+++ b/Documentation/input/devices/gadget_hid.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
 ===========================
 Linux USB HID gadget driver
 ===========================
@@ -8,15 +10,15 @@ Introduction
 The HID Gadget driver provides emulation of USB Human Interface
 Devices (HID). The basic HID handling is done in the kernel,
 and HID reports can be sent/received through I/O on the
-/dev/hidgX character devices.
+:file:`/dev/hidgX` character devices.
 
 For more details about HID, see the developer page on
-http://www.usb.org/developers/hidpage/
+`<http://www.usb.org/developers/hidpage/>`_
 
 Configuration
 =============
 
-g_hid is a platform driver, so to use it you need to add
+*g_hid* is a platform driver, so to use it you need to add
 struct platform_device(s) to your platform code defining the
 HID function descriptors you want to use - E.G. something
 like::
@@ -89,16 +91,16 @@ Send and receive HID reports
 ============================
 
 HID reports can be sent/received using read/write on the
-/dev/hidgX character devices. See below for an example program
+:file:`/dev/hidgX` character devices. See below for an example program
 to do this.
 
-hid_gadget_test is a small interactive program to test the HID
+*hid_gadget_test* is a small interactive program to test the HID
 gadget driver. To use, point it at a hidg device and set the
 device type (keyboard / mouse / joystick) - E.G.::
 
 	# hid_gadget_test /dev/hidg0 keyboard
 
-You are now in the prompt of hid_gadget_test. You can type any
+You are now in the prompt of *hid_gadget_test*. You can type any
 combination of options and values. Available options and
 values are listed at program start. In keyboard mode you can
 send up to six values.
-- 
2.17.1

