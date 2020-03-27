Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 951D2194E7D
	for <lists+linux-input@lfdr.de>; Fri, 27 Mar 2020 02:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbgC0Bc5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Mar 2020 21:32:57 -0400
Received: from mail-pl1-f202.google.com ([209.85.214.202]:41570 "EHLO
        mail-pl1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727855AbgC0Bc5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Mar 2020 21:32:57 -0400
Received: by mail-pl1-f202.google.com with SMTP id m9so5860294plt.8
        for <linux-input@vger.kernel.org>; Thu, 26 Mar 2020 18:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=1tcAWU23e/8ucRLXfB8Bf3DPNWWN2Xhk2IPOTZhBJdU=;
        b=b8YClyd+joF1ICbitvFylO2DFCsO8F5g9Ec7xPO+DJ+873ECEI2/mwqWB4pYD4DbSI
         cOELowT0Dia3PdQp60x/0qhnpins6s/pRVrr7F1eb2Sf4dfplZ/S5CtaLgBZ/XzQO9nQ
         vY2PSMbyLbKl4bUY/qw7i9a+A/Moy94kiBd7+1qBBPEz6Ibp9uYCAWfDtFZwpEcU6e3P
         G3K1XwvYbjaeA4ewI1B0tbBBFIWphbp2n/AxLIvWqhMUT/1wKJ/8e2j6A9IMv6caNbeV
         yiKMlbkhoBZQcvbVdZWSAhMpDmc9wEd738zLIShROJRdsTHxnIK6H/paXuh+Gj+N6uKC
         U7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=1tcAWU23e/8ucRLXfB8Bf3DPNWWN2Xhk2IPOTZhBJdU=;
        b=hfLxbnZq6/duk21ZUZBQrsXZ1gptoTpvvbrvqsyF37SOK9eIpNOuy4RAqmXKGYWLud
         ZS8gV6vLu1/YhRUl3twRNE1BsgtHvd3DgQ27C0YUJSVR7j7nCJMMHOVdI7RX5CLw5M6h
         gVPGmrmgv4j+T0tVvsnOTf0wDxuyjHvKBA2L0naxFAJPUckyyQJKOXG/3RUz7LOch7qM
         5wqBAVeM+VLk0IG9FnaX+OoA1Bh73DxaF7Rld/vpxep9tE4AO/icZppatcl9rzG0pat7
         Q0CSWfYmiZck4ffy490MD596eooFrqxaEs6JDgh8CTWcqYOVRYfm8D4C9bNW4ClZHjlE
         H3oQ==
X-Gm-Message-State: ANhLgQ3PbpoUe6f2hDtsf1TnEVRtMDmN+Mgs1qFwhrfM0jLsxwgzgi+F
        GGXPf6MDWoaQV5lCnTzXoXagNsf4/yAw
X-Google-Smtp-Source: ADFU+vvU0Pz1HEuo3Vn8SApjRgiPioPAG2esbBsxvbRVTv3Ql/N7mV0cmtlBo34yI1UQ8TltLwOz2yCR6d0N
X-Received: by 2002:a17:90b:1b01:: with SMTP id nu1mr3059618pjb.129.1585272775898;
 Thu, 26 Mar 2020 18:32:55 -0700 (PDT)
Date:   Thu, 26 Mar 2020 18:32:38 -0700
In-Reply-To: <20200327013239.238182-1-rajatja@google.com>
Message-Id: <20200327013239.238182-4-rajatja@google.com>
Mime-Version: 1.0
References: <20200327013239.238182-1-rajatja@google.com>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH v3 4/5] Input: atkbd: Receive and use physcode->keycode
 mapping from FW
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

Allow the firmware to specify the mapping between the physical
code and the linux keycode. This takes the form of a "keymap"
property which is an array of u32 values, each value specifying
mapping for a key.

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v3: Don't save the FW mapping in atkbd device.
v2: Remove the Change-Id from the commit log

 drivers/input/keyboard/atkbd.c | 41 +++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 3b20aba1861cd..0afa6d5aec3b4 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -66,6 +66,9 @@ MODULE_PARM_DESC(terminal, "Enable break codes on an IBM Terminal keyboard conne
 
 #define MAX_FUNCTION_ROW_KEYS	24
 
+#define PHYSCODE(keymap)	((keymap >> 16) & 0xFFFF)
+#define KEYCODE(keymap)		(keymap & 0xFFFF)
+
 /*
  * Scancode to keycode tables. These are just the default setting, and
  * are loadable via a userland utility.
@@ -1032,6 +1035,38 @@ static unsigned int atkbd_oqo_01plus_scancode_fixup(struct atkbd *atkbd,
 	return code;
 }
 
+static int atkbd_get_keymap_from_fwnode(struct atkbd *atkbd)
+{
+	struct device *dev = &atkbd->ps2dev.serio->dev;
+	int i, n;
+	u32 *ptr;
+	u16 physcode, keycode;
+
+	/* Parse "keymap" property */
+	n = device_property_count_u32(dev, "keymap");
+	if (n <= 0 || n > ATKBD_KEYMAP_SIZE)
+		return -ENXIO;
+
+	ptr = kcalloc(n, sizeof(u32), GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	if (device_property_read_u32_array(dev, "keymap", ptr, n)) {
+		dev_err(dev, "problem parsing FW keymap property\n");
+		kfree(ptr);
+		return -EINVAL;
+	}
+
+	memset(atkbd->keycode, 0, sizeof(atkbd->keycode));
+	for (i = 0; i < n; i++) {
+		physcode = PHYSCODE(ptr[i]);
+		keycode = KEYCODE(ptr[i]);
+		atkbd->keycode[physcode] = keycode;
+	}
+	kfree(ptr);
+	return 0;
+}
+
 /*
  * atkbd_set_keycode_table() initializes keyboard's keycode table
  * according to the selected scancode set
@@ -1039,13 +1074,16 @@ static unsigned int atkbd_oqo_01plus_scancode_fixup(struct atkbd *atkbd,
 
 static void atkbd_set_keycode_table(struct atkbd *atkbd)
 {
+	struct device *dev = &atkbd->ps2dev.serio->dev;
 	unsigned int scancode;
 	int i, j;
 
 	memset(atkbd->keycode, 0, sizeof(atkbd->keycode));
 	bitmap_zero(atkbd->force_release_mask, ATKBD_KEYMAP_SIZE);
 
-	if (atkbd->translated) {
+	if (!atkbd_get_keymap_from_fwnode(atkbd)) {
+		dev_dbg(dev, "Using FW keymap\n");
+	} else if (atkbd->translated) {
 		for (i = 0; i < 128; i++) {
 			scancode = atkbd_unxlate_table[i];
 			atkbd->keycode[i] = atkbd_set2_keycode[scancode];
@@ -1173,6 +1211,7 @@ static void atkbd_parse_fwnode_data(struct serio *serio)
 		atkbd->num_function_row_keys = n;
 		dev_dbg(dev, "FW reported %d function-row key locations\n", n);
 	}
+
 }
 
 /*
-- 
2.25.1.696.g5e7596f4ac-goog

