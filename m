Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6B351D73C0
	for <lists+linux-input@lfdr.de>; Mon, 18 May 2020 11:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbgERJSJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 May 2020 05:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbgERJSI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 May 2020 05:18:08 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88925C061A0C;
        Mon, 18 May 2020 02:18:08 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id z22so7406899lfd.0;
        Mon, 18 May 2020 02:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sc8TUDXWPz7UQKQUqaWBNuivArjYMb9Icx1lmuCCfNg=;
        b=Fbtz5h4NZGIcKdvkQ7P8zHwq7+qlt4zclrBTWmuEgUaLhQ2IBoqhASDfNuaq22600K
         wGIB4UljSHga6l5daQ7N9rOrcVPF8M7up4bcHJrMvNxHMFgRMChnsuCUIqmPD9dzyHSt
         z7vPd+SZdosdwIchkrzgcQ6E+vJ6EUQHZnSNLAKl+dngY5aF0466RNYux/P/RLa3iP6c
         kQA3Mk4rn2Kh9em6i4CxjNcXvW/cUOnDhCntPyTP6F0UnWmpfhzGWB0itObN0sFGDumV
         YL5R/CFx7hB6GSK13PvavA4Gh46aRYhs5G5Qb0QMFlbX+mFh2vXwe0izo5KrEtZCfw1V
         foGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sc8TUDXWPz7UQKQUqaWBNuivArjYMb9Icx1lmuCCfNg=;
        b=EJQ3uperuv1lhEwlTCrQBIjbwJn4PJw5sLArNmUCttbzvphajw/DH+f46VtNzpJm2k
         dG5VhPs2Vp0PDkpv411xwbbRxDolgVUcO7/qtDmI8Ger1932X0mUQrUCKKizDm4759PQ
         VavTaJtQigFg8v6e7iq0mKFUGMUqf30thVGdSKeJdS4q2JtSVd5g2N9wrkQl6xY0MjZr
         jjl+v4N8NJOSJd2YwZndyLm0Azhqi4l/Om8TSa28lHcljKfIClpbnxjXkCsgPOChIf8n
         8kZ/7N7m4pEWYkEs7WhHU18polIPZKiiG235p5gPBSh+bt1V2jYx7KVa9nl7Qiq2oxna
         H+Rw==
X-Gm-Message-State: AOAM533mHVds6Al7mbkjDYNr96GhfrqOh6vOqvWqie2g0laqXa2XYuHO
        Y3q9R3Hh4ydVE7v8NOHqNX9Kur49
X-Google-Smtp-Source: ABdhPJwWYtw9yvtS4VLAIwALqTqRjz45YJjXgzIjUmNCCOn81RI7ieRhD30Sj8mgHQ3FcZjlqEZ37Q==
X-Received: by 2002:a19:f11c:: with SMTP id p28mr4191532lfh.0.1589793486849;
        Mon, 18 May 2020 02:18:06 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id 192sm5329868ljj.41.2020.05.18.02.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 02:18:06 -0700 (PDT)
Subject: Re: [PATCH v5 01/10] input: elants: document some registers and
 values
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     David Heidelberg <david@ixit.cz>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1587923061.git.mirq-linux@rere.qmqm.pl>
 <a8c17a4c804ad5c429269cc0468d8cb4c0783a47.1587923061.git.mirq-linux@rere.qmqm.pl>
 <20200518040710.GQ89269@dtor-ws>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c2a02c41-3474-583f-4f14-a81c8b5846cf@gmail.com>
Date:   Mon, 18 May 2020 12:18:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518040710.GQ89269@dtor-ws>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

18.05.2020 07:07, Dmitry Torokhov пишет:
...
>> +/* FW write command, 0x54 0x?? 0x0, 0x01 */
>> +#define E_POWER_MODE_BATTERY	0x40
>> +#define E_POWER_MODE_AC		0x41
>> +#define E_POWER_MODE_USB	0x42
> 
> What is this for?

It is possible to switch the touchscreen's power source. Downstream
kernel switches away from the battery source when USB cable is connected
and baterry is charging. This is not supported by upstream driver yet, I
guess it should be good to postpone adding these FW opcodes until they
will become actually needed.
