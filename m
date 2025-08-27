Return-Path: <linux-input+bounces-14333-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E63D4B37B64
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 09:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFC1436709B
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 07:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3780930C601;
	Wed, 27 Aug 2025 07:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="W9Gz5mtc"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE731EA7CF;
	Wed, 27 Aug 2025 07:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756279321; cv=none; b=CS+jNPs1maTG43rq5SYqmXOvLJGlrcvFdRVWYTWphdStY4nV8Cg8EzH3KV6Z2TeYYII1tzu3dfVvzsYK06vtw8ogPqEH8qFTEzPdysSFk/PH8XgC069vt0nsU019ksHh/wgcAhqHAiocctFaG8fypYu+nJ+rZVPdoZ1EPckTxR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756279321; c=relaxed/simple;
	bh=dlo/9J6rhts2KG0F4PfNSCNpj/HjCVBE3juBwL0eg0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gzEicG0qVkZM9u1KZOkW1t76rzmxZyjfxdyG3CC2B2B02jEhpg/8K5p2QktgdMtJGHgtVPID93JyBSdA6W91VfagBaiEvIskIpIA3/yX+z42WS+0eniQygkTQRaCRCg/jU0i7DD2whz2tHhF1o8z7C3T4ugaH4dREUNb+E2cEC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=W9Gz5mtc; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1756279303;
	bh=E49A0qgUBTyj8XWDCdM/eYAU15Zj10Ql4fzxbPmX3Ss=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=W9Gz5mtcMHZmhNqSl8hkrsFZb3oDxRfOReKO5NiABMVAJRzfd4/u/USyiJ1lJRJ2A
	 oenxKXtK9adCyBVq6JPabMi+TI4KitBrxzRuG0bfDJxKwyb5EK7JysjenUyksGFK+p
	 +a3atBM8BYpzYWUlAVdN8rFl+omkAHnvl0151ctk=
X-QQ-mid: zesmtpip2t1756279294tad99e06a
X-QQ-Originating-IP: 2Cx51Oqqsvj0SfpaTDErqPLoI4bIH6fgC2p7DJ10Xuc=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 27 Aug 2025 15:21:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12414129326743720862
EX-QQ-RecipientCnt: 6
From: Morduan Zang <zhangdandan@uniontech.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liziyao@uniontech.com,
	WangYuli <wangyuli@uniontech.com>,
	Morduan Zang <zhangdandan@uniontech.com>
Subject: [PATCH 2/2 v2] selftests: input: Add tracepoint testing script
Date: Wed, 27 Aug 2025 15:21:23 +0800
Message-ID: <1B705FD25232CA91+20250827072125.139887-2-zhangdandan@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827072125.139887-1-zhangdandan@uniontech.com>
References: <20250827072125.139887-1-zhangdandan@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OcIiaahx2ZjKJoN50pxxtfisxaMxKUqP88QaHsG23uanRVzGmQS7Kmcg
	GXfkskc0tKOqHg/4Y2JrIsfcAWcQgpDDyGYPdYJlu7xlfNDczzYI+8MVYlbBnEf1lFG/tMB
	qVWCMxX9m6eG09pSO0KSyaEQmzPElQJdDOsyZ9Nzxp+jVyAEpTrxVuc+ZpmP0x0DfouQPdT
	JAqxmjlZaneXorErRHy5hv4qIMkbmHN2XMeUivyZNH+BrDNITaGCoNwXuJBJ3PWd3SCdgHS
	1/W5/WykBc2p/9nTZS8C1OaBnuQz+KqvweZqvqHAq8uVLFh+BbFTObE2kyoxVMbGtgZ7oNz
	w5gOI8Rs01gvhc+u+Mt5Ll5dikzt7GCq5TaC4cn/ItqFH8EIwxiYe2nztygr/Ppl7kI42T7
	+KtIPJaQAZRBH3It7Sk5YjcJlStyN85oQT/NInAy84gwADVe3Qb/Kn3+yndsq2JVuVv+yzG
	xLouZBcF4tMyuLctjZImE0Lh+rvhvQO/6XRoBVjIHDsVLV5GUCut83rTTjOgbzDETyFDx6W
	13Bc4XvNdimJdaAUonGjPIws1StYU0A2vka0HgQ91xL0gPCIsFLnQ7g2cFn0h+5Rff96/P0
	nx6kK6GW4dlQ5rA5RcaNIYPOWDaV9g2PRyHyKT6FR3ZSdEfE8+X7jjF7Q2lejq8wG30wr64
	WeRHSxanzHXfrD5CtFjJD+NEI5PoDXV4KcFWk/SRNacnNKwCtRd14czk9wXE0mqdi6hLpB2
	7Z4oZ3+R/l2KOENTzcWVAhSi2nHkJnHybfxxwm8CiNSGZvCBowv77V9iEnWQ4ZYfcJSrDCf
	ZtWAxtsAmUC7yspb1nA5wgmPM4ZrVskhy4knzhrT6uYwuuzV1NpDxxgCbt5NuPbj/HYSWaV
	zbatRC8fBwdWt5uNzSnWjoJZUjcA15uyhlhnSl9Ztudif98EQIgnWbJew8RRsydSO7gcsfW
	O1GM1Bo4Pp7elG3rR6RIJ/1dRtHLhURWqQkZK1kG5FeRvSf76Rol9FvXzeHBdtrMLQQl2P3
	1EbkKUWTwnnafvyFmBTSRuksDoW2Jc39yHpBOKYwIIo/YKr1wBTDzRA3ThuFq8z3t7DFNCQ
	QfGc/3uw0XHSa0XSq/YC9iCj4/ur0/JzJDrM0l0WcdpEiJgYSiWmYeoUgRBv4gciXFGTysY
	PctsqjTWkFos0IW4Ltmgqe+G5fRjC7CS12Lpp3cgHL84860=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

From: WangYuli <wangyuli@uniontech.com>

Add a test script for the input subsystem tracepoints.

The script provides:
 - Automatic detection of available input tracepoints
 - Privilege and filesystem mount validation
 - Interactive testing with real-time trace monitoring
 - Support for both batch and live trace analysis

The script enables easy validation and demonstration of the input
tracepoint functionality, making it easier for developers to verify
the implementation and understand the tracepoint capabilities.

Usage:
  sudo ./tools/testing/selftests/input/test_input_tracepoints.sh

Signed-off-by: WangYuli <wangyuli@uniontech.com>
Signed-off-by: Morduan Zang <zhangdandan@uniontech.com>
---
 MAINTAINERS                                   |  2 +
 .../selftests/input/test_input_tracepoints.sh | 78 +++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100755 tools/testing/selftests/input/test_input_tracepoints.sh

diff --git a/MAINTAINERS b/MAINTAINERS
index 4dfa2d60faa0..f6e5da714ba9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12099,6 +12099,7 @@ F:	include/uapi/linux/input-event-codes.h
 F:	include/uapi/linux/input.h
 F:	include/uapi/linux/serio.h
 F:	include/uapi/linux/uinput.h
+F:	tools/testing/selftests/input/
 
 INPUT MULTITOUCH (MT) PROTOCOL
 M:	Henrik Rydberg <rydberg@bitmath.org>
@@ -25568,6 +25569,7 @@ F:	kernel/trace/
 F:	kernel/tracepoint.c
 F:	scripts/tracing/
 F:	tools/testing/selftests/ftrace/
+F:	tools/testing/selftests/input/test_input_tracepoints.sh
 
 TRACING MMIO ACCESSES (MMIOTRACE)
 M:	Steven Rostedt <rostedt@goodmis.org>
diff --git a/tools/testing/selftests/input/test_input_tracepoints.sh b/tools/testing/selftests/input/test_input_tracepoints.sh
new file mode 100755
index 000000000000..6ade2619b62d
--- /dev/null
+++ b/tools/testing/selftests/input/test_input_tracepoints.sh
@@ -0,0 +1,78 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+###############################################################################
+#
+# Input subsystem tracepoint testing script
+#
+# AUTHOR
+#      WangYuli <wangyuli@uniontech.com>
+#
+###############################################################################
+
+DEBUGFS_PATH="/sys/kernel/debug/tracing"
+INPUT_EVENTS_PATH="${DEBUGFS_PATH}/events/input"
+
+# Check if we have sufficient privileges
+if [ ! -w "$DEBUGFS_PATH" ]; then
+    echo "Error: Root privileges required to access tracing system"
+    echo "Please run: sudo $0"
+    exit 1
+fi
+
+# Check if debugfs is mounted
+if [ ! -d "$DEBUGFS_PATH" ]; then
+    echo "Error: debugfs is not mounted"
+    echo "Please run: mount -t debugfs none /sys/kernel/debug"
+    exit 1
+fi
+
+# Check if input tracepoints exist
+if [ ! -d "$INPUT_EVENTS_PATH" ]; then
+    echo "Error: input tracepoints not found, kernel may need to be recompiled"
+    exit 1
+fi
+
+echo "=== Input Subsystem Tracepoint Test ==="
+echo
+
+# Clear existing trace buffer
+echo > "${DEBUGFS_PATH}/trace"
+
+# List available input tracepoints
+echo "Available Input Tracepoints:"
+for event in "${INPUT_EVENTS_PATH}"/*; do
+    if [ -d "$event" ]; then
+        event_name=$(basename "$event")
+        echo "  - $event_name"
+    fi
+done
+echo
+
+# Enable all input tracepoints
+echo "Enabling all input tracepoints..."
+echo 1 > "${INPUT_EVENTS_PATH}/enable"
+
+if [ $? -eq 0 ]; then
+    echo "✓ Successfully enabled input tracepoints"
+else
+    echo "✗ Failed to enable input tracepoints"
+    exit 1
+fi
+
+echo
+echo "Please perform some operations in another terminal (keyboard input, mouse movement, etc.)"
+echo "or plug/unplug USB devices, then come back to view the results..."
+echo
+echo "Press any key to continue viewing trace output (press Ctrl+C to exit)..."
+read -n 1
+
+echo
+echo "=== Trace Output ==="
+echo "(Last 100 lines)"
+tail -n 100 "${DEBUGFS_PATH}/trace"
+
+echo
+echo "=== Real-time Trace Output ==="
+echo "(Press Ctrl+C to stop)"
+cat "${DEBUGFS_PATH}/trace_pipe"
-- 
2.50.1


