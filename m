Return-Path: <linux-input+bounces-13451-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC85AFFAF1
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 09:33:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BC821C811DF
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 07:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A37926F476;
	Thu, 10 Jul 2025 07:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="OREHr7gb"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B6E22D7A5;
	Thu, 10 Jul 2025 07:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752132813; cv=none; b=U162AD0FNf5eYpXnn3NcYwXubEdJK05ZdF2FTlx12Gad3kMCLdCbbbO5x/rgZcPavKR38G23NOStfSpVlieafKYjLJHUkgHUdc6F6HKCRtP0uVmTgqIJnk5PY4mx9IRXK05JrCjReYsGWHk9A0uUqsqALpnW8qCmBzjz9IElRQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752132813; c=relaxed/simple;
	bh=ru6WC3aKTKx+HNUMWn7/ABAYv3F2LVzKQIts/BaQPEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KZ1REc2OxKXKb9ht7K2It9rdppkmhqaM28vWRpj9wPX3/GSN+bZJY2L0ZeXDPHIvQHuymfDerVvqhkDS/kWuTAal8cpWqXIiWGZ1fnPdmiDSZ1YTcF8VqGTN6qkq5b3D2Wgb73ky12aKpLGhfEIZmR7YXjdJJCOsaUvBxlpiTho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=OREHr7gb; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1752132775;
	bh=wxPDaS9M7eiZgqTbTb/ieaoSzC16Z0UcvtN7Iiihn64=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=OREHr7gbTVsJZ8l6um2x+PgpgksapJ08pSqE/yLcAkoTfseGB50hT7wBOJLdt3m7z
	 CsSiHP4cnqSxB+KpxzH2pTzce//zKmJQj+bF6j2gAafmF80FikO16X5Kch0mWhXPQO
	 /vhfxtHumVH9Q9roQ+UKmf5n9b2OIoMxKzfz0fTk=
X-QQ-mid: zesmtpip2t1752132723tf4adab5b
X-QQ-Originating-IP: zl7VhSkSdaS7urA94n5L+ibxoa0yuNJuk1pA9GOkrKw=
Received: from avenger-e500 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 10 Jul 2025 15:32:00 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15372651956222595813
EX-QQ-RecipientCnt: 12
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: dmitry.torokhov@gmail.com,
	guanwentao@uniontech.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	mathieu.desnoyers@efficios.com,
	mhiramat@kernel.org,
	niecheng1@uniontech.com,
	rostedt@goodmis.org,
	wangyuli@deepin.org,
	zhanjun@uniontech.com
Subject: [PATCH 2/2] selftests: input: Add tracepoint testing script
Date: Thu, 10 Jul 2025 15:31:39 +0800
Message-ID: <D63FD07A2C7FF319+20250710073148.3994900-2-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <19571F312EE197A5+20250710072634.3992019-1-wangyuli@uniontech.com>
References: <19571F312EE197A5+20250710072634.3992019-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MbY7GcL85SkKl0ZaciNxKdxAPkJoX+P7k6UxKNtKO9YG2L0bS4NWDbYN
	P3Tfl70sJMFcDME/zU65af/h8SB8v5SwlAbiKmH+NQMhH1pKnXUypv5ZpBBYxvPSnBH70lr
	7nfHY/QtEC2n1KNyINqZY7njApHB+aImsVr3NuR4zdSBYdBtrXlDPeOFqwk//lpEdECbsby
	MGjJr7I3yrqSjqDvgbilDAZQkG/EmVXx3lyQ2a0Js3DGo/NxBj3V9kOhmWuuGuMEnLx0Qf1
	d4polxQPPOtnlBubJdoKtcJKInm188dtniu3PSmCw06fjMtJ8EwhazAqL/LH1kghjd1Txfx
	zpseqvOMhTp7+wGp7mxCgZ1LedUtqw2xoPmodYvQ2wNreT7fhXUYWYLwZy8dDXD3zjQ+bEx
	KB4EeSPjoAyErBxuVdK+ftMDYJ9d912fCIQtri9uewBH9m+b9keB/idbI45wMZ2oQaZgv+e
	WbbONAGI5X0O9OmonyQhDmjORkZi15OH6FjT6TwIojiYQZuvfvUNtGJiG/AfxRQwMr3lfGi
	UNR9/MUN97gaHGpggiX77NKb9JxOzuLHiYnhuQje57k+ZUTLrk2H7BHkzXggv9gYwuqZ5VA
	ceRSEeLFyAq6gNmaFZ/p5yr/pZon2ne8ACysXSs6I7XcSNZHxVTBJ3O7KF3DdsM2tPsYVN6
	mNrOZvJZAMFGxi1oX23lSNqCqQpmYjublykOaBGpJ6qrDps4CLvWQwTJPDYfpcdpbNmilsV
	BcA5gLjSoFYAfAN+m5DECfEaUXuzk9inx+AmjOio/f98M4sESWol/v7qSPXzcQ6Nri5UBaQ
	PPb6XbycRo+P1KotpusGZcpLHKDfxuObCRzmdEKiyGG4L+78OmbeJxgy1QI3xUDh3Mje91z
	Z/J66zyCH+em67c2IilToXOwu4GOZlkrt+s9OD17Q5xLIC35QD+biUcBHfaEyPHd2I2lBn/
	ix8NoaSS0IqAcDoBoFpfEVXusYXyDj29LjOqB+DhvGo8mglWJUaHmsgvWOBTwBJghtZ0dM0
	om60BjfSZwgQvtB47b/FJJOg+bJrGTEKO1AfYQM161e8mzlX/YbxtRnjcWaNaIguiUaioxM
	IfCC5zWG8V4d1mYZ+X5ESQhOrMwdFNlPQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

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
---
 MAINTAINERS                                   |  2 +
 .../selftests/input/test_input_tracepoints.sh | 78 +++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100755 tools/testing/selftests/input/test_input_tracepoints.sh

diff --git a/MAINTAINERS b/MAINTAINERS
index c1b03679a5a1..8a0920734303 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11940,6 +11940,7 @@ F:	include/uapi/linux/input-event-codes.h
 F:	include/uapi/linux/input.h
 F:	include/uapi/linux/serio.h
 F:	include/uapi/linux/uinput.h
+F:	tools/testing/selftests/input/
 
 INPUT MULTITOUCH (MT) PROTOCOL
 M:	Henrik Rydberg <rydberg@bitmath.org>
@@ -25211,6 +25212,7 @@ F:	kernel/trace/
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
2.50.0


