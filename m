Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF53BB43D6
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 00:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727999AbfIPWQL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Sep 2019 18:16:11 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36639 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729632AbfIPWQL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Sep 2019 18:16:11 -0400
Received: by mail-lf1-f65.google.com with SMTP id x80so1223881lff.3
        for <linux-input@vger.kernel.org>; Mon, 16 Sep 2019 15:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OjeXXmneEY1+cdlBCuXNvkRTitrNfKZl6S7JEd4/kjY=;
        b=Iv5FO+HJMQkyTKLUaJdQl9XuV/HZf9Bg4skseGPfLwijPhuo8l2GP8s3pqER2RTKNr
         XnX4gIl7ydaUQDSG74VpTyk5fNrZCiD3c1MsizczxBusbkgerfayLUng6BEbGn/FlgFI
         o5qEuDh1Z31Phe+X31dWtC5Wa/drv1+8jUDgvrUwE0e/+Kj2pH/CyMaYoB6HmwQA7U3U
         Jfxsk2h0LpXGyEAKuEuIdbDKm9iWbf2kTOkWTDU1MBBi2hpkuFpUb30ASwP91UjZ3n3E
         m35uSGbgqyYPbB1XhimNbBrfJhZIelCaOlL1mKUBCTD5rqcxlDJvj0DNcvEeMZphtSNp
         zXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OjeXXmneEY1+cdlBCuXNvkRTitrNfKZl6S7JEd4/kjY=;
        b=g5rgHVI+8X0p+bRufKr5jmwFpNQDcfYWjjhwlZy62FXRAcwjo5Jrh2D8ypNx0mehUU
         WNr+kovzESzx50W9YFhWykELUwkVmCXrRSwZIfCz3f9cnTPJrhQFT3znAkzebmxYnokL
         24gfiBerI0bVuQL+R6Mmra8aBooW5sqfclhe7s20q+h9gUCXp9mqQFUBLy90Nw0fCgUL
         N4WdCQwQl+o9kuPsEF9J4n91w6XHYg3trFcU/Lb/PyZbBhw/jZBk8DtB3Qj/vJYB8sOZ
         lP/sYUMXmTAHjBwemhr/6Dcxfusw+c0jH8p34XYg/8horVk6AQqYn64WQv7tC27wTJLi
         yIng==
X-Gm-Message-State: APjAAAW6i15wDIOGbuzys831lvvjOsKYOOs6VklkQB2d7Nm6lKF0+/xh
        VXIkTTfyCGUBYsbDrPTl8zU=
X-Google-Smtp-Source: APXvYqx3EuJuFO2ue5jqsylbs8CCahe5BmrxBCKoh1Oj4Dy+u8NnDQvcSz/MwWmRCXRApmk8Vo4Dog==
X-Received: by 2002:a19:beca:: with SMTP id o193mr228718lff.137.1568672169008;
        Mon, 16 Sep 2019 15:16:09 -0700 (PDT)
Received: from localhost.localdomain ([46.216.138.44])
        by smtp.gmail.com with ESMTPSA id g1sm39161ljl.31.2019.09.16.15.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 15:16:07 -0700 (PDT)
Received: from jek by localhost.localdomain with local (Exim 4.92.1)
        (envelope-from <jekhor@gmail.com>)
        id 1i9zHz-0000CH-TL; Tue, 17 Sep 2019 01:16:07 +0300
From:   Yauhen Kharuzhy <jekhor@gmail.com>
To:     Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Henrik Rydberg <rydberg@bitmath.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [RESEND PATCH 0/1] Add 9-bytes reports support for goodix TS
Date:   Tue, 17 Sep 2019 01:16:01 +0300
Message-Id: <20190916221602.715-1-jekhor@gmail.com>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is re-send of previous patch from 10 Feb 2019, without of any
changes.

Following patch adds support for 9-bytes format of contact data reports
found in Lenovo YB1-X91L tablet (Yoga Book). Seems that this tablet has
GT9110 chip with custom firmware.

Here is dump of config data:
0x8040: xx xx xx xx xx xx xx 4e b0 04 80 07 0a 05 20 01
0x8050: c8 1e 05 41 2d 03 00 00 00 00 00 00 00 00 00 00
0x8060: 00 00 95 35 ff 14 16 e5 26 03 07 00 1b 03 11 00
0x8070: 00 00 00 0b 0f 07 12 03 00 00 0a 1e 54 c0 04 00
0x8080: 00 00 04 c3 0b 00 ac 0d 00 8e 11 00 7c 15 00 6d
0x8090: 1b 00 6c 00 00 00 00 00 00 00 00 00 00 00 00 00
0x80a0: 00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 20
0x80b0: 00 00 00 00 00 50 00 1d 1c 1b 1a 19 18 17 16 15
0x80c0: 14 13 12 11 10 0f 0e 0d 0c 0b 0a 09 08 07 06 05
0x80d0: 04 03 02 01 00 2a 29 28 27 26 25 24 23 22 21 20
0x80e0: 1f 1e 1d 1c 1b 19 18 17 16 15 14 13 12 11 10 0f
0x80f0: 0e 0d 0c 0b 0a 09 08 07 06 05 04 03 02 01 00 fe
0x8100: 00

0x8140: 39 31 31 30 03 20 b0 04 80 07 00 00 00 04

I didn't find any way to reliable detect of format using only the config
data, so DMI check for machine name is used.

Yauhen Kharuzhy (1):
  goodix touchscreen: Add support for 9-bytes reports

 drivers/input/touchscreen/goodix.c | 58 +++++++++++++++++++++++++-----
 1 file changed, 50 insertions(+), 8 deletions(-)

-- 
2.23.0.rc1

