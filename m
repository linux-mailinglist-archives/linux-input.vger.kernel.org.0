Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67F4F44513B
	for <lists+linux-input@lfdr.de>; Thu,  4 Nov 2021 10:34:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbhKDJhS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Nov 2021 05:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbhKDJhO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 4 Nov 2021 05:37:14 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B464C061714;
        Thu,  4 Nov 2021 02:34:36 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id CE0121F45F26
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        kernel@collabora.com
Subject: [RFC] tty/sysrq: Add alternative SysRq key
Date:   Thu,  4 Nov 2021 10:34:29 +0100
Message-Id: <20211104093429.16096-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <b4dfb305-38d9-9a92-df76-90b72b93705a@infradead.org>
References: <b4dfb305-38d9-9a92-df76-90b72b93705a@infradead.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There exist machines which don't have SysRq key at all, e.g. chromebooks.

This patch allows configuring an alternative key to act as SysRq. Devices
which declare KEY_SYSRQ in their 'keybit' bitmap continue using KEY_SYSRQ,
but other devices use the alternative SysRq key instead, by default F10.
Which key is actually used can be modified with sysrq's module parameter.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---


A corrected version with completed conflict resolution.



 drivers/tty/sysrq.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index c911196ac893..fb59745b23c9 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -634,6 +634,7 @@ EXPORT_SYMBOL(handle_sysrq);
 
 #ifdef CONFIG_INPUT
 static int sysrq_reset_downtime_ms;
+static unsigned short alternative_sysrq_key = KEY_F10;
 
 /* Simple translation table for the SysRq keys */
 static const unsigned char sysrq_xlate[KEY_CNT] =
@@ -653,6 +654,7 @@ struct sysrq_state {
 	unsigned int alt_use;
 	unsigned int shift;
 	unsigned int shift_use;
+	unsigned short sysrq_key;
 	bool active;
 	bool need_reinject;
 	bool reinjecting;
@@ -802,10 +804,10 @@ static void sysrq_reinject_alt_sysrq(struct work_struct *work)
 
 		/* Simulate press and release of Alt + SysRq */
 		input_inject_event(handle, EV_KEY, alt_code, 1);
-		input_inject_event(handle, EV_KEY, KEY_SYSRQ, 1);
+		input_inject_event(handle, EV_KEY, sysrq->sysrq_key, 1);
 		input_inject_event(handle, EV_SYN, SYN_REPORT, 1);
 
-		input_inject_event(handle, EV_KEY, KEY_SYSRQ, 0);
+		input_inject_event(handle, EV_KEY, sysrq->sysrq_key, 0);
 		input_inject_event(handle, EV_KEY, alt_code, 0);
 		input_inject_event(handle, EV_SYN, SYN_REPORT, 1);
 
@@ -845,6 +847,7 @@ static bool sysrq_handle_keypress(struct sysrq_state *sysrq,
 			sysrq->shift = code;
 		break;
 
+key_sysrq:
 	case KEY_SYSRQ:
 		if (value == 1 && sysrq->alt != KEY_RESERVED) {
 			sysrq->active = true;
@@ -867,11 +870,15 @@ static bool sysrq_handle_keypress(struct sysrq_state *sysrq,
 		 * triggering print screen function.
 		 */
 		if (sysrq->active)
-			clear_bit(KEY_SYSRQ, sysrq->handle.dev->key);
+			clear_bit(sysrq->sysrq_key, sysrq->handle.dev->key);
 
 		break;
 
 	default:
+		/* handle non-default sysrq key */
+		if (code == sysrq->sysrq_key)
+			goto key_sysrq;
+
 		if (sysrq->active && value && value != 2) {
 			unsigned char c = sysrq_xlate[code];
 
@@ -970,6 +977,14 @@ static int sysrq_connect(struct input_handler *handler,
 	sysrq->handle.private = sysrq;
 	timer_setup(&sysrq->keyreset_timer, sysrq_do_reset, 0);
 
+	if (test_bit(KEY_SYSRQ, dev->keybit)) {
+		sysrq->sysrq_key = KEY_SYSRQ;
+		pr_info("%s: using default sysrq key [%x]\n", dev->name, KEY_SYSRQ);
+	} else {
+		sysrq->sysrq_key = alternative_sysrq_key;
+		pr_info("%s: Using alternative sysrq key: [%x]\n", dev->name, sysrq->sysrq_key);
+	}
+
 	error = input_register_handle(&sysrq->handle);
 	if (error) {
 		pr_err("Failed to register input sysrq handler, error %d\n",
@@ -1078,6 +1093,13 @@ module_param_array_named(reset_seq, sysrq_reset_seq, sysrq_reset_seq,
 
 module_param_named(sysrq_downtime_ms, sysrq_reset_downtime_ms, int, 0644);
 
+module_param(alternative_sysrq_key, ushort, 0644);
+MODULE_PARM_DESC(alternative_sysrq_key,
+	"Alternative SysRq key for input devices that don't have SysRq key. F10 by default.\n"
+	"Example\n"
+	"Using F9 as SysRq:\n"
+	"sysrq.alternative_sysrq_key=0x43\n");
+
 #else
 
 static inline void sysrq_register_handler(void)
-- 
2.17.1

