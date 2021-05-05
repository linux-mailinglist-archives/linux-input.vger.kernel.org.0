Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01B7A373BAA
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 14:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232142AbhEEMsN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 08:48:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:39460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230034AbhEEMsM (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 08:48:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 413F8613BC;
        Wed,  5 May 2021 12:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620218836;
        bh=K1tvaeyBF65sqdxG7iy3TRk3SWi/mJo1kQamET0hdrc=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=uJXxKUeauXVYvxttkbTJrgnH0oV8Ff8lv9JHIJ/jsX2vWXsF78LN4LBltwYlcym8F
         WBerd7r0mJDb4vy6jjZ6IkEfYuenFBRa8rz2y78VajuRt8z89lnrMjfgUVS6eELK5a
         OzV8fL1Nt+OJfk2ZWZvp/6YRDFgYYwWfGIUk0ddK5niC3BRTMUL8WgbDC122VGiTAM
         EmoSvKFH3u05R9VqRsjPufWvNdeADRkge58H5MaV73Tpl6yMcb1z2G1BM/GOE3gh0l
         F+Fj//3DX+AQjy14hsXOkHOJO+cmerWYt0oZ5v+0BPLMYIjQQdbPb8Z/JiyHgDoBQn
         i0GAE8JwCxA0w==
Date:   Wed, 5 May 2021 14:47:13 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH  1/1] HID: quirks: Add quirk for Lenovo optical mouse
In-Reply-To: <20210429185040.46249-1-saeed.mirzamohammadi@oracle.com>
Message-ID: <nycvar.YFH.7.76.2105051447031.28378@cbobk.fhfr.pm>
References: <20210429185040.46249-1-saeed.mirzamohammadi@oracle.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 29 Apr 2021, Saeed Mirzamohammadi wrote:

> The Lenovo optical mouse with vendor id of 0x17ef and product id of
> 0x600e experiences disconnecting issues every 55 seconds:
> 
> [38565.706242] usb 1-1.4: Product: Lenovo Optical Mouse
> [38565.728603] input: Lenovo Optical Mouse as /devices/platform/scb/fd500000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/usb1/1-1/1-1.4/1-1.4:1.0/0003:17EF:600E.029A/input/input665
> [38565.755949] hid-generic 0003:17EF:600E.029A: input,hidraw1: USB HID v1.11 Mouse [Lenovo Optical Mouse] on usb-0000:01:00.0-1.4/input0
> [38619.360692] usb 1-1.4: USB disconnect, device number 48
> [38620.864990] usb 1-1.4: new low-speed USB device number 49 using xhci_hcd
> [38620.984011] usb 1-1.4: New USB device found, idVendor=17ef,idProduct=600e, bcdDevice= 1.00
> [38620.998117] usb 1-1.4: New USB device strings: Mfr=0, Product=2,SerialNumber=0
> 
> This adds HID_QUIRK_ALWAYS_POLL for this device in order to work properly.
> 
> Reference:
> https://github.com/sriemer/fix-linux-mouse
> 
> Signed-off-by: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

