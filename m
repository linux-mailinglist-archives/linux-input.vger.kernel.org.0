Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B37381484
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2019 10:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbfHEIzL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Aug 2019 04:55:11 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:42859 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbfHEIzI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 5 Aug 2019 04:55:08 -0400
Received: by mail-ed1-f68.google.com with SMTP id v15so77947476eds.9
        for <linux-input@vger.kernel.org>; Mon, 05 Aug 2019 01:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=84QEP6FR40jS8MsBxZuPCzBl4Z7+iuUpFONR975wak0=;
        b=QxToici3Bx9eq3rRQ352Xo65/aoLungpft4Ezn2znhKWWUohIoLDOU6+ZpuIKkycMU
         wP44S3L+1GOUOU1MDA7d1iR2HJ35MvPLNgonPTV1+Z1eT78VjIUH7bmoBsrQFyb9iGt5
         AAYsIVu7EDkxmKBCApUkfOUYPFFGF7GlNWW+s/Uw9jPyaYHESa0rasNW9AdQ5JN9m2bj
         anUovFiTSz9iEK++9lHSKV1QjY79XaTvKd3saW3kRIG6jJWWWFk/naSm8ws2wzwDXTdF
         qVIIy5SdH2VoTzlzsVYUU/JKywWXYm3ySEd1kiMEENVUr9jEfJUxYz+816s/EEmvfuVj
         BnXA==
X-Gm-Message-State: APjAAAUEFmxZousz/qTFJ/Rz2eH9RQrEJiEV0/Mzq+ujkVURkKjCToDX
        0FKoFwIitgz0v6ITbnAsw5Z+1xxRDEg=
X-Google-Smtp-Source: APXvYqxBlSLzlAvy5N0qg2kyn7ZnVVogxS8dW1P324AzPoIeg9M28l87KxSLZpKgMwRiFN7yACOz4Q==
X-Received: by 2002:a50:acc6:: with SMTP id x64mr135478105edc.100.1564995306572;
        Mon, 05 Aug 2019 01:55:06 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id e43sm19988862ede.62.2019.08.05.01.55.05
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 01:55:05 -0700 (PDT)
Subject: Re: [PATCH] HID: logitech-dj: Fix check of
 logi_dj_recv_query_paired_devices()
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Petr Vorel <pvorel@suse.cz>, YueHaibing <yuehaibing@huawei.com>,
        benjamin.tissoires@redhat.com, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20190725145719.8344-1-yuehaibing@huawei.com>
 <20190731105927.GA5092@dell5510> <20190731110629.GB5092@dell5510>
 <3e9bda5b-68dc-15b9-ca79-2e73567ea0a5@redhat.com>
 <nycvar.YFH.7.76.1908051051080.5899@cbobk.fhfr.pm>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7988688e-8020-3d03-63cd-d844c01e5bf6@redhat.com>
Date:   Mon, 5 Aug 2019 10:55:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.1908051051080.5899@cbobk.fhfr.pm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiri,

On 05-08-19 10:51, Jiri Kosina wrote:
> On Wed, 31 Jul 2019, Hans de Goede wrote:
> 
>>>>> In delayedwork_callback(), logi_dj_recv_query_paired_devices
>>>>> may return positive value while success now, so check it
>>>>> correctly.
>>>
>>>>> Fixes: dbcbabf7da92 ("HID: logitech-dj: fix return value of
>>>>> Fixes: logi_dj_recv_query_hidpp_devices")
>>>>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>>>> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>>> OK, not only it didn't fix problems with logitech mouse (see below),
>>> but removing mouses USB dongle effectively crashes kernel, so this one
>>> probably
>>> shouldn't be applied :).
>>>
>>> [  330.721629] logitech-djreceiver: probe of 0003:046D:C52F.0013 failed with
>>> error 7
>>> [  331.462335] hid 0003:046D:C52F.0013: delayedwork_callback:
>>> logi_dj_recv_query_paired_devices error: 7
>>
>> Please test my patch titled: "HID: logitech-dj: Really fix return value of
>> logi_dj_recv_query_hidpp_devices"
>> which should fix this.
> 
> Hans, have I been CCed on that patch? I don't seem to see it in in inbox.

I have "Jiri Kosina <jikos@kernel.org>" in the To: for the patch in the
copy in my Inbox (I always Cc myself).

Anyways, you can grab it here:

https://patchwork.kernel.org/patch/11064087/

It has gathered 2 Tested-by-s and 2 Reviewed-by-s since posting, so
assuming you like it too, this is ready for merging.

Regards,

Hans
