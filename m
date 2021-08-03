Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3E73DE3A3
	for <lists+linux-input@lfdr.de>; Tue,  3 Aug 2021 02:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233235AbhHCAjO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Aug 2021 20:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232540AbhHCAjM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Aug 2021 20:39:12 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AC46C06175F;
        Mon,  2 Aug 2021 17:39:01 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id h13so9913585wrp.1;
        Mon, 02 Aug 2021 17:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=l/8Ed6S0tN2RxUJlIUubNrUkmTB8gmmGFdOP6HVjrCw=;
        b=RHXZddUxeu9vMosOBdyoYFmH6hmpjVoW82NV/WeNb2JH88GZf9wV3rcfj4TWW4IP1h
         LNBcMyNVo6I0I9fOPXrhlB7U+5J3szLweAlwL7GoZn0AvijkIrnszvqT/QZ9q2IOQ37V
         juC3PmTDRpe3jJxNgnmRXMP3bM8Uwknaf7BpJLtsoO8FnpMhkIt7niYfYc3oV66LyoxG
         LgcsYLuI+4wlH5dDFZtKsX0K6CGFgomOGcBKU8p72aCd3b1s7/UqWXP50kGDHGxNazCA
         XZrxs/X9K7TbpiJZROpPYN0to6b+oc57Zi7gUwSR7DitI6RMucnxU7GgyY1Q3xlgiZYF
         +p+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=l/8Ed6S0tN2RxUJlIUubNrUkmTB8gmmGFdOP6HVjrCw=;
        b=MubJrcDesCtVaQ4yqwNF9X0U47Wbw0GpzaA2gpE2AO1kYul6uRAg7q3GzzA4ti8RLn
         ZpnaI2v4XYgGj6HsaX3esCxNlz0oJsFHoKk8jNtLp/73OvthHIOTFM2Lno6ZexZVd/ZW
         G0DTYGbLplq6LgIyZiQhLjDAdccBJPnuX1oX7/zIQDpC4alPqhHPd/UljSIf9xWCyFH6
         0YeDz9miNvPUVYcb9yqyhEFbyM7/52RCiopuWNmMdr+xDqLWcDANIel14ef4k9kE9fJH
         I8rccRhFy4wZyKfHONYNN1FCUjbC9w0a7CHtBVKvyTSvzPZTa+Onok9Qbd7SjX2y8MkY
         gIrQ==
X-Gm-Message-State: AOAM5308uiF/gAvqBKSCaDAGSqZTEfvI3frwr58SzLlSWYbeiyeSkDGU
        /3uiTbka0Q7UVtyVr03/p08=
X-Google-Smtp-Source: ABdhPJzz63IvUKyA5AoTWr+A0TdMWEtEkHbw6sAzHHL6/g1JpGI3dzFiTmuQXbYkdOOJCgmIek7gPg==
X-Received: by 2002:adf:f4c5:: with SMTP id h5mr18618668wrp.292.1627951140105;
        Mon, 02 Aug 2021 17:39:00 -0700 (PDT)
Received: from pc ([196.235.140.151])
        by smtp.gmail.com with ESMTPSA id z6sm11645350wmp.1.2021.08.02.17.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 17:38:59 -0700 (PDT)
Date:   Tue, 3 Aug 2021 01:38:57 +0100
From:   Salah Triki <salah.triki@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Salah Triki <salah.triki@gmail.com>,
        Johan Hovold <johan@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, gregkh@linuxfoundation.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] input: touchscreen: replace conditional statement with max()
Message-ID: <20210803003857.GA1560352@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Replace conditional statement with max() in order to make code cleaner.
Issue found by coccinelle.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/input/touchscreen/usbtouchscreen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
index 43c521f50c85..69f36d4f6cea 100644
--- a/drivers/input/touchscreen/usbtouchscreen.c
+++ b/drivers/input/touchscreen/usbtouchscreen.c
@@ -269,7 +269,7 @@ static int e2i_read_data(struct usbtouch_usb *dev, unsigned char *pkt)
 
 	tmp = tmp - 0xA000;
 	dev->touch = (tmp > 0);
-	dev->press = (tmp > 0 ? tmp : 0);
+	dev->press = max(tmp, 0);
 
 	return 1;
 }
-- 
2.25.1

