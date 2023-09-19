Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A7FA7A6A89
	for <lists+linux-input@lfdr.de>; Tue, 19 Sep 2023 20:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbjISSQW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Sep 2023 14:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231929AbjISSQT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Sep 2023 14:16:19 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E6A699
        for <linux-input@vger.kernel.org>; Tue, 19 Sep 2023 11:16:12 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5031ccf004cso3696436e87.2
        for <linux-input@vger.kernel.org>; Tue, 19 Sep 2023 11:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695147367; x=1695752167; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXJATLGe/WfIktgoMPXg04Y8kCGTEYPfQUQyvrst4q0=;
        b=OXv0HcNzkQ0KMnMyRdEOzMgSBxKteGvyfAykDahGL5A1ynik6WsWGHyit8R3ebBjxD
         zddb55WEoFCPV1hUXUPvqgR8DR077G8jqXGijLBwUlxeySnEDM4NG9ojtbSgg3wF35CD
         Cf+oNQZ9VAVz4Cp4f0Qr102TEdGrbasi/9TYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695147367; x=1695752167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZXJATLGe/WfIktgoMPXg04Y8kCGTEYPfQUQyvrst4q0=;
        b=MQO8QIIc8W2HGnD64xt3jwVuGgNCt/7JL6TJa324llkQnyVD3bZ0bZJbv70op/KQPO
         6g8FEvb4L1lIbe2OkDaNFUsP8yhzKDalGmElBTU3LHnza6S/YXqHV/bgRSUMMrkn6IKp
         zThthchhOiakdygiaUnZqBTF9yfrLtwbtJkka4FFXHVwRWcu3Tho8fuXKbxxa5wzRBA9
         GW82zNwEogW+D2rqpNcY69vCVaz10dKkn7YbW4gFEQTdEO2bafGODe3AwHnRgW+98/gS
         umXZALb3j+/9W4fooOFnMoybzBupPjBd/W94tNIzbgeYvspHS+aIf8pwnAkCEmpLNrtV
         SAeg==
X-Gm-Message-State: AOJu0Yzc6ZJOoa8oGxBN3p9Y/y+Yuc3itPFB9MaRTJaAVjVlPWPf+jPP
        56G915dDNgoZ5tmkZwR5e0HkUBHXIXD45VT9FnLtLbqQ
X-Google-Smtp-Source: AGHT+IEx45qfgcVS/DP0W13WZLv2POczXVH0HYbD+CKjTaeqJXwhJUNqLAj37mkEbfPNXQcoPHUnig==
X-Received: by 2002:a05:6512:281b:b0:503:256a:80cc with SMTP id cf27-20020a056512281b00b00503256a80ccmr418168lfb.42.1695147366066;
        Tue, 19 Sep 2023 11:16:06 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id q5-20020aa7cc05000000b0052a1a623267sm7713450edt.62.2023.09.19.11.16.05
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 11:16:05 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-52fa364f276so2143a12.1
        for <linux-input@vger.kernel.org>; Tue, 19 Sep 2023 11:16:05 -0700 (PDT)
X-Received: by 2002:a50:d71b:0:b0:51a:1ffd:10e with SMTP id
 t27-20020a50d71b000000b0051a1ffd010emr3828edi.3.1695147364758; Tue, 19 Sep
 2023 11:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230918125851.310-1-johan+linaro@kernel.org> <CAD=FV=Wfwvp-SbGrdO5VJcjG42njkApJPB7wnY-YYa1_-O0JWQ@mail.gmail.com>
 <ZQlIveJVdvyV2Ygy@hovoldconsulting.com>
In-Reply-To: <ZQlIveJVdvyV2Ygy@hovoldconsulting.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 19 Sep 2023 11:15:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XBG7auVVyHn5uvahSZZxp5qBfp4+A9NwFqahdN6XrbZA@mail.gmail.com>
Message-ID: <CAD=FV=XBG7auVVyHn5uvahSZZxp5qBfp4+A9NwFqahdN6XrbZA@mail.gmail.com>
Subject: Re: [PATCH] HID: i2c-hid: fix handling of unpopulated devices
To:     Johan Hovold <johan@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        LinusW <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Tue, Sep 19, 2023 at 12:07=E2=80=AFAM Johan Hovold <johan@kernel.org> wr=
ote:
>
> > c) To solve this in the core, we have to make sure we properly handle
> > (without hanging/failing) multiple partially-conflicting devices and
> > devices that might acquire resources in arbitrary orders.
> >
> > Though the above solution detecting the pinctrl conflicts sounds
> > appealing and I'm currently working on prototyping it, I'm still not
> > 100% convinced. I'm worried about the above downsides.
>
> Yes, I agree that we'd need to take a broader look at this and not just
> focus on the immediate pinctrl issue.

OK. FWIW, I got blocked on trying to solve this in the core
automatically by just using the conflicting "pinctrl" entries. There
are probably some ways to get it solved, but none of them are easy.


> > Personally, I feel like we could add information to the device tree
> > that would help us out. The question is: is this an abuse of device
> > tree for something that Linux ought to be able to figure out on its
> > own, or is it OK? To make it concrete, I was thinking about something
> > like this:
> >
> > / {
> >   tp_ex_group: trackpad-exclusion-group {
> >     members =3D <&tp1>, <&tp2>, <&tp3>;
> >   };
> > };
> >
> > &i2c_bus {
> >   tp1: trackpad@10 {
> >     ...
> >     mutual-exclusion-group =3D <&tp_ex_group>;
> >   };
> >   tp2: trackpad@20 {
> >     ...
> >     mutual-exclusion-group =3D <&tp_ex_group>;
> >   };
> >   tp3: trackpad@30 {
> >     ...
> >     mutual-exclusion-group =3D <&tp_ex_group>;
> >   };
> > };
> >
> > Then the device core would know not to probe devices in the same
> > "mutual-exclusion-group" at the same time.
> >
> > If DT folks are OK with the "mutual-exclusion-group" idea then I'll
> > probably backburner my attempt to make this work on the pinctrl level
> > and go with that.
>
> I expressed something along these lines in the thread above:

I'm going to try coding up the above to see how it looks. Assuming
nothing comes up, I'll try to have something in the next few days.


>         It seems we'd need some way to describe the devices as mutually
>         exclusive...
>
> but given that we had prior art for handling simple cases and due to
> lack of time, I left it on the ever-growing todo list.
>
> But regardless of what a long-term proper solution to this may look
> like, we need to fix the regression in 6.6-rc1 by restoring the old
> behaviour.

OK, fair enough. I'll take a look at your patch, though I think the
person that really needs to approve it is Benjamin...

Style-wise, I will say that Benjamin really wanted to keep the "panel
follower" code out of the main probe routine. Some of my initial
patches adding "panel follower" looked more like the results after
your patch but Benjamin really wasn't happy until there were no
special cases for panel-followers in the main probe routine. This is
why the code is structured as it is.

Thinking that way, is there any reason you can't just move the
i2c_hid_init_irq() into __do_i2c_hid_core_initial_power_up()? You
could replace the call to enable_irq() with it and then remove the
`IRQF_NO_AUTOEN` flag? I think that would also solve the issue if you
wanted to use a 2nd source + the panel follower concept? Both devices
would probe, but only one of them would actually grab the interrupt
and only one of them would actually create real HID devices. We might
need to do some work to keep from trying again at every poweron of the
panel, but it would probably be workable? I think this would also be a
smaller change...

-Doug
