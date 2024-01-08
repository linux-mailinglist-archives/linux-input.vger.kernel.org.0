Return-Path: <linux-input+bounces-1162-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C6F8270A4
	for <lists+linux-input@lfdr.de>; Mon,  8 Jan 2024 15:06:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31F801F231CB
	for <lists+linux-input@lfdr.de>; Mon,  8 Jan 2024 14:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644C446B88;
	Mon,  8 Jan 2024 14:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lLAGiGzO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270C846B81;
	Mon,  8 Jan 2024 14:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA426C433D9;
	Mon,  8 Jan 2024 14:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1704722749;
	bh=A3MDVymzkdgqng/BpWHZNJl9Xi/zGuX7UtURlFIHjcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lLAGiGzO4zQ8JbCEd7GIuEr3DXhV7Wc27/IHpeKUX8DuoHMbE9ecd4+AoAlGqmdyD
	 uF35+eQJjIPw4bovTatU1wD9cie5BTxqzIigYWVU6pW+euMHc6YwqoVYxRby+VShTm
	 wvVLWt5rNVlX3LabRTB8ADw7kE0E7mDWOEHQ1JKM=
Date: Mon, 8 Jan 2024 15:05:46 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-input@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vt: remove superfluous CONFIG_HW_CONSOLE
Message-ID: <2024010822-cardstock-nebulizer-c9c9@gregkh>
References: <20240108134102.601-1-lukas.bulwahn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240108134102.601-1-lukas.bulwahn@gmail.com>

On Mon, Jan 08, 2024 at 02:41:02PM +0100, Lukas Bulwahn wrote:
> The config HW_CONSOLE is always identical to the config VT and is not
> visible in the kernel's build menuconfig. So, CONFIG_HW_CONSOLE is
> redundant.
> 
> Replace all references to CONFIG_HW_CONSOLE with CONFIG_VT and remove
> CONFIG_HW_CONSOLE.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> I think this patch is best picked up by Greg rather than splitting it
> in smaller pieces for m68k, amiga keyboard, fbdev etc.
> 
> Greg, if that is fine, could you pick this for the next merge window?

Yes, the "next" one, it's too late for 6.8-rc1, sorry.

I'll look at it after -rc1 is out.

thanks,

greg k-h

