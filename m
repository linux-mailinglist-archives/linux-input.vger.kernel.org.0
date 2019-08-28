Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD2A4A0338
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2019 15:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfH1NbD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Aug 2019 09:31:03 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:47258 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbfH1NbC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Aug 2019 09:31:02 -0400
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tip-bot2@linutronix.de>)
        id 1i2y2K-0004Mf-Ip; Wed, 28 Aug 2019 15:30:56 +0200
Received: from [127.0.1.1] (localhost [IPv6:::1])
        by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id 3114E1C0DE2;
        Wed, 28 Aug 2019 15:30:56 +0200 (CEST)
Date:   Wed, 28 Aug 2019 13:30:56 -0000
From:   "tip-bot2 for Thomas Hellstrom" <tip-bot2@linutronix.de>
Reply-to: linux-kernel@vger.kernel.org
To:     linux-tip-commits@vger.kernel.org
Subject: [tip: x86/vmware] input/vmmouse: Update the backdoor call with
 support for new instructions
Cc:     Thomas Hellstrom <thellstrom@vmware.com>,
        Borislav Petkov <bp@suse.de>,
        Doug Covelli <dcovelli@vmware.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        linux-input@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        <pv-drivers@vmware.com>, "x86-ml" <x86@kernel.org>,
        Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
        linux-kernel@vger.kernel.org
In-Reply-To: <20190828080353.12658-5-thomas_os@shipmail.org>
References: <20190828080353.12658-5-thomas_os@shipmail.org>
MIME-Version: 1.0
Message-ID: <156699905611.5321.15444519862547054670.tip-bot2@tip-bot2>
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot2.linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from these emails
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The following commit has been merged into the x86/vmware branch of tip:

Commit-ID:     f7b15c74cffd760ec9959078982d8268a38456c4
Gitweb:        https://git.kernel.org/tip/f7b15c74cffd760ec9959078982d8268a38456c4
Author:        Thomas Hellstrom <thellstrom@vmware.com>
AuthorDate:    Wed, 28 Aug 2019 10:03:53 +02:00
Committer:     Borislav Petkov <bp@suse.de>
CommitterDate: Wed, 28 Aug 2019 13:43:01 +02:00

input/vmmouse: Update the backdoor call with support for new instructions

Use the definition provided by include/asm/vmware.h.

Signed-off-by: Thomas Hellstrom <thellstrom@vmware.com>
Signed-off-by: Borislav Petkov <bp@suse.de>
Reviewed-by: Doug Covelli <dcovelli@vmware.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: linux-input@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: <pv-drivers@vmware.com>
Cc: x86-ml <x86@kernel.org>
Link: https://lkml.kernel.org/r/20190828080353.12658-5-thomas_os@shipmail.org
---
 drivers/input/mouse/vmmouse.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/mouse/vmmouse.c b/drivers/input/mouse/vmmouse.c
index 871e5b5..148245c 100644
--- a/drivers/input/mouse/vmmouse.c
+++ b/drivers/input/mouse/vmmouse.c
@@ -16,12 +16,12 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <asm/hypervisor.h>
+#include <asm/vmware.h>
 
 #include "psmouse.h"
 #include "vmmouse.h"
 
 #define VMMOUSE_PROTO_MAGIC			0x564D5868U
-#define VMMOUSE_PROTO_PORT			0x5658
 
 /*
  * Main commands supported by the vmmouse hypervisor port.
@@ -84,7 +84,7 @@ struct vmmouse_data {
 #define VMMOUSE_CMD(cmd, in1, out1, out2, out3, out4)	\
 ({							\
 	unsigned long __dummy1, __dummy2;		\
-	__asm__ __volatile__ ("inl %%dx" :		\
+	__asm__ __volatile__ (VMWARE_HYPERCALL :	\
 		"=a"(out1),				\
 		"=b"(out2),				\
 		"=c"(out3),				\
@@ -94,7 +94,7 @@ struct vmmouse_data {
 		"a"(VMMOUSE_PROTO_MAGIC),		\
 		"b"(in1),				\
 		"c"(VMMOUSE_PROTO_CMD_##cmd),		\
-		"d"(VMMOUSE_PROTO_PORT) :		\
+		"d"(0) :			        \
 		"memory");		                \
 })
 
