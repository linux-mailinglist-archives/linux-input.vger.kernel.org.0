Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3E41968D2
	for <lists+linux-input@lfdr.de>; Sat, 28 Mar 2020 19:59:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727491AbgC1S7i (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 28 Mar 2020 14:59:38 -0400
Received: from mail-yb1-f202.google.com ([209.85.219.202]:46146 "EHLO
        mail-yb1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727447AbgC1S7g (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 28 Mar 2020 14:59:36 -0400
Received: by mail-yb1-f202.google.com with SMTP id h185so7814659yba.13
        for <linux-input@vger.kernel.org>; Sat, 28 Mar 2020 11:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=SJTEeEKUV6TX+oPumalrivliTEZBzSn7PT5Yeqgsp2I=;
        b=eaJepCUAwlimKsXKMAKNJjSZXgGfYYQs8q1MPuEmLZuJw6/LfxHDz+ro1ySSWGlI21
         /Pdl3c/UX2EZI2gTIB9hMIGkxxtTXR2tDf5liLSZCSH0WSju8OySAWKjKmpyF4bohM3u
         VZ2mHvAFx+oGS4BRTPiRJD9tkI000CowpLcYV7rmrU5RfDKamqS0bqhTvGKsNZXWJHYY
         iosjHw+SyBn6u0qt0i+kUFlBLlYE74Lt/8FaXgzBMngDo6SeJ7FOb8MLu8D40v0jfGQW
         5oDkRcEA5pDmTOTRN3LA9shC/eTPTryav0qiENQ/lpufgJ17FRYORPEZmJMTshC6RZCZ
         Ff0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=SJTEeEKUV6TX+oPumalrivliTEZBzSn7PT5Yeqgsp2I=;
        b=IxHg0alw4ybpRvOFveZPx4+iLGPZQP5wixV0mYW/j5FOJM9pCqhIeGDZZrHjkuNBUL
         HIUjgW82rqLeOLgd8yNs9TIhTA1kjKLFP2TgUsGeB8yEMK5/x+smz3H5L0LXFmDa0HdC
         w39A38PgHPkgmzW1plz9FguND8e1JVppoyw+QLllek37tBhyMvSeYqWziwR/o7jkkb3b
         EEMLQaLT1mFiaKan1VZEK+EOSD/JnpsMBvLN0y7j09bYph8ZE2roJ7zX+/fTkCDq+oBw
         wpr6TbO0oDU3sNyRRX3hnB540UXfjKyEZ3hGSzZ6IhUiOUQkj3YYlMI5L9KSBp58bl1C
         9maA==
X-Gm-Message-State: ANhLgQ1QhufPp9kp/j7lOXej0jBw8cFF6vb9tLm/A/LXr1d6k7UMioBL
        sia0OWa7BYgB8/ZVIF8ibhzia8Uq4eqm
X-Google-Smtp-Source: ADFU+vsI0cZ9NAw9lkP2sgVNhfkx3UtYksWw5uSv9BLEwzeRDk4wXySWY9En8Bk1kv5+Bl0QL15WbBbA35lf
X-Received: by 2002:a25:38d2:: with SMTP id f201mr8070008yba.226.1585421974894;
 Sat, 28 Mar 2020 11:59:34 -0700 (PDT)
Date:   Sat, 28 Mar 2020 11:59:16 -0700
In-Reply-To: <20200328185916.98423-1-rajatja@google.com>
Message-Id: <20200328185916.98423-5-rajatja@google.com>
Mime-Version: 1.0
References: <20200328185916.98423-1-rajatja@google.com>
X-Mailer: git-send-email 2.26.0.rc2.310.g2932bb562d-goog
Subject: [PATCH v4 5/5] dt-bindings: input/atkbd.txt: Add binding info for
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
---
v4: Property name "keymap" -> "linux,keymap"
v3: same as v2
v2: Remove the Change-Id from the commit log

 .../devicetree/bindings/input/atkbd.txt       | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/atkbd.txt b/Documentation/devicetree/bindings/input/atkbd.txt
index 816653eb8e98d..8b6d7e2c55bb6 100644
--- a/Documentation/devicetree/bindings/input/atkbd.txt
+++ b/Documentation/devicetree/bindings/input/atkbd.txt
@@ -6,9 +6,15 @@ Optional properties:
 			An ordered array of the physical codes for the function
 			row keys. Arranged in order from left to right.
 
+	linux,keymap:
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
+                        Package () { "linux,keymap",
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
2.26.0.rc2.310.g2932bb562d-goog

