Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F25521C126D
	for <lists+linux-input@lfdr.de>; Fri,  1 May 2020 14:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728800AbgEAMvT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 1 May 2020 08:51:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:33080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728443AbgEAMvT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 1 May 2020 08:51:19 -0400
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5AD452137B;
        Fri,  1 May 2020 12:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588337478;
        bh=PbTTk16XGFmZ6lGmtVYu3MOCSebdvHExqPZJQnGbeMQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=aEfV9Pkpdv7mTF2ns7MBsyQXJ8doRzEdA6dNceWcINg6o7dnvhRQv/l3R9m2vZ8VA
         O2oVg1qiqDjsg5TjIVps4bf0meHUFcI6B5QgnBuvFKuvdgnt3GF52xAIx9a71gEurt
         d2FbNB/Ny92G5X/e4orcbqLeePY6nddZgH/Apdtw=
Received: by mail-ot1-f49.google.com with SMTP id g14so2436692otg.10;
        Fri, 01 May 2020 05:51:18 -0700 (PDT)
X-Gm-Message-State: AGi0PuaByOrsUXP/eUQ+0pw54przzrHrBWFt0GRS5WfW0EFZVks8QZCh
        5QO09gwgboYwtudt2lDqMF3WSNMOVHKxQvktCw==
X-Google-Smtp-Source: APiQypIZlbB4+c7zAit6H+xV/96DZdtWWe/qXIP9iMsElYWhSr6vLf/iR3jKd/ZrBFI8l7xeAKz5Q3FwxMKxfbxgMEU=
X-Received: by 2002:a9d:7d85:: with SMTP id j5mr3232869otn.107.1588337477631;
 Fri, 01 May 2020 05:51:17 -0700 (PDT)
MIME-Version: 1.0
References: <1587340068-2818-1-git-send-email-jeff@labundy.com>
 <20200430151108.GA21911@bogus> <20200501012313.GA14243@labundy.com>
In-Reply-To: <20200501012313.GA14243@labundy.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 1 May 2020 07:51:04 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+1GudY__zznL-KuLbsePZzHGFSQk3OHUugqyrkPo3Ltw@mail.gmail.com>
Message-ID: <CAL_Jsq+1GudY__zznL-KuLbsePZzHGFSQk3OHUugqyrkPo3Ltw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: input: Add bindings for Azoteq IQS269A
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Input <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 30, 2020 at 8:23 PM Jeff LaBundy <jeff@labundy.com> wrote:
>
> Hi Rob,
>
> Thank you for your thorough review.
>
> On Thu, Apr 30, 2020 at 10:11:08AM -0500, Rob Herring wrote:
> > On Sun, Apr 19, 2020 at 06:47:47PM -0500, Jeff LaBundy wrote:
> > > This patch adds device tree bindings for the Azoteq IQS269A
> > > capacitive touch controller.
> > >
> > > Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> > > ---
> > >  .../devicetree/bindings/input/iqs269a.yaml         | 591 +++++++++++++++++++++
> > >  1 file changed, 591 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/input/iqs269a.yaml
> >
> > Kind of a lot of properties compared to other devices. Why so many? That
> > said, nothing looks to be obviously something that doesn't belong in DT.
>
> I don't disagree; this device simply has a lot of knobs for accommodating
> multiple sensing modes across different applications. Once I added support
> for the ones I expected to be most commonly used, however, I didn't see a
> reason to exclude the remaining minority and risk having to add something
> later.
>
> >
> > No interdependencies between properties? If there are, use
> > 'dependencies'.
>
> Strictly speaking, no; each property can be specified independently of any
> other property and the device's registers will be updated accordingly.
>
> That being said, a couple of properties do impose restrictions on others
> within specific channels for certain applications. It wasn't clear if/how
> 'dependencies' could describe these conditional relationships, so I opted
> to include a note in the descriptions where applicable.
>
> [...]
>
> > > +
> > > +  azoteq,rate-np-ms:
> > > +    allOf:
> > > +      - $ref: /schemas/types.yaml#/definitions/uint32
> >
> > With a unit suffix, you can drop the type $ref.
>
> Sure thing, thank you for catching these. Once I remove $ref in these cases,
> is an 'allOf' still required above the remaining minimum/maximum/etc.?

No. Actually, you can now drop 'allOf' even with $ref. With
json-schema draft 2019.9, the behavior has changed such that $ref can
be mixed with other schema. So now that most everyone has learned the
old way, we're switching. You can use either form, but without 'allOf'
you'll need dt-schema to be up to date (2020.4).

> > > +      - minimum: 0
> > > +        maximum: 255
> > > +        default: 16
> > > +    description: Specifies the report rate (in ms) during normal-power mode.
> > > +
>
> On a related note, should all items under an 'allOf' be preceded by a hyphen?

No. It's logically equivalent, but the error reporting is worse.

Rob
