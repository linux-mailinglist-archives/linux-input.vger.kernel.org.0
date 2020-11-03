Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE5162A378D
	for <lists+linux-input@lfdr.de>; Tue,  3 Nov 2020 01:16:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727140AbgKCAQ0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Nov 2020 19:16:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbgKCAQ0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Nov 2020 19:16:26 -0500
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E0F6C061A48
        for <linux-input@vger.kernel.org>; Mon,  2 Nov 2020 16:16:26 -0800 (PST)
Received: by mail-vs1-xe42.google.com with SMTP id t8so5699544vsr.2
        for <linux-input@vger.kernel.org>; Mon, 02 Nov 2020 16:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p7j2MkqbzfmNDffUUJc2UA/rAd92pXTAvHkKX+n2Ey0=;
        b=kSydRRrNnUb20Ij+6fkK3MbRCz5KLiSa0VZqCZtc+WNLyQf/+BUD3QYq9V0bXFh7l2
         sQemKcpvArm+0zAmqI9hD1Z0ZJsZIdh2WO6Weucj/evPtWOjZNAhJjpHg29trekQqWXN
         vIzoI/n6ew5YlKlM68cPh+TdcsN3T/lelf++I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p7j2MkqbzfmNDffUUJc2UA/rAd92pXTAvHkKX+n2Ey0=;
        b=cBsZCZW7AvLj4RoPobUoRKjP114fmbqbD+eUiQcoklybuz8ueYcAFFANssR3BYyp7c
         sJw0vete0hqY2R3DgZS+z3DJ0bBCKdMSYoXuvh0Hwa/z1NW1H6n+IjxzfNq/NdlyiLwr
         MiFGlXIlk5epEzmeaLf0JArMYdW6lFKUiTIdnrDbJNXM+Rwfb83UOhWwVFHckxvudMHC
         gPm165Lc6HSaa0vFOXnSPI73PUFkzaNcp3OF85T8rpeguxboQHDEyGyvSw6Wc2EYFcFS
         d5jdDLWGrqeLEB1QaegF/j/YW0FlDAFhRnefM4xUuQ5ElZMpzl+9UK/Dh9eWL/nZqtsR
         8jdA==
X-Gm-Message-State: AOAM531R4cTUU9PygMDOGVlKTf9Oh9YkaMRCFIHLLhv7N9+BrbP/Zacx
        BonPrSXv81X8xOcMOazI3QUIQMFRpih6Cg==
X-Google-Smtp-Source: ABdhPJzdfNJzOJMBLlUUVUU0rVCMjNBwA8a5ECvb0VLNM1AlF+VGS7JII71KMaIuwP8rj92Cube7eg==
X-Received: by 2002:a67:fd64:: with SMTP id h4mr16266023vsa.38.1604362584709;
        Mon, 02 Nov 2020 16:16:24 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id c21sm1773762vsh.31.2020.11.02.16.16.22
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2020 16:16:22 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id w3so1408433uau.2
        for <linux-input@vger.kernel.org>; Mon, 02 Nov 2020 16:16:22 -0800 (PST)
X-Received: by 2002:a9f:2f15:: with SMTP id x21mr9142861uaj.104.1604362582272;
 Mon, 02 Nov 2020 16:16:22 -0800 (PST)
MIME-Version: 1.0
References: <20201023162220.v2.1.I45b53fe84e2215946f900f5b28bab1aa9d029ac7@changeid>
 <20201030164743.GA3967106@bogus>
In-Reply-To: <20201030164743.GA3967106@bogus>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 2 Nov 2020 16:16:04 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UoDUVyUakJGL=Pmedjj7DFexbi=WHeEkkD9XNhay64JQ@mail.gmail.com>
Message-ID: <CAD=FV=UoDUVyUakJGL=Pmedjj7DFexbi=WHeEkkD9XNhay64JQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: HID: i2c-hid: Label this binding as deprecated
To:     Rob Herring <robh@kernel.org>
Cc:     Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrea Borgia <andrea@borgia.bo.it>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-input@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Fri, Oct 30, 2020 at 9:47 AM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Oct 23, 2020 at 04:22:52PM -0700, Douglas Anderson wrote:
> > As pointed out by Rob Herring [1], we should have a device-specific
> > compatible string.  This means people shouldn't be using the
> > "i2c-over-hid" compatible string anymore, or at least not without a
> > more specific compatible string before it.  Specifically:
> >
> > 1. For newly added devices we should just have the device-specific
> >    device string (no "hid-over-i2c" fallback) and infer the timings
> >    and hid-descr-addr from there.
>
> I wouldn't go that far. Having a fallback is perfectly acceptible. And
> hopefully there are at least some devices where that's good enough for
> drivers to use.
>
> If we have cases of only 'i2c-over-hid' being used (in DT), then the
> solution is making this a schema so we can enforce that as not valid.

OK, fair enough.  I think in the case of the Goodix touchscreen I'm
trying to support, though, it's not useful to have the fallback since
it really doesn't seem to work without all the delays.  :(  I sent my
v3 without touching anything about "i2c-over-hid" as far as bindings
goes.

For my edification, though, when do you believe "i2c-over-hid" should
be the fallback?  Presumably you would advocate for
"post-power-on-delay-ms" being marked as deprecated, right?  That
should have been inferred by the compatible string, right?  So, in
theory, anyone who needed this delay couldn't have ever taken
advantage of the fallback, right?  They wouldn't have worked without
the delay?

-Doug
