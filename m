Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB061272A7
	for <lists+linux-input@lfdr.de>; Fri, 20 Dec 2019 02:10:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbfLTBKG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Dec 2019 20:10:06 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39773 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbfLTBKG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Dec 2019 20:10:06 -0500
Received: by mail-lf1-f65.google.com with SMTP id y1so5702227lfb.6;
        Thu, 19 Dec 2019 17:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vfXm6wroocpySxHofx5c4RN9rb7rL72Tf/ud1qMqmoY=;
        b=G65PKDWVPT8+CLmF6P9smz/Dioz++TJ9ygZxsNXMvxPv1x0DWS+GCbzzfnY6X9cZ/+
         qkBMf4gu/uuprXCiBit4s1jbkrh5ACIQxAPnYZoIS2KrPQbKWqPKMwk5fgsCgUJ5HyXA
         eSKecA1JtVz1+tKv84R0X6NkNCZ6aDUeHC+Tz97HsnYVIl8bvYIszdP6jYP2FKvoDYMB
         BUuqrEOEWlQxHcBglTGXEcYumSKeY/wUzV4hCLaKijQcgfEUls6Xj74T4Myj8qJ7cSPK
         7ULYbCthziu8V7VghwALXOkb15JXswM6PsD/3NeqW+O514n6KCUPj5CUIgfZPZHe2smx
         7KeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vfXm6wroocpySxHofx5c4RN9rb7rL72Tf/ud1qMqmoY=;
        b=idV2as2nOnwdF416GM2UtvtV2qL08aX3mPL3Yt1KWkr21zgIgr6pykrsGnqeBqfaEv
         4yINyOSg2/dy3nVibUFE6tJqD/lpoZ8g+OYG4XmuilC3xMc/4BQS3Lp6WEtWQJg7YKvH
         fGadAyd7EjA8MIK3WwtKlceJvYpaml/fBGSkjm/jNgBR/QvdvPj6eA0sDhHNT5efhAo7
         GAurCqX5J3TTmu/pvOkdPCzlOSrVWLVjqIQL5BguAIBDbf0QAGzswcKQCG7iEsgCc6Gj
         FTnG/cRzQ5ZnkRaGGR83CQGXC8uBbtAHrbueZfBusX+cn+8ciIp+dAEfEFK4YA/WqyPY
         6ueA==
X-Gm-Message-State: APjAAAWtmWXJiEsuPMjh6K85uRJ2IdLljyQNOBtq67uQ3vQpjhQzl3I7
        7thxxrk6WuiD6HkD7ihN9eY=
X-Google-Smtp-Source: APXvYqzrNLmEcJpG0JJJYPq9vWiBHeyQpiDFG0zq4ESkVj7MdFyCrN+aQYkJOUlWsi2n+v7u1EDBSA==
X-Received: by 2002:a19:3f51:: with SMTP id m78mr7469292lfa.70.1576804204162;
        Thu, 19 Dec 2019 17:10:04 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id a12sm3542761ljk.48.2019.12.19.17.10.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2019 17:10:03 -0800 (PST)
Subject: Re: [PATCH v2 9/9] dt-bindings: input: elants-i2c: Document eKTF3624
To:     Rob Herring <robh@kernel.org>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Scott Liu <scott.liu@emc.com.tw>
References: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
 <882916345a8aa2dc545a1bd2ca150cf913371d1a.1576079249.git.mirq-linux@rere.qmqm.pl>
 <20191219214254.GA25646@bogus>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0f91ef03-42f7-9fcc-2394-2d10a9dbbb17@gmail.com>
Date:   Fri, 20 Dec 2019 04:10:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191219214254.GA25646@bogus>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

20.12.2019 00:43, Rob Herring пишет:
> On Wed, 11 Dec 2019 17:03:26 +0100, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= wrote:
>> From: Dmitry Osipenko <digetx@gmail.com>
>>
>> The eKTF3624 hardware is similar to eKTH3500.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
>> ---
>>  Documentation/devicetree/bindings/input/elants_i2c.txt | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
> 
> Acked-by: Rob Herring <robh@kernel.org>
> 

Thank you very much!
