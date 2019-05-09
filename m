Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41117192FA
	for <lists+linux-input@lfdr.de>; Thu,  9 May 2019 21:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbfEIThA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 May 2019 15:37:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:43396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726658AbfEIThA (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 9 May 2019 15:37:00 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DF82421744;
        Thu,  9 May 2019 19:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557430619;
        bh=dPAplkIMNbOa38mzdpbmbJvgJFx/7G1fE2XCQuNFwv0=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=v6T+DMorSkprB8452mVnH6vWUI5RgSkR9yHKhJXqgjtcaVZj9fBgMtOwnf2I7vxrO
         F336e0lR7EAdBG4xT36p8xUNCu/icp4IZgFfCJWEoMHpLfKYcTaa2M08XtqnprViNR
         2P8sLJwVWDuTwXf5XIv+03aQb1JXVvxgmIwCZnKo=
Date:   Thu, 9 May 2019 21:36:56 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Tobias Auerochs <tobi291019@gmail.com>
cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com
Subject: Re: [PATCH] HID: Use SET_REPORT request on control endpoint in
 hid-rmi for Acer Switch 3 and 5 cover keyboards
In-Reply-To: <2931730.Pa2PyE0Qbt@tobias-tablet>
Message-ID: <nycvar.YFH.7.76.1905092136400.17054@cbobk.fhfr.pm>
References: <2931730.Pa2PyE0Qbt@tobias-tablet>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 20 Apr 2019, Tobias Auerochs wrote:

> The touchpad on the cover keyboard for the Acer Switch 3 and 5 does not
> work as-is under Linux. Both devices have the same usb id for the cover
> keyboard.
> 
> The kernel correctly assigns the hid-rmi driver to the device using usbhid
> for transport.
> Any attempts of hid-rmi to talk to the device using hid_hw_output_report
> fail however as usbhid does not have a working urbout due to the lack of
> any out endpoints.
> 
> Looking through Wireshark usbmon recordings from the Windows Synaptics
> driver for this computer running inside of QEMU shows that it should be
> using SET_REPORT requests instead.
> 
> This replaces the hid_hw_output_report in hid-rmi with a
> hid_hw_raw_request for this device, which is at least enough to enable
> the kernel to get working multi-touch input.

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

