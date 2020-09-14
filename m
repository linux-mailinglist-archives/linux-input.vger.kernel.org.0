Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7ADE269184
	for <lists+linux-input@lfdr.de>; Mon, 14 Sep 2020 18:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbgINQ3k (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 12:29:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbgINQ2n (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 12:28:43 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EED9C06174A;
        Mon, 14 Sep 2020 09:28:42 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id b19so180704lji.11;
        Mon, 14 Sep 2020 09:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ygRt9agcEbo7q8JCBAqrcVsrFofDa5xMd4dVLOvJgBA=;
        b=TafnvzwFrP555qzfqGI06/4AwjXq1KQmawiM8R+0iJdbibFqRtCWUZTrcmTXqbIV3I
         g0YUdQqyvlIyqudX2hn5IoIf5K67G4P3NsalvsVbhkYpYj37aiZ00JFJK/WeKVdUTUPM
         3LYxOMYimT4swp+kGHwT6jMyd5X4vKXtvPuTw+1oJ32nF1oNhmWbVawL2yT+vbg4MkQ/
         Uv1ui0AhOgCMkXm6/jf5j/zbjrF3mVUx/BUcD35d+/dbA8jii6Abl/rX1EzWqbZfV6u6
         G5GhBW6zbD+PyCpDtMPVnHUlGVrc6MoJcB9chOJ5tljWIp6HhpqrJQGPgwDm6/tcLkxX
         TGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ygRt9agcEbo7q8JCBAqrcVsrFofDa5xMd4dVLOvJgBA=;
        b=qXL4Ya6AggsoO1BbkF41eRmssnJMm/vYiKM6U9p2O2zcTq7IJnFbhBd0NPOhyUzR/T
         vnXCJUDGDpUv/Pqhkr86JUWJjW1y4PUjBTceX1Kg9YhLDItSwnR4QH4AYfTWwgZH2BhT
         +fe8dOLJ2ROsaSC/5sRY3DXVJPEDj2guPHdcUTFFiu3PzzSHh1uW82HS8jsmWiNjFOc8
         H5YgK9kLDWOHfvb5/sEQm5EwEmliwcmnLthFpPz99GAevcuGU2gF6F2AG4qSucPdr7Ra
         JUWKF9KyOBAF6YOLqFPk7zHkq0c1N8XN/DCFmRaRNQ2gqIKVnnCNgaoixaVdxfA2Fbo0
         kyoA==
X-Gm-Message-State: AOAM530LqJrtIIBHJUEkKRELSIlqJiUi94hzYFC10u0mnXumN49BERGU
        vzzPV0eC6uMW2j8bGq5G3q4=
X-Google-Smtp-Source: ABdhPJxkpXgg0sG6PdRnz/SglpJdWPRZ84qJISKehhFhwZJ+cAeQLVMcL/+xEA5pQXDMQy+r83ZSKw==
X-Received: by 2002:a2e:5357:: with SMTP id t23mr5210648ljd.394.1600100920559;
        Mon, 14 Sep 2020 09:28:40 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id u10sm3765945lfr.33.2020.09.14.09.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 09:28:39 -0700 (PDT)
Subject: Re: [PATCH v4 1/1] Input: atmel_mxt_ts - implement I2C retries
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Jiada Wang <jiada_wang@mentor.com>, nick@shmanahar.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Andrew_Gabbasov@mentor.com
References: <20200912005521.26319-1-jiada_wang@mentor.com>
 <CAHp75Vc5YCb-6oRRfVOE5bL_Dmzy0LwDpetxqD-G+E9M=EwA=w@mail.gmail.com>
 <bd668b99-5b14-f54d-101d-7d56e0c8c4c0@gmail.com>
 <CAHp75VdTv-uCQue3VU=czZJd4iTG+XBVe2kFtnP+fZ1XQuFbzA@mail.gmail.com>
 <137be969-f99a-66e0-ebe4-b86f4be2b5d3@gmail.com>
 <CAHp75Vfg6=5u1fthsub3xw3dxAKTGPUHfamjK_A2b5hcyw25PA@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e116e162-763a-ff0f-5b33-35024d0f57c2@gmail.com>
Date:   Mon, 14 Sep 2020 19:28:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vfg6=5u1fthsub3xw3dxAKTGPUHfamjK_A2b5hcyw25PA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

14.09.2020 18:50, Andy Shevchenko пишет:
...
>> It's more preferred
>> to accept patch as-is if it does right thing and then maintainer could
>> modify the patch, making cosmetic changes.
> 
> It depends on the maintainer's workflow (which may be different from
> maintainer to maintainer).

Sure!

It's awesome that you're pointing out it all in the reviews because it's
important to have such things explained and definitely should help to
improve quality of further of patches! But it shouldn't be necessary to
demand a very minor changes, IMO.

In particular Jiada was submitting this and lots of other atmel_mxt_ts
patches for about a year now without much progress yet, and you probably
should know how a frustrating experience this could be for a contributor
since you're a longtime kernel developer.
