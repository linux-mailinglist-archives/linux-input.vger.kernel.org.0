Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4E21CDC63
	for <lists+linux-input@lfdr.de>; Mon, 11 May 2020 16:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730236AbgEKN72 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 May 2020 09:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730180AbgEKN71 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 May 2020 09:59:27 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D85C061A0C;
        Mon, 11 May 2020 06:59:27 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 451452A0A01
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, andrzej.p@collabora.com,
        kernel@collabora.com
Subject: [PATCH 5/6] tty/sysrq: Add configurable handler to signal a process
Date:   Mon, 11 May 2020 15:59:17 +0200
Message-Id: <20200511135918.8203-6-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200511135918.8203-1-andrzej.p@collabora.com>
References: <20200511135918.8203-1-andrzej.p@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some userland might want to implement a policy to signal a configured
process with a configured signal. This patch adds necessary kernel-side
infrastructure and the newly added handler is triggered with
Alt-Shift-SysRq-s. Optionally the userland can also specify the expected
name of parent process of the victim.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/tty/sysrq.c | 123 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 122 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index ab4121a446b4..a6e91e4ae304 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -437,6 +437,15 @@ static struct sysrq_key_op sysrq_unrt_op = {
 	.enable_mask	= SYSRQ_ENABLE_RTNICE,
 };
 
+static void sysrq_signal_configured(int key);
+
+static struct sysrq_key_op sysrq_signal_configured_op = {
+	.handler	= sysrq_signal_configured,
+	.help_msg	= "signal-configured-process(S)",
+	.action_msg	= "Signal configured process",
+	.enable_mask	= SYSRQ_ENABLE_SIGNAL,
+};
+
 /* Key Operations table and lock */
 static DEFINE_SPINLOCK(sysrq_key_table_lock);
 
@@ -515,7 +524,7 @@ static struct sysrq_key_op *sysrq_key_table[62] = {
 	NULL,				/* P */
 	NULL,				/* Q */
 	NULL,				/* R */
-	NULL,				/* S */
+	&sysrq_signal_configured_op,	/* S */
 	NULL,				/* T */
 	NULL,				/* U */
 	NULL,				/* V */
@@ -633,6 +642,10 @@ EXPORT_SYMBOL(handle_sysrq);
 #ifdef CONFIG_INPUT
 static int sysrq_reset_downtime_ms;
 static unsigned short sysrq_key = KEY_SYSRQ;
+static char *sysrq_signalled;
+static char *sysrq_signalled_parent;
+static char *sysrq_signal;
+static int sysrq_signal_code;
 
 /* Simple translation table for the SysRq keys */
 static const unsigned char sysrq_xlate[KEY_CNT] =
@@ -751,6 +764,106 @@ static void sysrq_detect_reset_sequence(struct sysrq_state *state,
 	}
 }
 
+struct signal_search {
+	const char *name;
+	int code;
+};
+
+static void sysrq_str_to_signal(void)
+{
+	static const struct signal_search signals[] = {
+		{"SIGHUP", SIGHUP},
+		{"SIGINT", SIGINT},
+		{"SIGQUIT", SIGQUIT},
+		{"SIGILL", SIGILL},
+		{"SIGTRAP", SIGTRAP},
+		{"SIGABRT", SIGABRT},
+		{"SIGIOT", SIGIOT},
+		{"SIGBUS", SIGBUS},
+		{"SIGFPE", SIGFPE},
+		{"SIGKILL", SIGKILL},
+		{"SIGUSR1", SIGUSR1},
+		{"SIGSEGV", SIGSEGV},
+		{"SIGUSR2", SIGUSR2},
+		{"SIGPIPE", SIGPIPE},
+		{"SIGALRM", SIGALRM},
+		{"SIGTERM", SIGTERM},
+		{"SIGSTKFLT", SIGSTKFLT},
+		{"SIGCHLD", SIGCHLD},
+		{"SIGCONT", SIGCONT},
+		{"SIGSTOP", SIGSTOP},
+		{"SIGTSTP", SIGTSTP},
+		{"SIGTTIN", SIGTTIN},
+		{"SIGTTOU", SIGTTOU},
+		{"SIGURG", SIGURG},
+		{"SIGXCPU", SIGXCPU},
+		{"SIGXFSZ", SIGXFSZ},
+		{"SIGVTALRM", SIGVTALRM},
+		{"SIGPROF", SIGPROF},
+		{"SIGWINCH", SIGWINCH},
+		{"SIGIO", SIGIO},
+		{"SIGPOLL", SIGPOLL},
+		{"SIGPWR", SIGPWR},
+		{"SIGSYS", SIGSYS},
+	};
+	int i;
+
+	if (!sysrq_signal)
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(signals); ++i)
+		if (!strcmp(signals[i].name, sysrq_signal))
+			break;
+
+	if (i >= ARRAY_SIZE(signals)) {
+		pr_err("Unknown signal name %s", sysrq_signal);
+
+		return;
+	}
+
+	sysrq_signal_code = signals[i].code;
+}
+
+static void sysrq_signal_configured(int key)
+{
+	struct task_struct *p;
+
+	sysrq_str_to_signal();
+
+	if (!sysrq_signalled) {
+		pr_err("Unconfigured process name for %s",
+		       sysrq_signal_configured_op.help_msg);
+
+		return;
+	}
+
+	if (!sysrq_signal_code) {
+		pr_err("Unconfigured signal for %s",
+		       sysrq_signal_configured_op.help_msg);
+
+		return;
+	}
+
+	read_lock(&tasklist_lock);
+	for_each_process(p) {
+		if (p->flags & (PF_KTHREAD | PF_EXITING))
+			continue;
+		if (is_global_init(p))
+			continue;
+		if (strncmp(p->comm, sysrq_signalled, TASK_COMM_LEN))
+			continue;
+		if (sysrq_signalled_parent
+		    && strncmp(p->parent->comm, sysrq_signalled_parent,
+			       TASK_COMM_LEN))
+			continue;
+
+		pr_err("%s: signal %d %s pid %u tgid %u\n", __func__,
+		       sysrq_signal_code, sysrq_signalled, p->pid, p->tgid);
+		do_send_sig_info(sysrq_signal_code, SEND_SIG_PRIV, p, true);
+	}
+	read_unlock(&tasklist_lock);
+}
+
 
 static void sysrq_reinject_alt_sysrq(struct work_struct *work)
 {
@@ -1048,8 +1161,16 @@ module_param_named(sysrq_downtime_ms, sysrq_reset_downtime_ms, int, 0644);
 
 module_param(sysrq_key, ushort, 0644);
 
+module_param(sysrq_signalled, charp, 0644);
+module_param(sysrq_signalled_parent, charp, 0644);
+module_param(sysrq_signal, charp, 0644);
+
 #else
 
+static void sysrq_signal_configured(int key)
+{
+}
+
 static inline void sysrq_register_handler(void)
 {
 }
-- 
2.17.1

