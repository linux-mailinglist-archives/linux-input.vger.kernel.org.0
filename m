Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 829891D45BE
	for <lists+linux-input@lfdr.de>; Fri, 15 May 2020 08:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbgEOGUX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 May 2020 02:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726205AbgEOGUW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 May 2020 02:20:22 -0400
X-Greylist: delayed 368 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 14 May 2020 23:20:21 PDT
Received: from forward100o.mail.yandex.net (forward100o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::600])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA013C05BD09;
        Thu, 14 May 2020 23:20:21 -0700 (PDT)
Received: from mxback6g.mail.yandex.net (mxback6g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:167])
        by forward100o.mail.yandex.net (Yandex) with ESMTP id 22C324AC0FFB;
        Fri, 15 May 2020 09:14:06 +0300 (MSK)
Received: from sas8-b61c542d7279.qloud-c.yandex.net (sas8-b61c542d7279.qloud-c.yandex.net [2a02:6b8:c1b:2912:0:640:b61c:542d])
        by mxback6g.mail.yandex.net (mxback/Yandex) with ESMTP id bA4VsG7Diq-E5l0N6Ia;
        Fri, 15 May 2020 09:14:06 +0300
Received: by sas8-b61c542d7279.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id S7NK2Jjz50-E3TenMqh;
        Fri, 15 May 2020 09:14:04 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jkosina@suse.cz>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   free5lot <mail@free5lot.com>
Subject: [PATCH 5.7-rc5] HID: apple: Swap the Fn and Left Control keys on
 Apple keyboards
Message-ID: <27588684-a25a-83fd-7204-df3d6c20aac1@free5lot.com>
Date:   Fri, 15 May 2020 13:14:00 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: ru
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch allows users to swap the Fn and left Control keys on all Apple
keyboards: internal (e.g. Macbooks) and external (both wired and wireless).
The patch adds a new hid-apple module param: swap_fn_leftctrl (off by default).

Signed-off-by: Zakhar Semenov <mail@free5lot.com>
---
This patch was created to eliminate the inconvenience of having an unusual
order of 4 left-bottom keys on Apple keyboards for GNU+Linux users.
Now it's possible to swap the Fn and left Control keys on Macbooks and
external Apple keyboards and have the same experience as on usual PC layout.

The patch has been heavily tested for about 5 years by community at:
https://github.com/free5lot/hid-apple-patched
The patch is small and straightforward. The modified version of hid-apple
is currently mentioned in wiki-documentation of several major GNU/Linux
distributions (e.g. Ubuntu, Arch, openSUSE).


--- hid-apple.c.orig	2020-05-12 11:06:26.000000000 +0300
+++ hid-apple.c	2020-05-15 20:00:00.000000000 +0300
@@ -51,6 +51,12 @@ MODULE_PARM_DESC(swap_opt_cmd, "Swap the
  		"(For people who want to keep Windows PC keyboard muscle memory. "
  		"[0] = as-is, Mac layout. 1 = swapped, Windows layout.)");

+static unsigned int swap_fn_leftctrl;
+module_param(swap_fn_leftctrl, uint, 0644);
+MODULE_PARM_DESC(swap_fn_leftctrl, "Swap the Fn and left Control keys. "
+		"(For people who want to keep PC keyboard muscle memory. "
+		"[0] = as-is, Mac layout, 1 = swapped, PC layout)");
+
  struct apple_sc {
  	unsigned long quirks;
  	unsigned int fn_on;
@@ -162,6 +168,11 @@ static const struct apple_key_translatio
  	{ }
  };

+static const struct apple_key_translation swapped_fn_leftctrl_keys[] = {
+	{ KEY_FN, KEY_LEFTCTRL },
+	{ }
+};
+
  static const struct apple_key_translation *apple_find_translation(
  		const struct apple_key_translation *table, u16 from)
  {
@@ -183,9 +194,11 @@ static int hidinput_apple_event(struct h
  	bool do_translate;
  	u16 code = 0;

-	if (usage->code == KEY_FN) {
+	u16 fn_keycode = (swap_fn_leftctrl) ? (KEY_LEFTCTRL) : (KEY_FN);
+
+	if (usage->code == fn_keycode) {
  		asc->fn_on = !!value;
-		input_event(input, usage->type, usage->code, value);
+		input_event(input, usage->type, KEY_FN, value);
  		return 1;
  	}

@@ -270,6 +283,14 @@ static int hidinput_apple_event(struct h
  		}
  	}

+	if (swap_fn_leftctrl) {
+		trans = apple_find_translation(swapped_fn_leftctrl_keys, usage->code);
+		if (trans) {
+			input_event(input, usage->type, trans->to, value);
+			return 1;
+		}
+	}
+
  	return 0;
  }

@@ -333,6 +354,11 @@ static void apple_setup_input(struct inp

  	for (trans = apple_iso_keyboard; trans->from; trans++)
  		set_bit(trans->to, input->keybit);
+
+	if (swap_fn_leftctrl) {
+		for (trans = swapped_fn_leftctrl_keys; trans->from; trans++)
+			set_bit(trans->to, input->keybit);
+	}
  }

  static int apple_input_mapping(struct hid_device *hdev, struct hid_input *hi,
