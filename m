Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04DBCBB106
	for <lists+linux-input@lfdr.de>; Mon, 23 Sep 2019 11:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728352AbfIWJJa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Sep 2019 05:09:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:34224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727935AbfIWJJ3 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Sep 2019 05:09:29 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 96D1721670;
        Mon, 23 Sep 2019 09:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569229769;
        bh=8RVElTFHvsRrDX3GxYgPYspbtm5Sp3n+wmCjOPQwbZE=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=izQR+Ljq1dVwLHm5KTtNGF79NJ/EL5R2/ffn+GssEW54+zd0wsz29hRhL0v9QXlZO
         ZtnDw4hGhTU6Nxps/8cTsVxYJlr5IYqnFn4tBOoWyapkPYT8OkGeWQziHbYIsxm3AK
         AG1ay2GLq4BEHEmIUoghAJlf3e3cuz3Q3bZsGPNg=
Date:   Mon, 23 Sep 2019 11:09:04 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dmitry Torokhov <dtor@chromium.org>
cc:     Nicolas Boichat <drinkcat@chromium.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Benson Leung <bleung@chromium.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] HID: google: whiskers: more robust tablet mode
 detection
In-Reply-To: <CAE_wzQ9U-Lu=Uce0jFjec9JMYMhsQZoTuB+xqDpkOdC+Ufq6Ng@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.1909231108330.1459@cbobk.fhfr.pm>
References: <20190913220317.58289-1-dtor@chromium.org> <CANMq1KALGLdZmOgcrrOROU5BXjwnXWSfq6fr85jfRn079JympQ@mail.gmail.com> <CAE_wzQ9U-Lu=Uce0jFjec9JMYMhsQZoTuB+xqDpkOdC+Ufq6Ng@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 15 Sep 2019, Dmitry Torokhov wrote:

> > > The USB interface may get detected before the platform/EC one, so let's
> > > note the state of the base (if we receive event) and use it to correctly
> > > initialize the tablet mode switch state.
> > >
> > > Also let's start the HID interface immediately when probing, this will
> > > ensure that we correctly process "base folded" events that may be sent
> > > as we initialize the base. Note that this requires us to add a release()
> >
> > s/release/remove/ ?
> 
> You are right.

I'll fix that up when I am applying it (once 5.4 merge window is over).

Thanks,

-- 
Jiri Kosina
SUSE Labs

