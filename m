Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C745F73655
	for <lists+linux-input@lfdr.de>; Wed, 24 Jul 2019 20:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726849AbfGXSJ3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Jul 2019 14:09:29 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50329 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbfGXSJ3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Jul 2019 14:09:29 -0400
Received: by mail-wm1-f65.google.com with SMTP id v15so42668236wml.0;
        Wed, 24 Jul 2019 11:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tr730TPyiRSMnmgmYHVEvt0pnTgHm5PtfAW9oSx+PLg=;
        b=npi9pu+llLoDSzpo/qCwUbnJDz1nBoNYXXdl+lIvvSj0YHgMaQ5l94csIO3y1jWsR4
         pht6ilwaNzfbFKgLF0Nnh9spLviwGMcxP5I1YLsUmjtMwSd1WVbqEmkToT1G26ueNEqT
         1XJKp2F7RsEeteOlNF2IKz4ZQ3aAbDFtTByETP/TUxUX68xcjp0R9+nuUT5u5fA0w6CG
         V+ud5fkCVBftgsFcXJu5qZxKM8vRH5Xgy0AkL+TJFGZpVUKauR9QFIJHpDBq3p3eHfa5
         6Sb8zdjvVNLtCTEaVcAy5E35v3Uk2iEsXIPu43i+8wgssiYfhHsDymzdNvtSxC30PVl/
         N7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=tr730TPyiRSMnmgmYHVEvt0pnTgHm5PtfAW9oSx+PLg=;
        b=hYfO11lTHLHL5RCZsVwvSy7i8EfhwteMSyhT24BT3ZmYn0aeFRrRMOKIHiYovWUfR1
         Pmn/JrgmxNqPt2jeicf8UA3ENijIV/Py3/xdv0Kx4qAnvjwNV9OCDxCf+Dxjujs93a+k
         ZGVyoUKcePln5iOie6ZZpip7zqSx6gZCLpBKFDouOMTUq9D0wQ9p3Zxl+JpPItxsRGGk
         hB/+o9TSPOgIc0K5y5K17tBjHYfrN6yONvMiJ5PJ2Vsrde2vRB5lhE59XD0viJed4EUG
         9hYFp7ycql5Q9Rt1F1Yc+wP6DLcpzA7TrHu83ir718UECr/4PHbvrIS9sT5l9jMcHbkM
         /YIA==
X-Gm-Message-State: APjAAAWF18kNFMfiUt7kh4HkBWaDbvcdiZ7VPDXjo8dBFp1fEEfDRnrX
        J/5MG8v7kUHImbZnjAvLAi8eB9Mtznc=
X-Google-Smtp-Source: APXvYqxNAF7Uifi0O2qp7spk4dtvv+svXKGD05RvENSpt2ny34sh511vc1z9RcXWvZiTcUmoP+ZCfw==
X-Received: by 2002:a7b:c212:: with SMTP id x18mr73808451wmi.77.1563991766651;
        Wed, 24 Jul 2019 11:09:26 -0700 (PDT)
Received: from vi.lan (2a01-036d-0114-26a3-859c-fac3-f08a-f3a6.pool6.digikabel.hu. [2a01:36d:114:26a3:859c:fac3:f08a:f3a6])
        by smtp.gmail.com with ESMTPSA id y16sm95464629wrg.85.2019.07.24.11.09.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 11:09:26 -0700 (PDT)
From:   =?UTF-8?q?Istv=C3=A1n=20V=C3=A1radi?= <ivaradi@varadiistvan.hu>
Cc:     =?UTF-8?q?Istv=C3=A1n=20V=C3=A1radi?= <ivaradi@varadiistvan.hu>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] HID: quirks: Set the INCREMENT_USAGE_ON_DUPLICATE quirk on Saitek X52
Date:   Wed, 24 Jul 2019 20:09:18 +0200
Message-Id: <20190724180918.5987-1-ivaradi@varadiistvan.hu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Saitek X52 joystick has a pair of axes that are originally
(by the Windows driver) used as mouse pointer controls. The corresponding
usage->hid values are 0x50024 and 0x50026. Thus they are handled
as unknown axes and both get mapped to ABS_MISC. The quirk makes
the second axis to be mapped to ABS_MISC1 and thus made available
separately.

Signed-off-by: István Váradi <ivaradi@varadiistvan.hu>
---
 drivers/hid/hid-quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 185a577c46f6..7b18adb4922f 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -141,6 +141,7 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_RETROUSB, USB_DEVICE_ID_RETROUSB_SNES_RETROPAD), HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_RETROUSB, USB_DEVICE_ID_RETROUSB_SNES_RETROPORT), HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SAITEK, USB_DEVICE_ID_SAITEK_RUMBLEPAD), HID_QUIRK_BADPAD },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SAITEK, USB_DEVICE_ID_SAITEK_X52), HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SEMICO, USB_DEVICE_ID_SEMICO_USB_KEYKOARD2), HID_QUIRK_NO_INIT_REPORTS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SEMICO, USB_DEVICE_ID_SEMICO_USB_KEYKOARD), HID_QUIRK_NO_INIT_REPORTS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SENNHEISER, USB_DEVICE_ID_SENNHEISER_BTD500USB), HID_QUIRK_NOGET },
-- 
2.20.1

