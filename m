Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8959178FD1
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2019 17:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387512AbfG2Ptr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Jul 2019 11:49:47 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39570 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387495AbfG2Ptr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Jul 2019 11:49:47 -0400
Received: by mail-wr1-f65.google.com with SMTP id x4so9241701wrt.6
        for <linux-input@vger.kernel.org>; Mon, 29 Jul 2019 08:49:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=r1zF/Xvf5xstuaSmuvOpiw5SBlzxXv+2sIQrb0XvTxI=;
        b=XzFESUgwWYMnkbvm4GS8pDDVELK2JXYxDaw9nzGtAgPJzyOHgWBwbgbLjnfHNg2eT8
         xSsmvpYIThW0V11rM6PABNuUUOxkP1g3ASdQQz7JIAVozDXYOOwL/Bfgrk8lgsKOGGsG
         /fVspSoSbLzuZBfnjb8ihVJRcYN4UOwYoz3mjX/2bRBZUlFHZzPrKJOE25lnkG4QSdZn
         BJ/8fNCzASi75V8Mmkcdec6piRJbyvxjXCgNV4xtqqcVw2zO22PGNUNKYHHDwb+Rnq3l
         96Pa0DoG7wjrpIW57gMihb/ZaspZr/+8JFHbLPnfs4Q6TZxvZHSAuFWeW7aRFoupDTwo
         0NUQ==
X-Gm-Message-State: APjAAAX74X8/zrelpYAdyodzTaQzfPxSbGktMNaBqRIJSULqZzbvF6yU
        ITEptXukOsqEV9UNDq8cgQ2eDsNLLf8=
X-Google-Smtp-Source: APXvYqwG1kkdqyheJ5L/2tF9vxiXysI2Qf0EqMWIGET334y6sf3M1167NNNxYUgurF+LYlcv+lW2ng==
X-Received: by 2002:a5d:428b:: with SMTP id k11mr87739246wrq.174.1564415385095;
        Mon, 29 Jul 2019 08:49:45 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id r14sm54428995wrx.57.2019.07.29.08.49.44
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 08:49:44 -0700 (PDT)
Subject: Re: [Regression] 5.3-rc1: hid_llogitech_dj does not work
From:   Hans de Goede <hdegoede@redhat.com>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Kernel Mailing <linux-kernel@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org
References: <CAHk-=wjm7FQxdF=RKa8Xe23CLNNpbGDOACewgo8e-hwDJ8TyQg@mail.gmail.com>
 <2480108.bWkXKoXas6@kreacher>
 <1dddedba-ca02-1014-36e0-ba4e3631f28b@redhat.com>
Message-ID: <5036172e-1fa9-d038-4473-b4f257764b78@redhat.com>
Date:   Mon, 29 Jul 2019 17:49:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1dddedba-ca02-1014-36e0-ba4e3631f28b@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Rafael,

On 25-07-19 17:50, Hans de Goede wrote:
> Hi Rafael,
> 
> On 25-07-19 12:07, Rafael J. Wysocki wrote:
>> Hi Hans,
>>
>> This is similar to a problem I reported some time ago:
>>
>> https://lore.kernel.org/lkml/2268131.Lc39eCoc3j@kreacher/
>>
>> and the device affected by it is the same.
>>
>> The symptom is simply that the mouse just doesn't work (no reaction).  If I do
>> "rmmod hid_llogitech_dj", it says "Killed", but the module does go away and
>> the mouse starts to work (through the generic code I suppose), but then
>> the machine hangs on attempts to suspend (nasty).
>>
>> Reverting all of the hid_llogitech_dj changes between 5.2 and 5.3-rc1:
>>
>> dbcbabf7da92 HID: logitech-dj: fix return value of logi_dj_recv_query_hidpp_devices
>> 39d21e7e0043 HID: logitech-dj: make const array template static
>> 423dfbc362b7 HID: logitech-dj: Add usb-id for the 27MHz MX3000 receiver
>>
>> helps here, but the first two don't really look like they can make any difference,
>> so I guess I'm an unlucky owner of a MX3000 that doesn't quite work as expected.
>>
>> Any help will be appreciated. :-)
> 
> Actually we received another bug report about this and the reporter there
> has come up with a patch with points to
> 
> dbcbabf7da92 HID: logitech-dj: fix return value of logi_dj_recv_query_hidpp_devices
> 
> Being the culprit, can you try just reverting that one?
> 
> I will take a closer look at this soonish.

Thank you for reporting this.

After upgrading to 5.3-rc2 I can reproduce this myself and the dbcbabf7da92 commit
indeed is the culprit. I've prepared a fix for this which I'm about to submit upstream.

I've put you in the Cc of the fix.

Regards,

Hans
