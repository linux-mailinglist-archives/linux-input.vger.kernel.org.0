Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBFA2C682F
	for <lists+linux-input@lfdr.de>; Fri, 27 Nov 2020 15:50:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730944AbgK0Otc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Nov 2020 09:49:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:34124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729913AbgK0Otc (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Nov 2020 09:49:32 -0500
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 84E78221EB;
        Fri, 27 Nov 2020 14:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606488572;
        bh=LxJHP/cdIrEPkaficiW1GEGNjMCpm1HqRPY7H9fvmgw=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=EQOOZFWXBQG4mXOPWwqRh8d2AQolGpfo+/dNZNWJmdx5I+H+5sYwhaHPJ093J/4/s
         32zbZBKLjs771fOMsPBNRqfFMohvhmGUbxfcnbXRLExRCDZ3aKlAX4zn8jBIa/RTfA
         cVNEhzmR6TTYZIgWgmABZakidiYjxCn5a1/hEKR0=
Date:   Fri, 27 Nov 2020 15:49:29 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dean Camera <dean@fourwalledcubicle.com>
cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com
Subject: Re: [V3, PATCH] Add additional hidraw input/output report ioctls.
In-Reply-To: <20201125223957.5921-1-dean@fourwalledcubicle.com>
Message-ID: <nycvar.YFH.7.76.2011271549060.3441@cbobk.fhfr.pm>
References: <20201125223957.5921-1-dean@fourwalledcubicle.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 26 Nov 2020, Dean Camera wrote:

> Currently the hidraw module can only read and write feature HID
> reports on demand, via dedicated ioctls. Input reports are read
> from the device through the read() interface, while output reports
> are written through the write interface().
> 
> This is insufficient; it is desirable in many situations to be
> able to read and write input and output reports through the
> control interface to cover additional scenarios:
>   - Reading an input report by its report ID, to get initial state
>   - Writing an input report, to set initial input state in the device
>   - Reading an output report by its report ID, to obtain current state
>   - Writing an output report by its report ID, out of band
> 
> This patch adds these missing ioctl requests to read and write
> the remaining HID report types. Note that not all HID backends will
> neccesarily support this (e.g. while the USB link layer supports
> setting Input reports, others may not).
> 
> Also included are documentation and example updates. The current
> hidraw documentation states that feature reports read from the
> device does *not* include the report ID, however this is not the
> case and the returned report will have its report ID prepended
> by conforming HID devices, as the report data sent from the device
> over the control endpoint must be indentical in format to those
> sent over the regular transport.

This one is now queued in hid.git@for-5.11/core as well. Thanks,

-- 
Jiri Kosina
SUSE Labs

