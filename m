Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA8C190DB1
	for <lists+linux-input@lfdr.de>; Tue, 24 Mar 2020 13:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727640AbgCXMfr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Mar 2020 08:35:47 -0400
Received: from mail-pl1-f201.google.com ([209.85.214.201]:51587 "EHLO
        mail-pl1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727600AbgCXMfr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Mar 2020 08:35:47 -0400
Received: by mail-pl1-f201.google.com with SMTP id d4so11826272plr.18
        for <linux-input@vger.kernel.org>; Tue, 24 Mar 2020 05:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=WTtDeohiw28fP+FvwRacg/QdAzt+SACVEqfc7+VrrSs=;
        b=lmK5dE4xTioOUJb0kqqlE/hDhMU+igvmxfqo3tYMIzpmNIebEgeymGk+5oMOWxFmIj
         Pa2/c+eASLAY0I3zgTuNOwPm2KyoWnMGqTGOgRudAJ7DuGjOrbQ+nfkeVqy6SW2CdF5f
         1X6OmYom+zE7upFb4x+c77B16NLNxIxthW7Uv85WM7VBSUCRjJ7dxWqfn+NOVM/riz0E
         9zLBb+L4QkBF4hdFi11MwfzYQ84DvoBgTOID/yj0VdXGKkogD22BDvlXkyq4C0f1iGoW
         3Odza5xi4FS800WcDU4RONs1v5cElgzmCCZojxOKIYSQ56ibQQSJfuSEOd8ZTcTNr3zk
         OTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=WTtDeohiw28fP+FvwRacg/QdAzt+SACVEqfc7+VrrSs=;
        b=tiYb0+PnBNUhgLHuP2POKySJyOTobajeT1iQ7D9IWTWRaDwP2l0YBB2bkn6raG3CDq
         X7h8UARqwiteNT7jgofIooseFrkC+5+2CYU5BhSK/ild2iBir5367a7Yd9Q4d4b6eXQ+
         viDTQywuibIbJf1v5gpF7OFdsSSDdywGyBLJboI8AoNxUo5mf4Y+gb7GpNo2MxXaiDut
         NFi3R026wcBEbVL2svCyLtA9BnGAVdEDTcvntmpbr1YoozLtOxrqwCNbLrsIxZny2dHM
         SmgLf6T3gXkGjjvB9IpRZWE3HpGLo6Ox61IZPqIaGJPbAdGD7icFN/A1tAkRwakcwYx3
         /dEQ==
X-Gm-Message-State: ANhLgQ3UwdcoAUz9B5jp3OW70sencrXWMELoq+1taTqSWRCoRYbIgwh5
        ioCvEPhIhZDoVly2ZiaoNYISR2cE/GRL
X-Google-Smtp-Source: ADFU+vsJs0BHAEl02/RH514VKhmIhuqhq3TQF2u/DvRz5zc4EnAPY3XIZDO/SZ6Wje9PY0p9EzHI7QG7CyVw
X-Received: by 2002:a17:90b:300b:: with SMTP id hg11mr5035346pjb.181.1585053346423;
 Tue, 24 Mar 2020 05:35:46 -0700 (PDT)
Date:   Tue, 24 Mar 2020 05:35:17 -0700
In-Reply-To: <20200324123518.239768-1-rajatja@google.com>
Message-Id: <20200324123518.239768-4-rajatja@google.com>
Mime-Version: 1.0
References: <20200324123518.239768-1-rajatja@google.com>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH v2 4/5] Input: atkbd: Receive and use physcode->keycode
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
v2: Remove the Change-Id from the commit log

 drivers/input/keyboard/atkbd.c | 39 ++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 7623eebef2593..c8017a5707581 100644
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
@@ -236,6 +239,9 @@ struct atkbd {
 
 	u16 function_row_physmap[MAX_FUNCTION_ROW_KEYS];
 	int num_function_row_keys;
+
+	unsigned short fw_keymap[ATKBD_KEYMAP_SIZE];
+	bool use_fw_keymap;
 };
 
 /*
@@ -1045,7 +1051,10 @@ static void atkbd_set_keycode_table(struct atkbd *atkbd)
 	memset(atkbd->keycode, 0, sizeof(atkbd->keycode));
 	bitmap_zero(atkbd->force_release_mask, ATKBD_KEYMAP_SIZE);
 
-	if (atkbd->translated) {
+	if (atkbd->use_fw_keymap) {
+		memcpy(atkbd->keycode, atkbd->fw_keymap,
+		       sizeof(atkbd->keycode));
+	} else if (atkbd->translated) {
 		for (i = 0; i < 128; i++) {
 			scancode = atkbd_unxlate_table[i];
 			atkbd->keycode[i] = atkbd_set2_keycode[scancode];
@@ -1163,7 +1172,9 @@ static void atkbd_parse_fwnode_data(struct serio *serio)
 {
 	struct atkbd *atkbd = serio_get_drvdata(serio);
 	struct device *dev = &serio->dev;
-	int n;
+	int i, n;
+	u32 *ptr;
+	u16 physcode, keycode;
 
 	if (!dev_fwnode(dev))
 		return;
@@ -1176,6 +1187,30 @@ static void atkbd_parse_fwnode_data(struct serio *serio)
 		atkbd->num_function_row_keys = n;
 		dev_info(dev, "FW reported %d function-row key locations\n", n);
 	}
+
+	/* Parse "keymap" property */
+	n = device_property_count_u32(dev, "keymap");
+	if (n > 0 && n <= ATKBD_KEYMAP_SIZE) {
+
+		ptr = kcalloc(n, sizeof(u32), GFP_KERNEL);
+		if (!ptr)
+			return;
+
+		if (device_property_read_u32_array(dev, "keymap", ptr, n)) {
+			dev_err(dev, "problem parsing FW keymap property\n");
+			kfree(ptr);
+			return;
+		}
+
+		for (i = 0; i < n; i++) {
+			physcode = PHYSCODE(ptr[i]);
+			keycode = KEYCODE(ptr[i]);
+			atkbd->fw_keymap[physcode] = keycode;
+		}
+		dev_info(dev, "Using FW keymap (%d keys)\n", n);
+		atkbd->use_fw_keymap = true;
+		kfree(ptr);
+	}
 }
 
 /*
-- 
2.25.1.696.g5e7596f4ac-goog

