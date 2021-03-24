Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B85C5347F74
	for <lists+linux-input@lfdr.de>; Wed, 24 Mar 2021 18:35:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237226AbhCXRek (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Mar 2021 13:34:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237238AbhCXReP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Mar 2021 13:34:15 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 937D3C0613E1
        for <linux-input@vger.kernel.org>; Wed, 24 Mar 2021 10:34:15 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id e7so28504956edu.10
        for <linux-input@vger.kernel.org>; Wed, 24 Mar 2021 10:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YVoLbq8RBXUfihLEoAO2RhgjiaRVSJgl/YQpPYdz058=;
        b=F+iJ9M+WInt+IZa6vVqUUZZZXKjhcQ0sePVfsAX4epZi6SWJVwwuoO49lpEpWsG1B4
         lKTGk75uroceeGyvtgjjYpPiujSmq/LW9HLYXMjM0earEN+yrwXDAj9NnLOb+WVywr0E
         OihBB1Ah5Y+zYcknMsE9vNN7NU+z3C60+eoaaYCl/YU9INj8EwOoX8ifSB03NMHEefq3
         /1U3MTbAvW7ffjBahhaiMpWExcRT0HxVlOb4shQrt6UVPCrPlcrAF3Dfoa6Vx6HmEYjV
         3nQXYNopEpnO8Qzbnfdkla5KC38yLS6Y+r2C9Ghawi14bY0tK9CVh7OD8mP5/Y1usLIK
         4D/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YVoLbq8RBXUfihLEoAO2RhgjiaRVSJgl/YQpPYdz058=;
        b=Bq9wsHqktObNkcXr8+icAfuUbi4NEOfIEhAE24ZmIY0BVUHtLirUczR/SXZe3rRyzA
         SIhtSVtzwPaeqHRSrTeyd4f1+2YrSGCf3cK7xmEynmI48OC/wBHx7iAde1R4iePymSnW
         +XipKRrgX2xrvaDNDT4d+CrHekTi/QCjgv7bKBETjteLqlcJjDIGQN3hqKjc72m4cAsO
         tESFHkwVxAqzAfvik3omPI54CdsKTxOZdbzYQfEOC+H6Lnc1Sn//FJ92Vt9Q2BNO0Ad7
         ZLfgIAAoH5oPxDxHuKjOZhlIr0pPPRekVELZZ2Q70UEqRtbAQeHGmgfaCA5vHX0R21oj
         5oGA==
X-Gm-Message-State: AOAM533AbzE1GClAoEnhRU/r45VSFMUZJ95ABH42qWOMKnr/Y2UH9UKO
        qLZdwhaiNC4V3Rf46TcAKguMvg==
X-Google-Smtp-Source: ABdhPJxRZif/QlzU41cuhZx3aHLwJ3xCFIf1WIBnnn5M/mUI6grvUz+kGd+AImbr0OB4afgXt35r3g==
X-Received: by 2002:a05:6402:3587:: with SMTP id y7mr4901632edc.54.1616607254314;
        Wed, 24 Mar 2021 10:34:14 -0700 (PDT)
Received: from dell.default ([91.110.221.180])
        by smtp.gmail.com with ESMTPSA id p19sm1466367edr.57.2021.03.24.10.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 10:34:13 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        message to <vojtech@ucw.cz>, linux-usb@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH 06/25] HID: usbhid: Repair a formatting issue in a struct description
Date:   Wed, 24 Mar 2021 17:33:45 +0000
Message-Id: <20210324173404.66340-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210324173404.66340-1-lee.jones@linaro.org>
References: <20210324173404.66340-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/hid/usbhid/usbkbd.c:66: warning: bad line:                 should be on

Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: message to <vojtech@ucw.cz>
Cc: linux-usb@vger.kernel.org
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/hid/usbhid/usbkbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/usbkbd.c b/drivers/hid/usbhid/usbkbd.c
index d5b7a696a68c5..d0c640be8a885 100644
--- a/drivers/hid/usbhid/usbkbd.c
+++ b/drivers/hid/usbhid/usbkbd.c
@@ -63,7 +63,7 @@ static const unsigned char usb_kbd_keycode[256] = {
  *		new key is pressed or a key that was pressed is released.
  * @led:	URB for sending LEDs (e.g. numlock, ...)
  * @newleds:	data that will be sent with the @led URB representing which LEDs
- 		should be on
+ *  		should be on
  * @name:	Name of the keyboard. @dev's name field points to this buffer
  * @phys:	Physical path of the keyboard. @dev's phys field points to this
  *		buffer
-- 
2.27.0

