Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9574B1CDC68
	for <lists+linux-input@lfdr.de>; Mon, 11 May 2020 16:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730249AbgEKN73 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 May 2020 09:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730180AbgEKN72 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 May 2020 09:59:28 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21E13C061A0C;
        Mon, 11 May 2020 06:59:28 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id B07652A0A21
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, andrzej.p@collabora.com,
        kernel@collabora.com
Subject: [PATCH 6/6] tty/sysrq: Add configurable handler to execute a compound action
Date:   Mon, 11 May 2020 15:59:18 +0200
Message-Id: <20200511135918.8203-7-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200511135918.8203-1-andrzej.p@collabora.com>
References: <20200511135918.8203-1-andrzej.p@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some userland might want to execute e.g. 'w' (show blocked tasks), followed
by 's' (sync), followed by 1000 ms delay and then followed by 'c' (crash)
upon a single magic SysRq. Or one might want to execute the famous "Raising
Elephants Is So Utterly Boring" action. This patch adds a configurable
handler, triggered with 'C', for this exact purpose. The user specifies the
composition of the compound action using syntax similar to getopt, where
each letter corresponds to an individual action and a colon followed by a
number corresponds to a delay of that many milliseconds, e.g.:

ws:1000c

or

r:100eis:1000ub

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/tty/sysrq.c | 73 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index a6e91e4ae304..bde8de2d5b17 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -19,6 +19,7 @@
 #include <linux/sched/rt.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/task.h>
+#include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/mm.h>
 #include <linux/fs.h>
@@ -446,6 +447,15 @@ static struct sysrq_key_op sysrq_signal_configured_op = {
 	.enable_mask	= SYSRQ_ENABLE_SIGNAL,
 };
 
+static void sysrq_action_compound(int key);
+
+static struct sysrq_key_op sysrq_action_compound_op = {
+	.handler	= sysrq_action_compound,
+	.help_msg	= "execute-compound-action(C)",
+	.action_msg	= "Execute compound action",
+	.enable_mask	= SYSRQ_ENABLE_SIGNAL,
+};
+
 /* Key Operations table and lock */
 static DEFINE_SPINLOCK(sysrq_key_table_lock);
 
@@ -508,7 +518,7 @@ static struct sysrq_key_op *sysrq_key_table[62] = {
 	&sysrq_ftrace_dump_op,		/* z */
 	NULL,				/* A */
 	NULL,				/* B */
-	NULL,				/* C */
+	&sysrq_action_compound_op,	/* C */
 	NULL,				/* D */
 	NULL,				/* E */
 	NULL,				/* F */
@@ -646,6 +656,7 @@ static char *sysrq_signalled;
 static char *sysrq_signalled_parent;
 static char *sysrq_signal;
 static int sysrq_signal_code;
+static char *sysrq_compound_action;
 
 /* Simple translation table for the SysRq keys */
 static const unsigned char sysrq_xlate[KEY_CNT] =
@@ -864,6 +875,61 @@ static void sysrq_signal_configured(int key)
 	read_unlock(&tasklist_lock);
 }
 
+#define SYSRQ_COMPOUND_ACTION_VALIDATE	0
+#define SYSRQ_COMPOUND_ACTION_RUN	1
+
+static int sysrq_process_compound_action(int pass)
+{
+	const char *action = sysrq_compound_action;
+	struct sysrq_key_op *op_p;
+	int ret, delay;
+
+	while (*action) {
+		op_p = __sysrq_get_key_op(*action);
+		if (!op_p)
+			return -EINVAL;
+
+		/* Don't allow calling ourselves recursively */
+		if (op_p == &sysrq_action_compound_op)
+			return -EINVAL;
+
+		if (pass == SYSRQ_COMPOUND_ACTION_RUN)
+			__handle_sysrq(*action, false);
+
+		if (*++action == ':') {
+			ret = sscanf(action++, ":%d", &delay);
+			if (ret < 1) /* we want at least ":[0-9]" => 1 item */
+				return -EINVAL;
+
+			while (*action >= '0' && *action <= '9')
+				++action;
+			if (pass == SYSRQ_COMPOUND_ACTION_RUN)
+				mdelay(delay);
+		}
+	}
+
+	return 0;
+}
+
+static void sysrq_action_compound(int key)
+{
+	if (!sysrq_compound_action) {
+		pr_err("Unconfigured compound action for %s",
+		       sysrq_action_compound_op.help_msg);
+
+		return;
+	}
+
+	if (sysrq_process_compound_action(SYSRQ_COMPOUND_ACTION_VALIDATE)) {
+		pr_err("Incorrect compound action %s for %s",
+		       sysrq_compound_action,
+		       sysrq_action_compound_op.help_msg);
+
+		return;
+	}
+
+	sysrq_process_compound_action(SYSRQ_COMPOUND_ACTION_RUN);
+}
 
 static void sysrq_reinject_alt_sysrq(struct work_struct *work)
 {
@@ -1165,12 +1231,17 @@ module_param(sysrq_signalled, charp, 0644);
 module_param(sysrq_signalled_parent, charp, 0644);
 module_param(sysrq_signal, charp, 0644);
 
+module_param(sysrq_compound_action, charp, 0644);
 #else
 
 static void sysrq_signal_configured(int key)
 {
 }
 
+static void sysrq_action_compound(int key)
+{
+}
+
 static inline void sysrq_register_handler(void)
 {
 }
-- 
2.17.1

