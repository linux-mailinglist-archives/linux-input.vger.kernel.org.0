Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B205590D91
	for <lists+linux-input@lfdr.de>; Fri, 12 Aug 2022 10:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237383AbiHLInf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 Aug 2022 04:43:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbiHLIne (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 Aug 2022 04:43:34 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5779DA8964
        for <linux-input@vger.kernel.org>; Fri, 12 Aug 2022 01:43:33 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id y1so218349plb.2
        for <linux-input@vger.kernel.org>; Fri, 12 Aug 2022 01:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc;
        bh=kSOdIAVCbyX9fuxNC7baT+98A2d4xsZwipDvwGnvTy0=;
        b=aEbZShG5Y3lbDu+DLWdpyUYtmNqOYHXWFc6tgJqOb7mQrVFMz0vQ85FAbYLqwjChN6
         1idsPtCTYjfRP31AHj1YysUV31ar/IW1D1SQYY3XLNcq8rg2nf0T6DPKW/RoCNiSBbxP
         Fl5Y70C+NhQL8OqFojargP942sz3k7+YZZNIdjeK4jHiWztS4qkhBIVzQBPk5rbg7kbU
         5lgXgxYEalqleQM8ZoHbZSH3lcEN+EhgkDZmkS/CyZOLasnPJpoK/xSBHbtJeocC8kQ3
         /jBWVdGl8wpSEBBAVTtyiB6F9LiiXqUvc1TNT+ZAlh1Qq2VdYLTXba8LOXo3YZxLaelz
         QDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=kSOdIAVCbyX9fuxNC7baT+98A2d4xsZwipDvwGnvTy0=;
        b=VBNBo23LBjFECRiPv/ztojnMyEkVrXoIUCR0BELZ0oIbYAHa1UWlLtBhGE6rr2yBq1
         kYO7Nk8hMdHDxJCEG+aVWe+6utP/kSi3aWZmNIxCedGdIYvMp1AUtexEDN8qEJ07Gbae
         mxQxmbwcnkXE7WHpii2L76gk+ZkVR+zTXVbIdy1j9bYNeh6p4GylSUvX5ehIfKaXRKpi
         99FCq81XJ6g8+I6Uwkv0t/20r3HQ9NAgxXa9ezlwUQwAdSDN/RlFZfFB6tOUtPfvl47O
         2BGczdIvCgeyYSAA0CRbn89d5oftpL5wlnowdfPuOzYby0AR5nj3Rwn0wj+X6yaCH4Ul
         p2Ow==
X-Gm-Message-State: ACgBeo3w5mHsZ5ebmXqGM7+Eh6zozAloxl+nEE2mkTUvYEvVUPN7uTkN
        /zm9RfeFIZ6mr2keLjyQSgLpsA==
X-Google-Smtp-Source: AA6agR7z8YQui3JABeyn+3bgCDEkfOwapvyU/Z9HgLYIpxH82uIX+gv3/YemeMH3k/pk+pvhC9nkNQ==
X-Received: by 2002:a17:902:bf46:b0:170:aedd:e866 with SMTP id u6-20020a170902bf4600b00170aedde866mr3045368pls.21.1660293812870;
        Fri, 12 Aug 2022 01:43:32 -0700 (PDT)
Received: from localhost.localdomain ([63.222.17.38])
        by smtp.gmail.com with ESMTPSA id a128-20020a636686000000b004114cc062f0sm907954pgc.65.2022.08.12.01.43.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Aug 2022 01:43:32 -0700 (PDT)
From:   margeyang <marge.yang@synaptics.corp-partner.google.com>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, hdegoede@redhat.com,
        benjamin.tissoires@redhat.com
Cc:     marge.yang@tw.synaptics.com, derek.cheng@tw.synaptics.com,
        vincent.huang@tw.synaptics.com,
        Marge Yang <marge.yang@synaptics.corp-partner.google.com>
Subject: [PATCH V2] Input: synaptics-rmi4 - filter incomplete relative packet.
Date:   Fri, 12 Aug 2022 16:43:25 +0800
Message-Id: <1660293805-16053-1-git-send-email-marge.yang@synaptics.corp-partner.google.com>
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
 drivers/input/rmi4/rmi_f03.c | 83 ++++++++++++++++++++++++++++++++++--
 1 file changed, 79 insertions(+), 4 deletions(-)

diff --git a/drivers/input/rmi4/rmi_f03.c b/drivers/input/rmi4/rmi_f03.c
index c194b1664b10..56b3e1129b51 100644
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
@@ -87,7 +96,7 @@ static int rmi_f03_pt_write(struct serio *id, unsigned char val)
 			__func__, error);
 		return error;
 	}
-
+	f03->iwritecommandcounter++;
 	return 0;
 }
 
@@ -106,7 +115,8 @@ static int rmi_f03_initialize(struct f03_data *f03)
 		dev_err(dev, "Failed to read query register (%d).\n", error);
 		return error;
 	}
-
+	f03->iwritecommandcounter = 0;
+	f03->ipacketindex = 0;
 	f03->device_count = query1 & RMI_F03_DEVICE_COUNT;
 	bytes_per_device = (query1 >> RMI_F03_BYTES_PER_DEVICE_SHIFT) &
 				RMI_F03_BYTES_PER_DEVICE;
@@ -284,6 +294,22 @@ static irqreturn_t rmi_f03_attention(int irq, void *ctx)
 		ob_data = obs[i + RMI_F03_OB_DATA_OFFSET];
 		serio_flags = 0;
 
+		if (ob_status & (RMI_F03_OB_FLAG_TIMEOUT | RMI_F03_OB_FLAG_PARITY)) {
+			//  Send resend command to stick when timeout or parity error.
+			//  Driver can receive the last stick packet.
+
+			error = rmi_write(f03->fn->rmi_dev, f03->fn->fd.data_base_addr,
+			 RMI_F03_RESET_STYK);
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
 
@@ -298,9 +324,58 @@ static irqreturn_t rmi_f03_attention(int irq, void *ctx)
 			serio_flags & SERIO_TIMEOUT ?  'Y' : 'N',
 			serio_flags & SERIO_PARITY ? 'Y' : 'N');
 
-		serio_interrupt(f03->serio, ob_data, serio_flags);
+		if (f03->iwritecommandcounter > 0) {
+			// Read Acknowledge Byte after writing the PS2 command.
+			// It is not trackpoint data.
+			serio_interrupt(f03->serio, ob_data, serio_flags);
+
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
+				goto exit;
+			} else if ((f03->ipacketindex == 0) && !(ob_data & BIT(3))) {
+				dev_err(&f03->fn->dev,
+				"%s: New BIT 3 is not 1 for the first byte\n",
+				__func__);
+				goto exit;
+			} else {
+				if (f03->ipacketindex >= RELATIVE_PACKET_SIZE)
+					f03->ipacketindex = 0;
+
+				f03->ob_dataArry[f03->ipacketindex] = ob_data;
+				f03->serio_flagsArry[f03->ipacketindex] = serio_flags;
+				f03->ipacketindex++;
+
+				if (f03->ipacketindex == RELATIVE_PACKET_SIZE)	{
+					serio_interrupt(f03->serio, f03->ob_dataArry[0],
+					 f03->serio_flagsArry[0]);
+					serio_interrupt(f03->serio, f03->ob_dataArry[1],
+					 f03->serio_flagsArry[1]);
+					serio_interrupt(f03->serio, f03->ob_dataArry[2],
+					 f03->serio_flagsArry[2]);
+					f03->ipacketindex = 0;
+				}
+			}
+		}
+	}
+exit:
+	if (f03->iwritecommandcounter > 0) {
+		f03->ipacketindex = 0;
+		f03->iwritecommandcounter = f03->iwritecommandcounter - 1;
 	}
-
 	return IRQ_HANDLED;
 }
 
-- 
2.22.0.windows.1

