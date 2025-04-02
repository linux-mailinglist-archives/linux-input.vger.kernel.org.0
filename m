Return-Path: <linux-input+bounces-11474-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB1DA7927A
	for <lists+linux-input@lfdr.de>; Wed,  2 Apr 2025 17:55:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FC481893711
	for <lists+linux-input@lfdr.de>; Wed,  2 Apr 2025 15:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A550527735;
	Wed,  2 Apr 2025 15:55:09 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0796AA7;
	Wed,  2 Apr 2025 15:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743609309; cv=none; b=frv7oXuXRuuf0gXfvTDfRb3gVJSlzK1a/6iCgL48zEt0Fnqu2IMOP8De4nDcwqXSgHXFQ7KsdhpawofPy6RI+t8bOcncavIf0StXtQEbJDXF/YVmulD0yCcg4uk9GINf8gDNpdsmoMpkGILkLhMNLcpycoQ1drmnpKOPossZ/Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743609309; c=relaxed/simple;
	bh=vlPh5PCSARRxi39gaSvhG0GHKkjN6gue9AuWiipJ7tk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tIFWsIWmTmmIldqFByo8V6dKR56mHvbkz1GC00hCA9NEvY8A/dKRXiEsYQdKjvcqnh4K0rCi53+zCtRt4htDFiNV3wCGtAb+L2xE94VYvQ8ce2HgByzAEHSCPXy3WpjG27Fjbzg+AUVfa1zIZ+Jm0e0EI2wYVjl8ciE1XIN8pHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from altlinux.ipa.basealt.ru (unknown [178.76.204.78])
	(Authenticated sender: kovalevvv)
	by air.basealt.ru (Postfix) with ESMTPSA id 35B07233C5;
	Wed,  2 Apr 2025 18:47:46 +0300 (MSK)
From: Vasiliy Kovalev <kovalev@altlinux.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lvc-project@linuxtesting.org,
	kovalev@altlinux.org
Subject: [PATCH] Input: pegasus-notetaker - fix slab-out-of-bounds in pegasus_irq
Date: Wed,  2 Apr 2025 18:47:45 +0300
Message-Id: <20250402154745.399226-1-kovalev@altlinux.org>
X-Mailer: git-send-email 2.33.8
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a slab-out-of-bounds error in pegasus_irq reported by KASAN,
caused by insufficient packet size validation. The driver relied
on usb_maxpacket() to set the data length, which could be smaller
than the 6 bytes expected by pegasus_parse_packet(), leading to
oob reads at le16_to_cpup() calls when accessing coordinates.

Introduce NOTETAKER_PKGLEN_SIZE define with a value of 6 bytes,
reflecting the typical interrupt IN endpoint packet format for this
device family. Add a check in pegasus_probe() to ensure the data
length is at least this size, logging an info message if usb_maxpacket()
returns a smaller value and adjusting it accordingly. This prevents
buffer under-allocation while accommodating devices that might send
shorter packets, as various brandings (e.g., Pegasus Mobile Notetaker,
IRISnotes Express) may differ in implementation.

KASAN report:
BUG: KASAN: slab-out-of-bounds in pegasus_irq (little_endian.h:67 pegasus_notetaker.c:153 pegasus_notetaker.c:183)
Read of size 2 at addr ffff888009a01da2 by task (udev-worker)/985
CPU: 0 PID: 985 Comm: (udev-worker) Tainted: G OE 6.14.0-un-def-alt0.rc6.kasan #1
Hardware: QEMU Standard PC (Q35 + ICH9, 2009)
Call Trace:
 <IRQ>
  dump_stack_lvl (lib/dump_stack.c:122)
  print_report (mm/kasan/report.c:521)
  kasan_report (mm/kasan/report.c:636)
  pegasus_irq (little_endian.h:67 pegasus_notetaker.c:153 pegasus_notetaker.c:183)
  __usb_hcd_giveback_urb (drivers/usb/core/hcd.c:1650)
  usb_hcd_giveback_urb (drivers/usb/core/hcd.c:1735)
  dummy_timer (drivers/usb/gadget/udc/dummy_hcd.c:1995)
  __hrtimer_run_queues (kernel/time/hrtimer.c:1865)
  hrtimer_run_softirq (kernel/time/hrtimer.c:1884)
  handle_softirqs (kernel/softirq.c:561)
  __irq_exit_rcu (kernel/softirq.c:662)
  irq_exit_rcu (kernel/softirq.c:680)
  sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1049)
 </IRQ>

Found by Linux Verification Center (linuxtesting.org) with
"USB Gadget Tests"[1]:

$ make input-tab-pegasus
$ sudo ./src/input-tab-pegasus/input-tab-pegasus --invalid_ep_int_len

[1] Link: https://github.com/kovalev0/usb-gadget-tests
Fixes: 1afca2b66aac ("Input: add Pegasus Notetaker tablet driver")
Cc: stable@vger.kernel.org
Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
---
 drivers/input/tablet/pegasus_notetaker.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/input/tablet/pegasus_notetaker.c b/drivers/input/tablet/pegasus_notetaker.c
index 8d6b71d5979316..e578720585c2c8 100644
--- a/drivers/input/tablet/pegasus_notetaker.c
+++ b/drivers/input/tablet/pegasus_notetaker.c
@@ -70,6 +70,15 @@
 #define PEN_BUTTON_PRESSED		BIT(1)
 #define PEN_TIP				BIT(0)
 
+/* Minimum packet size for interrupt IN endpoint.
+ * Packet format  (expected 6 bytes, though some devices may send less):
+ *  - Byte 0: Packet type (command or status)
+ *  - Byte 1: Button/tip state
+ *  - Bytes 2-3: X coordinate (16-bit, little-endian)
+ *  - Bytes 4-5: Y coordinate (16-bit, little-endian)
+ */
+#define NOTETAKER_PKGLEN_SIZE		6
+
 struct pegasus {
 	unsigned char *data;
 	u8 data_len;
@@ -311,6 +320,16 @@ static int pegasus_probe(struct usb_interface *intf,
 	}
 
 	pegasus->data_len = usb_maxpacket(dev, pipe);
+	/* Ensure buffer is at least NOTETAKER_PKGLEN_SIZE to avoid oob
+	 * access in pegasus_parse_packet(). Adjust if endpoint reports a
+	 * smaller size, as some devices might send shorter packets.
+	 */
+	if (pegasus->data_len < NOTETAKER_PKGLEN_SIZE) {
+		dev_info(&intf->dev,
+			 "Int in endpoint data_len adjusted from %d to minimum %d\n",
+			 pegasus->data_len, NOTETAKER_PKGLEN_SIZE);
+		pegasus->data_len = NOTETAKER_PKGLEN_SIZE;
+	}
 
 	pegasus->data = usb_alloc_coherent(dev, pegasus->data_len, GFP_KERNEL,
 					   &pegasus->data_dma);
-- 
2.42.2


