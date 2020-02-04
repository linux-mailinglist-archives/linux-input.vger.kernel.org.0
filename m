Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26C95152039
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2020 19:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727363AbgBDSLS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Feb 2020 13:11:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:50136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727361AbgBDSLS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 4 Feb 2020 13:11:18 -0500
Received: from localhost (unknown [167.98.85.149])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 431612082E;
        Tue,  4 Feb 2020 18:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580839877;
        bh=R0MoCSZQK+PC0Q5mvT/DyawqafJ+9P3gT74qdvj40B0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Dw1WyUarX9uEzYVrUeuajcVVxjPRGecegJhMJu3GO86QFClKT50WtPDejiRIn5Thv
         HNoeYvdBsjOs5cBsX5QQp5chIE2SDc97LOG6w8ajxpu6OKrq8XIop1lQTnzrGisobK
         9ZcuWLcYS6XLyCfPiW1h4GCz+8KdtNRJGk2iUxvA=
Date:   Tue, 4 Feb 2020 18:11:15 +0000
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Lauri Jakku <lja@iki.fi>
Cc:     oneukum@suse.com, benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5] USB: HID: random timeout failures tackle try.
Message-ID: <20200204181115.GA1115743@kroah.com>
References: <20200204175238.3817-1-lja@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200204175238.3817-1-lja@iki.fi>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Feb 04, 2020 at 07:52:39PM +0200, Lauri Jakku wrote:
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
> 
> -- v2 ------------------------------------------------------------
> 
> If there is timeout, then sleep 20ms and try again. Retry count is 20
> witch translates maximium of 400ms before giving up. If the 400ms
> boundary is reached the HW is really bad.
> 
> JUST to be clear:
>     This does not make USB HID devices to sleep anymore than
>     before, if all is golden.
> 
> Why modify usb-hid-core: No need to modify driver by driver.
> 
> -- v3 ------------------------------------------------------------
> 
> Timeout given is divided by 100, but taken care that it is always
> at least 10ms.
> 
> so total time in common worst-case-scenario is:
> 
>  sleep of 20ms + common timeout divided by 100 (50ms) makes
>  70ms per loop, 20 loops => 1.4sec .
> 
> -- v4 ------------------------------------------------------------
> No changes in code, just elaborating what is done in v[1,2,3].
> 
> -- v5 ------------------------------------------------------------
> changes in code: what the build robot found:
>    drivers/usb/core/message.c: In function 'usb_control_msg':
> >> drivers/usb/core/message.c:173:11: error: type defaults to 'int' \
>      in declaration of 'timeout_happened' [-Werror=implicit-int]
>        static timeout_happened = 0;
>               ^~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
> 
> Fix done: added int to declaration.

Um, please read the documentation for how to do versioning of patches.
Or look at examples on the mailing list for this as well.  What you have
here will unfortunately not work at all.

thanks,

greg k-h
