Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3E85634B7
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2019 13:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbfGILDm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Jul 2019 07:03:42 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54380 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbfGILDm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 Jul 2019 07:03:42 -0400
Received: by mail-wm1-f66.google.com with SMTP id p74so2607933wme.4
        for <linux-input@vger.kernel.org>; Tue, 09 Jul 2019 04:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=i4AngQnZvqvb1OpQZ5SGnbLghPLc2hb/Z3nGSGr/+Es=;
        b=DWCZZC4ZYMs4zyZcCIDRTePF2gNsTQgeoKb0ueKGF2gNOSgrbUpdxRKWH8NOSetGBw
         6+5KzlDc7J4JeEIgUrNZWkAHUzNqzsOSPmcOetgDVerPO4jo6Uedr7gWcE8mMbWFaAMJ
         ukUcd9SW4LfaWUDRyKJU/UnhGG8aJ/+PZkDL6xFerBZmhydEni35Z7D1iV9rt9SyZkyo
         2ljyV/+GgClfSL6V2tB8Zo0igLSqY/+fe8IQWBVRBjOsugRLE3FKcoQxJrE5eA8TLhM6
         2gAfFfoi0QLJ3Gayzlz2St61qsswVVZSbdZrPpft95XLOTIDtsMP3CB87yypUD2uDoLW
         Uavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=i4AngQnZvqvb1OpQZ5SGnbLghPLc2hb/Z3nGSGr/+Es=;
        b=Nzu4YdTA+tIWa6it9fc09axgdmw3D3MTqr9zuoJHLTctHGepfU8dU0N0vXJ/EKRDVG
         Z0KcFfnN00ZA39/ngnENn5PKgkV3KMS3hdmOTCuAzJYByhQLJFSNB7XLyCVNBGZyJiF7
         ExNNXK6cJw9B/LQr86jqfAc2QpjDYR2thyWIGV2xijovWkjw8Q+/udk09HJ4zWDK60uO
         K5fn/8RSJ0LC/UFw27pLJXCGZ+0lFL0AYGgE35vHQ/CLQZTuAzybA0dealjDzDEJHyNo
         i0NvamZ336cVbtiAKbzvWGMHyRK05bhYsWC+J6WHP7VhMmygK4+xyeqqZGPyUvMIw2wK
         DMkQ==
X-Gm-Message-State: APjAAAWyE5XqofLKkgSJ03ZjvliCwFtrEYHo+xkCzTDhub2YiH2Fsmf6
        fbAHYUbN6w4N3Nb2oaIonpo=
X-Google-Smtp-Source: APXvYqxNkJuakTdXKQcS74pw8HkZ8TM3Gbxo/zUYzyGaVdmYGEfQG/IKD7FOX2cE48UzgCFtQfgySg==
X-Received: by 2002:a1c:343:: with SMTP id 64mr22976748wmd.116.1562670220239;
        Tue, 09 Jul 2019 04:03:40 -0700 (PDT)
Received: from ?IPv6:2a02:810c:6c0:70c:e4a4:44c5:7f7a:8e8? ([2a02:810c:6c0:70c:e4a4:44c5:7f7a:8e8])
        by smtp.gmail.com with ESMTPSA id o185sm2237905wmo.45.2019.07.09.04.03.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 04:03:39 -0700 (PDT)
From:   Fabian Henneke <fabian.henneke@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com
Subject: [PATCH] hidraw: Return EPOLLOUT from hidraw_poll
Message-ID: <3141770d-bb58-e0e9-35ac-84cc23719892@gmail.com>
Date:   Tue, 9 Jul 2019 13:03:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Always return EPOLLOUT from hidraw_poll when a device is connected.
This is safe since writes are always possible (but will always block).

hidraw does not support non-blocking writes and instead always calls
blocking backend functions on write requests. Hence, so far, a call to
poll never returned EPOLLOUT, which confuses tools like socat.

Signed-off-by: Fabian Henneke <fabian.henneke@gmail.com>
In-reply-to: <CA+hv5qkyis03CgYTWeWX9cr0my-d2Oe+aZo+mjmWRXgjrGqyrw@mail.gmail.com>
---
 drivers/hid/hidraw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hidraw.c b/drivers/hid/hidraw.c
index 006bd6f4f653..24f40a3ddded 100644
--- a/drivers/hid/hidraw.c
+++ b/drivers/hid/hidraw.c
@@ -252,7 +252,7 @@ static __poll_t hidraw_poll(struct file *file, poll_table *wait)
 
 	poll_wait(file, &list->hidraw->wait, wait);
 	if (list->head != list->tail)
-		return EPOLLIN | EPOLLRDNORM;
+		return EPOLLIN | EPOLLRDNORM | EPOLLOUT;
 	if (!list->hidraw->exist)
 		return EPOLLERR | EPOLLHUP;
 	return 0;
-- 
2.20.1


