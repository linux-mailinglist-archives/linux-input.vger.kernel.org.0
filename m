Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E22E3DFE50
	for <lists+linux-input@lfdr.de>; Wed,  4 Aug 2021 11:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237201AbhHDJqb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Aug 2021 05:46:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:43506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237177AbhHDJqa (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 4 Aug 2021 05:46:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D0F060F43;
        Wed,  4 Aug 2021 09:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628070378;
        bh=nt0RjSYMCjZ+aptscxs5+o+ti2RHm78rEXtWUlpI+iQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EK0cf9uy1ZVm3nPQNyD1Gb3mct7D6fJwv0rz9ej7uTVuQN8DblPmgfmarHSPKStLX
         e2CqUR+AsVFh/4/lel3GeXOpenokesve6/IeaWI8ox636wFduNeTQJgIMtx0wTwVnZ
         nrnv3kHTWyLsM4aymDPwxpw5h9RWDMpH6vnIdIKa5VCam3jQmNjixUP1htZ3wfJTvT
         OFoi0ro6dOKr41ScGwrXhU10MadOlaSda8xJVEjN2vhT1mhGQKUpLUPCNlyBlgvoQf
         jEDlB/NeaFQBiHMHZYUcNAZ2lUDxLblo5xs9DP5FZhlkv5TUh/2pJxdkgQHLyP134N
         7MX5sMnjyDpwQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mBDSx-0007Zu-O3; Wed, 04 Aug 2021 11:45:36 +0200
Date:   Wed, 4 Aug 2021 11:45:35 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Salah Triki <salah.triki@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>, gregkh@linuxfoundation.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: touchscreen: replace conditional statement with
 max()
Message-ID: <YQphv1ikiyT/q1zy@hovoldconsulting.com>
References: <20210803003857.GA1560352@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803003857.GA1560352@pc>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 03, 2021 at 01:38:57AM +0100, Salah Triki wrote:
> Replace conditional statement with max() in order to make code cleaner.
> Issue found by coccinelle.
> 
> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---
>  drivers/input/touchscreen/usbtouchscreen.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
> index 43c521f50c85..69f36d4f6cea 100644
> --- a/drivers/input/touchscreen/usbtouchscreen.c
> +++ b/drivers/input/touchscreen/usbtouchscreen.c
> @@ -269,7 +269,7 @@ static int e2i_read_data(struct usbtouch_usb *dev, unsigned char *pkt)
>  
>  	tmp = tmp - 0xA000;
>  	dev->touch = (tmp > 0);
> -	dev->press = (tmp > 0 ? tmp : 0);
> +	dev->press = max(tmp, 0);

I'm afraid that like the related patch you've posted elsewhere, this not
an improvement either.

>  
>  	return 1;
>  }

Johan
