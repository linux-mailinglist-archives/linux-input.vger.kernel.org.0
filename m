Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAF9F4310E9
	for <lists+linux-input@lfdr.de>; Mon, 18 Oct 2021 08:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbhJRG7N (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 02:59:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:42088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229533AbhJRG7M (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 02:59:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F11DE610A6;
        Mon, 18 Oct 2021 06:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634540221;
        bh=QcbkAz4eqj7Tl3dWC6mjCP8Z0t9AQTz15VULKx5FKXQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2NEGlyGVjPe0z+yO1vXdnBKQCsxdyXt0nsB2T/NmtZW027uKTU1I7pnaXcJG/RPcP
         nRCEpJidB/zZ/CrRSRryzhKBaVefog7h66yN80QwiPaPq+eBCng64UDPvL+Y1mKOLg
         EWneg+sH9cfiZ+7S1WmY2n82wAEyRS6MFuAYa+to=
Date:   Mon, 18 Oct 2021 08:56:58 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Andrej Shadura <andrew.shadura@collabora.co.uk>
Cc:     =?utf-8?B?SmnFmcOt?= Kosina <jikos@kernel.org>,
        linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel@collabora.com,
        Benjamin Tissoires <benjamin.tissoires@gmail.com>
Subject: Re: [PATCH 1/2] HID: u2fzero: explicitly check for errors
Message-ID: <YW0aulXWy86FvTvq@kroah.com>
References: <20211018064800.15173-1-andrew.shadura@collabora.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018064800.15173-1-andrew.shadura@collabora.co.uk>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 18, 2021 at 08:47:59AM +0200, Andrej Shadura wrote:
> The previous commit fixed handling of incomplete packets but broke error
> handling: offsetof returns an unsigned value (size_t), but when compared
> against the signed return value, the return value is interpreted as if
> it were unsigned, so negative return values are never less than the
> offset.
> 
> Fixes: 22d65765f211c("HID: u2fzero: ignore incomplete packets without data")
> Fixes: 42337b9d4d958("HID: add driver for U2F Zero built-in LED and RNG")

Nit, you need a ' ' before the '(' character here, and you only need 12
digits of the sha1.  It should look like:
	Fixes: 22d65765f211 ("HID: u2fzero: ignore incomplete packets without data")

Also, how about a cc: stable for these as well?

thanks,

greg k-h
