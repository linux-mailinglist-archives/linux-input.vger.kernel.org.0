Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04EA4134662
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2020 16:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727721AbgAHPhe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Jan 2020 10:37:34 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38988 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbgAHPhe (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Jan 2020 10:37:34 -0500
Received: by mail-lj1-f195.google.com with SMTP id l2so3771221lja.6;
        Wed, 08 Jan 2020 07:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c9hbr49Ley4UTmimx7yxEnrqrafXHv5pmFx/ZO0fWMk=;
        b=vNp5hosegcOknmSw79NZpyGoMqDPAkYat31L0xMKOSqqNI+hCdjY4mv6g8r9dTQFrS
         SDNPQBPCtFhxO5L/YcELkmNK8MM7OrKAVCaVImJRqErnYEJUn6bccDjrhvECPlyhxN4p
         BmvFbayLVt9r5BDgWiv0JOmOgz8ZsDytgPXWRil6qqP/2OWLrSnYq4CPnCGvfdgkVVDo
         yyhAnBtjDuyWKwQ6t45f2FpOy3qWLgHyzX4AM/3ZL+PzU+qJF1JySPSSfnSf+9csNq7J
         rjAnksKIIlAgLEae9UKXX52uOGWO1iKmXDvWHlxtzSMkuscaTv8Xpdd0wzPG0L8vUjIb
         1ezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c9hbr49Ley4UTmimx7yxEnrqrafXHv5pmFx/ZO0fWMk=;
        b=srvVkGZ5r+J+/OjEkUEvjnY3R0V+qwBqxn4CE1+uaxbwMzuUZjC2HGMNMCjDLgwX19
         coZ+ouyuVfT03j4qDEnoWB/S5b38AyAaRmmlkOsgHHYspJ7h261+1wXbSKU0eJ1zZzps
         GzSfd59KvKYNJtaFKqeDSEUuF6SPfMh64M/3zdLf0IXEBMrhyEeIt8NHxndTJyCR4QfM
         ywr8D9y7E3A2LzNEd6JpbctnlPY5M4EkCi8MS8/H1CUUV9dEBgkACAF0Q94APRDfuhWK
         KoUo2nlZa9z/rAgHIGF2z8Y/QT5PuWMXaNWFm3CcU81eOcqER8CTbD0a+HJKIhDalrz0
         +97w==
X-Gm-Message-State: APjAAAXJNC4Czi9AwXhEy/6+35rQH2NE9lHM/G+N7gQMgwe7ghutWMDJ
        ZtJ9d/xFYg2LGrP+rmkD5mo=
X-Google-Smtp-Source: APXvYqwh7BDY6OtOgf2vFIGEdrgC3+UO6b2zbI6cR9IU/z5FxmWmUdmzOm1y2uW1q1QDxoAPd1U82Q==
X-Received: by 2002:a2e:8544:: with SMTP id u4mr3239243ljj.70.1578497851734;
        Wed, 08 Jan 2020 07:37:31 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id 138sm1624357lfa.76.2020.01.08.07.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2020 07:37:30 -0800 (PST)
Subject: Re: [PATCH v2 0/9] input: elants: Support Asus TF300T touchscreen
To:     "Johnny.Chuang" <johnny.chuang@emc.com.tw>,
        'Dmitry Torokhov' <dmitry.torokhov@gmail.com>,
        =?UTF-8?B?J01pY2hhxYIgTWlyb3PFgmF3Jw==?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        'Scott Liu' <scott.liu@emc.com.tw>,
        'James Chen' <james.chen@emc.com.tw>,
        linux-kernel@vger.kernel.org,
        'Henrik Rydberg' <rydberg@bitmath.org>,
        'Mark Rutland' <mark.rutland@arm.com>,
        'Rob Herring' <robh-dt@kernel.org>
References: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
 <20191212192420.GD101194@dtor-ws>
 <7c67b849-369f-8a20-4f9e-9e0a7caec1cb@gmail.com>
 <000001d5c634$655bed20$3013c760$@emc.com.tw>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1451c959-03fc-9493-48f1-404cbd273aa9@gmail.com>
Date:   Wed, 8 Jan 2020 18:37:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <000001d5c634$655bed20$3013c760$@emc.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

08.01.2020 18:00, Johnny.Chuang пишет:
>> 12.12.2019 22:24, Dmitry Torokhov пишет:
>>> On Wed, Dec 11, 2019 at 05:03:18PM +0100, Michał Mirosław wrote:
>>>> This series cleans up the driver a bit and implements changes needed
>>>> to support EKTF3624-based touchscreen used in eg. Asus TF300T tablet.
>>>
>>> Johnny, could you please take a look at this patch series?
>>>
>>> Thanks!
>>
>> Hello Johnny,
>>
>> Could you please let us know whether you or anyone else from Elan are going
>> to take a look at this patchset anytime soon?
> 
> Hi Dmitry Osipenko,
> 
> I'm sorry to reply late. James Chen will take a look at this patch set. 
> 

No problems, thank you very much.
