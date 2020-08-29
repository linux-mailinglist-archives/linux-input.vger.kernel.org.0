Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11945256492
	for <lists+linux-input@lfdr.de>; Sat, 29 Aug 2020 06:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725822AbgH2EOj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Aug 2020 00:14:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbgH2EOe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Aug 2020 00:14:34 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38370C061264
        for <linux-input@vger.kernel.org>; Fri, 28 Aug 2020 21:14:32 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id h2so579036plr.0
        for <linux-input@vger.kernel.org>; Fri, 28 Aug 2020 21:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=Dn1HrW2Yd7UbmAKqU7+KrKOaj/zvpyp7jYDa/ue4xlU=;
        b=OsF8laYrHQIqwCszlnrO5Vk2qT8gRadbVy6f6g6ujXO6jBZ0Lbp+TI/HzEPevC5vmw
         wM5Q0GfHPUDCPtXPCchl/p/WD/Z0JORiCzJ+Ed3vw/XJsqzLp/KqH8zQpVHW4/EL99U7
         tu3zsmniwHJfeDoKg0BwHqCUO8Rt8ycuP3BliEXnn22+x1u9DMb1DkR7lCtB1xdH5fZX
         hE7wX69hR+UdruBXxa/ERN5iExm7Pps2O/cVsrfUVNk+ZHtOMdgv/a0zo7GMagu3Jyfi
         LpaGeaTJMAcTcEsRnDXhqRQ1fXUXBYqLJpZ+U7a6j+jdy7wAW/qdEBM3BgvS2Z4UjVdV
         JRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=Dn1HrW2Yd7UbmAKqU7+KrKOaj/zvpyp7jYDa/ue4xlU=;
        b=UV2qEZ/yS0z/6crKvwF6cgBcfTMCxOoQtqJGQ78JmMPhj5nuR7ldTAXkjFr0RlN7H3
         6y31iL9o5mXvZaFdZhQnkhZn6bSPTkYTy/46iZLgb1tPo4ynHAKiFAd3yVyMIypi9vXu
         ee6PjI1rhVw8bbCCenKB/b1rMdjiCrvT+D9lSPTDY6iQtu4A8Y28rURR9onEko+r03lS
         1vxMy05ItM3gbMgMxi0r4udvA/3i/JVrtgkA5nF5XjkGMdzSvP42tf3lqol0cRWIErQS
         YyVlg6UG1QP/cv8cikQPVUBBUkNyPFwYVbup0/ifCbRvBkdynaShwY6VavL+AUumcaqd
         1wjQ==
X-Gm-Message-State: AOAM532bq4P5njZiuHvQT2srxZnGoE+8VkBHaVlbFySTUacVPdWvZi4o
        Qssdcei+mjXQ31Fijjkl3s0=
X-Google-Smtp-Source: ABdhPJzBmL3hz+73c9bXUB5Oiziib/uMGMroAO3u36iqIcoWnI8wi9pIze1Y+sOpkEyFFBlFjKNqPw==
X-Received: by 2002:a17:902:fe8e:: with SMTP id x14mr1579173plm.85.1598674472091;
        Fri, 28 Aug 2020 21:14:32 -0700 (PDT)
Received: from ?IPv6:2601:601:1401:3540:7705:2d1f:7496:570? ([2601:601:1401:3540:7705:2d1f:7496:570])
        by smtp.googlemail.com with ESMTPSA id my8sm702132pjb.11.2020.08.28.21.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2020 21:14:30 -0700 (PDT)
To:     linux-input@vger.kernel.org
From:   Nicholas Miell <nmiell@gmail.com>
Subject: [PATCH] HID: microsoft: Add rumble support for the 8bitdo SN30 Pro+
 controller
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        dmitry.torokhov@gmail.com, pgriffais@valvesoftware.com,
        andrew.smirnov@gmail.com
Message-ID: <3289459a-915f-5f39-f1c0-0d2ee3adeebd@gmail.com>
Date:   Fri, 28 Aug 2020 21:14:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When operating in XInput mode, the 8bitdo SN30 Pro+ requires the same
quirk as the official Xbox One Bluetooth controllers for rumble to
function.

Other controllers like the N30 Pro 2, SF30 Pro, SN30 Pro, etc. probably
also need this quirk, but I do not have the hardware to test. (To test
your Bluetooth XInput controller, try echo "0x5 $vendor $product 0x80" >
/sys/bus/hid/drivers/microsoft/new_id)

Signed-off-by: Nicholas Miell <nmiell@gmail.com>
---
 drivers/hid/hid-ids.h       | 1 +
 drivers/hid/hid-microsoft.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 6f370e020feb3..bfefb0f8ae330 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -845,6 +845,7 @@
 #define USB_DEVICE_ID_MS_POWER_COVER     0x07da
 #define USB_DEVICE_ID_MS_XBOX_ONE_S_CONTROLLER	0x02fd
 #define USB_DEVICE_ID_MS_PIXART_MOUSE    0x00cb
+#define USB_DEVICE_ID_8BITDO_SN30_PRO_PLUS      0x02e0
 
 #define USB_VENDOR_ID_MOJO		0x8282
 #define USB_DEVICE_ID_RETRO_ADAPTER	0x3201
diff --git a/drivers/hid/hid-microsoft.c b/drivers/hid/hid-microsoft.c
index 2d8b589201a4e..8cb1ca1936e42 100644
--- a/drivers/hid/hid-microsoft.c
+++ b/drivers/hid/hid-microsoft.c
@@ -451,6 +451,8 @@ static const struct hid_device_id ms_devices[] = {
 		.driver_data = MS_SURFACE_DIAL },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_XBOX_ONE_S_CONTROLLER),
 		.driver_data = MS_QUIRK_FF },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_8BITDO_SN30_PRO_PLUS),
+		.driver_data = MS_QUIRK_FF },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, ms_devices);
-- 
2.26.2
