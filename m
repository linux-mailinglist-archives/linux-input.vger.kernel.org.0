Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22E512F44AE
	for <lists+linux-input@lfdr.de>; Wed, 13 Jan 2021 07:55:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbhAMGws (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Jan 2021 01:52:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbhAMGws (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Jan 2021 01:52:48 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE4AC061575
        for <linux-input@vger.kernel.org>; Tue, 12 Jan 2021 22:52:08 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id j1so540513pld.3
        for <linux-input@vger.kernel.org>; Tue, 12 Jan 2021 22:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=Szy2uZ5NZovRd/6XFMzWNhLQaVCstjvtDliO/4bcg+s=;
        b=NWwn0UVAS3xi6JgU1GcK9Tv8PzurOJA7EKIdVkV46r9L00wXmJAIVw9/EQNTLDVyEt
         hN3ksk0pdgUnZHHB/jelh4G+aItRYL9PAxO+NYborTZ3fzn8iWj7Swf3GotBYaHHcNrG
         GxaTwXcfn7T8COV76xfNCz4LWWyMbrYWYFSp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=Szy2uZ5NZovRd/6XFMzWNhLQaVCstjvtDliO/4bcg+s=;
        b=WOxiDgkKwzxfbXmchPeNehBta6kx+liYHQmQKPQFWYv6GLPEq1d6Iue0Tvy+wkwCiM
         419caNBwD4GZQxPV/N1GBEQ6q72lN/PEwIx+y6h9FAv9Hq1yqxJ+g8Ul6O9sJgEk79T6
         4M/1EcDGWR2sx4ibPeUFa66vaD5mhyWEFkOyKXcVXzNWn7bbmCi/CNitLVBg/ryM10o8
         4+UEoHibJ2xEmnbFW8AXPYNafg1SCpgpaZZSDK3ybebRROu4ALu0Cf1pUzWRhIr4p6ql
         +pXjxDSMcj9WeVHq36gkcWavkjB/TX9u17eWLqjxql9Oz8DvWSNZvTHpcWcgm07R/auU
         VX0Q==
X-Gm-Message-State: AOAM533x3Kzm1Esrcu6vxgn9yC9OPvbi/owXs5haSLja5b5XDOinV3oL
        AKWciapcWdlUZGc64HUr/d3uUA==
X-Google-Smtp-Source: ABdhPJw4r3n64gzdAsEHIp0sfkAo7LRBW267UKlEjDUdmET5goQxxwOINht8CXwxvSXNDD+mdZlmhw==
X-Received: by 2002:a17:90a:de94:: with SMTP id n20mr748448pjv.196.1610520728049;
        Tue, 12 Jan 2021 22:52:08 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id u126sm1201536pfu.113.2021.01.12.22.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 22:52:07 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CA+cxXhkXJGYx0SQ-S7B=6iHAWFoCQpokw7huaGTNKbVmP1JDhA@mail.gmail.com>
References: <20210107154200.v4.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid> <161041741167.3661239.13546059654424804588@swboyd.mtv.corp.google.com> <CA+cxXhkXJGYx0SQ-S7B=6iHAWFoCQpokw7huaGTNKbVmP1JDhA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: input: cros-ec-keyb: Add a new property
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Simon Glass <sjg@chromium.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
To:     Philip Chen <philipchen@chromium.org>
Date:   Tue, 12 Jan 2021 22:52:06 -0800
Message-ID: <161052072608.3661239.3835950564432313633@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Philip Chen (2021-01-12 15:29:11)
> On Mon, Jan 11, 2021 at 6:10 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > Quoting Philip Chen (2021-01-07 15:42:08)
> > > ---
> > > diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-k=
eyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > > index 8e50c14a9d778..7acdb33781d30 100644
> > > --- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > > +++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > > @@ -31,6 +31,16 @@ properties:
> > >        if the EC does not have its own logic or hardware for this.
> > >      type: boolean
> > >
> > > +  function-row-physmap:
> >
> > Is there any minimum/maximum number of elements possible?
> The maximum is 15.
> There is no definition for the minimum - we can probably say the minimum =
is 1.

Ok cool. Please add min/max of 1 to 15 to the binding.

> >
> > > +    $ref: '/schemas/types.yaml#/definitions/uint32-array'
> > > +    description: |
> > > +      An ordered u32 array describing the rows/columns (in the scan =
matrix)
> > > +      of top row keys from physical left (KEY_F1) to right. Each ent=
ry
> > > +      encodes the row/column as:
> > > +      (((row) & 0xFF) << 24) | (((column) & 0xFF) << 16)
> > > +      where the lower 16 bits are reserved. This property is specifi=
ed only
> > > +      when the keyboard has a custom design for the top row keys.
> > > +
