Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA04123BE12
	for <lists+linux-input@lfdr.de>; Tue,  4 Aug 2020 18:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729664AbgHDQYO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Aug 2020 12:24:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729889AbgHDQYN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Aug 2020 12:24:13 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BA27C06174A;
        Tue,  4 Aug 2020 09:24:11 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id EFC502950FC
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-input@vger.kernel.org, kernel@collabora.com
Subject: [PATCH 1/2] tty/sysrq: Extend the sysrq_key_table to cover capital letters
Date:   Tue,  4 Aug 2020 18:24:01 +0200
Message-Id: <20200804162402.2087-2-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200804162402.2087-1-andrzej.p@collabora.com>
References: <20200804162402.2087-1-andrzej.p@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

All slots in sysrq_key_table[] are either used, reserved or at least
commented with their intended use. This patch adds capital letter versions
available, which means adding 26 more entries.

For already existing SysRq operations the user presses Alt-SysRq-<key>, and
for the newly added ones Alt-Shift-SysRq-<key>.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 Documentation/admin-guide/sysrq.rst |  2 ++
 drivers/tty/sysrq.c                 | 49 +++++++++++++++++++++++++++--
 2 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/sysrq.rst b/Documentation/admin-guide/sysrq.rst
index e6424d8c5846..67dfa4c29093 100644
--- a/Documentation/admin-guide/sysrq.rst
+++ b/Documentation/admin-guide/sysrq.rst
@@ -79,6 +79,8 @@ On all
 
 		echo t > /proc/sysrq-trigger
 
+The :kbd:`<command key>` is case sensitive.
+
 What are the 'command' keys?
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index 7c95afa905a0..52e344bfe8c0 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -442,7 +442,7 @@ static const struct sysrq_key_op sysrq_unrt_op = {
 /* Key Operations table and lock */
 static DEFINE_SPINLOCK(sysrq_key_table_lock);
 
-static const struct sysrq_key_op *sysrq_key_table[36] = {
+static const struct sysrq_key_op *sysrq_key_table[62] = {
 	&sysrq_loglevel_op,		/* 0 */
 	&sysrq_loglevel_op,		/* 1 */
 	&sysrq_loglevel_op,		/* 2 */
@@ -499,6 +499,32 @@ static const struct sysrq_key_op *sysrq_key_table[36] = {
 	/* y: May be registered on sparc64 for global register dump */
 	NULL,				/* y */
 	&sysrq_ftrace_dump_op,		/* z */
+	NULL,				/* A */
+	NULL,				/* B */
+	NULL,				/* C */
+	NULL,				/* D */
+	NULL,				/* E */
+	NULL,				/* F */
+	NULL,				/* G */
+	NULL,				/* H */
+	NULL,				/* I */
+	NULL,				/* J */
+	NULL,				/* K */
+	NULL,				/* L */
+	NULL,				/* M */
+	NULL,				/* N */
+	NULL,				/* O */
+	NULL,				/* P */
+	NULL,				/* Q */
+	NULL,				/* R */
+	NULL,				/* S */
+	NULL,				/* T */
+	NULL,				/* U */
+	NULL,				/* V */
+	NULL,				/* W */
+	NULL,				/* X */
+	NULL,				/* Y */
+	NULL,				/* Z */
 };
 
 /* key2index calculation, -1 on invalid index */
@@ -510,6 +536,8 @@ static int sysrq_key_table_key2index(int key)
 		retval = key - '0';
 	else if ((key >= 'a') && (key <= 'z'))
 		retval = key + 10 - 'a';
+	else if ((key >= 'A') && (key <= 'Z'))
+		retval = key + 36 - 'A';
 	else
 		retval = -1;
 	return retval;
@@ -623,6 +651,8 @@ struct sysrq_state {
 	unsigned long key_down[BITS_TO_LONGS(KEY_CNT)];
 	unsigned int alt;
 	unsigned int alt_use;
+	unsigned int shift;
+	unsigned int shift_use;
 	bool active;
 	bool need_reinject;
 	bool reinjecting;
@@ -807,10 +837,20 @@ static bool sysrq_handle_keypress(struct sysrq_state *sysrq,
 		}
 		break;
 
+	case KEY_LEFTSHIFT:
+	case KEY_RIGHTSHIFT:
+		if (!value)
+			sysrq->shift = KEY_RESERVED;
+		else if (value != 2)
+			sysrq->shift = code;
+		break;
+
 	case KEY_SYSRQ:
 		if (value == 1 && sysrq->alt != KEY_RESERVED) {
 			sysrq->active = true;
 			sysrq->alt_use = sysrq->alt;
+			/* either RESERVED (for released) or actual code */
+			sysrq->shift_use = sysrq->shift;
 			/*
 			 * If nothing else will be pressed we'll need
 			 * to re-inject Alt-SysRq keysroke.
@@ -833,8 +873,13 @@ static bool sysrq_handle_keypress(struct sysrq_state *sysrq,
 
 	default:
 		if (sysrq->active && value && value != 2) {
+			unsigned char c = sysrq_xlate[code];
+
 			sysrq->need_reinject = false;
-			__handle_sysrq(sysrq_xlate[code], true);
+			if (sysrq->shift_use != KEY_RESERVED)
+				if (c >= 'a' && c <= 'z')
+					c &= ~(1 << 5); /* to uppercase */
+			__handle_sysrq(c, true);
 		}
 		break;
 	}
-- 
2.17.1

