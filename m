Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3BFA25E9C6
	for <lists+linux-input@lfdr.de>; Sat,  5 Sep 2020 20:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728423AbgIES5O (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Sep 2020 14:57:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728397AbgIES5N (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Sep 2020 14:57:13 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EE3EC061244;
        Sat,  5 Sep 2020 11:57:12 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id b12so5537096lfp.9;
        Sat, 05 Sep 2020 11:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JFaZX1yPOD5YrQmNNicSv1U0vDJOVK3tkWFEsyFX4y4=;
        b=B1RmBQpdyLlyQgJYVUrPN9Cvl8GQ++LbY4Lt3/r+6FNcLlrHHi3xyKUU1hvbb49LE0
         BJzRGQkIs2RhGGcCcu6TopgxIhQBi47AN2TmI0fy9Uk8Ua07PkPE2HWrdCGdPXAhaLoG
         VR9VnG3UNvHjD8wP+wQVG5IRplNurGSyNUlo0XvgyoirnVoYDnDNnyaDqf7V8JR37wVq
         nDc9wddtckAigqQC96qxoAaMXiwCfNe5F+MfiJacds0S9DSkwWNsq5MUDYMH1WjnOFsn
         pY2uvrdUOXMVhBf4sUZwUjC1KIFkeL9z5wY0idygzWZJbZ5sNAr5Wu6bfIW2Y7BBI8Gm
         Vn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JFaZX1yPOD5YrQmNNicSv1U0vDJOVK3tkWFEsyFX4y4=;
        b=qqKf44pRn3yvBdTNT/UrKnreaWQctPGUSuVsstGA1CJ3+88SkyBAA6u7dKApE7Vrf3
         i44IQzXWvQQie9RBJ0heMzBArPVl8rtdsdzZmIkPg6YZaNH6g+o4yl7K4xsR2ANWnmeZ
         l1DrndKIBp5a8aNwVORRGXDdIRgacrbqnySQEZwIHR03kU5z7cDDHBsyICi0qfTlStpZ
         nnOoWaxZTBwt8aJ5PAyJW0Gyp8NOUKTigu1Gvox95IO62oulOcaY4o6r5KoI8f/HnQ5M
         qsDZgMpRzrGIFw8MsiKiQhF/Uk86ed1kR5dcHd9+iTQr91k/X6Kgq6B16u7acIAVEKBJ
         YWpQ==
X-Gm-Message-State: AOAM53102AFyn+Hka1WlQHj2tCzajDoLNBSAJg24/EuFq+HIidnLqrjU
        0QY4LvifXxpEskozhTluCo0=
X-Google-Smtp-Source: ABdhPJxhBO9puaUXmB4DBnS0NwVqnuYWcXfGNDEU/UyZMtvQEza5s0m079mZOr7saQ6QL9Ja8TMTzA==
X-Received: by 2002:ac2:5547:: with SMTP id l7mr6639332lfk.153.1599332230136;
        Sat, 05 Sep 2020 11:57:10 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id q7sm2742041lfr.16.2020.09.05.11.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2020 11:57:09 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] Input: atmel_mxt_ts - implement I2C retries
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jiada Wang <jiada_wang@mentor.com>
Cc:     "nick@shmanahar.org" <nick@shmanahar.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Andrew_Gabbasov@mentor.com" <Andrew_Gabbasov@mentor.com>,
        "erosca@de.adit-jv.com" <erosca@de.adit-jv.com>
References: <20200903155904.17454-1-jiada_wang@mentor.com>
 <CAHp75Vfw1bJ+0pRJKVJ=nCJ-5rVzYLjkP4iWPqiG-it0qp5GFg@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <610b2513-7d62-386d-ed2a-54e1bea4df43@gmail.com>
Date:   Sat, 5 Sep 2020 21:57:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vfw1bJ+0pRJKVJ=nCJ-5rVzYLjkP4iWPqiG-it0qp5GFg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

05.09.2020 21:02, Andy Shevchenko пишет:
...
>      #define MXT_CRC_TIMEOUT                1000    /* msec */
>      #define MXT_FW_RESET_TIME      3000    /* msec */
>      #define MXT_FW_CHG_TIMEOUT     300     /* msec */
>     +#define MXT_WAKEUP_TIME                25      /* msec */
> 
> 
> Can we simple add _MS unit suffix to the definition?

I'd expect this

>      /* Command to unlock bootloader */
>      #define MXT_UNLOCK_CMD_MSB     0xaa
>     @@ -626,6 +627,7 @@ static int __mxt_read_reg(struct i2c_client *client,
>             struct i2c_msg xfer[2];
>             u8 buf[2];
>             int ret;
>     +       bool retry = false;
> 
> 
> Keep this ordered by length.

and this to be separate patches that are cleaning whole driver code,
otherwise there are no much benefits.
