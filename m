Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE144194E82
	for <lists+linux-input@lfdr.de>; Fri, 27 Mar 2020 02:33:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbgC0BdD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Mar 2020 21:33:03 -0400
Received: from mail-pl1-f202.google.com ([209.85.214.202]:52024 "EHLO
        mail-pl1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727876AbgC0BdA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Mar 2020 21:33:00 -0400
Received: by mail-pl1-f202.google.com with SMTP id d4so5832423plr.18
        for <linux-input@vger.kernel.org>; Thu, 26 Mar 2020 18:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=KfX4YhNI554hDVYR+6ARHJ1c92FuwzQbetwUIUbSZaQ=;
        b=cOd197Tc0jF8mPH8KVYwd9hJtOaPM0teR5d/aaVBilfpv2fnQq4VdJ8W2OLD9Wvn7g
         OeBDI3TNzKDHKT3W8qc0eDAr2I3PHdckKRs8YTe7xheYA62F6dUCRHYv+/hzH9B5iTcR
         SnY7GQpHxOxHfQo+NejJhn+Gg4cXCF+UOAucPeeLnSRNWVoTYm9hQSaG5JsS990B2pDd
         9XIYxKRa37roipCiSN1F+//suiCaCII2Hu7nCtoWQBWMuTMhslCozyfRLdp4uSPHD7Du
         12h94o8Z90VphWhaQYP5S01wZwMbZow82nU+GLcU9g9jLqFRD8qhpPtcg4+03NBI+BPu
         wZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=KfX4YhNI554hDVYR+6ARHJ1c92FuwzQbetwUIUbSZaQ=;
        b=RJ8oEcqMcoGA+ky4fYGLoaNKUvA+F/EOp7Dy/HeH4PxtvahW8rFa7u2IlcAUAM36zT
         jpHaiufhLLlZ6ePARapSutADC+B+/wcacvDk0bvjGQKy4LyzWa4Q75UaoRrEmBCfHMgI
         hfzTIHvk5nnuqnGdHsv0i8u9vOjAfFlOnrwTUarJDvH2k3LwJmGF/CQ14lj3HavZOFDk
         DSL3BwMsmDNoC6UnamYXxjcTbgqIE9GR+zv7thAG6TSwe8YfLZyORqCQYzy9GwsKl8Es
         jj3/Ycz6ig1SMPoEC9oEQ2cZ37D6oV7n6PTnYLsJe7qkVSOlAeI5YnBI3dsvcfYKFamP
         WW3g==
X-Gm-Message-State: ANhLgQ2RiVNTIt9aWYOCTtsrXDXOUoxl1EHPsoLJnPTiHdzHYTPOa8/p
        Jf7H1mUlpmccE95DqWGWbQD2QvLC9Qzo
X-Google-Smtp-Source: ADFU+vvZVBcF8elF8fTvulona4bRznVutDnKtKKl/DFIzMuaGqA1lxuTP7n4DU222Wk5nXojz7mHQMYTa4xt
X-Received: by 2002:a17:90a:e382:: with SMTP id b2mr2952451pjz.83.1585272778333;
 Thu, 26 Mar 2020 18:32:58 -0700 (PDT)
Date:   Thu, 26 Mar 2020 18:32:39 -0700
In-Reply-To: <20200327013239.238182-1-rajatja@google.com>
Message-Id: <20200327013239.238182-5-rajatja@google.com>
Mime-Version: 1.0
References: <20200327013239.238182-1-rajatja@google.com>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH v3 5/5] dt-bindings: input/atkbd.txt: Add binding info for
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
v3: same as v2
v2: Remove the Change-Id from the commit log

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

