Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68ACE1CDC61
	for <lists+linux-input@lfdr.de>; Mon, 11 May 2020 16:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730226AbgEKN71 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 May 2020 09:59:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730180AbgEKN71 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 May 2020 09:59:27 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6554C061A0C;
        Mon, 11 May 2020 06:59:26 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 63B0B2A09FA
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, andrzej.p@collabora.com,
        kernel@collabora.com
Subject: [PATCH 3/6] tty/sysrq: Allow configurable SysRq key
Date:   Mon, 11 May 2020 15:59:15 +0200
Message-Id: <20200511135918.8203-4-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200511135918.8203-1-andrzej.p@collabora.com>
References: <20200511135918.8203-1-andrzej.p@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There are existing machines which don't have SysRq key, e.g. chromebooks.
This patch allows configuring which key acts as SysRq. The value is passed
with sysrq's module parameter.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/tty/sysrq.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index 93202fc24308..ebad9799fdc0 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -604,6 +604,7 @@ EXPORT_SYMBOL(handle_sysrq);
 
 #ifdef CONFIG_INPUT
 static int sysrq_reset_downtime_ms;
+static unsigned short sysrq_key = KEY_SYSRQ;
 
 /* Simple translation table for the SysRq keys */
 static const unsigned char sysrq_xlate[KEY_CNT] =
@@ -735,10 +736,10 @@ static void sysrq_reinject_alt_sysrq(struct work_struct *work)
 
 		/* Simulate press and release of Alt + SysRq */
 		input_inject_event(handle, EV_KEY, alt_code, 1);
-		input_inject_event(handle, EV_KEY, KEY_SYSRQ, 1);
+		input_inject_event(handle, EV_KEY, sysrq_key, 1);
 		input_inject_event(handle, EV_SYN, SYN_REPORT, 1);
 
-		input_inject_event(handle, EV_KEY, KEY_SYSRQ, 0);
+		input_inject_event(handle, EV_KEY, sysrq_key, 0);
 		input_inject_event(handle, EV_KEY, alt_code, 0);
 		input_inject_event(handle, EV_SYN, SYN_REPORT, 1);
 
@@ -770,6 +771,7 @@ static bool sysrq_handle_keypress(struct sysrq_state *sysrq,
 		}
 		break;
 
+key_sysrq:
 	case KEY_SYSRQ:
 		if (value == 1 && sysrq->alt != KEY_RESERVED) {
 			sysrq->active = true;
@@ -790,11 +792,15 @@ static bool sysrq_handle_keypress(struct sysrq_state *sysrq,
 		 * triggering print screen function.
 		 */
 		if (sysrq->active)
-			clear_bit(KEY_SYSRQ, sysrq->handle.dev->key);
+			clear_bit(sysrq_key, sysrq->handle.dev->key);
 
 		break;
 
 	default:
+		/* handle non-default sysrq key */
+		if (code == sysrq_key)
+			goto key_sysrq;
+
 		if (sysrq->active && value && value != 2) {
 			sysrq->need_reinject = false;
 			__handle_sysrq(sysrq_xlate[code], true);
@@ -995,6 +1001,8 @@ module_param_array_named(reset_seq, sysrq_reset_seq, sysrq_reset_seq,
 
 module_param_named(sysrq_downtime_ms, sysrq_reset_downtime_ms, int, 0644);
 
+module_param(sysrq_key, ushort, 0644);
+
 #else
 
 static inline void sysrq_register_handler(void)
-- 
2.17.1

