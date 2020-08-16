Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7BCE24588B
	for <lists+linux-input@lfdr.de>; Sun, 16 Aug 2020 18:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728167AbgHPQbz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 16 Aug 2020 12:31:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbgHPQbx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 16 Aug 2020 12:31:53 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129BBC061786;
        Sun, 16 Aug 2020 09:31:53 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id d2so7171241lfj.1;
        Sun, 16 Aug 2020 09:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2wv1WZYWnZqUYuy5daGO2mFT0CBCIh8Qm4hC8CQxQFU=;
        b=Mlurn4Y1LLKDyXimOcadPEv1DSjh3MGR0eCcaPWourEdJTuMnrEhEoWAWAwyMV7yQk
         FLtkQzSzQsyLOjyE0R/x/8bpAjZEPyOUHRx3H3IYecS8M87qtcSjHjiAdwJ1vmCsHAIP
         i7hoqCqfGurg2t213fkmj1KkVCQQvXdbHSsPx1AnhEJMEDQuPtt+R2dx52HvY2ClPJs4
         mxHgItL7O/6xe3qdVIzx556ycgnPaICj5xNA/bxXrNbbSPywjlC5KDEA+FUfxk/AvpSM
         RfskPu0+b5zoOz42I3tBlRaZgS0eNTJ+G6aUz9qie1ir1WKQLBeib00zVB9fOwl2KoKh
         IP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2wv1WZYWnZqUYuy5daGO2mFT0CBCIh8Qm4hC8CQxQFU=;
        b=F+vthVz9Gc6jVjCDk57VpcSkilAsSHVt/syAL2ixbW7WRBA3z0cw2icInSamZiCopP
         P49tiGyakVBGORQ6sIzMGlAQOWU9PHKDiD8tdrQbkJkrgrZ8hdZYR+4VAo1R8Swoorfb
         b8QUcLm8jXu273JGBRS5iZ6hUfwR2rpYeZ3Pfp4jUs/fhQwWM8CEdqKbltO2U8Sp1i6o
         vDFUDutWwN5cXSzbzlAplw9dMEyUaibFkKaJAPTt0qA3aBbrJPP/A6OS5C6hdEn1ev8X
         II6tPBP4059T51usDa3Me5knMI/CqTRyia61nKyCerlzRNXxZShkjS8PhZWdQGf1S/l6
         9v1A==
X-Gm-Message-State: AOAM533w2aIoK1lsUHeQhPXHZfgcWTZhW0w6/f/ib4dOFTwl0LDO+qbr
        zHmOmO0oed1u1YWaA3LUr9o=
X-Google-Smtp-Source: ABdhPJxA7t5nG3a82vhuuEwlrGGq8x9c2Bcu2pzpEaWHa662axpyEXfmFQVgDkjvJM87aW+ySiWWkQ==
X-Received: by 2002:ac2:5223:: with SMTP id i3mr5653219lfl.57.1597595511363;
        Sun, 16 Aug 2020 09:31:51 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id z15sm4255580lfg.81.2020.08.16.09.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2020 09:31:50 -0700 (PDT)
Subject: Re: [PATCH 1/1] Input: atmel_mxt_ts - allow specification of firmware
 file name
To:     "Wang, Jiada" <jiada_wang@mentor.com>,
        "nick@shmanahar.org" <nick@shmanahar.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "erosca@de.adit-jv.com" <erosca@de.adit-jv.com>,
        "Gabbasov, Andrew" <Andrew_Gabbasov@mentor.com>
References: <20200731075714.10608-1-jiada_wang@mentor.com>
 <e5da9e03-8156-39f6-c78b-0226c95690c6@gmail.com>
 <a0af72eb-11d9-cab1-c79a-0c42c3eb0e19@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <affa0525-2543-b121-2793-b8dc022e98f1@gmail.com>
Date:   Sun, 16 Aug 2020 19:31:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a0af72eb-11d9-cab1-c79a-0c42c3eb0e19@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

12.08.2020 13:11, Wang, Jiada пишет:
>> Have you decided to abandon the patch which allowed to specify firmware
>> name in a device tree?
>>
> In v11 patch-set, there is a patch allows user to specify config file
> name via device-tree and sysfs, I will drop device-tree part, since
> Dmitry Torokhov commented he would like to change the behavior of
> firmware loading during boot time,
> but I will keep sysfs interface part, which is similar to this patch but
> for configuration file.

Okay!

BTW, looking forward to the "I2C retrying" patch, which is needed for
the mxt1386 controller. The Acer A500 device-tree has been merged into
upstream, but some pieces are still missing in the kernel which are
needed to get that device fully functional, the mxt1386 controller
support is one of those pieces.
