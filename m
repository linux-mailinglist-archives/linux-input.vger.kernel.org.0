Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2922044F630
	for <lists+linux-input@lfdr.de>; Sun, 14 Nov 2021 02:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbhKNBz2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Nov 2021 20:55:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbhKNBz2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Nov 2021 20:55:28 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E455C061714
        for <linux-input@vger.kernel.org>; Sat, 13 Nov 2021 17:52:35 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso20476079ots.6
        for <linux-input@vger.kernel.org>; Sat, 13 Nov 2021 17:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=fm9RkvfbaKhjnZYlklYRPQ2G9cfUxJSVi3MLSW2yVcI=;
        b=Z6v0FC4wLvTTPRbbWTi+QrFdDuisx8lUPea2lz96squFu/OUdL77Yj9KqFiNEtq9Ad
         1CifCEf08829eWdTcKg/fsQxWxGpbLzYcMB2lDU/C+AmQgmlp7chbAsFDf4Vig2nQc72
         VlosAHGKb3f5+H7WUTrmXJlrbfUVCr+PrzW6a4/fF22E4NklFL5gDjwp9ycTgPCysi4F
         88P8rfHMxPKE8wODN9OQPAnf+GbC50LgDhQtxIDrTHjCXkb7LpAA9bnuMKgg12CKkokM
         opMVb2koVyFCbfgoPTI79m37U1Ppbzr+sA7zLKjMdleBv34yhWcBWn9w+k1k+x5QjeRQ
         LT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fm9RkvfbaKhjnZYlklYRPQ2G9cfUxJSVi3MLSW2yVcI=;
        b=MSII1U9/NZSOh7yHWZc+TcpiEtf/uMvdo7ywCWSXEJtBLWkaEbPYngWtETcaVauW2l
         Z/EdoWp72auOUM7K6byVzy7I9E2SmKpAcVtUwznHAVHLks5ZqEdJnNhREUFxXmwfVuYu
         OC4v+FyhgSPJXVDR1CJmYy6g6uMtFS/3EIFf+kE9daMMRT7xIZljFAJmi5bX0osjr4ND
         KY/aT31EnAvBJgKCym6cQADwNaV0IaPDuZACQfDXBwrK7Nrpl4GdTWFJ+9O1ihl0NRl0
         IDjMSrd7cbCU1IlKqLTZ5QTjmWzUO9OJlv3xwSBZjCUBIee3PF3ExSye2/rQNhmJ3e2e
         Rgbg==
X-Gm-Message-State: AOAM532h5na9dVgeVH+owPswNIoMp2OSdA0CcexDWI4atfrxBbdqwSaF
        9L0wBGZt5qfi9dHsnUpgvBI=
X-Google-Smtp-Source: ABdhPJx8T2CgKVX1UmHAMfAbl8dbGY6YNL299pJzPKW6TlIauq/Ga2MfsdLk4+u5bLRyr0xU/mB1YA==
X-Received: by 2002:a9d:d68:: with SMTP id 95mr21925091oti.377.1636854754544;
        Sat, 13 Nov 2021 17:52:34 -0800 (PST)
Received: from ?IPV6:2600:1700:4830:3f7f:7aac:34da:1863:159e? ([2600:1700:4830:3f7f:7aac:34da:1863:159e])
        by smtp.gmail.com with ESMTPSA id l19sm1821886ooq.17.2021.11.13.17.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Nov 2021 17:52:34 -0800 (PST)
Message-ID: <3b25f4b1-3ec0-0878-99bc-0da06ce7c2f2@gmail.com>
Date:   Sat, 13 Nov 2021 19:52:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] Input: xpad - Poweroff XBOX360W on mode button long press
Content-Language: en-US
To:     Benjamin Valentin <benpicco@googlemail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, lawl <github@dumbinter.net>
References: <20211113141155.26217b44@rechenknecht2k11>
From:   Cameron Gutman <aicommander@gmail.com>
In-Reply-To: <20211113141155.26217b44@rechenknecht2k11>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 11/13/21 07:11, Benjamin Valentin wrote:
> Newer gamepads turn themselves off when the mode button is held down.
> For XBOX360W gamepads we must do this in the driver.
> 
> Power off the gamepad after 2s of holding down the button.
> 

2 seconds is pretty short. It seems like there's a pretty good chance a
user might accidentally turn their gamepad off when trying to activate
something mapped to a long-press on the guide/mode button.

I timed a couple of my Xbox One gamepads and they both took 5-7 seconds
to power off when holding down the button. How about 5 seconds here?

> Signed-off-by: lawl <github@dumbinter.net>
> Signed-off-by: Benjamin Valentin <benpicco@googlemail.com>
> ---

Regards,
Cameron
