Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7620E2F5A7F
	for <lists+linux-input@lfdr.de>; Thu, 14 Jan 2021 06:48:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbhANFsk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Jan 2021 00:48:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbhANFsj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Jan 2021 00:48:39 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 881B1C061786
        for <linux-input@vger.kernel.org>; Wed, 13 Jan 2021 21:47:54 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id p14so5861519qke.6
        for <linux-input@vger.kernel.org>; Wed, 13 Jan 2021 21:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vol3zGubhfmNLDPSAvceCN5gTPtshg95eaji0lDtBVU=;
        b=PEu80fRt0DlVSLPvQ9uU/MxFhm0chePgZxfehQ7zMqCkR69L1+9YqLG0tnnuZ0FN88
         Iw5B6tFTTeL8t3/CCQYHHwi8Y8u1c4vgdYYKlAYg0Du1KvksA0AHzTl9LhW9eWZ8iF/k
         rp+koUyN3zIEqAPbngOhbOsPu3TvAFl0Sqd80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vol3zGubhfmNLDPSAvceCN5gTPtshg95eaji0lDtBVU=;
        b=YBU4zpBy76gVDm1aVOzjEXz2PqT4M0EaWMrrg3zCWl37/EWuBDS03pBB7uFuFU5kNA
         P+Fc6B4D4sHRRLiRwAMlwsvUnfjFMUSiwiZSNd/6TKRFXbjDj704N7CJQZ3hjbUFvkYp
         i8FI/St80kpvY2INkxXywac/zE0E4Ud1Esk2B8mbMN0x/DEjYpxLjiGuuQEuh2VQ2oUw
         nGidPX80Iwu5WsvsvpuYqGs/OnDbNXmwjQfIvCdzq2nFG4nqt1opgIZXm9DYKaU02BX2
         J24RMvRNcMg15oWWNHNvrn7oX5pLk+6ChjNfmyVBjlV6EimN0iROgWMBpniS8DZ5ArCs
         US1w==
X-Gm-Message-State: AOAM5330+l8EyX09+9jg3/XH63F6NUDsrGfYCASXcnU2C045NH4m9Ky0
        4UaDwaS8cOvI370jITv6/EoYOXUSf3yWPi4wcjZRNw==
X-Google-Smtp-Source: ABdhPJzb/y+Ul3PP0ioburOHy8SKBREjFquM1OJZW8/HfmolxR7dyGmhGLsxgQIXR4GwKZT7RZ1lfjJ6cgxaikUSBBc=
X-Received: by 2002:a5b:54a:: with SMTP id r10mr8688410ybp.250.1610603273848;
 Wed, 13 Jan 2021 21:47:53 -0800 (PST)
MIME-Version: 1.0
References: <20210113172450.v5.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
 <161058782774.3661239.6435895454078235399@swboyd.mtv.corp.google.com>
In-Reply-To: <161058782774.3661239.6435895454078235399@swboyd.mtv.corp.google.com>
From:   Philip Chen <philipchen@chromium.org>
Date:   Wed, 13 Jan 2021 21:47:43 -0800
Message-ID: <CA+cxXhkffakNXjqXsaCp0PU=4GnP58mVZcTA1g2eSn7G666V9w@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: input: cros-ec-keyb: Add a new property
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Simon Glass <sjg@chromium.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jan 13, 2021 at 5:30 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Philip Chen (2021-01-13 17:25:12)
> > This patch adds a new property `function-row-physmap` to the
>
> :)
Sorry, I'll make it imperative tense.
>
> > device tree for the custom keyboard top row design.
> >
> > The property describes the rows/columns of the top row keys
> > from left to right.
> >
> > Signed-off-by: Philip Chen <philipchen@chromium.org>
> > ---
> >
> > Changes in v5:
> > - add minItems and maxItems for `function-row-physmap`
> >
> > Changes in v2:
> > - add `function-row-physmap` instead of `google,custom-keyb-top-row`
> >
> >  .../bindings/input/google,cros-ec-keyb.yaml          | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > index 8e50c14a9d778..e573ef3e58b65 100644
> > --- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > +++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > @@ -31,6 +31,18 @@ properties:
> >        if the EC does not have its own logic or hardware for this.
> >      type: boolean
> >
> > +  function-row-physmap:
> > +    $ref: '/schemas/types.yaml#/definitions/uint32-array'
>
> I'm not sure this is needed if min/max items is there.
>
> > +    minItems: 1
> > +    maxItems: 15
> > +    description: |
> > +      An ordered u32 array describing the rows/columns (in the scan matrix)
> > +      of top row keys from physical left (KEY_F1) to right. Each entry
> > +      encodes the row/column as:
> > +      (((row) & 0xFF) << 24) | (((column) & 0xFF) << 16)
> > +      where the lower 16 bits are reserved. This property is specified only
> > +      when the keyboard has a custom design for the top row keys.
>
> Can you add it to the example so it can be tested? Then you can prove
> out if the ref is needed or not.
Sure, I'll give it a try.
>
> > +
> >  required:
> >    - compatible
> >
