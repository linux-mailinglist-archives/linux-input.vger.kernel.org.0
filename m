Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2DC69BF8
	for <lists+linux-input@lfdr.de>; Mon, 15 Jul 2019 22:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732589AbfGOUAs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Jul 2019 16:00:48 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:41137 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731262AbfGOUAr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Jul 2019 16:00:47 -0400
Received: by mail-io1-f66.google.com with SMTP id j5so31951472ioj.8;
        Mon, 15 Jul 2019 13:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=D/u//h9h5nsqAs7HfcVGU38KKZeeeobvjpeQ+T4FGUw=;
        b=j+1GpKUrI57uEEkfPvTStFfut1NiVn1A/l+zGXIuClHjPdQD7GXUijxd0dyBo/CsHQ
         Bq+TMIDTowgY+dRMVYFTZ2HIrQGlPbl2nDVWBNL8QS0YA7558NLf56+vQGk1UMdNOgis
         nAoemWbyrgtjGFlo3eID4MX8RVG6FBdGwDmU/NVsbjwh7jIEM5FyCgIMl1BH19pVQcKM
         cUdAKEgppV50CRqrdYISBXXGCJI/RavB27InkgiS0hXPNXeTiSw622gRa6r/Gtlr7mvT
         SlJkBY8aSoJ0R9k83EqBbMR6P0xNMrpAIqeJdIcRpEVeMgM5+hSInJUK7aSgeLYOVTsk
         bGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=D/u//h9h5nsqAs7HfcVGU38KKZeeeobvjpeQ+T4FGUw=;
        b=oK1enitWxYSgaUeP5++jpqFmnNY3xAOw8NtsM+CBv1IpvAVVzh7F25fOOUwRCaGK0q
         LoTj2hb7kJwF5Z1JyehTPIGy6rHtQSZCpBgLMiCBc6mWetXkjvM34ybbv/fx9dJVy9lL
         TeOhLi88lDChEPIyR6+86kY0d0UOLcaJB4sfG0iSLqaTTAdjtiICNltDRsUEewKk66ni
         NJ0aSWdanRLD7LUo8J95VSPTJKFmmMa19qbFCV8fUQStMNo97MDXjkxUEketnpgXPDWm
         wxuAQkKYYmg9p2SYN1vU8qmrAcGkOkK8fD3w/loG6Huxelp+UEY0I0LlU1FqkiNlGNSo
         iMoA==
X-Gm-Message-State: APjAAAWtrplWTohFL5FPw8yEMXx4AwxBtZBi8U0JHBAGpD/6iSXg7pmr
        2u/3YiPKGlSloa2r5RG2mPuTsBVUgOe8er8Qmn0=
X-Google-Smtp-Source: APXvYqyA6vQUGkrRdX/HxIitR7pnzYfqz0G0jJgjDOfZSZ3zx/ehoosjvpOq9MEMo4CpKvX4MGgoRTmUe1f03Nyg/e8=
X-Received: by 2002:a6b:f90f:: with SMTP id j15mr21440225iog.43.1563220845620;
 Mon, 15 Jul 2019 13:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190419081926.13567-1-ronald@innovation.ch> <20190419081926.13567-2-ronald@innovation.ch>
 <CGME20190702135052eucas1p11e2621af0514505789c7947b84cf133c@eucas1p1.samsung.com>
 <2d0fe94c-a2c9-a8f6-967f-c33b53e86518@samsung.com> <20190703063956.GA32102@innovation.ch>
 <20190715180407.GB131063@dtor-ws>
In-Reply-To: <20190715180407.GB131063@dtor-ws>
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date:   Mon, 15 Jul 2019 13:00:34 -0700
Message-ID: <CAKdAkRTGXNbUsuKASNGLfwUwC7Asod9K5baYLPWPU7EX-42-yA@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] drm/bridge: sil_sii8620: make remote control optional.
To:     "Life is hard, and then you die" <ronald@innovation.ch>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lukas Wunner <lukas@wunner.de>,
        Federico Lorenzi <federico@travelground.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 15, 2019 at 11:04 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi,
>
> On Tue, Jul 02, 2019 at 11:39:56PM -0700, Life is hard, and then you die =
wrote:
> >
> > On Tue, Jul 02, 2019 at 03:50:49PM +0200, Andrzej Hajda wrote:
> > > On 19.04.2019 10:19, Ronald Tschal=C3=A4r wrote:
> > > > commit d6abe6df706c (drm/bridge: sil_sii8620: do not have a depende=
ncy
> > > > of RC_CORE) changed the driver to select both RC_CORE and INPUT.
> > > > However, this causes problems with other drivers, in particular an =
input
> > > > driver that depends on MFD_INTEL_LPSS_PCI (to be added in a separat=
e
> > > > commit):
> > > >
> > > >   drivers/clk/Kconfig:9:error: recursive dependency detected!
> > > >   drivers/clk/Kconfig:9:        symbol COMMON_CLK is selected by MF=
D_INTEL_LPSS
> > > >   drivers/mfd/Kconfig:566:      symbol MFD_INTEL_LPSS is selected b=
y MFD_INTEL_LPSS_PCI
> > > >   drivers/mfd/Kconfig:580:      symbol MFD_INTEL_LPSS_PCI is implie=
d by KEYBOARD_APPLESPI
> > > >   drivers/input/keyboard/Kconfig:73:    symbol KEYBOARD_APPLESPI de=
pends on INPUT
> > > >   drivers/input/Kconfig:8:      symbol INPUT is selected by DRM_SIL=
_SII8620
> > > >   drivers/gpu/drm/bridge/Kconfig:83:    symbol DRM_SIL_SII8620 depe=
nds on DRM_BRIDGE
> > > >   drivers/gpu/drm/bridge/Kconfig:1:     symbol DRM_BRIDGE is select=
ed by DRM_PL111
> > > >   drivers/gpu/drm/pl111/Kconfig:1:      symbol DRM_PL111 depends on=
 COMMON_CLK
> > > >
> > > > According to the docs and general consensus, select should only be =
used
> > > > for non user-visible symbols, but both RC_CORE and INPUT are
> > > > user-visible. Furthermore almost all other references to INPUT
> > > > throughout the kernel config are depends, not selects. For this rea=
son
> > > > the first part of this change reverts commit d6abe6df706c.
> > > >
> > > > In order to address the original reason for commit d6abe6df706c, na=
mely
> > > > that not all boards use the remote controller functionality and hen=
ce
> > > > should not need have to deal with RC_CORE, the second part of this
> > > > change now makes the remote control support in the driver optional =
and
> > > > contingent on RC_CORE being defined. And with this the hard depende=
ncy
> > > > on INPUT also goes away as that is only needed if RC_CORE is define=
d
> > > > (which in turn already depends on INPUT).
> > > >
> > > > CC: Inki Dae <inki.dae@samsung.com>
> > > > CC: Andrzej Hajda <a.hajda@samsung.com>
> > > > CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > Signed-off-by: Ronald Tschal=C3=A4r <ronald@innovation.ch>
> > > > Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> > >
> > >
> > > Apparently this patch was not queued to kernel yet. If there are no
> > > objections I will queue it via drm-misc-next tree tomorrow.
> >
> > If this patch set won't be queued for 5.3 then I guess that would be a
> > good idea.
> >
> > But may I ask what is preventing this patch set from being queued for
> > upstream, so I can try and fix whatever the issue is?
>
> As I mentioned in my pull request to Linux I will be picking up the
> Apple keyboard driver for this merge window even though it was not in
> next (my fault).
>
> I created and immutable branch for this change if you'd like to pull it
> in so we do not duplicate commit and risk the conflicts (but I believe
> git should resolve it either way).
>
> https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git id/5.2-sil=
_sii8620-rc-optional

Sorry, that should have read:

https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git
ib/5.2-sil_sii8620-rc-optional

Thanks.

--=20
Dmitry
