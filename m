Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21754194E7C
	for <lists+linux-input@lfdr.de>; Fri, 27 Mar 2020 02:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbgC0Bc4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Mar 2020 21:32:56 -0400
Received: from mail-pf1-f202.google.com ([209.85.210.202]:48449 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727841AbgC0Bc4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Mar 2020 21:32:56 -0400
Received: by mail-pf1-f202.google.com with SMTP id h24so6950311pfn.15
        for <linux-input@vger.kernel.org>; Thu, 26 Mar 2020 18:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=CndPbhEYDs1U4gkN9kz/g201YX5b6/GIUM2pkWkOTok=;
        b=Z2i95AqxFtFVeJnN0ep10o2FLq3PHgLj0xV1jas+TG8DoHR/Ie+akCb78FuKraPzKz
         5aoVGcNUcN8y2qQzoBO0xfnWUftDtaJwhSSJ3j4DqC7DT63Dw4v4mM5VXLzsrlcbEXpp
         5OpEooJMSJpoIbeIy/wyazTFWjJ9rqCjPkliTqDnMNWWtGBW4ip8H6gDpwQmHE6NHRXP
         /e8lpO8XPWTXNUYU4mMInzlM3mpaz/GYK9bJAyiG+oT7KNYz2COa3tO7FBNqBBv4WH6p
         8xOK/8TWkKuoLZwdOSnKmKYVvyr5dewf+biAQDRqc3ncEHidS84Wt9vcPYW49WP4Do7Z
         YUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=CndPbhEYDs1U4gkN9kz/g201YX5b6/GIUM2pkWkOTok=;
        b=iWxPnRC2YctJaNOfmHkJhIPEMiPX1GFVSVIyrF+qygPxLhEq0mE8Dlrfwv3F/sQGB5
         lfWY0xqlV8HogS/dpr0O4suRvU+MsRLE6kMQTErNeN+sg7RAS1yO4XvSTwE6/pCx4OjM
         juoe1vWgjMjs0gjPaiVQMIdsJ/+kpL4iBj7/gsegx/jF5BsMewY3Na3rlAvZwOhRX7O0
         fCZ7TK7TEUNCUsJodYITpYjFELnNBipft8ob4OAGtg6/4zNpT8m0fMht5lcXoiKyjqBE
         65yY/Pf7Evano/lLGKOnnkwx8qnDfJvJ0WNA/rNUebKxdIBnjPDwPgkGheFaShvX8IyN
         0/ag==
X-Gm-Message-State: ANhLgQ2oN5CEG31w3jRiQPwtmbEmX/8s75gC7dvlGIsG0/1Qxp7BxbL7
        UWdtMENYUZ+UpLmR/Mu0mQOso7THx0Qb
X-Google-Smtp-Source: ADFU+vtEHaAqRLOhguRyQ6WDAN2vuYnRbqyv9pgMaWqOyGbQOTVbIoWbvV3BqJHbw+jxXtfx1C87+q2KzjgX
X-Received: by 2002:a63:da4d:: with SMTP id l13mr11745412pgj.216.1585272773528;
 Thu, 26 Mar 2020 18:32:53 -0700 (PDT)
Date:   Thu, 26 Mar 2020 18:32:37 -0700
In-Reply-To: <20200327013239.238182-1-rajatja@google.com>
Message-Id: <20200327013239.238182-3-rajatja@google.com>
Mime-Version: 1.0
References: <20200327013239.238182-1-rajatja@google.com>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH v3 3/5] dt-bindings: input/atkbd.txt: Add binding for "function-row-physmap"
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
2.25.1.696.g5e7596f4ac-goog

