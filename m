Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E064151CAE
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2020 15:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbgBDO5w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Feb 2020 09:57:52 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:46488 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727275AbgBDO5w (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Feb 2020 09:57:52 -0500
Received: (qmail 1705 invoked by uid 2102); 4 Feb 2020 09:57:50 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 4 Feb 2020 09:57:50 -0500
Date:   Tue, 4 Feb 2020 09:57:50 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Lauri Jakku <lja@iki.fi>
cc:     oneukum@suse.com, <benjamin.tissoires@redhat.com>,
        <jikos@kernel.org>, <linux-input@vger.kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v4] USB: HID: random timeout failures tackle try.
In-Reply-To: <20200204144634.7622-1-lja@iki.fi>
Message-ID: <Pine.LNX.4.44L0.2002040954190.1587-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 4 Feb 2020, Lauri Jakku wrote:

> -- v1 ------------------------------------------------------------
> send, 20ms apart, control messages, if error is timeout.
> 
> There is multiple reports of random behaviour of USB HID devices.
> 
> I have mouse that acts sometimes quite randomly, I debugged with
> logs others have published that there is HW timeouts that leave
> device in state that it is errorneus.
> 
> To fix this I introduced retry mechanism in root of USB HID drivers.
> 
> Fix does not slow down operations at all if there is no -ETIMEDOUT
> got from control message sending. If there is one, then sleep 20ms
> and try again. Retry count is 20 witch translates maximium of 400ms
> before giving up.
> 
> NOTE: This does not sleep anymore then before, if all is golden.

How do other operating systems handle these problems?  Perhaps we 
should use the same approach.

Also, if this problem only affects USB HID devices, why not put the 
fix in the usbhid driver rather than the USB core?

Alan Stern

