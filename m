Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E27F117FCA4
	for <lists+linux-input@lfdr.de>; Tue, 10 Mar 2020 14:22:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727967AbgCJNWU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Mar 2020 09:22:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:47952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730239AbgCJNWT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Mar 2020 09:22:19 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 53E39208E4;
        Tue, 10 Mar 2020 13:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583846539;
        bh=FaMTD2na3NDedgKSwXsZVOGx7i/nxquek6psyjDM3Lo=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=nOHUzyv8eb4NIsmREF9QILrzXXWOx92nJ+aS2RDg1Dv7jNtzGLBsZOeyveMA7AQVV
         Cq8vn5QKZbw+kqb6EA5V7asq10eKRxLNL69aHKd+KpzRG/coxJDSXCz2f2nx0TCNRr
         L6a5/PaJXVH3SRWycAiQbGPnBxTmEZsULi5zIptM=
Date:   Tue, 10 Mar 2020 14:22:16 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@archlinux.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Subject: Re: [PATCH] HID: logitech-dj: add support for the static device in
 the Powerplay mat/receiver
In-Reply-To: <5a93677bd6238a9d7928e4fd16a8915faeb5f19e.camel@archlinux.org>
Message-ID: <nycvar.YFH.7.76.2003101301280.19500@cbobk.fhfr.pm>
References: <20200115201811.3271284-1-lains@archlinux.org>  <nycvar.YFH.7.76.2002121449191.3144@cbobk.fhfr.pm> <5a93677bd6238a9d7928e4fd16a8915faeb5f19e.camel@archlinux.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 12 Feb 2020, Filipe Laíns wrote:

> > > +	/* custom receiver device (eg. powerplay) */
> > > +	if (hidpp_report->device_index == 7) {
> > > +		workitem.reports_supported |= HIDPP;
> > > +	}
> > > +
> > 
> > I guess we can't do anything else than to trust Logitech that they will 
> > not assign conflicting device_index ID in the future to something that 
> > will not be HID++, right?
> > 
> > Or is this properly documented somewhere?
> > 
> > Thanks,
> 
> 
> CCing Nestor
> 
> Yes, we need to trust Logitech on this. There's isn't anything
> documented regarding this AFAIK.
> 
> Even if Logitech released a device with index 7 that didn't support
> HID++, it wouldn't be that big of an issue. We would just end up with a
> hidraw node which would export a vendor page report descriptor but the
> device wouldn't actually reply to anything.

Given the silence from Nestor, I guess we can just apply this for 5.7; 
pushing to for-5.7/logitech branch.

Thanks,

-- 
Jiri Kosina
SUSE Labs

