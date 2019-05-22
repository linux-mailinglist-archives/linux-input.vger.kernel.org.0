Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04ADE2620B
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2019 12:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728835AbfEVKiO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 May 2019 06:38:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:46890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728693AbfEVKiN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 May 2019 06:38:13 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6BDF520856;
        Wed, 22 May 2019 10:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558521493;
        bh=ugDv1aBMMhmnp7egqL5fWduYgoZ8qqmiraEmhPdjH6s=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=is0NSXvRpweE1LCYR9EJ3VmwRfkiRVhtxld8yEp+rRv/9mxkV7nI29mMDeCkAsVwm
         UgEB5UwCoG3b5Bmu12qYuA3N9YE3wKWtByai0puQcD4xXMT8i8J+f9T93gXOajKUSD
         kf5Q5t6lcR8AjvewKShct4ALI7BGPdd39cEd5YEk=
Date:   Wed, 22 May 2019 12:38:10 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH] HID: multitouch: handle faulty Elo touch device
In-Reply-To: <CAO-hwJJfRXEdwMq9KLXDMs37CnHXnVhUzD5sbd5uzoeVdKQdvw@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.1905221237590.1962@cbobk.fhfr.pm>
References: <20190521133831.4436-1-benjamin.tissoires@redhat.com> <CAO-hwJJfRXEdwMq9KLXDMs37CnHXnVhUzD5sbd5uzoeVdKQdvw@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 21 May 2019, Benjamin Tissoires wrote:

> On Tue, May 21, 2019 at 3:38 PM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > Since kernel v5.0, one single win8 touchscreen device failed.
> > And it turns out this is because it reports 2 InRange usage per touch.
> >
> > It's a first, and I *really* wonder how this was allowed by Microsoft in
> > the first place. But IIRC, Breno told me this happened *after* a firmware
> > upgrade...
> >
> > Anyway, better be safe for those crappy devices, and make sure we have
> > a full slot before jumping to the next.
> > This won't prevent all crappy devices to fail here, but at least we will
> > have a safeguard as long as the contact ID and the X and Y coordinates
> > are placed in the report after the grabage.
> 
> Grmbl, I forgot:
> Fixes: 01eaac7e5713 ("HID: multitouch: remove one copy of values")
> CC: stable@vger.kernel.org # v5.0+

I've now pushed this to for-5.2/fixes. Thanks,

-- 
Jiri Kosina
SUSE Labs

