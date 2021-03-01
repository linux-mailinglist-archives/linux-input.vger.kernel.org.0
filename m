Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42BBC3276FB
	for <lists+linux-input@lfdr.de>; Mon,  1 Mar 2021 06:26:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233466AbhCAF0B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Mar 2021 00:26:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbhCAF0A (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Mar 2021 00:26:00 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E426C06174A;
        Sun, 28 Feb 2021 21:25:19 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id e6so10763208pgk.5;
        Sun, 28 Feb 2021 21:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=rfrjhWTiKdZwm1SmPC3mAg3sEQUbY4V7eBsT+TSRXqw=;
        b=vgkE0PuMfE8yEXxONSMKhpFoahERgruB2gY5VdxDp/KgIIR+3zrDkfrkLkcKTQ6Xz+
         KK0G84EuSCIK1Pl0FVjuMoG8CxSwh4H1fJjPpIeBOaa+tOBRgGNobcXNXwtLx56+5niF
         LgzB7jKeq3QoRH9wEf5Pjl7fDUJ9dVDkmHyxyeJZJP/H3BjTbNbQG92QG888toI9arzg
         SW4GfH45vDnVk9SMpxB1mq6/EQFww2+ZAVWzvGQbZAEKZDFD4EzooYHhfcfVRiX8cSd8
         d+Fx2j0UlcsXuNZAyP903BTvrNxa0Eqv1Zi8OdpPwKxMcB0D/ya9ZHEyrhbAYNC9aIRw
         rKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rfrjhWTiKdZwm1SmPC3mAg3sEQUbY4V7eBsT+TSRXqw=;
        b=jnFDYw0F/0gy4bAVLNYTO9olZbpq05mZA04A7mN2DcrqRTucYZ/1jxJrNdMLkGSi6R
         Ssv7e+fA2SwEPzQa8SVxnKwB3Z77uc1ZLb4hZCYmMMYFtztwXT9GqQrQaxr0+3uknHEw
         CIvDZaElV63QOZ2ruxFRAvnB91dQPWmY9o71mMO3ci7PAZf8+s8UCxun4zNSl/M4sfBR
         gdUApn6tIf74ZfU1ciNCGQjLB5UddRGBbrQyS+XjwnZ/R3p3gTF81l7VD9wIqHQDde+e
         77tayLCFgKXnqq7Vc4zUfeHSp+WYCyeJ49KONNd0DMjrOKNCeDon0lPS5vK8x43BulMr
         Tw1g==
X-Gm-Message-State: AOAM532lRmBH1kRj2tLMl3XcpaFFdIbJ8+FaLhr/c8B2xs7DbcKCUV5k
        BQJ4AVrSQJfFox+IEXP5WRE=
X-Google-Smtp-Source: ABdhPJzYV9b1Ay3uuQZIUCtsJVbvX1gxje81GHvBjfiv9/E16fMchHSbaSb0tcwKVD9NK1PMbkZCMg==
X-Received: by 2002:a63:fd0a:: with SMTP id d10mr12263965pgh.345.1614576318646;
        Sun, 28 Feb 2021 21:25:18 -0800 (PST)
Received: from google.com ([2620:15c:202:201:bc4a:36c8:19a:eb9e])
        by smtp.gmail.com with ESMTPSA id h75sm16627072pfe.162.2021.02.28.21.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 21:25:17 -0800 (PST)
Date:   Sun, 28 Feb 2021 21:25:13 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Joe Hung =?utf-8?B?KOa0qumKmOmZvSk=?= <joe_hung@ilitek.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Luca Hsu =?utf-8?B?KOW+kOWYiemNiik=?= <luca_hsu@ilitek.com>
Subject: Re: [PATCH v3 2/2] input: touchscreen: Add support for ILITEK Lego
 Series
Message-ID: <YDx6udLZf6thd4KQ@google.com>
References: <20210218064435.1360483-1-joe_hung@ilitek.com>
 <20210218064435.1360483-2-joe_hung@ilitek.com>
 <YDH0/tSytUagrzKP@google.com>
 <3d8c4d2e56fd40cc859b393c292432ac@ilitek.com>
 <YDdCZdRJAqBvVZFZ@google.com>
 <4c0d711cd2f046938dbd34a1bf0d9661@ilitek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c0d711cd2f046938dbd34a1bf0d9661@ilitek.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Joe,

On Fri, Feb 26, 2021 at 08:30:25AM +0000, Joe Hung (洪銘陽) wrote:
> Hello Dmitry,
> 
> Thank you for the quick response.
> Understand and agreed on all your comments.
> 
> Little question about the name of prefix and this driver file,
> could it be named according to different protocol version named by ILITEK internally
> as ilitek_p6x.c (as protocol version 6 for Lego series, and ili210x.c should be protocol 2).
> 
> In addition, could we named it like how touchscreen/elants_i2c.c and eftf2127.c worked?

So elants_i2c vs eftf2127 is historical artefact with elants_i2c being
there first.

> Is there a way that we could keep ilitek as prefix and driver file's name?

OK, this is really a minor point as far as I am concerned and we spent
way too much time debating it. You may keep ilitek file name and prefix
if you would prefer. Just make sure you list supported
controllers/protocols in Kconfig and that should be enough.

Thanks.

-- 
Dmitry
