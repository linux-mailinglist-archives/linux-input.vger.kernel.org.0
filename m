Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11F171968D4
	for <lists+linux-input@lfdr.de>; Sat, 28 Mar 2020 19:59:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727356AbgC1S7b (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 28 Mar 2020 14:59:31 -0400
Received: from mail-pf1-f202.google.com ([209.85.210.202]:39592 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727193AbgC1S7a (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 28 Mar 2020 14:59:30 -0400
Received: by mail-pf1-f202.google.com with SMTP id x189so11484729pfd.6
        for <linux-input@vger.kernel.org>; Sat, 28 Mar 2020 11:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=RmZqFhOWmJfblEL39xHqmka8Tn/Hx8czxElVow6EI48=;
        b=LsfvxAZTfx0EdEbqJrtv0QvW38sITdabmPyei4aZ2Hy3cyyWY8SsoAvWle9hPf5oDC
         ioejvTsBSCiwQsSjc2tzw9uRHh5zKQM35MiR5Jdej0EAugnnFvynwQezlZKSIaFKf+La
         nIHtqe5HTcqlUdFEb8uGC3sm6xVXOuKjYe9VctUSWq2rT40VMpsnwW1JlzqcHdJ/3ez7
         Iqv4ChmXgPnGbUir4rlt7tTWuh4eaLA4hd2t5DdPvqYnkNloLEfog78LvamAkZV9W4++
         wA5TR4ndSFw18N6W6nDejDarzS/aDW4vxFXuhtAkifBrNPgcvyAUmmDz7Cdr0CFTNk91
         7fOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=RmZqFhOWmJfblEL39xHqmka8Tn/Hx8czxElVow6EI48=;
        b=NwBfv/Y45pep+3JUC4iTAjTkFg99OWcz+RswRNHA/OKeX9um8QxhsU0ZG3TmOjE5oM
         /+tC/7rrVGsA+xhCnFEAkmassJse+aqmuS/iX+tpVNJfpelJK2djGxo8PW/UetpYRSUa
         az4WQ2e1JTcz/Urq2ofHrZr/brg51IA+9L3P/NZbAR2VF+46v1uAuCtB2Dje6Hzny1CT
         WQf//2QekRFW3JtvtU3epT/UiJFVnelVn5M8S+KFjYPACrp1KoLnlFbzVzBEm2srfp+d
         c71iOS7nNb5XrBSX0H28OMh4W47nUbkPcDHZwSEEB334/JL4hUw9L83D1D2BqL5bUg7R
         iyMw==
X-Gm-Message-State: ANhLgQ2extK52ED4zFteAbCZe+kdivnP8nweH5HFgoAAZV9QZGqWv7ES
        NbQ2S5MUAxpC0ytYzcfPyzxObKvENoZD
X-Google-Smtp-Source: ADFU+vuoEMxULA3UhwesqVMltERLeDVP8XgmIuQ9z/hiaou45fh2RQVncRU3HyXUkshQHrnPQy2r2ato9pUj
X-Received: by 2002:a63:4c0b:: with SMTP id z11mr5506572pga.385.1585421969560;
 Sat, 28 Mar 2020 11:59:29 -0700 (PDT)
Date:   Sat, 28 Mar 2020 11:59:14 -0700
In-Reply-To: <20200328185916.98423-1-rajatja@google.com>
Message-Id: <20200328185916.98423-3-rajatja@google.com>
Mime-Version: 1.0
References: <20200328185916.98423-1-rajatja@google.com>
X-Mailer: git-send-email 2.26.0.rc2.310.g2932bb562d-goog
Subject: [PATCH v4 3/5] dt-bindings: input/atkbd.txt: Add binding for "function-row-physmap"
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

Create the documentation for the new introduced property, that
describes the function-row keys physical positions.

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v4: Same as v3
v3: same as v2
v2: Remove the Change-Id from the commit log

 .../devicetree/bindings/input/atkbd.txt       | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/atkbd.txt

diff --git a/Documentation/devicetree/bindings/input/atkbd.txt b/Documentation/devicetree/bindings/input/atkbd.txt
new file mode 100644
index 0000000000000..816653eb8e98d
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/atkbd.txt
@@ -0,0 +1,34 @@
+Device tree bindings for AT / PS2 keyboard device
+
+Optional properties:
+
+	function-row-physmap:
+			An ordered array of the physical codes for the function
+			row keys. Arranged in order from left to right.
+
+Example:
+
+	This is a sample ACPI _DSD node describing the property:
+
+        Name (_DSD, Package () {
+                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
+                Package () {
+                        Package () { "function-row-physmap",
+                                Package () {
+                                        0xEA, /* T1 BACK */
+                                        0xE7, /* T2 REFRESH */
+                                        0x91, /* T3 FULLSCREEN */
+                                        0x92, /* T4 SCALE */
+                                        0x93, /* T5 SNIP */
+                                        0x94, /* T6 BRIGHTNESS_DOWN */
+                                        0x95, /* T7 BRIGHTNESS_UP */
+                                        0x96, /* T8 PRIVACY_SCRN_TOGGLE */
+                                        0x97, /* T9 KBD_BKLIGHT_DOWN */
+                                        0x98, /* T10 KBD_BKLIGHT_UP */
+                                        0xA0, /* T11 VOL_MUTE */
+                                        0xAE, /* T12 VOL_DOWN */
+                                        0xB0, /* T13 VOL_UP */
+                                }
+                        }
+                }
+        })
-- 
2.26.0.rc2.310.g2932bb562d-goog

