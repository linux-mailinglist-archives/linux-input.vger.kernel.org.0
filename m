Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA2723D8A8C
	for <lists+linux-input@lfdr.de>; Wed, 28 Jul 2021 11:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235538AbhG1J0O (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Jul 2021 05:26:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:48948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235473AbhG1J0M (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Jul 2021 05:26:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 16F2E60F9B;
        Wed, 28 Jul 2021 09:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627464371;
        bh=Qv6oknRfy/lFOSK4PBJ3JRHaeIYDqqUboFmgVYep0s0=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=iiaezIF62WzrWubvEwIfGJAnsveT7j1UiYctavK3OaLrAhv3mqrJaCthiPNj0t6AK
         NMWRqjN4VfsHGekMxeNNleS1UhIwkbLoZyP+m5l3wpx8clQj9raMz0xTURkkGXrZvW
         aYWdTZ43e3nqJHQzIAkpNnP15AUj6rw28yfSuWvYtqogxgA8t0nBLtVMnD7oOltHXe
         slHE1lfT/zYg+RiOyH1qy7c/3B2gVW/fZ+dSaqiGOk9NcDEaUVRk11ku6UPnZAE5C0
         JsaXMFOOoSkhSgPcsXUog1J36hgQpsY4NoPgfT4haQrof2E8IXWuvygglFNHWqmsP1
         VNWmgKed+t3zg==
Date:   Wed, 28 Jul 2021 11:26:08 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] HID: fix typo in Kconfig
In-Reply-To: <13c5bff1d50addbb2249b40632fcef0095231ca4.1627052845.git.christophe.jaillet@wanadoo.fr>
Message-ID: <nycvar.YFH.7.76.2107281126030.8253@cbobk.fhfr.pm>
References: <13c5bff1d50addbb2249b40632fcef0095231ca4.1627052845.git.christophe.jaillet@wanadoo.fr>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 23 Jul 2021, Christophe JAILLET wrote:

> There is a missing space in "relyingon".
> Add it.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/hid/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 160554903ef9..76937f716fbe 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -576,7 +576,7 @@ config HID_LOGITECH_HIDPP
>  	depends on HID_LOGITECH
>  	select POWER_SUPPLY
>  	help
> -	Support for Logitech devices relyingon the HID++ Logitech specification
> +	Support for Logitech devices relying on the HID++ Logitech specification
>  
>  	Say Y if you want support for Logitech devices relying on the HID++
>  	specification. Such devices are the various Logitech Touchpads (T650,

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

