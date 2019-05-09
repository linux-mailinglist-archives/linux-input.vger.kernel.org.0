Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB3419476
	for <lists+linux-input@lfdr.de>; Thu,  9 May 2019 23:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbfEIVSn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 May 2019 17:18:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:47016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726686AbfEIVSm (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 9 May 2019 17:18:42 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 860DD21744;
        Thu,  9 May 2019 21:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557436722;
        bh=QlQ55Ea4J4EOVNkV5Psi/l7xVsCojarUEsxbs/GIkJg=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=abT7AP9qwlnDHSsClF6f/aqj8iWgT+UG1CFQC56vs20BIOzzm9RJEv7h2YG/dTtZf
         JTmSjonK/HIFSExFdtvWKFzNdREIDbdATl0ew+MKYu69ArmSYk2qaDp4q8S6tNGn0i
         XItHpEOXz//qj+6+SKr8uzLcb+VLh67m7FwzA9Nw=
Date:   Thu, 9 May 2019 23:18:39 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-dj: Add usb-id for the 27MHz MX3000
 receiver
In-Reply-To: <20190509114704.10333-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.1905092318000.17054@cbobk.fhfr.pm>
References: <20190509114704.10333-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 9 May 2019, Hans de Goede wrote:

> Testing has shown that, as expected, the MX3000 receiver is fully
> compatible with the existing 27MHz receiver support in hid-logitech-dj.c.
> 
> After this the only, presumably also compatible, receiver id left in
> hid-lg.c is the USB_DEVICE_ID_S510_RECEIVER / 0xc50c id. If we can get
> someone to confirm that this receiver works with the dj 27Mhz support too,
> then the handling of the LG_RDESC and LG_WIRELESS quirks can be removed
> from hid-lg.c.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied for 5.3 (I believe there is no rush to have this in 5.2 before we 
figure out 0xc50c anyway), thanks.

-- 
Jiri Kosina
SUSE Labs

