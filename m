Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76D3B48F1BD
	for <lists+linux-input@lfdr.de>; Fri, 14 Jan 2022 21:56:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbiANUzv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jan 2022 15:55:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbiANUzu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jan 2022 15:55:50 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65702C06161C
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 12:55:50 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id z25-20020a0568301db900b005946f536d85so2485791oti.9
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 12:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=kZlcK6bzk2i8yDVBkb61iS5h5fQfrdP5oTJGQdHluU8=;
        b=TsQm+oAzKNnCJ4v024+FpUVdSx0j6IuMd+HlMYnTIuQfYA4xMIFvWyEkWD7qgiPmqk
         WYwR7hi3YJ2qM5lSGaQRvov0csEpAdxMoJk85UB5SOeAqACTVZQPYhi/AJuwY5kXHXI/
         Q5hJgwUHVrXBKac+U2t6XQ3I0l0SIvlxe8wVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=kZlcK6bzk2i8yDVBkb61iS5h5fQfrdP5oTJGQdHluU8=;
        b=56iiVdhVQYHgwHxWDqd2t5IUyBV3pBmxke2asU9XOKxD771Ri38lJZqALBU/W3Zzn4
         +OLix6vIHa+PvyFgof33USsRMEWbGGaAluBnq7iHLjs9jE92F6IK+cLrAoPG/3hWW9+U
         qogoOH5gbpxJW2QSd4hPzgNNw5FZB/u1xwsCfvYGVcMA7qytW+ui/NlZurKUGQkZyD0H
         D4WHQTqHiCU/EXPL8ktyUWzyIQOu1qnse7A6+a4mrp1qjQ5O0F/HQYe6/GTv1AThnzPn
         xG5DHm7Utp6qPnte9wC4WZoljrenMVh2fEILNlhyUjrfOCGQ9fa3QyVsmZ06bhLaaHJ3
         p0NA==
X-Gm-Message-State: AOAM531PMayKpfb9yUUQc9biEetbNJ//H6k2Utlwy2kkqTV1f2fgneDc
        6dBfVnURR8mun1iNNhmlXuWyAnl/1kPld4l102xD0kcRwtM=
X-Google-Smtp-Source: ABdhPJzzp8E4NOSV2XzSq+cs6x37dxauIKu6zpkuVpKATYcGEIUh/HC5MNTbrioYLy7iARwikOhEYirsEKJu8hhT6CU=
X-Received: by 2002:a9d:2243:: with SMTP id o61mr8151551ota.126.1642193749461;
 Fri, 14 Jan 2022 12:55:49 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 14 Jan 2022 14:55:49 -0600
MIME-Version: 1.0
In-Reply-To: <YeHWNtl0Or1dgadz@google.com>
References: <20220107091357.28960-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <nycvar.YFH.7.76.2201140935460.28059@cbobk.fhfr.pm> <CAE-0n53M723sZ7H-f0SF=AoTrwznmTRhKPapgHe5H7Mw6bPb7Q@mail.gmail.com>
 <YeHWNtl0Or1dgadz@google.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 14 Jan 2022 14:55:49 -0600
Message-ID: <CAE-0n51TAtifbbruKhCJ_u5xH1j0zKjWOehGQFFdCez=RubxVA@mail.gmail.com>
Subject: Re: [PATCH v2] HID: google: modify HID device groups of eel
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        Wei-Ning Huang <wnhuang@google.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        "Sean O'Brien" <seobrien@chromium.org>, phoenixshen@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Dmitry Torokhov (2022-01-14 11:59:50)
> On Fri, Jan 14, 2022 at 01:25:12PM -0600, Stephen Boyd wrote:
> >
> > My understanding is that 'vivaldi' is mostly a keyboard layout and
> > 'hammer' is a detachable keyboard. We want to prevent the hid-vivaldi
> > driver from probing this particular device because the hid-vivaldi
> > driver doesn't know about detachable keyboards. Hammer devices also
> > support 360 degree wraparound so we know that the keyboard has been put
> > behind the screen or that it's being used to stand up the device on a
> > table.
> >
> > Given all that, I'm still confused. If we make the hid-google-hammer
> > driver probe this device and the keyboard layout is vivaldi then we'd
> > want the part of the vivaldi driver that exposes the
> > function_row_physmap through sysfs. Otherwise userspace won't know how
> > to handle the function row properly. I think we need the device to stack
> > two drivers here. Does that happen with HID?
>
> As far as I know HID does not easily allow "stacking" drivers like that.

Ok.

>
> Probably the easiest way would be to export vivaldi_feature_mapping()
> and the show method for the physical row map and call them from the
> hammer driver.
>

I worry about builtin vs. modular drivers so probably ought to make some
hid-vivaldi-common.c file that has the physmap code and then have both
drivers call that mini-library. The 'vivaldi_data' structure would need
to be figured out too. The hammer driver stores 'hammer_kbd_leds' in the
hid_get_drvdata() whereas the vivaldi driver stores 'vivalid_data' so we
can't simply call the show method for the sysfs attribute without some
minor surgery.
