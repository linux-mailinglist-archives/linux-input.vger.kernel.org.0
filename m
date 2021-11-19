Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B71F745714C
	for <lists+linux-input@lfdr.de>; Fri, 19 Nov 2021 16:00:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbhKSPDu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Nov 2021 10:03:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:50548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229805AbhKSPDu (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Nov 2021 10:03:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F80E61AA7;
        Fri, 19 Nov 2021 15:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637334048;
        bh=uHg+WxaDrjOwyCDjdSa5x43VfDWNhiSl6x823c9Dit8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=gg/uLtHC0yy+o4HFjE/LxPpOb1u5ovaoBWFIwc+QSlw9IFRmuyJ8cRQxuJbXQBYxb
         2yVxfZLWLisxm59yToljZYr1c9EKfaub2N4JSl8H/jH43ha5RvWy4v/v41FQVPOs8e
         xT92mk/f3G9J86ciDWZ/Rgv5kVti5Z+PeI06syUVltCmfRT3+H+kCpTPv2NOC7GzHs
         6ckUTDUP3/LqVfFoPiEvS/zpTRraA6aDDwBS4ExG31ZdFMXJjBP2WbAj+mbvaXLI3W
         9NZl+jTH7atffODmDOCEpzjogXw99sMeLipmnpac/mTkhEsZAKtVcjdFBfypa4/yEj
         7CnOVvqyKosFQ==
Date:   Fri, 19 Nov 2021 16:00:45 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Ondrej Zary <linux@zary.sk>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hid-multitouch: Fix Iiyama ProLite T1931SAW (0eef:0001
 again!)
In-Reply-To: <20211116131502.24603-1-linux@zary.sk>
Message-ID: <nycvar.YFH.7.76.2111191600380.16505@cbobk.fhfr.pm>
References: <CAO-hwJ+huX5wFQjwzZ+o9zOonCuifiyQ2rZosTWW7or09_SfiA@mail.gmail.com> <20211116131502.24603-1-linux@zary.sk>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 16 Nov 2021, Ondrej Zary wrote:

> Iiyama ProLite T1931SAW does not work with Linux - input devices are
> created but cursor does not move.
> 
> It has the infamous 0eef:0001 ID which has been reused for various
> devices before.
> 
> It seems to require export_all_inputs = true.
> 
> Hopefully there are no HID devices using this ID that will break.
> It should not break non-HID devices (handled by usbtouchscreen).
> 
> Signed-off-by: Ondrej Zary <linux@zary.sk>
> ---
>  drivers/hid/hid-multitouch.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 3ea7cb1cda84..ac114b76057b 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -1880,6 +1880,11 @@ static const struct hid_device_id mt_devices[] = {
>  		MT_USB_DEVICE(USB_VENDOR_ID_CVTOUCH,
>  			USB_DEVICE_ID_CVTOUCH_SCREEN) },
>  
> +	/* eGalax devices (SAW) */
> +	{ .driver_data = MT_CLS_EXPORT_ALL_INPUTS,
> +		MT_USB_DEVICE(USB_VENDOR_ID_DWAV,
> +			USB_DEVICE_ID_EGALAX_TOUCHCONTROLLER) },
> +
>  	/* eGalax devices (resistive) */
>  	{ .driver_data = MT_CLS_EGALAX,

Applied, thanks Ondrej.

-- 
Jiri Kosina
SUSE Labs

