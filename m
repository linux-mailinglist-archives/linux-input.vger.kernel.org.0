Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95B5C5BE8CB
	for <lists+linux-input@lfdr.de>; Tue, 20 Sep 2022 16:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231835AbiITOZQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Sep 2022 10:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231708AbiITOYr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Sep 2022 10:24:47 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49890E086
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 07:24:35 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id z2so4129087edi.1
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 07:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=RB9jao1RvJqD7q146MWauhEs/XPA1hJe/ii/bB71eYk=;
        b=bY4rQNJblhGCXlfTf0ljqyrS0bwAA7s1qk+DVA7MaGpfDN9urU4dwOrG0PRT67r4b+
         KVuu1GBzHozmiZ/R0O0a/yT2PdhZdhoZ+B4TnPXKExKhxtnl0PBPHrTtg8LmOZPQafmH
         S1yod32L2LUvVwdoULLd4/ejBhoyCy09wHLoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=RB9jao1RvJqD7q146MWauhEs/XPA1hJe/ii/bB71eYk=;
        b=IGt0bVbaqZpapHLx0H1rU+fIyCSUx0GoxYzyGiJZG606Zf6Y6IiMecaBKtEyJ73sRj
         A4nolzwqZMTu/FRzcta6f9P71MxHXNAZkPuX09JxOAh+QZPJm5X8ZhcAHFqIk1kzLmRF
         Z/6/ibCFyH7zV3zwUuLpC0fN/xlXlLAidIphkKHxY3My+LJt96IAs7JIIplz2pRXazNU
         CbIzp9OkF41irRPp2ipNFbzHNJd0bnk+SG7RC2xJ0UvnshoWV2tXesBfyzaTlSFR35Aj
         p71acm14b1Jbip/vjdFP0skKOxAVc9P6OMVzk7tIwkhZfRjMxHG4/B+at2pqHDx3q0fk
         8GmQ==
X-Gm-Message-State: ACrzQf1NDyIzQz0MYzO1paEDXpR+/YHZ2pjJxykewsdgtcFS/wjG6uyh
        PuREl+oMY/qjIZPZUffO6L2jn32X9QNuDmtC
X-Google-Smtp-Source: AMsMyM7A6bz2agX04FEWCkFols/9f4eKsQzbC5EhLI9w/UUwpOtW5Yut/7+iAY46G0skcKihE68Blw==
X-Received: by 2002:a05:6402:1353:b0:454:8f82:d1d2 with SMTP id y19-20020a056402135300b004548f82d1d2mr1294153edw.210.1663683873361;
        Tue, 20 Sep 2022 07:24:33 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id f9-20020a056402068900b004539604cc9esm76514edy.96.2022.09.20.07.24.30
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 07:24:30 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id b5so4578655wrr.5
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 07:24:30 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr14212984wrr.583.1663683870079; Tue, 20
 Sep 2022 07:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220909102720.v3.1.Ib599a6001558a4afd11016e7016d74dce748a749@changeid>
 <20220909102720.v3.2.I22ae48d8ee064456073a828393704809360c4368@changeid>
 <Yyk/b29aG2ivpkf5@google.com> <CAFvdKjuBFoKXmU9zN8vQ65LT3=MMX-_3vhay16uhN3Z05QN6eA@mail.gmail.com>
In-Reply-To: <CAFvdKjuBFoKXmU9zN8vQ65LT3=MMX-_3vhay16uhN3Z05QN6eA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 20 Sep 2022 07:24:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U6zAabNPCB2aER7FL9Hwt=m71PTviOFcUbbZf7SmAA0A@mail.gmail.com>
Message-ID: <CAD=FV=U6zAabNPCB2aER7FL9Hwt=m71PTviOFcUbbZf7SmAA0A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] input: touchscreen: elants_i2c: Add eth3915n
 touchscreen chip
To:     Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Henry Sun <henrysun@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Yunlong Jia <yunlong.jia@ecs.com.tw>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Tue, Sep 20, 2022 at 1:38 AM Yunlong Jia
<yunlong.jia@ecs.corp-partner.google.com> wrote:
>
> Dear Dmitry=EF=BC=9A
>
> Thanks for your reminding.
> After double checked with Elan, we finally decided to cancel this timing =
delay submission, due to touch panel module has HW modification..

Just to confirm that I understand this. I believe that you're saying
that in the end you decided that you _don't_ need the extra delays for
"ekth3915" and you can just use the normal ones. You only needed the
extra delays because of something that was different on your local
setup. Thus we should consider ${SUBJECT} patch abandoned.

If that's not true then please yell.

-Doug
