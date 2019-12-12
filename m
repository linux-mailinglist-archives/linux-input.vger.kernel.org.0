Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F4E211C157
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2019 01:29:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727229AbfLLA3g (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Dec 2019 19:29:36 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36330 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727189AbfLLA3g (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Dec 2019 19:29:36 -0500
Received: by mail-lf1-f68.google.com with SMTP id n12so281879lfe.3;
        Wed, 11 Dec 2019 16:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pC6XF/C4qA6Z3fF58X0CjVZydy0fb8CelD9qd37i5gc=;
        b=HshZQGQHDaBtH2auNRZfezkqBM+IIN3iaK35ve5/12tX8zrV3UwAwhNtW2CaOC4GGH
         VulBEsCEkSHMh7Ln0pKDk9e8aB3S++LApRbmWewG2o0/isabLtPD9i09Pcr+uy6mJ1zh
         yinfxOFIvvABQXxS3N32b9Hu/AlWcnXm7UipweDlDLPPkxZwaNQYKlS5DRi7NZgtqEvQ
         5HiVMcTOP1bpSnkaN4n/2pVbUD/+EISG3O6fpniJ9EpXw3bgh0UEfNoVMAZi2BSoC1WR
         BQ/rX5E358IAzM7hQ94LlfNSTL2fuo10CBtRH5favAiDybjbGb1diIYoP1VvKQCA7r6X
         oWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pC6XF/C4qA6Z3fF58X0CjVZydy0fb8CelD9qd37i5gc=;
        b=CH04j7calde3YBRK69AHXtWFZN4MTur9MU579yU31ZJZbl7fIpG2+0HjyxCyw17/bl
         C+grvvQJ2PhOnd8pFz/kH067StEzzJG5gV4tHU+Q97zfWLiiHz3cD6BVKyZPDCdzraDw
         Yf+zey0ba9zVkaYPqKRBgWscPAkBF5YP7wS2TMJVWkGH9iwVHziVieH9I8IpWydLm0VS
         VvwcIuXndX05xKsRi8Qk9fRmAouJNfqOU0fC8kTwpPeW+2nrhSVjT51CFG880T+yPbno
         VK14z27puUWGOMZrzAySoAicMNpsnlpK6w5tS1+S2Z5gpmR51VhwfhcF3BMVUeliY+VM
         RlzQ==
X-Gm-Message-State: APjAAAU5lF1FD/9/EovHQ3F+oqTt45jUJ5q3freS29CGMfAKB/my6fM6
        goOnr62iNxAKcIaguRlcujm/diwh
X-Google-Smtp-Source: APXvYqyD9UYdejrNSyfdLH+9mfQMcI9Ym/rhgknNTIiB4I1iG4nafZurmwrznkO4CEVPBg3bmCBAvw==
X-Received: by 2002:ac2:599c:: with SMTP id w28mr4173459lfn.78.1576110573638;
        Wed, 11 Dec 2019 16:29:33 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id d16sm1964036lfa.16.2019.12.11.16.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 16:29:32 -0800 (PST)
Subject: Re: [PATCH v2 0/9] input: elants: Support Asus TF300T touchscreen
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Scott Liu <scott.liu@emc.com.tw>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh-dt@kernel.org>
References: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3da0327c-d7c4-b0f2-9ab4-b7088891ef7c@gmail.com>
Date:   Thu, 12 Dec 2019 03:29:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

11.12.2019 19:03, Michał Mirosław пишет:
> This series cleans up the driver a bit and implements changes needed to
> support EKTF3624-based touchscreen used in eg. Asus TF300T tablet. 
> 
> ---
> v2: extended with Dmitry's patches (replaced v1 patches 3 and 4)
> 
> Dmitry Osipenko (3):
>   input: elants: support 0x66 reply opcode for reporting touches
>   dt-bindings: input: elants-i2c: Document common touchscreen properties
>   dt-bindings: input: elants-i2c: Document eKTF3624
> 
> Michał Mirosław (6):
>   input: elants: document some registers and values
>   input: elants: support old touch report format
>   input: elants: remove unused axes
>   input: elants: override touchscreen info with DT properties
>   input: elants: refactor elants_i2c_execute_command()
>   input: elants: read touchscreen size for EKTF3624
> 
>  .../devicetree/bindings/input/elants_i2c.txt  |   6 +-
>  drivers/input/touchscreen/elants_i2c.c        | 358 ++++++++++++------
>  2 files changed, 239 insertions(+), 125 deletions(-)
> 

Hello Michał,

The series works and looks good to me, eKTF3624 touchscreen is working
fine on Nexus 7. Thank you very much!
