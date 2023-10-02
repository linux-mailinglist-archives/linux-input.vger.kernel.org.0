Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A31537B575E
	for <lists+linux-input@lfdr.de>; Mon,  2 Oct 2023 18:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238372AbjJBQHH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Oct 2023 12:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232151AbjJBQHG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Oct 2023 12:07:06 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B79EDB3
        for <linux-input@vger.kernel.org>; Mon,  2 Oct 2023 09:07:03 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9adb9fa7200so733899966b.0
        for <linux-input@vger.kernel.org>; Mon, 02 Oct 2023 09:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696262821; x=1696867621; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+6tSuZGsJ8MLmUkhQ/q6aX6p0H5mimnkA642RTbylo=;
        b=mTu8zoWOdeE5tGGpb/7TOrB7PTTa2CWjBrfNYiUIJyGJLBdz21r/9P8oW6ysB1hCxb
         oNtJY92G+CE8VnoS41g3clpY7B4WLbhlODtEhkQwSV18UWGTv3mXsFPfcH1cReA+kuIk
         spKLIvj5Jzq1DINxRuicubnWbuodAGDciz434=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696262821; x=1696867621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+6tSuZGsJ8MLmUkhQ/q6aX6p0H5mimnkA642RTbylo=;
        b=I9hEkrbSWIh9RwTTXtOSipdVwGA9rj6WgkwCnGEEZDb24aVQT1NvZ2mEJdqJRny825
         E/nSMbgtVnSLXm/0iYpmkaO0GAlZCwmPBvXBhiBlyb6g5dhFcrVn2tThucu0I/QImcvU
         XM/bCbNY80TLFRSYXHr8sHvAV9pYzXHY74bt5Suf61utFGYRqY/rl/9ZGQNnPPmvYi/J
         sA+WmN0BiOEHpxDttV8iTptrBpAhNFM/n7mVeGmFugxLtu33d+qjIyAq7FVw9oNRR40p
         695AZMvEYOrLIO7h772b+0kF81SEgr0g9OIdk+cLJAFImEMSiWogZTMzqV6YiO+toC/+
         eQqA==
X-Gm-Message-State: AOJu0Yw0iyMW0u//b3vDBWv29bdThrJy/0zbqKsoyjISbSvZUl0zvYnr
        6YkA4jQqiuyCc0LT7dCK9nGNALHD4E31Va9TfN858xZE
X-Google-Smtp-Source: AGHT+IHdQRIz0JawymrKPkrCgiSaI0v0FEEdXHgqZgGQmrnNG9XpVDEXw2Gu4qfCv9qdGan0LOPt3w==
X-Received: by 2002:a17:907:c24:b0:9a1:8993:9532 with SMTP id ga36-20020a1709070c2400b009a189939532mr88191ejc.30.1696262821711;
        Mon, 02 Oct 2023 09:07:01 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id md1-20020a170906ae8100b00997c1d125fasm17278041ejb.170.2023.10.02.09.07.01
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 09:07:01 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40662119cd0so108085e9.1
        for <linux-input@vger.kernel.org>; Mon, 02 Oct 2023 09:07:01 -0700 (PDT)
X-Received: by 2002:a50:9b19:0:b0:522:4741:d992 with SMTP id
 o25-20020a509b19000000b005224741d992mr156294edi.4.1696262443982; Mon, 02 Oct
 2023 09:00:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230918125851.310-1-johan+linaro@kernel.org> <CAD=FV=Wfwvp-SbGrdO5VJcjG42njkApJPB7wnY-YYa1_-O0JWQ@mail.gmail.com>
 <ZQlIveJVdvyV2Ygy@hovoldconsulting.com> <CAD=FV=XBG7auVVyHn5uvahSZZxp5qBfp4+A9NwFqahdN6XrbZA@mail.gmail.com>
 <ZQqemN8P2VKgxhsV@hovoldconsulting.com> <CAD=FV=XK87TZuPy+d2r2g5QhowmghE-m9pGHe9-X7jnXAw9z1g@mail.gmail.com>
 <ZQ1Zm6ec9NuBvqpl@hovoldconsulting.com> <CAD=FV=USBJRzqxX9kBP8pp4LKRGpBee+jkHL=KmeQvyfBk2CVQ@mail.gmail.com>
 <ZRqzGA1F6JV-mlRL@hovoldconsulting.com> <CAD=FV=UHEeu3crTFEZDY+LDQZk07H8un7gCSs0jyCQJrGYkV=Q@mail.gmail.com>
 <ZRrmVN3Rbz9PY8FW@hovoldconsulting.com>
In-Reply-To: <ZRrmVN3Rbz9PY8FW@hovoldconsulting.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 2 Oct 2023 09:00:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WcUKPezcp2dUQHW2vhrvvdo9=GSAOeML1JPLhEyG3WqA@mail.gmail.com>
Message-ID: <CAD=FV=WcUKPezcp2dUQHW2vhrvvdo9=GSAOeML1JPLhEyG3WqA@mail.gmail.com>
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

On Mon, Oct 2, 2023 at 8:48=E2=80=AFAM Johan Hovold <johan@kernel.org> wrot=
e:
>
> > In any case, the fact that there is a shared power rail / shared power
> > sequence is because the hardware designer intended them to either be
> > both off or both on. Whenever I asked the EEs that designed these
> > boards about leaving the touchscreen on while turning the panel power
> > off they always looked at me incredulously and asked why I would ever
> > do that. Although we can work around the hardware by powering the
> > panel in order to allow the touchscreen to be on, it's just not the
> > intention.
>
> I hear you, but users sometimes want do things with their hardware which
> may not have originally been intended (e.g. your kiosk example).

...and they can. I don't think it's totally unreasonable for userspace
in this case to take into account that they need to keep the panel
powered on (maybe with the screen black and the backlight off) if they
want the touchscreen kept on. If I was coding up userspace it wouldn't
surprise me at all if the touchscreen stopped working when the panel
was off.

I will further note that there is actually hardware where it's even
more difficult. On the same sc7180-trogdor laptops (and others as
well) the USB webcam is _also_ powered by the same power rail. When
you power the screen off then the USB webcam deenumerates. When you
power the screen on then it shows back up. It would be really weird if
somehow the USB webcam driver needed a link to the panel to try to
keep it powered.


-Doug
