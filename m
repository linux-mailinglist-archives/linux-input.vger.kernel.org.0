Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22EAD14719E
	for <lists+linux-input@lfdr.de>; Thu, 23 Jan 2020 20:17:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728792AbgAWTRC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Jan 2020 14:17:02 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41049 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727590AbgAWTRC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Jan 2020 14:17:02 -0500
Received: by mail-lj1-f193.google.com with SMTP id h23so4894058ljc.8;
        Thu, 23 Jan 2020 11:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wmphSZ8sU4dWkQ3DRzdv5dHXvC3B9dVKeB/xkfJZIyo=;
        b=of2n3Wx7J4bQL0mMgSf/jLoYdJvZcbE7VNKSYVJzAVcCmdUO2dlbmJis2afBsfrASb
         deOBKJ4AOEspuX+LnRRurfSyxW5e7pp89V5ve0jXUwAq6F5pZYqMj6hqsQ0+V2zug/+2
         qwnkIfFdVC81eWT0wObxyPuanBnQtYBo9Yesl1vzGSWDicf71pjhjSrN1nntFOriLUjE
         HJS8PrOMGlHxyikKY6SGl/Lf91yoHIX8vHl4cma6ntm7cOug2TU2B2Pem1pMm4RrBRrq
         WlRFyN06GsTlZnVt2yLvOCXnPjK9rwT3FgDqpskaM6up2ZpFyMtR44zusEJiHbDr/I/Y
         pznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wmphSZ8sU4dWkQ3DRzdv5dHXvC3B9dVKeB/xkfJZIyo=;
        b=NowZiT6DJUP6mJZgql35zj37QuH5AqhEkYxe3IeAygOF9Be2MB/ikY8juKfH/osbMf
         gI3Swa901wuvNc8F1ESa/Y7hEzztCnDg2Nh1smQ5h8XYL1rbmQkESjxTgeakdUZb1lUB
         OV3DWnwaKQxpTPp396VuyN5/kZSQx7qJfsCeTjO/u9xwCkKnQAElrRxMKVNIm/F13D6B
         XBDNDCJRyRK0ZeyAaDy5v/C41tlf1LzhDzfBYZYKmfglY7meQtggMGT5pZgj1WzvfzOG
         GaSkp/4krVV8uBt6q9x5Rh8GEb3Nix4TQNmEj4GhMQann68piE/zw9WPNMAYO/effATn
         fKpg==
X-Gm-Message-State: APjAAAWp04mk5+4iJXov/3Nf1U9I24oCTfQOWs+73PWWt1/Ekio83ZPU
        dpYQcOsAq+G91f7lTyrdxVM=
X-Google-Smtp-Source: APXvYqyuwRA5CiUa9ZtwW32eQSRiySpogNJVsIYjo5WHM20vJeMkTHQXiyMsF3MEnmmEHfQacykfgA==
X-Received: by 2002:a2e:844e:: with SMTP id u14mr52113ljh.183.1579807020220;
        Thu, 23 Jan 2020 11:17:00 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id t9sm1523866lfl.51.2020.01.23.11.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2020 11:16:59 -0800 (PST)
Subject: Re: [PATCH v2 0/9] input: elants: Support Asus TF300T touchscreen
From:   Dmitry Osipenko <digetx@gmail.com>
To:     "Johnny.Chuang" <johnny.chuang@emc.com.tw>,
        'Dmitry Torokhov' <dmitry.torokhov@gmail.com>,
        =?UTF-8?B?J01pY2hhxYIgTWlyb3PFgmF3Jw==?= <mirq-linux@rere.qmqm.pl>,
        'James Chen' <james.chen@emc.com.tw>
Cc:     linux-input@vger.kernel.org, 'Scott Liu' <scott.liu@emc.com.tw>,
        linux-kernel@vger.kernel.org,
        'Henrik Rydberg' <rydberg@bitmath.org>
References: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
 <20191212192420.GD101194@dtor-ws>
 <7c67b849-369f-8a20-4f9e-9e0a7caec1cb@gmail.com>
 <000001d5c634$655bed20$3013c760$@emc.com.tw>
 <1451c959-03fc-9493-48f1-404cbd273aa9@gmail.com>
Message-ID: <9b5b8dd4-0d21-0d1f-cd4a-36d0f9008605@gmail.com>
Date:   Thu, 23 Jan 2020 22:16:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1451c959-03fc-9493-48f1-404cbd273aa9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

08.01.2020 18:37, Dmitry Osipenko пишет:
> 08.01.2020 18:00, Johnny.Chuang пишет:
>>> 12.12.2019 22:24, Dmitry Torokhov пишет:
>>>> On Wed, Dec 11, 2019 at 05:03:18PM +0100, Michał Mirosław wrote:
>>>>> This series cleans up the driver a bit and implements changes needed
>>>>> to support EKTF3624-based touchscreen used in eg. Asus TF300T tablet.
>>>>
>>>> Johnny, could you please take a look at this patch series?
>>>>
>>>> Thanks!
>>>
>>> Hello Johnny,
>>>
>>> Could you please let us know whether you or anyone else from Elan are going
>>> to take a look at this patchset anytime soon?
>>
>> Hi Dmitry Osipenko,
>>
>> I'm sorry to reply late. James Chen will take a look at this patch set. 
>>
> 
> No problems, thank you very much.

Hello James,

Could you please let us know whether you'll be able to take a look at
this series? Thanks in advance.
