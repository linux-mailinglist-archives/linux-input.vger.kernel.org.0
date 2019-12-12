Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C892011C1B9
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2019 01:58:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727333AbfLLA6U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Dec 2019 19:58:20 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:32863 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727257AbfLLA6U (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Dec 2019 19:58:20 -0500
Received: by mail-lj1-f196.google.com with SMTP id 21so287498ljr.0;
        Wed, 11 Dec 2019 16:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ac4sBjrgbwD1XozPAPJcThsfbfGffUb6YgSx3fBWo7o=;
        b=I0EtZGomGE4S18jWCsR5a6o2SiqCPE2g7bd9wqwinusTJNqRASUyYKtXDcwN4vAs5u
         gP0Y7o/FWTwPOs8yaHfM1lD9KKjsnU1yT0ljFqxCvWEoS89048J6S8UrS/lBi6Oi+bKW
         mnyqNbjNx1tVjL9zFB+g+grWNUKdDFoZ/BzMtoTHmDG5nLUdtRsB9BZ8ham33Xbx4em3
         KFZa+CpYIubB8K7+UFyRBA2+PP66k1tuw4Ml20UazSZL4GyM7ZyLwGl8+QDCbmZw34kY
         e5IGWAhM9qdKgxnXkBMbMQgIG9mafMjQmuVyJKepkPvP6APaYrM8/4bfgB8rRFLUfdbG
         puJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ac4sBjrgbwD1XozPAPJcThsfbfGffUb6YgSx3fBWo7o=;
        b=JVMGsx4MDILZ8zfxY2+7VJ1jEO+ps0hhHjx3lO4v+NB72urX9BPWqbGoO5ikIZZXff
         TdRegkNHe7S+1lUKUI1VOx0zX4Jo82kjSUZmZJrvRutnJU+CEUY+IjVQJH0qEPqwSHJ3
         ySZ/zgMXbyxTV/afJvY0YAqMfpRGiXBO8PMyGfkqBwvfK314TKJoB385zj+T4BHKYY9a
         5vT9Z+Oh/O7U6biAA7DGXXSrnYvTniLLrM9soZupT7jF+iNilCU7yu1S/aEN2wE+VlKq
         n39UvmNRzqPpFinE308L1+cqNDjB/ZBkDKMADx/ogFHF0ra82X+zn2evhSzhO7cOm8Vv
         ZAaA==
X-Gm-Message-State: APjAAAWugiX7uu0B63GeDlDO4PWXzdylCul2AAm4L1PWgFVxWLX4NCew
        ppNuV8/Cd040pM5Tvp3CIUg=
X-Google-Smtp-Source: APXvYqwxgFQMB4q7QALXGTiqBeirOv/A1DerRzMiZLhZS32dbnz0mwu3JZQyqN+43bru59v+A1EKQw==
X-Received: by 2002:a2e:99c3:: with SMTP id l3mr4107084ljj.250.1576112298238;
        Wed, 11 Dec 2019 16:58:18 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id k24sm2323326ljj.27.2019.12.11.16.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 16:58:17 -0800 (PST)
Subject: Re: [PATCH v2 8/9] dt-bindings: input: elants-i2c: Document common
 touchscreen properties
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh-dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Scott Liu <scott.liu@emc.com.tw>
References: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
 <ecacdd9b1baea0cf332c30f3c7e01d5e734957be.1576079249.git.mirq-linux@rere.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <24fcfedd-1c32-0c2e-73e3-08c4e289d96a@gmail.com>
Date:   Thu, 12 Dec 2019 03:58:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <ecacdd9b1baea0cf332c30f3c7e01d5e734957be.1576079249.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

11.12.2019 19:03, Michał Mirosław пишет:
> From: Dmitry Osipenko <digetx@gmail.com>
> 
> Document support of the common touchscreen properties.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
>  Documentation/devicetree/bindings/input/elants_i2c.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/elants_i2c.txt b/Documentation/devicetree/bindings/input/elants_i2c.txt
> index 5edac8be0802..45fab32bbc19 100644
> --- a/Documentation/devicetree/bindings/input/elants_i2c.txt
> +++ b/Documentation/devicetree/bindings/input/elants_i2c.txt
> @@ -14,9 +14,13 @@ Optional properties:
>  - reset-gpios: reset gpio the chip is connected to.
>  - vcc33-supply: a phandle for the regulator supplying 3.3V power.
>  - vccio-supply: a phandle for the regulator supplying IO power.
> +- see [2] for additional properties
> +
> +For additional optional properties see: touchscreen.txt
>  
>  [0]: Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
>  [1]: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> +[2]: Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
>  
>  Example:
>  	&i2c1 {
> 

Rob's email address is incorrect: <robh-dt@kernel.org> ->
<robh+dt@kernel.org>

But I suppose he's keeping an eye on the device-tree ML.
