Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70B3A75334
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2019 17:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389569AbfGYPua (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Jul 2019 11:50:30 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:39900 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389568AbfGYPu3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Jul 2019 11:50:29 -0400
Received: by mail-ed1-f66.google.com with SMTP id m10so50653167edv.6
        for <linux-input@vger.kernel.org>; Thu, 25 Jul 2019 08:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NPzRI+wHt7J9VSEK+V9e/axuse6c4lCMrXpMW5Fy2u4=;
        b=HAcDGKxhELuh6oOgbF4PuJY5VL5TCL/CNvrUag8wfIqA5Jd9zyNJSRZ5Zd8u3aSSSC
         v3OAqDGJJWVPy8WzCe9Q7t1RAQS+YmuVUh794UeMRJ9l6ghBgcUwp9+B7+20LUkBsHHW
         pmwPT8r5A580uieWeOCBs6KvT+hmLoaNaYRzbaf56LbDAnGPfIB+0J1xUOp4l7m/F+YG
         NuFE/S1w3QGIqDmcbCS0/yF5FOh/JrgTdFqDf7+sc2m5C/c0/SO8WK7403ty3AbG8Zwy
         2RFN/YczRm96oTFiKMkhMeiRf/72L8r/Sbzo1SpoVnUS8IQaG9ZUW7IjQvrClCLwwOGn
         TKcA==
X-Gm-Message-State: APjAAAXSLn2IIGa2twlWuPNzbVSchRF+Ve/tV/jxUSaK+aZFNTWRPobi
        qJ11lgFoopVIQh9dwGhX9/NRY+f4OGg=
X-Google-Smtp-Source: APXvYqyJU8oVrk49qxZH287prK1CTBmO3Yowj/vCqJS3SxCAHQCfdEXMkcGgABpZqhmIOx0MikzSeQ==
X-Received: by 2002:a17:906:edd7:: with SMTP id sb23mr68347517ejb.309.1564069827634;
        Thu, 25 Jul 2019 08:50:27 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id gz5sm9840869ejb.21.2019.07.25.08.50.25
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 08:50:27 -0700 (PDT)
Subject: Re: [Regression] 5.3-rc1: hid_llogitech_dj does not work
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Kernel Mailing <linux-kernel@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org
References: <CAHk-=wjm7FQxdF=RKa8Xe23CLNNpbGDOACewgo8e-hwDJ8TyQg@mail.gmail.com>
 <2480108.bWkXKoXas6@kreacher>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1dddedba-ca02-1014-36e0-ba4e3631f28b@redhat.com>
Date:   Thu, 25 Jul 2019 17:50:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2480108.bWkXKoXas6@kreacher>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Rafael,

On 25-07-19 12:07, Rafael J. Wysocki wrote:
> Hi Hans,
> 
> This is similar to a problem I reported some time ago:
> 
> https://lore.kernel.org/lkml/2268131.Lc39eCoc3j@kreacher/
> 
> and the device affected by it is the same.
> 
> The symptom is simply that the mouse just doesn't work (no reaction).  If I do
> "rmmod hid_llogitech_dj", it says "Killed", but the module does go away and
> the mouse starts to work (through the generic code I suppose), but then
> the machine hangs on attempts to suspend (nasty).
> 
> Reverting all of the hid_llogitech_dj changes between 5.2 and 5.3-rc1:
> 
> dbcbabf7da92 HID: logitech-dj: fix return value of logi_dj_recv_query_hidpp_devices
> 39d21e7e0043 HID: logitech-dj: make const array template static
> 423dfbc362b7 HID: logitech-dj: Add usb-id for the 27MHz MX3000 receiver
> 
> helps here, but the first two don't really look like they can make any difference,
> so I guess I'm an unlucky owner of a MX3000 that doesn't quite work as expected.
> 
> Any help will be appreciated. :-)

Actually we received another bug report about this and the reporter there
has come up with a patch with points to

dbcbabf7da92 HID: logitech-dj: fix return value of logi_dj_recv_query_hidpp_devices

Being the culprit, can you try just reverting that one?

I will take a closer look at this soonish.

Thank & Regards,

Hans
