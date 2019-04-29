Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0C00E5E7
	for <lists+linux-input@lfdr.de>; Mon, 29 Apr 2019 17:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728481AbfD2PQL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Apr 2019 11:16:11 -0400
Received: from mail-it1-f196.google.com ([209.85.166.196]:55212 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728436AbfD2PQL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Apr 2019 11:16:11 -0400
Received: by mail-it1-f196.google.com with SMTP id a190so16718566ite.4;
        Mon, 29 Apr 2019 08:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b6ajSVLv5SWPLweJxZ32fnsUz0bwEwPWJw0yNaApLQM=;
        b=qON+5q8bwMnoIt5MFuP4w4ha3JLYR7M19gqhd5cN1jR6eQ0dj6d+apoaqSAhWwys+X
         GN7pohkQhOsuDE++0RpOFxPCRafFPVpt/yHNJNSK7JJljeK0erecmC8l665wQhrqTT3E
         bgYB9fHg70spPs0jcgt6Cabh651D4cdX/usCKLk2d3v9b2gViIQc89MQbRG2IvB+lQWx
         YyrXxBQj9xix9JIylamMLuNN3D+Jys2VNVujHss9/AsRV4zHxRYW1kqlq30UcszoNcwK
         5Y9CqdCBMnMHMYNqKt7Z+XfRroM6OjmZCkcImIUexticUrTAXPZTUpRoaPEJfoil83lR
         UvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b6ajSVLv5SWPLweJxZ32fnsUz0bwEwPWJw0yNaApLQM=;
        b=DxVTIWAIqmEpd9lqDVtAXykmDsXiodX0wF7rWpX8a/R81f2BM+zokdDPnRiO9EKuEi
         Yi/DC2XWY8RLxCJxTLeefT/4PiHj/DT9dO8SWw+SLHyOQ+bSVuLXbMuQnEDRq+MSrH3v
         JihXyGJHX/xQWIBBQuEIApZWkyYA4yQ87iSq1YbM/D+BSKWijqeVjN7qq9fsHZweXeLX
         XysCrkv94aoyaPqCpF6KwgUMRBmOoPDD00SjZuDyBz+fpMproTN7T7o81PCEY9nVjRkq
         0NPkAcYws8w/c8LBvReP1WO9/7SzXJkyNxEdL6Gq/h/yZOy2jJCtK7hTXddWgz3gCsKh
         a7LA==
X-Gm-Message-State: APjAAAWyC2KfVYOz+1507xcWSbC1d0uJilWS4kiVi5cji/rZ5si/LKMk
        SLB8B6DHAIhWR9rDReHm6uLqDnjjMonqZrzIGx4=
X-Google-Smtp-Source: APXvYqxLUPuI3K0KG2ObUi7BQFAJyD7FeLAYMT6+GngM9oDcmjrnr4k7Xp2ffhdrTEjnnkTTXOPes9k8UZgyuEJJZos=
X-Received: by 2002:a02:1142:: with SMTP id 63mr35498389jaf.19.1556550969659;
 Mon, 29 Apr 2019 08:16:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190415160915.16324-1-jeffrey.l.hugo@gmail.com>
 <20190415161055.16372-1-jeffrey.l.hugo@gmail.com> <CAO-hwJJ_BRRHL44yaZ=d_K-9iq1cyONn0rR+VW3ukW1M2Ma0ug@mail.gmail.com>
 <20190426224908.GA30389@bogus>
In-Reply-To: <20190426224908.GA30389@bogus>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 29 Apr 2019 09:15:59 -0600
Message-ID: <CAOCk7No6xyA+kjXqdWLTKjoK39yBqGuuirWV-J8raoCVGfTgnA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: input: add Elan 400 combo
 keyboard/touchpad over i2c
To:     Rob Herring <robh@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Apr 26, 2019 at 4:49 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Apr 18, 2019 at 11:35:42AM +0200, Benjamin Tissoires wrote:
> > On Mon, Apr 15, 2019 at 6:11 PM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
> > >
> > > The Elan 400 combo keyboard/touchpad over i2c device is a distinct device
> > > from the Elan 400 standalone touchpad device.  The combo device has been
> > > found in the Lenovo Miix 630 and HP Envy x2 laptops.
> > >
> > > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > > ---
> >
> > With my comments in 2/3, I wonder if you need this patch at all then.
>
> I don't really follow the discussion in 2/3, but you should still have
> specific compatibles even if right now you don't need them.
>
> >
> > Cheers,
> > Benjamin
> >
> > >  .../devicetree/bindings/input/elan,combo400-i2c.txt   | 11 +++++++++++
> > >  1 file changed, 11 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/input/elan,combo400-i2c.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/input/elan,combo400-i2c.txt b/Documentation/devicetree/bindings/input/elan,combo400-i2c.txt
> > > new file mode 100644
> > > index 000000000000..fb700a29148d
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/input/elan,combo400-i2c.txt
> > > @@ -0,0 +1,11 @@
> > > +Elantech 0400 I2C combination Keyboard/Touchpad
> > > +
> > > +This binding describes an Elan device with pid 0x0400, that is a combination
> > > +keyboard + touchpad device.  This binding does not cover an Elan device with
> > > +pid 0x0400 that is solely a standalone touchpad device.
> > > +
> > > +Required properties:
> > > +- compatible: should be "elan,combo400-i2c"
> > > +
> > > +This binding is compatible with the HID over I2C binding, which is specified
> > > +in hid-over-i2c.txt in this directory.
>
> Separate is fine, but we've been adding compatibles to hid-over-i2c.txt.

Are you just referring to "wacom,w9013" ?
