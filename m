Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7938635E5BF
	for <lists+linux-input@lfdr.de>; Tue, 13 Apr 2021 19:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345826AbhDMR6f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Apr 2021 13:58:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:46682 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237095AbhDMR6e (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Apr 2021 13:58:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 264F261220;
        Tue, 13 Apr 2021 17:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618336694;
        bh=FfzIve3xPN9IGoioW4OJdSXAM3DQmxDEqCa3p8D9AQs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fuTGoumBPOYp4ArzUzEzdtlyVFhT4Do+2QkKOnSoMzO3NZlWlBXD0q66z+sDwPcJ1
         yxhKOHl1nZJ/2FixiygQwO5y750qFPTJkaUTOmjfpYZ/tgSQIQkdSghWpmQSkR5DID
         Gfj2KX1wOJDCTQxpnyojeXn90x6ATvGCYsSLyUFDjX2Ls9JUCqn5H7JQIeY3NWbLbA
         W3+THEQzbKjWN2giFRICNYtQT1NkcUp/TuRTNDL3zrH+0vxtF3Ldx4KojaFtP3N7VV
         +u08G/3IVOMTRHpR+s0eMohmvnbCvHekhiEqXdTNGMj0af0/iAByqrM9Oaf/IQeMDa
         zHYWkXPSQqSOA==
Received: by mail-qv1-f46.google.com with SMTP id h3so7746858qve.13;
        Tue, 13 Apr 2021 10:58:14 -0700 (PDT)
X-Gm-Message-State: AOAM533BEHKeaEOz4VYIDZLfaBd7q5AP6oRyjuixd+fKRGdt7HeKEurl
        7x71+bThhXKsx/xOimX/MbX1DMPaAITtvWNR9A==
X-Google-Smtp-Source: ABdhPJws1NfHPs84htGhmYHcyxv9pk+tCN0kYfaOX/vqo8HvO6tvcqeuum4MKIVrerz1ncj2JDFbf+S/ztoUdH6yMjc=
X-Received: by 2002:a05:6214:8c4:: with SMTP id da4mr34787401qvb.57.1618336693305;
 Tue, 13 Apr 2021 10:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210412144624.GA3868831@robh.at.kernel.org> <20210412152400.1587623-1-giulio.benetti@benettiengineering.com>
 <20210412152400.1587623-2-giulio.benetti@benettiengineering.com>
 <20210413150710.GA1683048@robh.at.kernel.org> <3bf86aaf-bfad-0615-44c7-3a89417af56a@benettiengineering.com>
In-Reply-To: <3bf86aaf-bfad-0615-44c7-3a89417af56a@benettiengineering.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 13 Apr 2021 12:58:01 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLZo45pY+mB+vvsAaGaE8N-P=4ojOMGSra4=6y1ESTJBw@mail.gmail.com>
Message-ID: <CAL_JsqLZo45pY+mB+vvsAaGaE8N-P=4ojOMGSra4=6y1ESTJBw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: touchscreen: Add HY46XX bindings
To:     Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Apr 13, 2021 at 10:27 AM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:
>
> On 4/13/21 5:07 PM, Rob Herring wrote:
> > On Mon, 12 Apr 2021 17:23:59 +0200, Giulio Benetti wrote:
> >> This adds device tree bindings for the Hycon HY46XX touchscreen series=
.
> >>
> >> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> >> ---
> >> V1->V2:
> >> As suggested by Rob Herring:
> >> * fixed $id: address
> >> * added "hycon," in front of every custom property
> >> * changed all possible property to boolean type
> >> * removed proximity-sensor-switch property since it's not handled in d=
river
> >> V2->V3:
> >> As suggested by Jonathan Neusch=C3=A4fer:
> >> * fixed some typo
> >> * fixed description indentation
> >> * improved boolean properties descriptions
> >> * improved hycon,report-speed description
> >> V3->V4:
> >> * fixed binding compatible string in example as suggested by Jonathan =
Neusch=C3=A4fer
> >> V4->V5:
> >> As suggested by Rob Herring:
> >> * drop hycon- prefix from compatible
> >> * use Hertz unit suffix for hycon,report-speed instead of u32
> >> * set hycon,report-speed minimum to 1Hz, 0Hz make controller to do not=
hing
> >> * change hycon,power-noise-enable property name to hycon,noise-filter-=
enable
> >> * improve hycon,filter-data property description
> >> * use generic touchscreen node name in example
> >> V5->V6:
> >> * changed report-speed property name into report-speed-hz according to
> >> Rob Herring's suggestion
> >> ---
> >>   .../input/touchscreen/hycon,hy46xx.yaml       | 119 ++++++++++++++++=
++
> >>   MAINTAINERS                                   |   6 +
> >>   2 files changed, 125 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/input/touchscre=
en/hycon,hy46xx.yaml
> >>
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
>
> I've sent v7[1] before receiving your Reviewed-by.
> Do I have to re-submit it once and if I receive a Reviewed-by from you
> as a v8 with all your Reviewed-by's?

I gave it on v7 too, so only if there are other changes on any of the
patches. The tools will generally pick up any tags on the version
applied. You just can't expect maintainers to go rummage thru old
versions to find any tags.

Rob
