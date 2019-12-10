Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90DCA117CD4
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2019 02:01:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727213AbfLJA7b (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 19:59:31 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:35605 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727059AbfLJA7a (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Dec 2019 19:59:30 -0500
Received: by mail-lf1-f67.google.com with SMTP id 15so12282761lfr.2;
        Mon, 09 Dec 2019 16:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9hiWosH+VeoYM4lxmg313Iwo3l/eXHwLXDbT5+/apOg=;
        b=Yfw4+uN+uJBfN02MxQ3yon1n9qcbB5nca3yJx1+kKufYYm9Jh2h578cNmDna8r1vFF
         FYE2DpJ6DRcqPZASUkHxy4FkGu9m/X/hGVXPL4JcafEgAouOzzcZFRIDqHMLdiF6X9nB
         ISQF/72Atj4D1WG/eVFDgnqvoxVC/ZhbA10CDIqeesRHdV3QwAmu6JV2mBYkWF+FziXL
         VXua8wqBiLShKx6OD9b6y6twgQltqP3BuN9WLjSBTmoZhwaR8c7hd38ZIBE+2zbHD02j
         j3PoHyn/7kW6iRU2qoM8OdMAIlEg2TAHNw9/dHQKUNSp7Huv6L6ayVYwDrGOVGhb4A8b
         TgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9hiWosH+VeoYM4lxmg313Iwo3l/eXHwLXDbT5+/apOg=;
        b=ByRfTQV8cCpJDVVbR8ffUj/JQ3FO08rBzqbOTOliEFwxExErjqAIbqdJ8JZZpXBPo+
         PiYYN9SNjz4qGeDGo6KVQMvMXcVnMTC6+fqHdKygslI1L84aE+7si4NOpW8t/f2uFAmH
         obBSMsVFhewIU4YoNUEd5Z2PS63l9lq7oV5IF6goWP3SHXgRKXXWnwrLo3A/dIP3LHww
         ziuXpWgSZXTsqwwy5mBihPeqDO8SIj6xA6O4aQXI+pFrNsf3H1cM71+jGQSN2wvxj7gS
         imcK3ihmRooiJyvfZ0RMBSG3BP3pPQfTh1V/+9J8m5Jn3f5Si5M7+EKwhAdrfdwDHmB/
         wnWg==
X-Gm-Message-State: APjAAAV52y9NhIDFZ+QF9z7VIRgsofBjAoC60D5sFcjwMtce/hNPgbVZ
        0c68m3cADwPpJPwApG18G2KHlWV8
X-Google-Smtp-Source: APXvYqwmCCRCTNKWhRPCGttlljSjvqPj7XX9KNbGngHF0rMgpwvpAd7g0ToffDkyDToFCm/OAxgWbw==
X-Received: by 2002:a19:f716:: with SMTP id z22mr4779911lfe.14.1575939567355;
        Mon, 09 Dec 2019 16:59:27 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id w16sm507286lfc.1.2019.12.09.16.59.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2019 16:59:26 -0800 (PST)
Subject: Re: [PATCH 0/6] input: elants: Support Asus TF300T touchscreen
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org
References: <cover.1575936961.git.mirq-linux@rere.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8b656670-fd05-57b5-d361-267f3e3c78b9@gmail.com>
Date:   Tue, 10 Dec 2019 03:59:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <cover.1575936961.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

10.12.2019 03:19, Michał Mirosław пишет:
> This series implements changes needed to support EKTF3624-based touchscreen
> used in eg. Asus Transformer Pad TF300T.
> 
> Michał Mirosław (6):
>   input: elants: document some registers and values
>   input: elants: support old touch report format
>   input: elants: support common touchscreen DT properties
>   input: elants: detect max_x/y from hardware
>   input: elants: refactor elants_i2c_execute_command()
>   input: elants: read touchscreen size for EKTF3624
> 
>  drivers/input/touchscreen/elants_i2c.c | 365 ++++++++++++++++---------
>  1 file changed, 237 insertions(+), 128 deletions(-)
> 

Hello Michał,

Very nice work! I saw these patches couple days ago on the rere git, but
wasn't sure if you were going to submit them. It's very good that you
found time to send them out, looks like we're going to have a fully
supported eKTF3624 in upstream soon!

It's a bit unfortunate that Elantech firmware writers couldn't maintain
common commands format for all firmware versions, but not really a big
deal since it will be one more trivial patch to support Nexus 7 :)
