Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCD9331024
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 14:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbhCHN4l (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 08:56:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:37474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230439AbhCHN4P (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Mar 2021 08:56:15 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 83AEA651CC;
        Mon,  8 Mar 2021 13:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615211766;
        bh=d/1+X6c0kuhAjWU7z5EWjg2l51Zui1YVR2UWWj45ynE=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Xur0uaq7fZpnmk74VWF/8h/fHcwuqdbilbUGghr4E4FBx0yjMqlDWyMaMn7r7Lwf/
         f+bm+zQGUtd1WCSJ2z2CE7zAgSFgizlrmfrtcJxCofSSW71gHLzPwqVvlynvDjM8RC
         vX14GW3RdnMdTK48C+cmZMM99q8Mbtrnfd1FVmHut39wiu/sFKPRLY1IT+b+OPYMI5
         RqfZNnmdHrRzsbjQpeEegSbU3zxkQxkO7wHcNF8tv99kXCEKwAjP14jRyBGpXrU/zH
         lx9PN1DMujiVOgbka05Q0lOshZX+w2FwlrABtM2ArFUCxDTJS6+LZzbH8CCD025FQQ
         d3KlJBPKYscDQ==
Date:   Mon, 8 Mar 2021 14:56:03 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Douglas Gilbert <dgilbert@interlog.com>
cc:     linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
        benjamin.tissoires@redhat.com
Subject: Re: [PATCH] [input]: hid-cp2112: fix multiple gpiochips
In-Reply-To: <20210109223658.749743-1-dgilbert@interlog.com>
Message-ID: <nycvar.YFH.7.76.2103081455520.12405@cbobk.fhfr.pm>
References: <20210109223658.749743-1-dgilbert@interlog.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 9 Jan 2021, Douglas Gilbert wrote:

> In lk 5.11.0-rc2 connecting a USB based Silicon Labs HID to I2C
> bridge evaluation board (CP2112EK) causes this warning:
>   gpio gpiochip0: (cp2112_gpio): detected irqchip that is shared
>        with multiple gpiochips: please fix the driver
> 
> Simply copy what other gpio related drivers do to fix this
> particular warning: replicate the struct irq_chip object in each
> device instance rather than have a static object which makes that
> object (incorrectly) shared by each device.
> 
> Signed-off-by: Douglas Gilbert <dgilbert@interlog.com>

Applied, thanks for the fix, and sorry for the delay.

-- 
Jiri Kosina
SUSE Labs

