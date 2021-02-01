Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DBC430AC42
	for <lists+linux-input@lfdr.de>; Mon,  1 Feb 2021 17:06:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhBAQFL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Feb 2021 11:05:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbhBAQFJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Feb 2021 11:05:09 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D1AEC061788
        for <linux-input@vger.kernel.org>; Mon,  1 Feb 2021 08:03:51 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id c18so20244912ljd.9
        for <linux-input@vger.kernel.org>; Mon, 01 Feb 2021 08:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cpp-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Co+6+xdQuLdeKSFddD7sU1x5t+G3NoJzfMab6z42/Ts=;
        b=n1aF01O+J/rIrydp1HjflAZTF4s656VtTYlYvGq66ktP3x1ITrtdwgzs0EnVXDEVUz
         0TFHcCs7YyxdGHsuU2k2sKykxtINDCfJvYjnQeqnsfaP1wevFjQrYEhqmm27XFDrPh5v
         WScMtuZ28YbMql72vwIj6YcPpsKYEsengBS2F/8cfnrqZ5jGb9h2ztjwkSEAZoLo+aI/
         g3LSuRQTbVhQ34Va2cug//28GZ1HohHBHB6LC2sv0/Wb1QExjDnn8Wxgb22NLsVvub+Z
         FxI4BwF2BT8TVwF1UTmKLZO6WNSVGYxQwN7VSTV8ah23n50QdOjduFvw3Iqf95ozifhH
         Ci2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Co+6+xdQuLdeKSFddD7sU1x5t+G3NoJzfMab6z42/Ts=;
        b=E+0U8SI8My/K5pW28vG5jfWtE1n7Grjs20GHr8viJgs5t4t90ucYHufFIeIR+jJad4
         01UwJbHNnthof5nSv0GrXuJ52kNb9HqGltM1YcLMcQhj+AKQ3XhV8PZhcQBDGbCJohmB
         +8fzet2TZnx+0i7BAdFAKrf8vGa2DptX1wheVuZnUW5UzFEdawqcC32flmxj9UPh5pJO
         MLzMM0iar+O6y2hftMKT9WRilgo1LI0HrimTqk6FxzJEte7pE2YO1xVjxSj6Hn4DVv7G
         WIJ5h8vXGB79IYAzuOuvyl51EZeXtruDFObn4Xg7wDvqzbQgtdur9NuSdkr9jH/Sxl+0
         6iWg==
X-Gm-Message-State: AOAM533k8NIqjKcwLJ0L88ykVanEAdgVxHw/7MaeKn1c5pfufJOPL8zO
        yYZnUUISJFby4Wnm7rMQKXLaDQ==
X-Google-Smtp-Source: ABdhPJz4HWhvAi/4zeKzmAuaVD0aON05R/rxQoR1mI5TLVjiJCjpB9ibOwOr1Qin3ac8fdxBuP5nsA==
X-Received: by 2002:a2e:3209:: with SMTP id y9mr10113479ljy.446.1612195429791;
        Mon, 01 Feb 2021 08:03:49 -0800 (PST)
Received: from x360.. (aigilea.static.corbina.ru. [78.107.254.230])
        by smtp.googlemail.com with ESMTPSA id r14sm3968073ljd.123.2021.02.01.08.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 08:03:48 -0800 (PST)
From:   Anton Zhilyaev <anton@cpp.in>
To:     dmitry.torokhov@gmail.com, hdegoede@redhat.com,
        linux-input@vger.kernel.org
Cc:     Anton Zhilyaev <anton@cpp.in>
Subject: [PATCH] i8042: Work around HP TGL bug
Date:   Mon,  1 Feb 2021 19:03:36 +0300
Message-Id: <20210201160336.16008-1-anton@cpp.in>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some Tiger Lake laptops like HP Spectre x360 13-aw2xxx have a bug in i8042
implementation that causes keyboard initialization to take from few seconds
to sometimes a minute or more each time the system starts or resumes.

In a nutshell problem is caused by interrupt being deasserted after byte
read, even when there are more bytes readily available and I8042_STR_OBF is
still set. Once in a while it keeps interrupt asserted, I haven't found any
explanation for this.

This causes atkbd_probe to fail on both ATKBD_CMD_GETID (no id received)
and ATKBD_CMD_SETLEDS (id received instead of ack) approaches which causes
keyboard initialization to be re-tried multiple times until it randomly
scores to get a valid reply either by interrupt surviving long enough for
ID to be read or by ATKBD_CMD_SETLEDS luckily receiving some old ack.

This patch turns single-shot interrupt handler into a read loop that runs
until I8042_STR_OBF goes unset or 4 valid non-filtered bytes are read or
32 iterations are performed. Another loop passes the read bytes to the
serio layer later after unlocking i8042_lock.

Here's HP Spectre x360 issue discussion with this problem mentioned a few
times:
https://bbs.archlinux.org/viewtopic.php?id=261108

Here's some logs illustrating the problem and the solution:
http://cpp.in/dev/hp_x360_tgl_kbd_before.log
http://cpp.in/dev/hp_x360_tgl_kbd_after.log

Signed-off-by: Anton Zhilyaev <anton@cpp.in>
---
--- a/drivers/input/serio/i8042.c	2021-01-25 03:47:14.000000000 +0300
+++ b/drivers/input/serio/i8042.c	2021-02-01 02:57:54.556703786 +0300
@@ -159,6 +159,8 @@ struct i8042_port {
 #define I8042_MUX_PORT_NO	2
 #define I8042_NUM_PORTS		(I8042_NUM_MUX_PORTS + 2)
 
+#define I8042_QUEUE_SIZE	4
+
 static struct i8042_port i8042_ports[I8042_NUM_PORTS];
 
 static unsigned char i8042_initial_ctr;
@@ -520,33 +522,36 @@ static irqreturn_t i8042_interrupt(int i
 	struct i8042_port *port;
 	struct serio *serio;
 	unsigned long flags;
-	unsigned char str, data;
-	unsigned int dfl;
-	unsigned int port_no;
+	unsigned char str;
 	bool filtered;
+	unsigned char q_data[I8042_QUEUE_SIZE];
+	unsigned int q_port[I8042_QUEUE_SIZE];
+	unsigned int q_dfl[I8042_QUEUE_SIZE];
+	unsigned int q_used = 0, q_cycles = 0, q_i;
 	int ret = 1;
 
 	spin_lock_irqsave(&i8042_lock, flags);
 
 	str = i8042_read_status();
-	if (unlikely(~str & I8042_STR_OBF)) {
-		spin_unlock_irqrestore(&i8042_lock, flags);
-		if (irq)
-			dbg("Interrupt %d, without any data\n", irq);
-		ret = 0;
-		goto out;
-	}
+	do {
+		if (unlikely(~str & I8042_STR_OBF)) {
+			spin_unlock_irqrestore(&i8042_lock, flags);
+			if (irq)
+				dbg("Interrupt %d, without any data\n", irq);
+			ret = 0;
+			goto out;
+		}
 
-	data = i8042_read_data();
+		q_data[q_used] = i8042_read_data();
 
-	if (i8042_mux_present && (str & I8042_STR_AUXDATA)) {
-		static unsigned long last_transmit;
-		static unsigned char last_str;
-
-		dfl = 0;
-		if (str & I8042_STR_MUXERR) {
-			dbg("MUX error, status is %02x, data is %02x\n",
-			    str, data);
+		if (i8042_mux_present && (str & I8042_STR_AUXDATA)) {
+			static unsigned long last_transmit;
+			static unsigned char last_str;
+
+			q_dfl[q_used] = 0;
+			if (str & I8042_STR_MUXERR) {
+				dbg("MUX error, status is %02x, data is %02x\n",
+				    str, q_data[q_used]);
 /*
  * When MUXERR condition is signalled the data register can only contain
  * 0xfd, 0xfe or 0xff if implementation follows the spec. Unfortunately
@@ -560,7 +565,7 @@ static irqreturn_t i8042_interrupt(int i
  * was transmitted (if transmission happened not too long ago).
  */
 
-			switch (data) {
+				switch (q_data[q_used]) {
 				default:
 					if (time_before(jiffies, last_transmit + HZ/10)) {
 						str = last_str;
@@ -569,37 +574,49 @@ static irqreturn_t i8042_interrupt(int i
 					fallthrough;	/* report timeout */
 				case 0xfc:
 				case 0xfd:
-				case 0xfe: dfl = SERIO_TIMEOUT; data = 0xfe; break;
-				case 0xff: dfl = SERIO_PARITY;  data = 0xfe; break;
+				case 0xfe:
+					q_dfl[q_used] = SERIO_TIMEOUT;
+					q_data[q_used] = 0xfe;
+					break;
+				case 0xff:
+					q_dfl[q_used] = SERIO_PARITY;
+					q_data[q_used] = 0xfe;
+					break;
+				}
 			}
-		}
 
-		port_no = I8042_MUX_PORT_NO + ((str >> 6) & 3);
-		last_str = str;
-		last_transmit = jiffies;
-	} else {
+			q_port[q_used] = I8042_MUX_PORT_NO + ((str >> 6) & 3);
+			last_str = str;
+			last_transmit = jiffies;
+		} else {
 
-		dfl = ((str & I8042_STR_PARITY) ? SERIO_PARITY : 0) |
-		      ((str & I8042_STR_TIMEOUT && !i8042_notimeout) ? SERIO_TIMEOUT : 0);
+			q_dfl[q_used] = ((str & I8042_STR_PARITY) ? SERIO_PARITY : 0) |
+					((str & I8042_STR_TIMEOUT && !i8042_notimeout) ? SERIO_TIMEOUT : 0);
 
-		port_no = (str & I8042_STR_AUXDATA) ?
-				I8042_AUX_PORT_NO : I8042_KBD_PORT_NO;
-	}
+			q_port[q_used] = (str & I8042_STR_AUXDATA) ?
+					I8042_AUX_PORT_NO : I8042_KBD_PORT_NO;
+		}
+
+		port = &i8042_ports[q_port[q_used]];
+		serio = port->exists ? port->serio : NULL;
+
+		filter_dbg(port->driver_bound, q_data[q_used], "<- i8042 (interrupt, %d, %d%s%s)\n",
+			   q_port[q_used], irq,
+			   q_dfl[q_used] & SERIO_PARITY ? ", bad parity" : "",
+			   q_dfl[q_used] & SERIO_TIMEOUT ? ", timeout" : "");
 
-	port = &i8042_ports[port_no];
-	serio = port->exists ? port->serio : NULL;
+		filtered = i8042_filter(q_data[q_used], str, serio);
 
-	filter_dbg(port->driver_bound, data, "<- i8042 (interrupt, %d, %d%s%s)\n",
-		   port_no, irq,
-		   dfl & SERIO_PARITY ? ", bad parity" : "",
-		   dfl & SERIO_TIMEOUT ? ", timeout" : "");
+		if (likely(serio && !filtered))
+			++q_used;
 
-	filtered = i8042_filter(data, str, serio);
+		str = i8042_read_status();
+	} while ((q_used < I8042_QUEUE_SIZE) && (++q_cycles < 32) && (str & I8042_STR_OBF));
 
 	spin_unlock_irqrestore(&i8042_lock, flags);
 
-	if (likely(serio && !filtered))
-		serio_interrupt(serio, data, dfl);
+	for (q_i = 0; q_i < q_used; ++q_i)
+		serio_interrupt(i8042_ports[q_port[q_i]].serio, q_data[q_i], q_dfl[q_i]);
 
  out:
 	return IRQ_RETVAL(ret);
