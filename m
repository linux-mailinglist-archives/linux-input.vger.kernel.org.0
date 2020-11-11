Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51D6F2AF541
	for <lists+linux-input@lfdr.de>; Wed, 11 Nov 2020 16:42:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbgKKPm0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Nov 2020 10:42:26 -0500
Received: from netrider.rowland.org ([192.131.102.5]:40993 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727254AbgKKPmZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Nov 2020 10:42:25 -0500
Received: (qmail 237992 invoked by uid 1000); 11 Nov 2020 10:42:24 -0500
Date:   Wed, 11 Nov 2020 10:42:24 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Hgntkwis@vfemail.net
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: I need advice with UPS connection.
Message-ID: <20201111154224.GA237113@rowland.harvard.edu>
References: <20201109220000.2ae98fa5@Phenom-II-x6.niklas.com>
 <20201110215511.GA208895@rowland.harvard.edu>
 <20201110201735.29a37035@Phenom-II-x6.niklas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110201735.29a37035@Phenom-II-x6.niklas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 10, 2020 at 08:17:35PM -0500, Hgntkwis@vfemail.net wrote:
> On Tue, 10 Nov 2020 16:55:11 -0500
> Alan Stern <stern@rowland.harvard.edu> wrote:
> > > 
> > > I'd appreciate any advice trying to get my UPS to stay connected and
> > > not spam the kernel log. The UPS is about 1 year old. It's working
> > > fine. I just want to use nut or apcupsd with it.
> > > 
> > > Thanks,
> > > David
> >
> > +Jiri, Ben, and linux-input
> > 
> 
> I googled Jiri and ben but I don't see anything promising. Can you give
> me more search terms or absolute URLs?

Jiri Kosina and Benjamin Tissoires are the maintainers of Linux's HID 
(Human Interface Device) subsystem, which interacts closely with the 
Input subsystem.  Your UPS uses the HID communication protocol, so they 
are the people best suited to fix its problems.

> Also, in pointing me to the linux-input subsystem, are you recommending
> me to write a driver or something else?

I am recommending that the people who work on the Input subsystem should 
take a look at your bug report.

Alan Stern
