Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6479E4BA7D
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2019 15:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727458AbfFSNvO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Jun 2019 09:51:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:46306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726689AbfFSNvN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Jun 2019 09:51:13 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DB0872183F;
        Wed, 19 Jun 2019 13:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560952273;
        bh=ZVujIgYZnMmQjR3Huk72/ZHlXusk1I8d2LVCfhaiaZY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YHmsWEjp6J7tuvvbPtPMEdyUepUFU/hTwP+Rw2/OqajQCfE8fEKqzlMDBqkiPPJ3p
         j8bNDtG/6jRhWasJ99HLJ0Im7bpjHmtf+Y38W00AtFOtgu65BSl7VuXLAx+7iEju3/
         q9tPuvtld7yrsUfDGlsJAdMz6WvoRFs99LkS7FR0=
Received: by mail-qt1-f174.google.com with SMTP id p15so19952005qtl.3;
        Wed, 19 Jun 2019 06:51:12 -0700 (PDT)
X-Gm-Message-State: APjAAAXZcOH2SQLWTyQa4n+2id3xVifM3DoWnx7HTKXTS4u6zhMPysIK
        TaByn++QumfQiJ1Pu41tIqzcueADMErCFmi4eA==
X-Google-Smtp-Source: APXvYqz7r1c3Wrbu3m+ul5OTweDnP7HJcfI3dpJyAoI3C0XBCNVTuoQTdwu/uraeXPapBMucQ9U+X9snyRuBw8bzgxE=
X-Received: by 2002:a0c:8a43:: with SMTP id 3mr34177957qvu.138.1560952272091;
 Wed, 19 Jun 2019 06:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
 <20190527160736.30569-2-leif.middelschulte@klsmartin.com> <20190614194818.GA22146@bogus>
 <b1f40349dced90ea2ab0c9e5dc528db883e62e8d.camel@klsmartin.com>
In-Reply-To: <b1f40349dced90ea2ab0c9e5dc528db883e62e8d.camel@klsmartin.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 19 Jun 2019 07:51:00 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLrMk9yNAzHWCgOFaOqnHKiwSjLOfbhU5+DzLCNBD+H_w@mail.gmail.com>
Message-ID: <CAL_JsqLrMk9yNAzHWCgOFaOqnHKiwSjLOfbhU5+DzLCNBD+H_w@mail.gmail.com>
Subject: Re: [PATCH 01/10] dt-bindings: input: touchscreen: stmpe: add touch
 window configuration
To:     "Middelschulte, Leif" <Leif.Middelschulte@klsmartin.com>
Cc:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 19, 2019 at 5:56 AM Middelschulte, Leif
<Leif.Middelschulte@klsmartin.com> wrote:
>
> Am Freitag, den 14.06.2019, 13:48 -0600 schrieb Rob Herring:
> > On Mon, May 27, 2019 at 06:07:27PM +0200, Leif Middelschulte wrote:
> > > The STMPE811 is able to only monitor a subwindow of the
> > > entire screen. Touches outside of this window are neglected.
> > > This change adds the corresponding documentation.
> >
> > Unless you are trying to just filter out the edge values
> I'm trying to "just filter out the edge values" by filtering the values
> right on the smpte microcontroller. It is a device specific feature, that is
> why I implemented and documented the support.
>
> But sure, one could leave that to a corresponding entry in the hwdb that
> would manipulate absinfo to gain calibrated input [1].
>
> > which I think we already have properties for,
> While there [0] is "touchscreen-min-{x,y}", I could not spot a corresponding
> "touchscreen-max-{x,y}". Could you point me to the right property?

Perhaps add them. If we have min, adding a max seems logical.

Rob
