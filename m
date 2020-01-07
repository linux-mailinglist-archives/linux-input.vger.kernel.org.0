Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0194A132DE7
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2020 19:03:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728365AbgAGSDI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jan 2020 13:03:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:44822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728451AbgAGSDI (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Jan 2020 13:03:08 -0500
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6F1622146E;
        Tue,  7 Jan 2020 18:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578420187;
        bh=cSIlJoOHgh09/Owb7TPSkjG78kZT597IFYgjh7h8uB4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=e2LzPBNXp3x9Bm5rMIEhqwZU81/LocL4/QqhOxwF/P+YoAWqVZI0jLC5EM8khBdqF
         MioV+9WAdD3+dUiHdLpMCdx4wAXSTcy0PZCcO8yKcP2J4vJw+juDRuGFP5pNxv3pTQ
         29KO2sWh0NSf5f3ZXEzDza38dv7g3MSSEJvAMvn8=
Received: by mail-qt1-f173.google.com with SMTP id n15so502441qtp.5;
        Tue, 07 Jan 2020 10:03:07 -0800 (PST)
X-Gm-Message-State: APjAAAURryYFfymvWfxrvVZZkLs41BOLguW2QEjLcRRrUaEm3uUOtIFk
        5ipif0b1PSO56d0bYgjZGpXOakCNBMreHmOR+Q==
X-Google-Smtp-Source: APXvYqzYgPt2mmOM92fmtqc1Y7J5YrHICFVpYfLAMISsmbC9T8x4hClE7gReZJC7gNb4Eez9i67VoJZ6iFbj0o1RXfE=
X-Received: by 2002:ac8:6747:: with SMTP id n7mr187365qtp.224.1578420186617;
 Tue, 07 Jan 2020 10:03:06 -0800 (PST)
MIME-Version: 1.0
References: <20200107130903.14421-1-benjamin.gaignard@st.com>
 <20200107130903.14421-3-benjamin.gaignard@st.com> <99576d0367241bff637e82dddca839c40f672d86.camel@hadess.net>
In-Reply-To: <99576d0367241bff637e82dddca839c40f672d86.camel@hadess.net>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 7 Jan 2020 12:02:52 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLGJehgW6c=GbyFSV8hL+WsUEkRzEBO0_kEka-d2nQ8pw@mail.gmail.com>
Message-ID: <CAL_JsqLGJehgW6c=GbyFSV8hL+WsUEkRzEBO0_kEka-d2nQ8pw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: touchscreen: Convert Goodix touchscreen
 to json-schema
To:     Bastien Nocera <hadess@hadess.net>
Cc:     Benjamin Gaignard <benjamin.gaignard@st.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux Input <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Yannick Fertre <yannick.fertre@st.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 7, 2020 at 7:38 AM Bastien Nocera <hadess@hadess.net> wrote:
>
> On Tue, 2020-01-07 at 14:09 +0100, Benjamin Gaignard wrote:
> > Convert the Goodix binding to DT schema format using json-schema
>
> I don't have an opinion on the migration itself, but this really should
> not lose any of the descriptions that were in the old text file.

To some extent, yes. Any information specific to the device should be.
Anything generic can be dropped. I see 2 cases that should be kept:

> > - - reg                       : I2C address of the chip. Should be
> > 0x5d or 0x14

'I2C address of the chip' can be dropped as that's every 'reg'
property for I2C devices. The addresses can be expressed as
constraints.

> > - - irq-gpios         : GPIO pin used for IRQ. The driver uses the
> > -                       interrupt gpio pin as output to reset the
> > device.

Also useful info.

Rob
