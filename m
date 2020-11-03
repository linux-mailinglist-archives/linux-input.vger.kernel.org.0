Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A36852A3B43
	for <lists+linux-input@lfdr.de>; Tue,  3 Nov 2020 04:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbgKCD7J (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Nov 2020 22:59:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727312AbgKCD7G (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Nov 2020 22:59:06 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1380C0617A6;
        Mon,  2 Nov 2020 19:59:05 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id x16so17541588ljh.2;
        Mon, 02 Nov 2020 19:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SgDFD27UVRKii640rvXHvwpae24ErqFjXOqO253fhcY=;
        b=BSe5NKp75nwSYYuE/7lQanTProiLqua600T+gtFW0E/tO+ZocB9adxn0yE/WbxymP3
         VquIxqJNm2Zu0VvI+8ceXvDWCNqJkKvO4sCG59RVoG2n/wGHzqezREp+aldB2BpNmTxs
         2VeBKYiwafC9IlWmO1Bwqa42vjeYXmQVN3RscHz5Z53hnjAvkrmQj54XE3ir5mKTUi53
         prDbwSNh51bcp5/WcmLkIJy6UYp//u3HfSZ2HcEjkEV1z+/uSpymyqNzh1WYw6ZjMyqD
         9c1G+5YIsXFcpHLPd7fdX46g24SAUM0s5lYpRc5FD7ByOOKJQRhxM27yt3Q235PcFR5j
         9y5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SgDFD27UVRKii640rvXHvwpae24ErqFjXOqO253fhcY=;
        b=JmAFTmmJUz+2vqBjJ18apHkLBjYtS0d1ROA11RVFE7SoyFHIp15Hm17oCmVgHzxVvl
         h2egsy6tJz0FzXzK2QWWjpwpTSiucgN0IGnfw7t2V2YSHP+Yw3AaTCWd2CAbajGE89vb
         HO2KLotsiDkdsRtGO6mqs/AuNLdQNLyqKysOWeEsgrIh9/uFXAckk6cGnHjkAoqOgLxz
         Yygi04e4HxOVmR3rspio7UhNkiPyzbBs6qd4juIXGOOnOWW5EPqsFlK1igHhQ8PJUkcX
         R5nnvnm5WeF3NqUjIWv6ua605qXduox4rsm8xK+vSxfceSHtFJOQI+lsrfWHakMRX5MS
         SQPA==
X-Gm-Message-State: AOAM532/SdbKIzrD4ANcuLWYsuqBtECENzsDI4ofJ78M8j5kEm+Pgxs/
        0s+Zymv92yZJFmekcURT5E+Gs1Jygg4=
X-Google-Smtp-Source: ABdhPJyHuApH4XD8Jr3oProNxTyKh81g51mvQrqJVICKW3ZOYFNr56JJC8uJXIH7+7JE3L/xV7Rrsg==
X-Received: by 2002:a2e:920a:: with SMTP id k10mr1042035ljg.330.1604375944105;
        Mon, 02 Nov 2020 19:59:04 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-17.dynamic.spd-mgts.ru. [109.252.192.17])
        by smtp.googlemail.com with ESMTPSA id m15sm2653852lfr.241.2020.11.02.19.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2020 19:59:03 -0800 (PST)
Subject: Re: [PATCH v8 0/4] input: elants: Support Asus TF300T and Nexus 7
 touchscreens
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1603543323.git.mirq-linux@rere.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d942c01f-d43d-8bce-4c02-924feee1e3f9@gmail.com>
Date:   Tue, 3 Nov 2020 06:59:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cover.1603543323.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

24.10.2020 15:46, Michał Mirosław пишет:
> This series cleans up the driver a bit and implements changes needed to
> support EKTF3624-based touchscreen used in Asus TF300T, Google Nexus 7
> and similar Tegra3-based tablets.
> 
> ---
> v2: extended with Dmitry's patches (replaced v1 patches 3 and 4)
> v3: rebased for v5.7-rc1
> v4: rebased onto v5.7-rc2+ (current Linus' master)
>     update "remove unused axes" and "refactor
>       elants_i2c_execute_command()" patches after review
>     add David's patch converting DT binding to YAML
> v5: rebased onto dtor/input/for-linus
> v6: rebased onto newer dtor/input/for-linus
>     remove yet unused constants from patch 1
>     added a new drive-by cleanup (last patch)
> v7: rebased onto current dtor/input/for-next
> v8: rebased onto current dtor/input/for-linus again
> ---
> 
> Dmitry Osipenko (1):
>   input: elants: support 0x66 reply opcode for reporting touches
> 
> Michał Mirosław (3):
>   input: elants: document some registers and values
>   input: elants: support old touch report format
>   input: elants: read touchscreen size for EKTF3624
> 
>  drivers/input/touchscreen/elants_i2c.c | 149 +++++++++++++++++++++----
>  1 file changed, 127 insertions(+), 22 deletions(-)
> 

Hello all!

Johnny Chuang, do you have any comments or objections to this series?
Could you please give yours review and acks to the patches? Thanks in
advance!
