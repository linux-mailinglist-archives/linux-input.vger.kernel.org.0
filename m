Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08EB44472A8
	for <lists+linux-input@lfdr.de>; Sun,  7 Nov 2021 12:24:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234525AbhKGL0l (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Nov 2021 06:26:41 -0500
Received: from smtp-32-i2.italiaonline.it ([213.209.12.32]:55594 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234528AbhKGL0l (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 7 Nov 2021 06:26:41 -0500
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([213.45.67.127])
        by smtp-32.iol.local with ESMTPA
        id jgG9mbDBMCVSejgH8mjsV9; Sun, 07 Nov 2021 12:23:57 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1636284237; bh=z0f6YHnmWTPy574Y4Y7b2kctkr8UGKCiTD9N4kEgvMc=;
        h=From;
        b=eRxYxo1MnaMP+HFfZIr5HqVoTFEm8ETDJr9MqKBdcYTTzcEgZDYs+PWDvR9a3co3A
         Ufgt8qa8P2Rxp5Uiz0J4kHIEbmEIUyuFp9rX2cwnqfMJqymX4Qm3yMWNsMAa3c2p4Q
         5DOHvVcNZWPHBqaDXtTXuaIDfd9uEL7XA1+C472OLXhKtGnwaG6ZHy5J2FxmVVBm1s
         KZk1JwnKk5p6bPC6ioTtKAs6vAUGbgFlfAvsS+w1rk9fugOoIoqBpvA60NOSiwvlDO
         Kw0dIo4lKY9P4bukMK51o9CjnUxIARpfLsO31a05LmvRmyWj62bwGy+e9ayTi9zwa0
         7hrZQoTGbkAig==
X-CNFS-Analysis: v=2.4 cv=M/2Ilw8s c=1 sm=1 tr=0 ts=6187b74d cx=a_exe
 a=Vk63IOK+/LoQucGDvce7tA==:117 a=Vk63IOK+/LoQucGDvce7tA==:17
 a=BhtjshvPcAAyVhBn9nwA:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     linux-input@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Rachna Patil <rachna@ti.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dario Binacchi <dariobin@libero.it>
Subject: [RESEND PATCH 6/6] mfd: ti_am335x_tscadc: drop the CNTRLREG_8WIRE macro
Date:   Sun,  7 Nov 2021 12:22:36 +0100
Message-Id: <20211107112236.7969-7-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211107112236.7969-1-dariobin@libero.it>
References: <20211107112236.7969-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfF0lR9aaRRDSlbHcHGrIfxP2uIrIfJ2dnEvPRNuKcvBIQ9SYFTBShI7emdCDK7LmhjV3ZAKDxpB6FglX11uxcyyD108UQR23fYQJQs/SVD6eT9p7ZYzt
 SW8beUWx4JqE8eIJ4P9SYGaWmSrrFX4nr3og1Eym8EOFE3J/PBSgNJPAcIx8AQAwRmHGotLAVHt+UxLb05WV0I3/TNjf/zWO6hOxZsyOcWCUveOibp0FL+6V
 duXhSLQqdcEdwOT/ikVlsPyaft9IdeDbkv8FdJDDAX/KoT3M+B1D+BVsAR2TMov9NYF4t8fqUPMXpFdQcQBqxJxLSyVUlbDsZMD4H+9Rsvj+zN5tZ546Cbvz
 ouaqnz1uSdL+evmxcV2JfBo5RYNFHURriPFKLM8qPw9kMTHAtW0wWOXKHR660yMDTYHN2waWod/OUaFyWeFTlqCvxNq+oA==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In TI's reference manual description for the `AFE_Pen_Ctrl' bit-field
of the TSC's CTRL register, there is no mention of 8-wire touchscreens.
Even commit f0933a60d190 ("mfd: ti_am335x_tscadc: Update logic in CTRL
register for 5-wire TS") says that the value of this bit-field must be
the same for 4-wire and 8-wire touchscreens. So let's remove the
CNTRLREG_8WIRE macro to avoid misunderstandings.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---

 include/linux/mfd/ti_am335x_tscadc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/mfd/ti_am335x_tscadc.h b/include/linux/mfd/ti_am335x_tscadc.h
index ffc091b77633..155b2ab13bf8 100644
--- a/include/linux/mfd/ti_am335x_tscadc.h
+++ b/include/linux/mfd/ti_am335x_tscadc.h
@@ -126,7 +126,6 @@
 #define CNTRLREG_AFE_CTRL(val)	((val) << 5)
 #define CNTRLREG_4WIRE		CNTRLREG_AFE_CTRL(1)
 #define CNTRLREG_5WIRE		CNTRLREG_AFE_CTRL(2)
-#define CNTRLREG_8WIRE		CNTRLREG_AFE_CTRL(3)
 #define CNTRLREG_TSCENB		BIT(7)
 
 /* FIFO READ Register */
-- 
2.17.1

