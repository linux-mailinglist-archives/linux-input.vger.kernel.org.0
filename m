Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 480EF201645
	for <lists+linux-input@lfdr.de>; Fri, 19 Jun 2020 18:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394628AbgFSQ2o (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Jun 2020 12:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394953AbgFSQ2a (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Jun 2020 12:28:30 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EB33C06174E;
        Fri, 19 Jun 2020 09:28:30 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 15E0B2A54CC
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Slaby <jslaby@suse.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        kernel@collabora.com
Subject: [PATCH] tty/sysrq: Add alternative SysRq key
Date:   Fri, 19 Jun 2020 18:28:19 +0200
Message-Id: <20200619162819.715-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200511180145.GU89269@dtor-ws>
References: <20200511180145.GU89269@dtor-ws>
Sender: linux-input-owner@vger.kernel.org
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
 drivers/tty/sysrq.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index 0dc3878794fd..e1d271c84746 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -604,6 +604,7 @@ EXPORT_SYMBOL(handle_sysrq);
 
 #ifdef CONFIG_INPUT
 static int sysrq_reset_downtime_ms;
+static unsigned short alternative_sysrq_key = KEY_F10;
 
 /* Simple translation table for the SysRq keys */
 static const unsigned char sysrq_xlate[KEY_CNT] =
@@ -621,6 +622,7 @@ struct sysrq_state {
 	unsigned long key_down[BITS_TO_LONGS(KEY_CNT)];
 	unsigned int alt;
 	unsigned int alt_use;
+	unsigned short sysrq_key;
 	bool active;
 	bool need_reinject;
 	bool reinjecting;
@@ -770,10 +772,10 @@ static void sysrq_reinject_alt_sysrq(struct work_struct *work)
 
 		/* Simulate press and release of Alt + SysRq */
 		input_inject_event(handle, EV_KEY, alt_code, 1);
-		input_inject_event(handle, EV_KEY, KEY_SYSRQ, 1);
+		input_inject_event(handle, EV_KEY, sysrq->sysrq_key, 1);
 		input_inject_event(handle, EV_SYN, SYN_REPORT, 1);
 
-		input_inject_event(handle, EV_KEY, KEY_SYSRQ, 0);
+		input_inject_event(handle, EV_KEY, sysrq->sysrq_key, 0);
 		input_inject_event(handle, EV_KEY, alt_code, 0);
 		input_inject_event(handle, EV_SYN, SYN_REPORT, 1);
 
@@ -805,6 +807,7 @@ static bool sysrq_handle_keypress(struct sysrq_state *sysrq,
 		}
 		break;
 
+key_sysrq:
 	case KEY_SYSRQ:
 		if (value == 1 && sysrq->alt != KEY_RESERVED) {
 			sysrq->active = true;
@@ -825,11 +828,15 @@ static bool sysrq_handle_keypress(struct sysrq_state *sysrq,
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
 			sysrq->need_reinject = false;
 			__handle_sysrq(sysrq_xlate[code], true);
@@ -924,6 +931,14 @@ static int sysrq_connect(struct input_handler *handler,
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
@@ -1032,6 +1047,13 @@ module_param_array_named(reset_seq, sysrq_reset_seq, sysrq_reset_seq,
 
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

base-commit: 3d77e6a8804abcc0504c904bd6e5cdf3a5cf8162
-- 
2.17.1

