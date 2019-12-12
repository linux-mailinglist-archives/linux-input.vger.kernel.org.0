Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D61E011C1BF
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2019 02:01:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbfLLBBD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Dec 2019 20:01:03 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34615 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbfLLBBC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Dec 2019 20:01:02 -0500
Received: by mail-lf1-f66.google.com with SMTP id l18so335291lfc.1;
        Wed, 11 Dec 2019 17:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1yHYuY8rVNWJMaDwGRTUaPkGk2faHXUM519JZN0chQw=;
        b=gQqkeUbch5ZLoU/Oq5FAPfMhGY5+YZjAakgEaB28PtSPd2iA2ZvMBdMZYKkwbIs84T
         9wuu0Olhd927uliwpr1WOVaF9uGmVHZsDnAKeV4s+Mv/27+f1syMU4qRauQuh4WM7SWn
         /vpJ4LDhYoFB00+JtcRAeB9nbCaLCpVIwaAJ9/5DhB5TgvTzCsONNR/ChAiAeDBJMYNc
         e+9dIfTRgAUiAWcA6+mkGAF4+ThVMshA8S3hv9PSh9umo5ykMaPVeQrcHt09zrFnW1Hm
         PcvEiAUAfFfIYLqBHWaYzlEExqkUjfcBYvWJeJfzmUXuw108ZAkmNxqe+CNGUKo7Y0nR
         x+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1yHYuY8rVNWJMaDwGRTUaPkGk2faHXUM519JZN0chQw=;
        b=k0YG0XkwR/sXpBPsAFoAsFe3zpppW7sRr43Bx/R/IE/ghBTj1NFD94/3TvCRtWQMWN
         v9PYqPal6c38ah0aTdCjGsx/8M434rY9SK+P3KyEx3iZOgeMkPxaasoNT39Vs0Oudrhr
         yTLjSdfvAttPLFQmtj8Kl9dA6p9ko+qxIqmg6fJpzrZGiosFwGujbt6mYnQWlQb+bcLS
         0afbycTAzJ3mWpvMbBK0E5q1BCnXUIkiguhw9JsLxp7wBPcolEdyNz90kuqIbj6Mg1V1
         cDC8ccY/d/p6GT1s+2M6mfnUWwZ423L/wwCtPDyi6LERs27aQXSsMW79sNWllvNlw98T
         SAtQ==
X-Gm-Message-State: APjAAAVSqsX4XpG1PUj4GISIYLEzh+3rLYhCwMJkQriAMkPNMhKSyI3S
        MoUgR2ea0JZ8qZwBCX4iDLU=
X-Google-Smtp-Source: APXvYqyOF2Os93Cc5b6hs3Zi3POGXACpSIzvcBlwaJRKs+mwxJu8IC6o1IHz8Bd6MPuVAijO/zCDGQ==
X-Received: by 2002:ac2:48bc:: with SMTP id u28mr3965686lfg.81.1576112460540;
        Wed, 11 Dec 2019 17:01:00 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id y25sm1965881lfy.59.2019.12.11.17.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 17:01:00 -0800 (PST)
Subject: Re: [PATCH v2 8/9] dt-bindings: input: elants-i2c: Document common
 touchscreen properties
From:   Dmitry Osipenko <digetx@gmail.com>
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Scott Liu <scott.liu@emc.com.tw>
References: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
 <ecacdd9b1baea0cf332c30f3c7e01d5e734957be.1576079249.git.mirq-linux@rere.qmqm.pl>
 <24fcfedd-1c32-0c2e-73e3-08c4e289d96a@gmail.com>
Message-ID: <a1aa3010-727b-3536-3426-7281030f6886@gmail.com>
Date:   Thu, 12 Dec 2019 04:00:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <24fcfedd-1c32-0c2e-73e3-08c4e289d96a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

12.12.2019 03:58, Dmitry Osipenko пишет:
> 11.12.2019 19:03, Michał Mirosław пишет:
>> From: Dmitry Osipenko <digetx@gmail.com>
>>
>> Document support of the common touchscreen properties.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
>> ---
>>  Documentation/devicetree/bindings/input/elants_i2c.txt | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/input/elants_i2c.txt b/Documentation/devicetree/bindings/input/elants_i2c.txt
>> index 5edac8be0802..45fab32bbc19 100644
>> --- a/Documentation/devicetree/bindings/input/elants_i2c.txt
>> +++ b/Documentation/devicetree/bindings/input/elants_i2c.txt
>> @@ -14,9 +14,13 @@ Optional properties:
>>  - reset-gpios: reset gpio the chip is connected to.
>>  - vcc33-supply: a phandle for the regulator supplying 3.3V power.
>>  - vccio-supply: a phandle for the regulator supplying IO power.
>> +- see [2] for additional properties
>> +
>> +For additional optional properties see: touchscreen.txt
>>  
>>  [0]: Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
>>  [1]: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
>> +[2]: Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
>>  
>>  Example:
>>  	&i2c1 {
>>
> 
> Rob's email address is incorrect: <robh-dt@kernel.org> ->
> <robh+dt@kernel.org>
> 
> But I suppose he's keeping an eye on the device-tree ML.

Adding Rob to CC using the correct address.
