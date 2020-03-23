Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90496190234
	for <lists+linux-input@lfdr.de>; Tue, 24 Mar 2020 00:46:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727332AbgCWXpX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Mar 2020 19:45:23 -0400
Received: from mail-pf1-f202.google.com ([209.85.210.202]:53848 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727323AbgCWXpX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Mar 2020 19:45:23 -0400
Received: by mail-pf1-f202.google.com with SMTP id i26so12595362pfk.20
        for <linux-input@vger.kernel.org>; Mon, 23 Mar 2020 16:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=K7VFDU7GlU5U4OxUapn6OgbtnHCUEbg6buPZcCk3EXM=;
        b=FJ96uvPEpHjQNRDWex/xGNOmSvOdt1pxL2MVP9Hn8diPXufsanczI0F9UAwO9HFVTX
         AgDe+k3+hRhAyxWUMmJIrgSJpJ2qMRUI+aGSVuv6dNc+zBRwUg5Ub/YbdtHAw5Un5RXS
         d5IiS9DkmsILyrHWrBDYIIQYUkJgqkBlJtY+XQoXuw1slRWB8/1/uarmnWmyKGSkogFP
         40hGgvrLi0bP4NbCEWZIB5CNNHknbs6EDbY04O1VSXN85uELIroHuGM2ksd0R9YD+KyN
         t832C0CLLfJcotEpZqoGckNiIXDgEuc0Nq6WfXCCNgEqx1JzdFkQyi6xFQV+lzGB0zJA
         fWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=K7VFDU7GlU5U4OxUapn6OgbtnHCUEbg6buPZcCk3EXM=;
        b=NT69386cMCoqbgMz2WI3MN38Z7ypFeirpx2qXkaKUDWB/DwL80R9xR/hXE+XZ73JCi
         6wUjq/FVwpLUyIPzBojvQXN5PZ7QsIrtHCFmrAuJpPkqzXo+GdEGFxdVVEjvBdvBHdu/
         gKF4LxMzvS6nCzWlzLXgsdkdUCeMMFpMX46WPP400MMNWf5426zjeKrijQMHypfmBaV/
         7CZu89+OURiyP5XQgk/yCvb1eTlkkZquBuK+js0GEU5qFet9qhX4yrZrvlIFXcUcvBtG
         /XIXxJzK52+hD3AWyAradsOpNFTEcrbkJKiYkwhUaQZl7bARMDEEkzeZv5gETd8bjH74
         Smuw==
X-Gm-Message-State: ANhLgQ39zykGBnPjDcZPU9n5jmUseYbUdM2bvayvW/oTX/l/jzPiRkI/
        R1WDbKXu7fviLP6m4o8+AZQ4uhiWK0Ze
X-Google-Smtp-Source: ADFU+vtzNNZ+frS2k2eYn6AUK9rcW4jYx4Hb49mce2tIaK5oiVCnnrj0ZBd2sKY+xjgd7DejcbjvLfReTdBh
X-Received: by 2002:a17:90a:8586:: with SMTP id m6mr1937984pjn.121.1585007121296;
 Mon, 23 Mar 2020 16:45:21 -0700 (PDT)
Date:   Mon, 23 Mar 2020 16:45:05 -0700
In-Reply-To: <20200323234505.226919-1-rajatja@google.com>
Message-Id: <20200323234505.226919-5-rajatja@google.com>
Mime-Version: 1.0
References: <20200323234505.226919-1-rajatja@google.com>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH RESEND 5/5] dt-bindings: input/atkbd.txt: Add binding info for
 "keymap" property
From:   Rajat Jain <rajatja@google.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>, dtor@google.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajat Jain <rajatja@google.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Enrico Weigelt <info@metux.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, furquan@google.com,
        dlaurie@google.com, bleung@google.com, zentaro@google.com,
        dbehr@google.com
Cc:     rajatxjain@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add the info for keymap property that allows firmware to specify the
mapping from physical code to linux keycode, that the kernel should use.

Signed-off-by: Rajat Jain <rajatja@google.com>
Change-Id: I5226fffc048399f003bc30410d5893f5ab24be08
---
 .../devicetree/bindings/input/atkbd.txt       | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/atkbd.txt b/Documentation/devicetree/bindings/input/atkbd.txt
index 816653eb8e98d..0a0037d70adc8 100644
--- a/Documentation/devicetree/bindings/input/atkbd.txt
+++ b/Documentation/devicetree/bindings/input/atkbd.txt
@@ -6,9 +6,15 @@ Optional properties:
 			An ordered array of the physical codes for the function
 			row keys. Arranged in order from left to right.
 
+	keymap:
+			An array of the u32 entries to specify mapping from the
+			keyboard physcial codes to linux keycodes. The top 16
+			bits of each entry are the physical code, and bottom
+			16 bits are the	linux keycode.
+
 Example:
 
-	This is a sample ACPI _DSD node describing the property:
+	This is a sample ACPI _DSD node describing the properties:
 
         Name (_DSD, Package () {
                 ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
@@ -29,6 +35,25 @@ Example:
                                         0xAE, /* T12 VOL_DOWN */
                                         0xB0, /* T13 VOL_UP */
                                 }
+                        },
+                        Package () { "keymap",
+                                Package () {
+                                        0xEA009E, /* EA -> KEY_BACK */
+                                        0xE700AD, /* E7 -> KEY_REFRESH */
+                                        0x910174, /* 91 -> KEY_FULL_SCREEN */
+                                        0x920078, /* 92 -> KEY_SCALE */
+                                        0x930280, /* 93 -> 0x280 */
+                                        0x9400E0, /* 94 -> KEY_BRIGHTNESS_DOWN*/
+                                        0x9500E1, /* 95 -> KEY_BRIGHTNESS_UP */
+                                        0x960279, /* 96 -> KEY_PRIVACY_SCRN_TOGGLE*/
+                                        0x9700E5, /* 97 -> KEY_KBDILLUMDOWN */
+                                        0x9800E6, /* 98 -> KEY_KBDILLUMUP */
+                                        0xA00071, /* A0 -> KEY_MUTE */
+                                        0xAE0072, /* AE -> KEY_VOLUMEDOWN */
+                                        0xB00073, /* B0 -> KEY_VOLUMEUP */
+					...
+					<snip other entries>
+                                }
                         }
                 }
         })
-- 
2.25.1.696.g5e7596f4ac-goog

