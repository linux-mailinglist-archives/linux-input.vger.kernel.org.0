Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09784397B76
	for <lists+linux-input@lfdr.de>; Tue,  1 Jun 2021 22:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234728AbhFAU5a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Jun 2021 16:57:30 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:46840 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234638AbhFAU5a (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Jun 2021 16:57:30 -0400
Received: by mail-oi1-f176.google.com with SMTP id x15so635724oic.13;
        Tue, 01 Jun 2021 13:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GT0YJk1SoIsMBRgFISlbdSl1Kix6eGvlEqcdI62y5+w=;
        b=ewAn7mbUGb0Q2nJrZNw9n+j1swzLPghqhpWce3wPGzr2ZWYi+70gRTiLbiNX+55v9x
         aYzrT7/vzz4KBt2hC6vgZbxGOSS6ssyc893oyGW62TEmsGAxyHkXBc64ugosm9ajUZM8
         NOoGKgsRp8e9JXtTcxwCuItJY+3bDosvhce+fcJvgomwj485O2pwBaf/mEYlksUiWPna
         MHumMs1iNLixrSq9POGYHmZnjW4mvo6JLM4P/6QuPUFdxbh4EcdrXeXQyXw9fXGPiDtb
         HHvIPSWtdxbOdImkXpkt93RkRrJ/JKIhQxTvqpSP3BOtirm5mTIhqaDm7MGLv6Oo16no
         fNTA==
X-Gm-Message-State: AOAM531qseNlUBn9rVp3SJYfaVjDOzGGOctvw6noBQUQqoAbKsYkdOGk
        uLHNlxSnE8UztB0nm5HkXg==
X-Google-Smtp-Source: ABdhPJzonkWue1R8lV3ydAUjrTGZoaMfGoB+K3xciDDDomSqxUUaqcCUwZClLmlwSqkAa7VDoujo9Q==
X-Received: by 2002:a05:6808:1c9:: with SMTP id x9mr19529588oic.109.1622580948529;
        Tue, 01 Jun 2021 13:55:48 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q19sm2787305oov.18.2021.06.01.13.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 13:55:47 -0700 (PDT)
Received: (nullmailer pid 1025092 invoked by uid 1000);
        Tue, 01 Jun 2021 20:55:46 -0000
Date:   Tue, 1 Jun 2021 15:55:46 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Device Tree mailing list <devicetree@vger.kernel.org>,
        Jiri Kosina <jikos@jikos.cz>,
        Patchwork Bot <patchwork-bot@kernel.org>
Subject: Re: [PATCH] input: add SparkFun Qwiic Joystick driver
Message-ID: <20210601205546.GA1017434@robh.at.kernel.org>
References: <20210531133243.9488-1-oleg@kaa.org.ua>
 <YLXRNVBG0ewhVUxD@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YLXRNVBG0ewhVUxD@google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 31, 2021 at 11:18:29PM -0700, Dmitry Torokhov wrote:
> Hi Oleh,
> 
> On Mon, May 31, 2021 at 04:32:43PM +0300, Oleh Kravchenko wrote:
> > A simple analog joystick built on Low Power ATtiny85 Microcontroller.
> > Directional movements are measured with two 10 kΩ potentiometers
> > connected with a gimbal mechanism that separates the horizontal and
> > vertical movements. This joystick also has a select button that is actuated
> > when the joystick is pressed down.
> > 
> > Input events polled over the I2C bus.
> 
> Thank you for the driver.
> 
> > 
> > Product page:
> > https://www.sparkfun.com/products/15168
> > Firmware and hardware sources:
> > https://github.com/sparkfun/Qwiic_Joystick
> > 
> > Tested on RPi4B and O4-iMX-NANO boards.
> > 
> > Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > Cc: Device Tree mailing list <devicetree@vger.kernel.org>
> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Cc: Jiri Kosina <jikos@jikos.cz>
> > Cc: Patchwork Bot <patchwork-bot@kernel.org>
> > Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> > ---
> >  .../bindings/input/qwiic-joystick.yaml        |  31 ++++
> >  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
> >  drivers/input/joystick/Kconfig                |   9 +
> >  drivers/input/joystick/Makefile               |   1 +
> >  drivers/input/joystick/qwiic-joystick.c       | 169 ++++++++++++++++++
> >  5 files changed, 212 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/input/qwiic-joystick.yaml
> >  create mode 100644 drivers/input/joystick/qwiic-joystick.c
> > 
> > diff --git a/Documentation/devicetree/bindings/input/qwiic-joystick.yaml b/Documentation/devicetree/bindings/input/qwiic-joystick.yaml
> > new file mode 100644
> > index 000000000000..51cadeb350f2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/qwiic-joystick.yaml
> > @@ -0,0 +1,31 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright 2021 Oleh Kravchenko
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/input/qwiic-joystick.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: SparkFun Qwiic Joystick
> > +
> > +maintainers:
> > +  - Oleh Kravchenko <oleg@kaa.org.ua>
> > +
> > +description: |
> > +  Bindings for SparkFun Qwiic Joystick (COM-15168).
> > +  https://www.sparkfun.com/products/15168
> > +
> > +properties:
> > +  compatible:
> > +    const: sparkfun,qwiic-joystick
> 
> Rob, is this compatible acceptable?

Yes.

> 
> > +
> > +required:
> > +  - compatible
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    qwiic@20 {
> > +        compatible = "sparkfun,qwiic-joystick";
> > +        reg = <0x20>;
> > +    };
> 
> I think this device would be covered by
> Documentation/devicetree/bindings/trivial-devices.yaml so please add its
> compatible there.

That's fine. Or not.

Please make bindings a separate patch.

Rob
