Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 981CD2979AF
	for <lists+linux-input@lfdr.de>; Sat, 24 Oct 2020 01:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1758747AbgJWXa2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Oct 2020 19:30:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754929AbgJWXa2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Oct 2020 19:30:28 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E231C0613CE
        for <linux-input@vger.kernel.org>; Fri, 23 Oct 2020 16:30:27 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id x11so968822uav.1
        for <linux-input@vger.kernel.org>; Fri, 23 Oct 2020 16:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f7t13KJFtLK85C1FR2S26/HGUVh7XtE1EASNOKN5/Sw=;
        b=eTA546ceA0tx2anudpIlj8hWS6Zr4dDiqNUsxg0ECeHE9b4FVXomMA3NzZBODGaiS3
         LcRcY0rThWckcVc3pVsVSSYkP+0iSM38PoEX4WaGWdU22yIadhkdDtKqzpxjq747+NC+
         Jgu+VwsckF9NJTyrsyMYJ/N/2U7CQU1RHfh/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f7t13KJFtLK85C1FR2S26/HGUVh7XtE1EASNOKN5/Sw=;
        b=tx1DnSjb1zMEigcIZWk1IAcvQCIsoQFo1rPT6j29INF+yp8UmIePjmWOuWEzSO+aBu
         urbrOutk7vIWqkdvj8QkoijJUCCqqjNE44nUriZXm7DsfznKwpmB85OtSpfQOYnTi6Jy
         nebKmHeH3XUi4Nx42WNu58tPGl81dIfa48t50p4Mflpjy3a7qIIONq+xjCHmzlGxVYvL
         Pm2KhMrfgmfbC5hwpDWeprP4QlZo7VlMV1CdE2SHnuj/cp8j/WPDCBDNuD5aODlf3unY
         g4myyNd7ktw8COu/bfkavP4z7zSt2jkL8EyrdhDyiJuq6JF7fXYF61rDRHvFs8W2eE85
         Rsjw==
X-Gm-Message-State: AOAM530GBCUc6DSsKpljGkXMehdr1w8iBhzoRzp5IxGIca17tTaVq58Q
        4wBTeXa/MiNw0lgX9cFrfuxzxDB5JfjSpw==
X-Google-Smtp-Source: ABdhPJxVva2C/X8NiQiz4avirfQafwxxCIwHsEXWbvL4s/x492UEFEosRp4rZ30dSwR9EsM3Y/vrnA==
X-Received: by 2002:a9f:35cb:: with SMTP id u11mr4314370uad.46.1603495822653;
        Fri, 23 Oct 2020 16:30:22 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id x186sm420120vke.32.2020.10.23.16.30.21
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2020 16:30:21 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id 52so905980uaj.4
        for <linux-input@vger.kernel.org>; Fri, 23 Oct 2020 16:30:21 -0700 (PDT)
X-Received: by 2002:ab0:4923:: with SMTP id z32mr4192469uac.121.1603495820984;
 Fri, 23 Oct 2020 16:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <20201023162220.v2.1.I45b53fe84e2215946f900f5b28bab1aa9d029ac7@changeid>
 <20201023162220.v2.2.Ibb28033c81d87fcc13a6ba28c6ea7ac154d65f93@changeid>
In-Reply-To: <20201023162220.v2.2.Ibb28033c81d87fcc13a6ba28c6ea7ac154d65f93@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 23 Oct 2020 16:30:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XnXCL0xrDoxpdaeQv5rut7Vpryor20KR4sHR_344_LcA@mail.gmail.com>
Message-ID: <CAD=FV=XnXCL0xrDoxpdaeQv5rut7Vpryor20KR4sHR_344_LcA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: HID: i2c-hid: Introduce bindings for
 the Goodix GT7375P
To:     Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andrea Borgia <andrea@borgia.bo.it>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-input@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Fri, Oct 23, 2020 at 4:23 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      ap_ts: touchscreen@5d {
> +        compatible = "hid-over-i2c";

You always find one more problem right after you hit send, don't you?
Or is that just me?

Obviously the above should say

compatible = "goodix,gt7375p";

Luckily when I change that "dt_binding_check" still passes.  Whew!

I won't send a v3 yet and I'll wait for feedback.  On the off chance
that there are no other problems with this binding and the maintainer
wants to land this, I don't have any objections to the maintainer
fixing this when the patch lands.

-Doug
