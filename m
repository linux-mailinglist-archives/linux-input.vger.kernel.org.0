Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E72F26820AC
	for <lists+linux-input@lfdr.de>; Tue, 31 Jan 2023 01:25:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbjAaAZe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Jan 2023 19:25:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbjAaAZ2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Jan 2023 19:25:28 -0500
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B5FE2BEFE;
        Mon, 30 Jan 2023 16:25:25 -0800 (PST)
Received: by mail-vs1-xe2f.google.com with SMTP id 187so14402555vsv.10;
        Mon, 30 Jan 2023 16:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JPYYzJBRE2hZQZu6xxzfCtdzMijLz6xeT8V5xhIEHKM=;
        b=q19gdCQcI3bN48xJ5ilrnrWb+j9Bt/6WCppm3scBZKhnhfjET1vHTtFeI7qgmQpJpC
         wgIBT2OOYUbpPRfG9wvHka7/A04bCN60i0ubTqF+YWzsRP5co9fdcz0QuUzgKzToHlQm
         S58IZnIsiXS6dBtCa9Wn6/3wdGHtjQLeuFSG3tg7LvekuWlRKP+urQ81O4w99zeORADc
         +hdyeTtkbFyTujMmrTwIHoCAtxHoKJJsQZIQzEXJLZSis1BEbZiUFm7w720E6fxv66s8
         2W2PvbKsdk2rd3pAx4+9tBY8xPXbjTqoOx9gmcDkFMM7Xs7LOKAwEaeNMeDzo7zjft3H
         fWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPYYzJBRE2hZQZu6xxzfCtdzMijLz6xeT8V5xhIEHKM=;
        b=uhur+zxqauoPMP2gm1afmcFSoXE0gGeFPODr7xSYwz3SgK5+BF7dOvsOi4e6nR6TnL
         rYbPcqzzdYBIDOleb3YkErj8Eo3DLfXg85tMixz8tIgD+13zdzhRuVuFJIyDoc6djQs7
         jzB6AOCnNjY+zOCCbo8uQNPLQbBqPVYkNuRH4bv7ObtGwhd60/FsNYs8yfEH3/RbqRx+
         mEfj+8un1/L4/41UxEyVpA/AUVelzHMpHXODv66S1yJvaFAdkghL3oTUDflfnmgeCEDg
         ITtE+1msdLUCp0yqNqJSVFuFFtYY8bn1ArrGQBdUrmhLT48ZKZS2GF76/2nGWnYJ0hDD
         Ubdg==
X-Gm-Message-State: AO0yUKV48T/rrQ6IvxeDCy31fAQBIaioItcq235Ek8RLJJc6j7/7Fi8b
        /IH2hLG4+EP6tfSe9srShfzE1mdTBAX6DSSFdqA=
X-Google-Smtp-Source: AK7set+U2JMLzXYydWC2YgrSAqSSIZZxKs42Kr0SvWDXmkFig3XdXMJRCovIpBgbRYzVOSKNr9VbPBNufuArOuTUZgo=
X-Received: by 2002:a05:6102:2136:b0:3f8:6b59:61b with SMTP id
 f22-20020a056102213600b003f86b59061bmr1014656vsg.40.1675124724233; Mon, 30
 Jan 2023 16:25:24 -0800 (PST)
MIME-Version: 1.0
References: <20230128202622.12676-1-kaehndan@gmail.com> <20230128202622.12676-2-kaehndan@gmail.com>
 <fa320b2c-5cf5-c10a-ba63-17ccb5c992ad@linaro.org> <e4f11bda-32c1-fa9d-39d7-402e55ff1d22@linaro.org>
In-Reply-To: <e4f11bda-32c1-fa9d-39d7-402e55ff1d22@linaro.org>
From:   Daniel Kaehn <kaehndan@gmail.com>
Date:   Mon, 30 Jan 2023 18:25:14 -0600
Message-ID: <CAP+ZCCdbwzDwF2kYMQucy+5d23L3tbLQWxxWvEx_ZXWgQQdUnA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: hid: Add CP2112 HID USB to SMBus Bridge
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thanks for all of the comments. All feedback is ACK'd and will be
added in v2 -- what follows is just commentary on some comments.

On Sun, Jan 29, 2023 at 5:33 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 29/01/2023 12:05, Krzysztof Kozlowski wrote:
> > On 28/01/2023 21:26, Danny Kaehn wrote:
> >> This is a USB HID device which includes an I2C controller and 8 GPIO pins.
> >>
> > Thank you for your patch. There is something to discuss/improve.
> >
> >> The binding allows describing the chip's gpio and i2c controller in DT
> >> using the subnodes named "gpio" and "i2c", respectively. This is
> >> intended to be used in configurations where the CP2112 is permanently
> >> connected in hardware.
> >>
> >> Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
> >> ---
> >>  .../bindings/hid/silabs,cp2112.yaml           | 82 +++++++++++++++++++
> >
> > There is no "hid" directory, so I think such devices where going to
> > different place, didn't they?

Good point, I didn't notice other hid-related bindings went into
input/ -- will change

> >
> >> +  While USB devices typically aren't described in DeviceTree, doing so with the
> >> +  CP2112 allows use of its i2c and gpio controllers with other DT nodes when
> >> +  the chip is expected to be found on a USB port.
> >
> > Drop these three and replace with description of the hardware.

Understood. I noticed that a similar usb-based binding included
a similar description (net/marvell,mvusb.yaml) but I understand why
we would not want this in new bindings.

> >
> >> +  i2c:
> >> +    $ref: /schemas/i2c/i2c-controller.yaml#
> >
> > This is not specific enough. What controller is there?
>
> OK, assuming this is tightly wired (with cp2112 I2C controller), then
> the compatible could be skipped as it is inferred from parent one. Yet
> still you need description and unevaluatedProperties.
>

Great point, will update -- I didn't quite understand that child nodes of the
root could have properties/unevaluatedProperties/etc.. but I see now that
that is well-documented (just not often done in existing bindings)!

> >
> > Missing unevaluatedProperties: false, anyway.
> >
> >> +  gpio:
> >> +    $ref: /schemas/gpio/gpio.yaml#
> >
> > Same comments.
>
> Description, unevaluatedProperties and constraints on properties (line
> names, reserved ranges, ranges).
>

Will add.

Thanks,
Danny Kaehn
