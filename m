Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CAC459581E
	for <lists+linux-input@lfdr.de>; Tue, 16 Aug 2022 12:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231955AbiHPKZ5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Aug 2022 06:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234552AbiHPKZ2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Aug 2022 06:25:28 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FAE64B0CD
        for <linux-input@vger.kernel.org>; Tue, 16 Aug 2022 02:20:56 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id l64so8768319pge.0
        for <linux-input@vger.kernel.org>; Tue, 16 Aug 2022 02:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc;
        bh=NYMVGkKHTI2397pZiPkc6thZcKXJkTNnoZ83oivJ0hA=;
        b=3MdnH6Wu+h0/6p9F+Sgw7j7Zn84mdhKm9pp478xVH+Xp2ZCl4a+WzmIBdqHbo0hWVS
         6CT6RuTe7l0wSqvznHsR955Z8o4RcpaTM1bNCQ0NM/xZC8tEn5ayEFQYRaH3yzHw8aq5
         wejBHEBpZyJyzxqZd5g6JjhDkqTqYnu9ajHalVYW1tUS7aVIBck3/VZvpKLzJu8WIjR1
         hpab0KlgWt9FeRf+0C8e/AvO1AVSOAADFn4FjJ4bgTVFjUhKc93YThSznAaKAhmsL/mU
         4qyXi3Fyq6uMJoRiP6trVc8oA0bxZyhAgmXKhQ0gbq0DS4vP7EQcIj+mSqkpknux86hK
         Fx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=NYMVGkKHTI2397pZiPkc6thZcKXJkTNnoZ83oivJ0hA=;
        b=35y6lBoQn3+HsAv8Ii91vMWnb3NPAydhk6o1JgED7JqFn2IV1Ku3+ddHdD6U6i8TK/
         sE3gMsdpx2ard8WqU8Jeu2IZAg/Ld8n0RCjLMVduHmDhIrOiN2xM3bumNfFUrdMcfrOd
         4NG/uNnxGkABD1KHrZSXr9P74wXEHfu2cu+ZyuRtaK2xpfi6n1bdQaGefypngaI3i0hE
         LyX2zLNkhFP3ZaA2fu23gQuxFzc3gvcI9tbtJX5ZnmPCUWnq4i1tsftsjKc9rgVQnoIR
         KIu9v2j9xQAYAB61V8GnhCKoyLIu1g5VYBXna8CawB2U6V5SKiJsQKo9yipzLRWF2nQV
         oEAQ==
X-Gm-Message-State: ACgBeo0ckaONUm9fFyHOe6lH9C9KRK5Vh32z2kSjFdNrVxivHXG2fwOz
        i8O535fcWZ/IZEaAhrhLD7Z3ig==
X-Google-Smtp-Source: AA6agR4ycWJjwl2rFgkoYIo9fC0Cg8flQ7zt65qwLV9hxmhCn9wMJd8m0S2RL9ct/jVoxEkqZs0PSw==
X-Received: by 2002:a63:6587:0:b0:41b:dacc:1826 with SMTP id z129-20020a636587000000b0041bdacc1826mr16835970pgb.142.1660641655741;
        Tue, 16 Aug 2022 02:20:55 -0700 (PDT)
Received: from margeyang-ThinkPad-T440.synaptics-inc.local ([63.222.17.37])
        by smtp.gmail.com with ESMTPSA id i14-20020a056a00004e00b0052db5872d7esm7963897pfk.22.2022.08.16.02.20.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Aug 2022 02:20:55 -0700 (PDT)
From:   margeyang <marge.yang@synaptics.corp-partner.google.com>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, hdegoede@redhat.com,
        benjamin.tissoires@redhat.com
Cc:     marge.yang@tw.synaptics.com, derek.cheng@tw.synaptics.com,
        vincent.huang@tw.synaptics.com,
        Marge Yang <marge.yang@synaptics.corp-partner.google.com>
Subject: [PATCH V4] Input: synaptics-rmi4 - filter incomplete relative packet.
Date:   Tue, 16 Aug 2022 17:20:49 +0800
Message-Id: <1660641649-11929-1-git-send-email-marge.yang@synaptics.corp-partner.google.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Marge Yang <marge.yang@synaptics.corp-partner.google.com>

RMI4 F03 supports the Stick function,
it's designed to support relative packet.
This patch supports the following case.
When relative packet can't be reported completely,
it may miss one byte or two byte.
New Synaptics firmware will report PARITY error.
When timeout error or parity error happens,
RMI4 driver will sends 0xFE command and
ask FW to Re-send stick packet again.

Signed-off-by: Marge Yang<marge.yang@synaptics.corp-partner.google.com>
---
 drivers/input/rmi4/rmi_f03.c | 74 +++++++++++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/input/rmi4/rmi_f03.c b/drivers/input/rmi4/rmi_f03.c
index c194b1664b10..563b40c2dc06 100644
--- a/drivers/input/rmi4/rmi_f03.c
+++ b/drivers/input/rmi4/rmi_f03.c
@@ -23,8 +23,12 @@
 #define RMI_F03_BYTES_PER_DEVICE_SHIFT	4
 #define RMI_F03_QUEUE_LENGTH		0x0F
 
+#define RMI_F03_RESET_STYK		0xFE
+
 #define PSMOUSE_OOB_EXTRA_BTNS		0x01
 
+#define RELATIVE_PACKET_SIZE		3
+
 struct f03_data {
 	struct rmi_function *fn;
 
@@ -33,6 +37,11 @@ struct f03_data {
 
 	unsigned int overwrite_buttons;
 
+	int iwritecommandcounter;
+	unsigned int ipacketindex;
+	unsigned int serio_flagsArry[RELATIVE_PACKET_SIZE];
+	u8 ob_dataArry[RELATIVE_PACKET_SIZE];
+
 	u8 device_count;
 	u8 rx_queue_length;
 };
@@ -88,6 +97,7 @@ static int rmi_f03_pt_write(struct serio *id, unsigned char val)
 		return error;
 	}
 
+	f03->iwritecommandcounter++;
 	return 0;
 }
 
@@ -107,6 +117,8 @@ static int rmi_f03_initialize(struct f03_data *f03)
 		return error;
 	}
 
+	f03->iwritecommandcounter = 0;
+	f03->ipacketindex = 0;
 	f03->device_count = query1 & RMI_F03_DEVICE_COUNT;
 	bytes_per_device = (query1 >> RMI_F03_BYTES_PER_DEVICE_SHIFT) &
 				RMI_F03_BYTES_PER_DEVICE;
@@ -284,6 +296,22 @@ static irqreturn_t rmi_f03_attention(int irq, void *ctx)
 		ob_data = obs[i + RMI_F03_OB_DATA_OFFSET];
 		serio_flags = 0;
 
+		if (ob_status & (RMI_F03_OB_FLAG_TIMEOUT | RMI_F03_OB_FLAG_PARITY)) {
+			//  Send resend command to stick when timeout or parity error.
+			//  Driver can receive the last stick packet.
+			unsigned char val = RMI_F03_RESET_STYK;
+
+			error = rmi_write(f03->fn->rmi_dev, f03->fn->fd.data_base_addr, val);
+			if (error) {
+				dev_err(&f03->fn->dev,
+					"%s: Failed to rmi_write to F03 TX register (%d).\n",
+					__func__, error);
+				return error;
+			}
+			f03->ipacketindex = 0;
+			break;
+		}
+
 		if (!(ob_status & RMI_F03_RX_DATA_OFB))
 			continue;
 
@@ -298,7 +326,51 @@ static irqreturn_t rmi_f03_attention(int irq, void *ctx)
 			serio_flags & SERIO_TIMEOUT ?  'Y' : 'N',
 			serio_flags & SERIO_PARITY ? 'Y' : 'N');
 
-		serio_interrupt(f03->serio, ob_data, serio_flags);
+		if (f03->iwritecommandcounter > 0) {
+			// Read Acknowledge Byte after writing the PS2 command.
+			// It is not trackpoint data.
+			serio_interrupt(f03->serio, ob_data, serio_flags);
+		} else {
+			//   The relative-mode PS/2 packet format is as follows:
+			//
+			//              bit position            position (as array of bytes)
+			//     7   6   5   4   3   2   1   0
+			//   =================================+
+			//    Yov Xov DY8 DX8  1   M   R   L  | DATA[0]
+			//                DX[7:0]             | DATA[1]
+			//                DY[7:0]             | DATA[2]
+			//   =================================+
+			//		Yov: Y overflow
+			//    Xov: X overflow
+			if ((f03->ipacketindex == 0) && (ob_data & ((BIT(7)|BIT(6))))) {
+				dev_err(&f03->fn->dev,
+				"%s: X or Y is overflow. (%x)\n",
+				__func__, ob_data);
+				break;
+			} else if ((f03->ipacketindex == 0) && !(ob_data & BIT(3))) {
+				dev_err(&f03->fn->dev,
+				"%s: New BIT 3 is not 1 for the first byte\n",
+				__func__);
+				break;
+			}
+			f03->ob_dataArry[f03->ipacketindex] = ob_data;
+			f03->serio_flagsArry[f03->ipacketindex] = serio_flags;
+			f03->ipacketindex++;
+
+			if (f03->ipacketindex == RELATIVE_PACKET_SIZE)	{
+				serio_interrupt(f03->serio, f03->ob_dataArry[0],
+				 f03->serio_flagsArry[0]);
+				serio_interrupt(f03->serio, f03->ob_dataArry[1],
+				 f03->serio_flagsArry[1]);
+				serio_interrupt(f03->serio, f03->ob_dataArry[2],
+				 f03->serio_flagsArry[2]);
+				f03->ipacketindex = 0;
+			}
+		}
+	}
+	if (f03->iwritecommandcounter > 0) {
+		f03->ipacketindex = 0;
+		f03->iwritecommandcounter = f03->iwritecommandcounter - 1;
 	}
 
 	return IRQ_HANDLED;
-- 
2.22.0.windows.1

