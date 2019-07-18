Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 536E16D601
	for <lists+linux-input@lfdr.de>; Thu, 18 Jul 2019 22:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbfGRUvC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Jul 2019 16:51:02 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:33928 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727687AbfGRUvC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Jul 2019 16:51:02 -0400
Received: by mail-ed1-f65.google.com with SMTP id s49so32113612edb.1
        for <linux-input@vger.kernel.org>; Thu, 18 Jul 2019 13:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=BForRrlpL+KyZG6ISBWhJCdyq+J05d1LT1A+UYYas5E=;
        b=K6LdhqekYHs1XneMALWEV29p0fEfMsPCvFG7OvCvCKY5zfOytRxlKroTKirIz1FbhV
         dDks5OLED14dxYAtV4TvytRsocbWulUsNECO759sthu2uyQf0u+o4cf14bssrJa9HvwA
         j2V3QvH34bEhBAF9cqdbO5WvOleEgdmiJ9yfmXkYBV1sCMeM3Qw1q0OxMwM+fnO/lIN+
         pxcJxpLOHHU0GDxnZvHgqldJBDpk2WAPCw/3Bvy2OP+3ARAZ4EcjcQTWLtO0vpGMQogC
         HVuT0nV3J/nZrSxt3aUxpnC8g7D3RjXhYfyo57VRtCwj6KssY3u7KTrC9M8uYFOSFwUM
         KzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BForRrlpL+KyZG6ISBWhJCdyq+J05d1LT1A+UYYas5E=;
        b=KypLbd2IAaSL34rIwF9o5AhMdBziEMx7GTU5++KKhq7Zm7pngjnL1YlafKAbj95+HN
         Alk7SxDW0DY+lTUrKwzmxLXTySdvHH90Ic/pscxCHi+VT5SrgXpUftM1DbQ5tYfOzg6r
         aSqdJWJSU70rjrSVGajyBcps9+2NV4PXGQ0B26vYQXo2S+oPPn/4E6DNk0KnDPb63XMF
         p4fhL6fW0p+Vcwcxib8vR44iADR8c2/F3rx4ymCxE1drpwRtzS0h8GLMzW1WvQXfSB2Z
         N0K8tY8napFEICAJLLx9pZGWQ7wR/oq4arVggShyd50/xeg3LDu4ClvgUGSQjKiVcnzK
         9wMQ==
X-Gm-Message-State: APjAAAVZw6Eae1CBJsu2pWCrEg88iuKdNrlR7LAw6pJ3lEwXN0ZjToH9
        /rJkC/QtCRAp8Ez7WAzhbP9mO+I836M=
X-Google-Smtp-Source: APXvYqzU1E7Kr7xnIy1xhh0GMqtiL4RBlT4+XR82rSNavLYQuf6eNSJdueqNk8Unum0ZUANLMIEywg==
X-Received: by 2002:a17:906:7382:: with SMTP id f2mr37006566ejl.88.1563483059794;
        Thu, 18 Jul 2019 13:50:59 -0700 (PDT)
Received: from ?IPv6:2001:16b8:1ce7:c900:58f4:fdce:9c5d:69b8? ([2001:16b8:1ce7:c900:58f4:fdce:9c5d:69b8])
        by smtp.gmail.com with ESMTPSA id t18sm5793270ejz.74.2019.07.18.13.50.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 13:50:59 -0700 (PDT)
Subject: [PATCH] hiddev: Return EPOLLOUT from hiddev_poll
To:     Jiri Kosina <jikos@kernel.org>,
        linux-input <linux-input@vger.kernel.org>
References: <3141770d-bb58-e0e9-35ac-84cc23719892@gmail.com>
 <nycvar.YFH.7.76.1907171333160.5899@cbobk.fhfr.pm>
From:   Fabian Henneke <fabian.henneke@gmail.com>
Message-ID: <ad32bc93-e833-d729-3b96-f18146c9099a@gmail.com>
Date:   Thu, 18 Jul 2019 22:50:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.1907171333160.5899@cbobk.fhfr.pm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Always return EPOLLOUT from hiddev_poll when a device is connected.
This is safe since hiddev_write always fails and improves compatibility
with tools like socat.

Signed-off-by: Fabian Henneke <fabian@henneke.me>
In-reply-to: <nycvar.YFH.7.76.1907171333160.5899@cbobk.fhfr.pm>
---
 drivers/hid/usbhid/hiddev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hiddev.c b/drivers/hid/usbhid/hiddev.c
index 55b72573066b..73a76d9af974 100644
--- a/drivers/hid/usbhid/hiddev.c
+++ b/drivers/hid/usbhid/hiddev.c
@@ -416,7 +416,7 @@ static __poll_t hiddev_poll(struct file *file, poll_table *wait)

        poll_wait(file, &list->hiddev->wait, wait);
        if (list->head != list->tail)
-               return EPOLLIN | EPOLLRDNORM;
+               return EPOLLIN | EPOLLRDNORM | EPOLLOUT;
        if (!list->hiddev->exist)
                return EPOLLERR | EPOLLHUP;
        return 0;
-- 
2.20.1

