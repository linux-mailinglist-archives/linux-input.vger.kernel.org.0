Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5B5934A9EA
	for <lists+linux-input@lfdr.de>; Fri, 26 Mar 2021 15:37:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhCZOfr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Mar 2021 10:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbhCZOfK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Mar 2021 10:35:10 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78DA5C0613B5
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:09 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id g20so3097642wmk.3
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YVoLbq8RBXUfihLEoAO2RhgjiaRVSJgl/YQpPYdz058=;
        b=B2LHHGKt5RYtaAQDcE2ea2YjPdmOcookzVWUcAeW2fSKBOJYI4+/tTokzh72qclZTH
         o9XkPL0/M9rjfnS0EZXsGyJLZuK/uhjxvHwy1BgLn7IF2r6pLi5+aL1OsFmoaK4rM18+
         /8iiG42d8nOg7/rkGhD126LKouPNXEJWi2msD9kTTxN49Wxj2WHPgltfnrXugkf++PmV
         Dnkl+/l2GOSiKRL9zXMtTp+NQdKdWLXML6VUtuhVoVumEgKfU33KjTxhACDeTX0YFY2P
         2zDhuvtdB3zSN3PqLen9XWHTHmRYsWQtS5DmLO0R+qUVl5hEEGYzb45za+kw3BYdKZZb
         ph4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YVoLbq8RBXUfihLEoAO2RhgjiaRVSJgl/YQpPYdz058=;
        b=Ncyp+PvQhfSvQL+oTNIEN1AJ9k35FigkS/2I22WKeL9Jhnjsb2v1H5bLrEdbjY+Oco
         AKykBFiFV+aMQZEjedHKIPJP1tdvzftL5l5qTpe3nUdg6PeXojC2IkWguytBnMqWM/bO
         3FFR4R0uF5yorUhSqa0zJMKIofXD9cCaZ0eMEKDYKPI4yLST2jDsZhKQiVIcHQQcewUt
         SD6oBUl3vgG1UHh76ordKWZqG0dUsZqZb7uo0dFC82sAr3s9VxC8mrLQR3bB1FRPBHLL
         ZkarWpVOA/XEidNipPlCz7vpR2kL1FmEjnEjmqCDI+qGXs6nil5vZZ/0PjV4qcFn0iVT
         knHQ==
X-Gm-Message-State: AOAM532vDNgSt19n/UFnYl1TZZtBX2mV5Qs3Z3HgOD5MesCagvzAy8Qe
        Nqi6sAj9XGl2wL800tMz9loIkQ==
X-Google-Smtp-Source: ABdhPJyOl6H0eBdmFimOW38fifNp/S8IZLg8/1blX0NB8KwX5xbBrC5A0cvRaugsDJzcDYhO6id48Q==
X-Received: by 2002:a1c:4e0f:: with SMTP id g15mr13424401wmh.144.1616769308209;
        Fri, 26 Mar 2021 07:35:08 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id j26sm12878225wrh.57.2021.03.26.07.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:35:07 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        message to <vojtech@ucw.cz>, linux-usb@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH 06/25] HID: usbhid: Repair a formatting issue in a struct description
Date:   Fri, 26 Mar 2021 14:34:39 +0000
Message-Id: <20210326143458.508959-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210326143458.508959-1-lee.jones@linaro.org>
References: <20210326143458.508959-1-lee.jones@linaro.org>
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

