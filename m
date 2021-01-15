Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33EA02F88AF
	for <lists+linux-input@lfdr.de>; Fri, 15 Jan 2021 23:47:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727378AbhAOWon (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Jan 2021 17:44:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727177AbhAOWom (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Jan 2021 17:44:42 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3088BC061757
        for <linux-input@vger.kernel.org>; Fri, 15 Jan 2021 14:44:02 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id b5so6067995pjl.0
        for <linux-input@vger.kernel.org>; Fri, 15 Jan 2021 14:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=mjmhzCxq5pbVH4bXG4GaoLE2im/d0NYMiaeqGM/Vh2A=;
        b=hLycDkMDchQHlWdWsrjWr3UBgejQQ3Ovk8nornlDD52lqrCiK77f7aitNbbqbKt7Cv
         avjW2Y+KJn3LiUOxOufNxg8syfmnlcjZctPH5p7IRilKaC0kSn8ay95ZJVniIZPbnbqT
         5IHjyo37QtwESsJOqNEXSrR3/LksjN3X7Yh2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=mjmhzCxq5pbVH4bXG4GaoLE2im/d0NYMiaeqGM/Vh2A=;
        b=ra1AaijwqMwF+Sgly6ydo0syHf7jQQbge7+IxJNDWVmaPA4CJ2zixZ24tVBS5ihK0q
         XjXCb2eDWZURZWLRPTc0+rZnyM8qqZsYmPxN+nNSzQ9bQ7ZlLV8xdfEeaXfc7FPPmVW9
         /4BvgVyzLjqS7twkmbJfw3BECpEouvT/lvzQejlPP1LQKz496uNIMptecyKQzX8OvXv0
         R/+ERR22gv6+DtJK/DVG6DUEgu4dIlMSjq94eCHEWL9h1pyZMbzyrIfx2DELbb+u1cM5
         6VSHeFS+yJovk4Bu7esuSMWnHtjquBYr0POegufAhLXAv1BJZT9Mt6brzgyqCQxWGkln
         gBTw==
X-Gm-Message-State: AOAM532yrrCngqOsYdH8WxolsnQRBB2+H+QBZN4Dofvkf4Vckgno8Fzc
        kDVXYUY1v7yPkH11SyvfNmZp/N42K/MbAQ==
X-Google-Smtp-Source: ABdhPJwczw73/caLQt7NVwLFlyBdc8k0alhRhk2B56jvp6W/r2+VdYKjWodeNOfZnahuoJ9c5ztJTQ==
X-Received: by 2002:a17:902:6bca:b029:dc:34e1:26b1 with SMTP id m10-20020a1709026bcab02900dc34e126b1mr14829023plt.52.1610750641561;
        Fri, 15 Jan 2021 14:44:01 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id l7sm8745699pjy.29.2021.01.15.14.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 14:44:00 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CABXOdTcT4f_mg=ukPd0sD90o-aKg3qgiuLDRNPU8SUuFnFbRxA@mail.gmail.com>
References: <20201205004709.3126266-1-swboyd@chromium.org> <CAD=FV=XjzBLTPMqOf1NK0pjXiZWrLT227nksxhMqaFG6GxAqjQ@mail.gmail.com> <CABXOdTcT4f_mg=ukPd0sD90o-aKg3qgiuLDRNPU8SUuFnFbRxA@mail.gmail.com>
Subject: Re: [PATCH] Input: cros_ec_keyb: Add support for a front proximity switch
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Benson Leung <bleung@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>, open list:
        HID CORE LAYER <linux-input@vger.kernel.org>,
        Guenter Roeck <groeck@chromium.org>, ;
Illegal-Object: Syntax error in Cc: address found on vger.kernel.org:
        Cc:     ;
                        ^-missing semicolon to end mail group, extraneous tokens in mailbox, missing end of mailbox
To:     Doug Anderson <dianders@chromium.org>,
        Guenter Roeck <groeck@google.com>
Date:   Fri, 15 Jan 2021 14:43:58 -0800
Message-ID: <161075063876.3661239.2601657304680031525@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Guenter Roeck (2021-01-06 18:30:20)
> On Wed, Jan 6, 2021 at 5:16 PM Doug Anderson <dianders@chromium.org> wrot=
e:
>=20
>     Hi,
>=20
>     On Fri, Dec 4, 2020 at 4:48 PM Stephen Boyd <swboyd@chromium.org> wro=
te:
>     >
>     > Some cros ECs support a front proximity MKBP event via
>     > 'EC_MKBP_FRONT_PROXIMITY'. Map this to the 'SW_FRONT_PROXIMITY' inp=
ut
>     > event code so it can be reported up to userspace.
>     >
>     > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>     > Cc: Benson Leung <bleung@chromium.org>
>     > Cc: Guenter Roeck <groeck@chromium.org>
>     > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>     > ---
>     >=C2=A0 drivers/input/keyboard/cros_ec_keyb.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 5 +++++
>     >=C2=A0 include/linux/platform_data/cros_ec_commands.h | 1 +
>=20
>=20
> For a year or two people kept changes to=C2=A0cros_ec_commands.h separate=
 from
> functional changes. Unfortunately, we are now reverting to the old
> "change=C2=A0cros_ec_commands.h together with some functional change" app=
roach which
> caused an endless amount of trouble and pain for Chrome OS rebases a coup=
le of
> years ago.
>=20
> I won't NACK this patch, but it is close.

I'm fine to split it into two, or keep it together. Just let me know
what is preferred. Thanks!
