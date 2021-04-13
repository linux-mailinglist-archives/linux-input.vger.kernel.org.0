Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81F4E35E02A
	for <lists+linux-input@lfdr.de>; Tue, 13 Apr 2021 15:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237789AbhDMNgG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Apr 2021 09:36:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:59118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237619AbhDMNgF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Apr 2021 09:36:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 29AA46128C;
        Tue, 13 Apr 2021 13:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618320946;
        bh=VZQV9Opjy86FewZMAhYePFDcd5qXgMbf260PrkOeNnQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iEBP3eVQDtkMO4DxAf+v0sdWwnqL0IGJE2SwFHIsc/UAdvyNXLNRrv/cD49zU7+gB
         1TerQCaoVZcHqGrbYfGNzH9ckYnMglfiC3NBYBcVh2CpVrDtP2kRLWYld914hyk6ek
         GZP7rRrzcQVUZOG87uLUZijCi6U9FRNTu0I/03QS5RXXGlzFnqXGeJTPwZdY81ztfs
         H3NvrVX/cqeqXzYrjTtF/tH306OCZ9nKVDTO6mCM2XYYHrTw9KzSBpl01pss2WRVVj
         NQGv9QQuHJrZDcM/A2i+4Z8ZJbHY6TfLYsG8KqsTCHs7uco0NPnB9skS7+DPbQ0yAK
         PocrAolh71QNA==
Received: by mail-ej1-f46.google.com with SMTP id sd23so17315009ejb.12;
        Tue, 13 Apr 2021 06:35:46 -0700 (PDT)
X-Gm-Message-State: AOAM531YdXHeDyRoFKdIdyAvBJs49d9XuEhPaoWOj6iA5XgYq3KwnUFj
        B+4gO4mHNyD8E8nqZpj1hRw0vUj9JUESxvnKag==
X-Google-Smtp-Source: ABdhPJzARnbJQG3HiMaabtpq3OZPCNjGKEjJAbrhn3GvTlOBImId00g/2D+na3HVG+mIDw7JkKQKWOHRHQRClEFvuO8=
X-Received: by 2002:a17:906:9ac5:: with SMTP id ah5mr6764815ejc.360.1618320944742;
 Tue, 13 Apr 2021 06:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210408202137.GA1890401@robh.at.kernel.org> <20210411114804.151754-1-giulio.benetti@benettiengineering.com>
 <20210411114804.151754-2-giulio.benetti@benettiengineering.com>
 <20210412150527.GA3897939@robh.at.kernel.org> <5ca45a6b-2cf0-cbb5-1f0d-3bf780052951@benettiengineering.com>
In-Reply-To: <5ca45a6b-2cf0-cbb5-1f0d-3bf780052951@benettiengineering.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 13 Apr 2021 08:35:33 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK6Bm==DaCMD3PruZoFO9iv0Te_KBVPnb9ZU0L8yDYF5Q@mail.gmail.com>
Message-ID: <CAL_JsqK6Bm==DaCMD3PruZoFO9iv0Te_KBVPnb9ZU0L8yDYF5Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: Add Hycon Technology vendor prefix
To:     Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc:     devicetree@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        Linux Input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Apr 12, 2021 at 10:12 AM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:
>
> On 4/12/21 5:05 PM, Rob Herring wrote:
> > On Sun, 11 Apr 2021 13:48:02 +0200, Giulio Benetti wrote:
> >> Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
> >> include "hycon" as a vendor prefix for "Hycon Technology".
> >> Company website: https://www.hycontek.com/
> >>
> >> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> >> Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> >> ---
> >>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >
> >
> > Please add Acked-by/Reviewed-by tags when posting new versions. However=
,
> > there's no need to repost patches *only* to add the tags. The upstream
> > maintainer will do that for acks received on the version they apply.
> >
> > If a tag was not added on purpose, please state why and what changed.
> >
>
> Ok, so on V6 series I'll send only patches 2 and 3 without this one.

No, send the whole series and add any tags. Just don't resend a series
for the sole purpose of adding tags.

Rob
