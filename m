Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41FB11CDC65
	for <lists+linux-input@lfdr.de>; Mon, 11 May 2020 16:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730248AbgEKN72 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 May 2020 09:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730214AbgEKN71 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 May 2020 09:59:27 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 437FFC061A0C;
        Mon, 11 May 2020 06:59:27 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id D03052A0A13
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, andrzej.p@collabora.com,
        kernel@collabora.com
Subject: [PATCH 4/6] tty/sysrq: Extend the sysrq_key_table to cover capital letters
Date:   Mon, 11 May 2020 15:59:16 +0200
Message-Id: <20200511135918.8203-5-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200511135918.8203-1-andrzej.p@collabora.com>
References: <20200511135918.8203-1-andrzej.p@collabora.com>
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
 drivers/tty/sysrq.c | 49 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index ebad9799fdc0..ab4121a446b4 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -440,7 +440,7 @@ static struct sysrq_key_op sysrq_unrt_op = {
 /* Key Operations table and lock */
 static DEFINE_SPINLOCK(sysrq_key_table_lock);
 
-static struct sysrq_key_op *sysrq_key_table[36] = {
+static struct sysrq_key_op *sysrq_key_table[62] = {
 	&sysrq_loglevel_op,		/* 0 */
 	&sysrq_loglevel_op,		/* 1 */
 	&sysrq_loglevel_op,		/* 2 */
@@ -497,6 +497,32 @@ static struct sysrq_key_op *sysrq_key_table[36] = {
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
@@ -508,6 +534,8 @@ static int sysrq_key_table_key2index(int key)
 		retval = key - '0';
 	else if ((key >= 'a') && (key <= 'z'))
 		retval = key + 10 - 'a';
+	else if ((key >= 'A') && (key <= 'Z'))
+		retval = key + 36 - 'A';
 	else
 		retval = -1;
 	return retval;
@@ -622,6 +650,8 @@ struct sysrq_state {
 	unsigned long key_down[BITS_TO_LONGS(KEY_CNT)];
 	unsigned int alt;
 	unsigned int alt_use;
+	unsigned int shift;
+	unsigned int shift_use;
 	bool active;
 	bool need_reinject;
 	bool reinjecting;
@@ -771,11 +801,21 @@ static bool sysrq_handle_keypress(struct sysrq_state *sysrq,
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
 key_sysrq:
 	case KEY_SYSRQ:
 		if (value == 1 && sysrq->alt != KEY_RESERVED) {
 			sysrq->active = true;
 			sysrq->alt_use = sysrq->alt;
+			/* either RESERVED (for released) or actual code */
+			sysrq->shift_use = sysrq->shift;
 			/*
 			 * If nothing else will be pressed we'll need
 			 * to re-inject Alt-SysRq keysroke.
@@ -802,8 +842,13 @@ static bool sysrq_handle_keypress(struct sysrq_state *sysrq,
 			goto key_sysrq;
 
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

