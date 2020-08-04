Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8F3723BE14
	for <lists+linux-input@lfdr.de>; Tue,  4 Aug 2020 18:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729898AbgHDQYY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Aug 2020 12:24:24 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34188 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729884AbgHDQYL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Aug 2020 12:24:11 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 51D2C2950FD
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-input@vger.kernel.org, kernel@collabora.com
Subject: [PATCH 2/2] tty/sysrq: Add configurable handler to execute a compound action
Date:   Tue,  4 Aug 2020 18:24:02 +0200
Message-Id: <20200804162402.2087-3-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200804162402.2087-1-andrzej.p@collabora.com>
References: <20200804162402.2087-1-andrzej.p@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Userland might want to execute e.g. 'w' (show blocked tasks), followed
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
 Documentation/admin-guide/sysrq.rst |  9 ++++
 drivers/tty/sysrq.c                 | 81 ++++++++++++++++++++++++++++-
 include/linux/sysrq.h               |  1 +
 3 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/sysrq.rst b/Documentation/admin-guide/sysrq.rst
index 67dfa4c29093..80bdd8bf9636 100644
--- a/Documentation/admin-guide/sysrq.rst
+++ b/Documentation/admin-guide/sysrq.rst
@@ -32,6 +32,7 @@ to 1. Here is the list of possible values in /proc/sys/kernel/sysrq:
          64 =  0x40 - enable signalling of processes (term, kill, oom-kill)
         128 =  0x80 - allow reboot/poweroff
         256 = 0x100 - allow nicing of all RT tasks
+        512 = 0x200 - allow compound action
 
 You can set the value in the file by the following command::
 
@@ -148,6 +149,14 @@ Command	    Function
 
 ``z``	    Dump the ftrace buffer
 
+``C``	    Execute a predefined, compound action. The action is defined with
+	    sysrq.sysrq_compound_action module parameter, whose value contains known
+	    command keys (except ``C`` to prevent recursion). The command keys can
+	    be optionally followed by a colon and a number of milliseconds to wait
+	    after executing the last action. For example:
+
+	    sysrq.sysrq_compound_action=r:100eis:1000ub
+
 ``0``-``9`` Sets the console log level, controlling which kernel messages
             will be printed to your console. (``0``, for example would make
             it so that only emergency messages like PANICs or OOPSes would
diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index 52e344bfe8c0..ffcda1316675 100644
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
@@ -439,6 +440,15 @@ static const struct sysrq_key_op sysrq_unrt_op = {
 	.enable_mask	= SYSRQ_ENABLE_RTNICE,
 };
 
+static void sysrq_action_compound(int key);
+
+static struct sysrq_key_op sysrq_action_compound_op = {
+	.handler	= sysrq_action_compound,
+	.help_msg	= "execute-compound-action(C)",
+	.action_msg	= "Execute compound action",
+	.enable_mask	= SYSRQ_ENABLE_COMPOUND,
+};
+
 /* Key Operations table and lock */
 static DEFINE_SPINLOCK(sysrq_key_table_lock);
 
@@ -501,7 +511,7 @@ static const struct sysrq_key_op *sysrq_key_table[62] = {
 	&sysrq_ftrace_dump_op,		/* z */
 	NULL,				/* A */
 	NULL,				/* B */
-	NULL,				/* C */
+	&sysrq_action_compound_op,	/* C */
 	NULL,				/* D */
 	NULL,				/* E */
 	NULL,				/* F */
@@ -634,6 +644,7 @@ EXPORT_SYMBOL(handle_sysrq);
 
 #ifdef CONFIG_INPUT
 static int sysrq_reset_downtime_ms;
+static char *sysrq_compound_action;
 
 /* Simple translation table for the SysRq keys */
 static const unsigned char sysrq_xlate[KEY_CNT] =
@@ -787,6 +798,61 @@ static void sysrq_of_get_keyreset_config(void)
 {
 }
 #endif
+#define SYSRQ_COMPOUND_ACTION_VALIDATE	0
+#define SYSRQ_COMPOUND_ACTION_RUN	1
+
+static int sysrq_process_compound_action(int pass)
+{
+	const char *action = sysrq_compound_action;
+	const struct sysrq_key_op *op_p;
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
@@ -1079,8 +1145,21 @@ module_param_array_named(reset_seq, sysrq_reset_seq, sysrq_reset_seq,
 
 module_param_named(sysrq_downtime_ms, sysrq_reset_downtime_ms, int, 0644);
 
+module_param(sysrq_compound_action, charp, 0644);
+MODULE_PARM_DESC(sysrq_compound_action,
+	"Compound sysrq action to be executed on Alt-Shift-SysRq-C\n"
+	"The compound action definition consists of known SysRq action letters except 'C',\n"
+	"each letter can be optionally followed by a colon and a number of milliseconds to wait\n"
+	"after executing the last action.\n"
+	"Example:\n"
+	"To unRaw, wait 100ms, tErminate, kIll, Sync, wait 1000ms, Unmount, Boot\n"
+	"sysrq.sysrq_compound_action=r:100eis:1000ub");
 #else
 
+{
+}
+
+static void sysrq_action_compound(int key)
 static inline void sysrq_register_handler(void)
 {
 }
diff --git a/include/linux/sysrq.h b/include/linux/sysrq.h
index 3a582ec7a2f1..6df4442f12a9 100644
--- a/include/linux/sysrq.h
+++ b/include/linux/sysrq.h
@@ -28,6 +28,7 @@
 #define SYSRQ_ENABLE_SIGNAL	0x0040
 #define SYSRQ_ENABLE_BOOT	0x0080
 #define SYSRQ_ENABLE_RTNICE	0x0100
+#define SYSRQ_ENABLE_COMPOUND	0x0200
 
 struct sysrq_key_op {
 	void (* const handler)(int);
-- 
2.17.1

