Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20DA134E65C
	for <lists+linux-input@lfdr.de>; Tue, 30 Mar 2021 13:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231872AbhC3Ldt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Mar 2021 07:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231862AbhC3Ldi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Mar 2021 07:33:38 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BE85C061574
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 04:33:38 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id t140so4173553pgb.13
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 04:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NeWUvZBV3NAy1b0eckELIbBZ7sti/n1sLYnD4r2cjaU=;
        b=L7lXWlYljg2OiuXRdqbKSJIi48tUgBGncPDl5WJYxie/1qg+ZpaJOuM1PMBmp/Yjsi
         VQSwRj7G25pR+BEV5OY5JBx88YplDPvIHkctzDhTHIz6+viEzoo1rkEKTV++g472n1WN
         QvO9Ca37Nn9uN+OoTbdyQ79+h2qcYVFem4tXkzROXn95pdALA1JS5BFmd/wBAymTHzNU
         GJWphpBpz/h6Q4RqtAl2mzLklc+ytAuALPtNR9irAGFrskBVSfgbmExIe86TqZ+RlzfX
         o21XR3e3We7m2pOZF1FDMpRibZlbj8MAA0grieNZCGPEY2JMdykVSqR1nS25w548auMH
         cBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NeWUvZBV3NAy1b0eckELIbBZ7sti/n1sLYnD4r2cjaU=;
        b=IkVD68ddyEvX0SKBSoF1tcndcG96aL33SNy09GfRgdbNkxuFjTAWjBtux0iuZt5Y8y
         i5whxjg9LKj2XHW4dtWK8LHxCjtcd2N5RzXDwaObdNPeoznnOIm9P6Lmodn2svSswPcZ
         mHiKbcWa0sVU7PLLRDYsDTWOg0UVhcJMAYqN6DjHJkuLtpPYU0XsD6vOtg1+rNuK0RTS
         LdkyzDk0VcRlaS1mYxkpkqzjPGriSdMMh/q8TqCsDqo1lguGJbTvaQ2MsuiTehz0tKvl
         L6iCj26KKH1+H2JvHXMOKq1CIo+j/J8w6iLwqh5U/hZMgzG209Y1RmqK9VoySwa77x8G
         KQ6Q==
X-Gm-Message-State: AOAM533wQejdxQxKGDZd+YIN7yAG8wbvP2U39DdGAWFNI0jvnannCdHW
        ZA1PTlTsl8vVj7UmxBubrpeQ9/YwB+ONHxW5
X-Google-Smtp-Source: ABdhPJxL28GgIKWBgC5EQ8ud+cQ31L1OqI4Jxis4LCPa5ZmEmoQynFTGYOwJMe2IFB+nlAWatzJc5w==
X-Received: by 2002:a62:3706:0:b029:211:3d70:a55a with SMTP id e6-20020a6237060000b02902113d70a55amr28410593pfa.16.1617104017486;
        Tue, 30 Mar 2021 04:33:37 -0700 (PDT)
Received: from johnchen902-arch-ryzen.. (2001-b011-3815-5a81-9afa-9bff-fe6e-3ce2.dynamic-ip6.hinet.net. [2001:b011:3815:5a81:9afa:9bff:fe6e:3ce2])
        by smtp.gmail.com with ESMTPSA id y4sm19650868pfn.67.2021.03.30.04.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 04:33:37 -0700 (PDT)
From:   John Chen <johnchen902@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Rohit Pidaparthi <rohitpid@gmail.com>,
        RicardoEPRodrigues <ricardo.e.p.rodrigues@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        John Chen <johnchen902@gmail.com>
Subject: [PATCH v2 2/4] HID: magicmouse: fix 3 button emulation of Mouse 2
Date:   Tue, 30 Mar 2021 19:33:17 +0800
Message-Id: <20210330113319.14010-3-johnchen902@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210330113319.14010-1-johnchen902@gmail.com>
References: <20210330113319.14010-1-johnchen902@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

It is observed that, with 3 button emulation, when middle button is
clicked, either the left button or right button is clicked as well. It
is caused by hidinput "correctly" acting on the event, oblivious to the
3 button emulation.

As raw_event has taken care of everything, no further processing is
needed. However, the only way to stop at raw_event is to return an error
(negative) value. Therefore, the processing is stopped at event instead.

Signed-off-by: John Chen <johnchen902@gmail.com>
---
 drivers/hid/hid-magicmouse.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index 7aad6ca56780..c646b4cd3783 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -440,6 +440,21 @@ static int magicmouse_raw_event(struct hid_device *hdev,
 	return 1;
 }
 
+static int magicmouse_event(struct hid_device *hdev, struct hid_field *field,
+		struct hid_usage *usage, __s32 value)
+{
+	struct magicmouse_sc *msc = hid_get_drvdata(hdev);
+	if (msc->input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 &&
+	    field->report->id == MOUSE2_REPORT_ID) {
+		// magic_mouse_raw_event has done all the work. Skip hidinput.
+		//
+		// Specifically, hidinput may modify BTN_LEFT and BTN_RIGHT,
+		// breaking emulate_3button.
+		return 1;
+	}
+	return 0;
+}
+
 static int magicmouse_setup_input(struct input_dev *input, struct hid_device *hdev)
 {
 	int error;
@@ -754,6 +769,7 @@ static struct hid_driver magicmouse_driver = {
 	.id_table = magic_mice,
 	.probe = magicmouse_probe,
 	.raw_event = magicmouse_raw_event,
+	.event = magicmouse_event,
 	.input_mapping = magicmouse_input_mapping,
 	.input_configured = magicmouse_input_configured,
 };
-- 
2.31.0

