Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E31125FBCB
	for <lists+linux-input@lfdr.de>; Mon,  7 Sep 2020 16:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729759AbgIGOFw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Sep 2020 10:05:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:45710 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729686AbgIGOFV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 7 Sep 2020 10:05:21 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4324921775;
        Mon,  7 Sep 2020 14:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599487521;
        bh=SkYkCjky5bPQ4GQiZR4hOe5NZBf2aRKEeVAAgfB2Foo=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=EvLq49AU2NOISeHmAjD8AS1blfK9dSOES9C5uUKh0gQ2JtIvCUKuCeHX5F2BX7jUP
         HqpLnxEXQ3doxLAW2Uad5HAheF1I3WnYnjsGMUfwxXTBzEncOQanwhbHoRJNUEJcml
         P76rrAAyS0tRl4mh8A8c/CxxTaGYqGUIi6JxLSUU=
Date:   Mon, 7 Sep 2020 16:05:18 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Ian Abbott <abbotti@mev.co.uk>
cc:     linux-input@vger.kernel.org,
        David Rheinsberg <david.rheinsberg@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: Re: {PATCH 0/2] HID: wiimote: Minor change to spinlock usage
In-Reply-To: <20200904132143.9496-1-abbotti@mev.co.uk>
Message-ID: <nycvar.YFH.7.76.2009071605080.4671@cbobk.fhfr.pm>
References: <20200904132143.9496-1-abbotti@mev.co.uk>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 4 Sep 2020, Ian Abbott wrote:

> [I have posted these patches previously, but that was over a year ago.
> --IA]
> 
> A couple of minor changes to the wiimote core module.  They do not
> change functionality of the driver:
> 
> 1) HID: wiimote: make handlers[] const
> 2) HID: wiimote: narrow spinlock range in wiimote_hid_event()
> 
>  drivers/hid/hid-wiimote-core.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

Applied to for-5.10/wiimote. Thanks,

-- 
Jiri Kosina
SUSE Labs

