Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B18F4151697
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2020 08:44:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgBDHoy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Feb 2020 02:44:54 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:41530 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbgBDHox (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Feb 2020 02:44:53 -0500
Received: by mail-vk1-f196.google.com with SMTP id p191so4893821vkf.8
        for <linux-input@vger.kernel.org>; Mon, 03 Feb 2020 23:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PrJkaVosHVyDC3fJ7ODIJY8tH2A+lqKAd2gAEcP3LqI=;
        b=RXnUPNFAExJbKvzQbWRSzigj2n5KQbtVWAkmfN5b3Cx7N17s6x6+JFpKQa1oUei03F
         BXlRwmOaBRBls7iCRkBmqhAmPd16T9JcinVAR6gN9hCJE7HXZEMaCuuUUhgdfZPJw2hO
         LSZ+Is1b0UJHU942FfZwiLITm3RsZrzWRHZvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PrJkaVosHVyDC3fJ7ODIJY8tH2A+lqKAd2gAEcP3LqI=;
        b=nCdYRNo97De+YI90Ztn590Fk8F+faKFp9M5lVGdB+7qEP73OSQFGKgREx3Z65CjSc4
         CgtpYimOqNTNfdG2i7EwLE8kjrOhwILg9ksTV2vkElkZBbzKnhqY9huweGQnobDWrBbq
         lPKWQaROxDYSQ/kCOS3wW20kusU9/kVCIGRoAI/Ib3htIstv+8Gy1eBggEeeTy9X+ynJ
         bUtu0i9/unmfgRDtRLacVpb/qzjOf18jwte9PbtnFGVBjdv8C4YLkDSADYPR92I88iYp
         f3Bb/PXS2AmwiU6ROppR1HMPzWANRIuggfKRhiEVqKeicpHAhEYOpOzONHbQr0G2NLMk
         zhRw==
X-Gm-Message-State: APjAAAW4IPVjvNo0UQsQxhXUy9JN6eVh5I4ZBudmXBTtt93jo+FnOkGo
        SU/Y0QFCLKRkfQzvGOyM1eskQKtJiOi3PdFfsgNHihM8
X-Google-Smtp-Source: APXvYqyIj13EoH0jYPwM1kKCOFX/RV4/LYJXjijNF/m1go8sCfb68u/ehTXS8H/FGQhgexUB6V01thob+q5J+/A/jKg=
X-Received: by 2002:a1f:264b:: with SMTP id m72mr16513637vkm.51.1580802292741;
 Mon, 03 Feb 2020 23:44:52 -0800 (PST)
MIME-Version: 1.0
References: <20200114021934.178057-1-ikjn@chromium.org> <20200121074727.35893-1-ikjn@chromium.org>
 <6739cc32-9beb-ac0a-f500-db2d70bb8e22@collabora.com> <20200127161206.GB30843@bogus>
 <ef653218-4a59-73e1-186e-9b62b8ed6dae@collabora.com>
In-Reply-To: <ef653218-4a59-73e1-186e-9b62b8ed6dae@collabora.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Tue, 4 Feb 2020 15:44:41 +0800
Message-ID: <CAATdQgAf8udrhAYt048m5crkDy2sGDu5n6BP0U1v-qgbyjUJrQ@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: mfd: Convert ChromeOS EC bindings to json-schema
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Gwendal Grignou <gwendal@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nicolas Boitchat <drinkcat@chromium.org>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thanks for the reviews,
I will send v4 soon, sorry for the late reply.

On Tue, Jan 28, 2020 at 12:25 AM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Hi Rob,
>
> On 27/1/20 17:12, Rob Herring wrote:
> > On Mon, Jan 27, 2020 at 04:57:13PM +0100, Enric Balletbo i Serra wrote:
> >> Hi Ikjoon,
> >>
> >> On 21/1/20 8:47, Ikjoon Jang wrote:
> >>> Convert the ChromeOS EC bindings to json-schema.
> >>>
> >>> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> >>> ---
> >>> v3: node name changed in rpmsg example
> >>> v2: cleanup description, fix typos, remove LPC, add add RPMSG example
> >>> ---
> >>>  .../devicetree/bindings/mfd/cros-ec.txt       |  76 ------------
> >>>  .../devicetree/bindings/mfd/cros-ec.yaml      | 111 ++++++++++++++++++
> >>>  2 files changed, 111 insertions(+), 76 deletions(-)
> >>>  delete mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.txt
> >>>  create mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.yaml
> >>>
> >>
> >> Still in mfd directory, this is not a MFD driver, please move to chrome/cros-ec.yaml
> >
> > Please don't. Looks to me like the chrome EC has multiple functions and
> > is a device.
> >
>
> This binding is part of the Chrome EC core and we explicitly moved all this out
> from mfd subsytem in the past because wasn't really fit as mfd driver.
>
> We still have one device driver (cros_ec_dev) in mfd, this is the one that
> instantiates all the subdevices but the above binding is not related to this
> one. All the core/bus part is in platform/chrome, looks to me more coherent have
> the binding accordingly.
>
> Anyway I'll let you the final decision, nothing that worries me too much.
>
> Thanks,
>  Enric
>
> > Bindings directories are often 1:1 with kernel driver directories, but
> > not always.

Converting the format at this time. I will keep the same directory in v4.
It seems that cros_ec_dev device driver should be changed before moving.

> >
> > Rob
> >
