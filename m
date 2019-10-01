Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6BC9C36D9
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2019 16:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbfJAOQk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Oct 2019 10:16:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:60716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388825AbfJAOQk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 1 Oct 2019 10:16:40 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AF5CF2086A;
        Tue,  1 Oct 2019 14:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569939400;
        bh=J9ed0KJmRZLdI0okBxc82Ypt6X45ISUClcmfQyIa8eQ=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=td/yed3D8cE+/wFon8OrIygIUcF1RdDoL0ZCxVhvd3nTK7sAHcfZ+nmGAeH7n6W5+
         Y4Pj26R3fXm7CXOBP9W5QSSDCAtaR3SJMLl/JhqN48E+T4eD1f7lSpcIMU8znWa+1u
         FYEAI3nzLnzccVQzf5fhvYSambBaaKPrcV3RrUug=
Date:   Tue, 1 Oct 2019 16:16:13 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dmitry Torokhov <dtor@chromium.org>
cc:     Nicolas Boichat <drinkcat@chromium.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Benson Leung <bleung@chromium.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] HID: google: whiskers: more robust tablet mode
 detection
In-Reply-To: <nycvar.YFH.7.76.1909231108330.1459@cbobk.fhfr.pm>
Message-ID: <nycvar.YFH.7.76.1910011616020.13160@cbobk.fhfr.pm>
References: <20190913220317.58289-1-dtor@chromium.org> <CANMq1KALGLdZmOgcrrOROU5BXjwnXWSfq6fr85jfRn079JympQ@mail.gmail.com> <CAE_wzQ9U-Lu=Uce0jFjec9JMYMhsQZoTuB+xqDpkOdC+Ufq6Ng@mail.gmail.com> <nycvar.YFH.7.76.1909231108330.1459@cbobk.fhfr.pm>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 23 Sep 2019, Jiri Kosina wrote:

> > > > The USB interface may get detected before the platform/EC one, so let's
> > > > note the state of the base (if we receive event) and use it to correctly
> > > > initialize the tablet mode switch state.
> > > >
> > > > Also let's start the HID interface immediately when probing, this will
> > > > ensure that we correctly process "base folded" events that may be sent
> > > > as we initialize the base. Note that this requires us to add a release()
> > >
> > > s/release/remove/ ?
> > 
> > You are right.
> 
> I'll fix that up when I am applying it (once 5.4 merge window is over).

Now applied (with the fixup made). Thanks,

-- 
Jiri Kosina
SUSE Labs

