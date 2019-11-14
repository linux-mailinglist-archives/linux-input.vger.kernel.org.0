Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFC04FC6CF
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2019 14:00:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbfKNNAr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Nov 2019 08:00:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:33430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726139AbfKNNAr (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Nov 2019 08:00:47 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 38BFE20709;
        Thu, 14 Nov 2019 13:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573736447;
        bh=8CXKhgJMA2evb+0iVwECmAMsTstQn2WVya+It8E+yR8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=b9kEJnD7cOJ9i6QCSbSaXbaJTbKPhnS/CdzY7TQiFA8d1pDwnMjIQ6gJTfMf9lwCg
         BRkCRZ+gxCv6v0HbGHxZVvjO8RQzkWz0TfaAKdvPYjhjqaEBK5A+4+0iyMSaKWp2sl
         RTfELRa6OgAbKDI+FlD36r0rBQvytvBYtS8J7I9Y=
Date:   Thu, 14 Nov 2019 14:00:43 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Jinke Fan <fanjinke@hygon.cn>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] HID: quirks: Add quirk for HP MSU1465 PIXART OEM
 mouse
In-Reply-To: <20191113033841.25174-1-fanjinke@hygon.cn>
Message-ID: <nycvar.YFH.7.76.1911141400340.1799@cbobk.fhfr.pm>
References: <20191113033841.25174-1-fanjinke@hygon.cn>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 13 Nov 2019, Jinke Fan wrote:

> The PixArt OEM mouse disconnets/reconnects every minute on
> Linux. All contents of dmesg are repetitive:
> 
> [ 1465.810014] usb 1-2.2: USB disconnect, device number 20
> [ 1467.431509] usb 1-2.2: new low-speed USB device number 21 using xhci_hcd
> [ 1467.654982] usb 1-2.2: New USB device found, idVendor=03f0,idProduct=1f4a, bcdDevice= 1.00
> [ 1467.654985] usb 1-2.2: New USB device strings: Mfr=1, Product=2,SerialNumber=0
> [ 1467.654987] usb 1-2.2: Product: HP USB Optical Mouse
> [ 1467.654988] usb 1-2.2: Manufacturer: PixArt
> [ 1467.699722] input: PixArt HP USB Optical Mouse as /devices/pci0000:00/0000:00:07.1/0000:05:00.3/usb1/1-2/1-2.2/1-2.2:1.0/0003:03F0:1F4A.0012/input/input19
> [ 1467.700124] hid-generic 0003:03F0:1F4A.0012: input,hidraw0: USB HID v1.11 Mouse [PixArt HP USB Optical Mouse] on usb-0000:05:00.3-2.2/input0
> 
> So add HID_QUIRK_ALWAYS_POLL for this one as well.
> Test the patch, the mouse is no longer disconnected and there are no
> duplicate logs in dmesg.
> 
> Reference:
> https://github.com/sriemer/fix-linux-mouse
> 
> Signed-off-by: Jinke Fan <fanjinke@hygon.cn>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

