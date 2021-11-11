Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E79844D3CA
	for <lists+linux-input@lfdr.de>; Thu, 11 Nov 2021 10:10:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbhKKJNI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Nov 2021 04:13:08 -0500
Received: from todd.t-8ch.de ([159.69.126.157]:40207 "EHLO todd.t-8ch.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229543AbhKKJNH (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Nov 2021 04:13:07 -0500
Date:   Thu, 11 Nov 2021 10:10:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1636621817;
        bh=jR20svMKeNsXprIZydpXZd6rzkZgzz81Jni1kX7WXgY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wy27b7kTryB/DrGHNVEQgMnJtF092YEalLJYEi+EJzUSNp9X+W/KH7y47BJLP4m7D
         +MEX8jI0y7Tk5jjydOjSCi96TIJXKFd1vi8CKtCsWnCb9B0a1KrJVxOLDLpFxLXLTp
         gy71S1kFgMnDIL6xhS6ORwuhoi6n7X3YpSdpevcY=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To:     Nathan Chancellor <nathan@kernel.org>, linux-input@vger.kernel.org,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>, llvm@lists.linux.dev,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/4] HID: intel-ish-hid: fw-loader: constify devicetable
 initializer
Message-ID: <fa7795d5-0f53-4a8d-b55b-454c8cdfa710@t-8ch.de>
References: <YYv22iWQ7yTfMNC5@archlinux-ax161>
 <20211110230043.701167-1-linux@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211110230043.701167-1-linux@weissschuh.net>
Jabber-ID: thomas@t-8ch.de
X-Accept: text/plain, text/html;q=0.2, text/*;q=0.1
X-Accept-Language: en-us, en;q=0.8, de-de;q=0.7, de;q=0.6
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 2021-11-11 00:00+0100, Thomas Weißschuh wrote:
> Previously the compilation broke on clang and gcc < 8.1.0 with errors like
> "error: initializer element is not constant".
> 
> Fixes: 44e2a58cb880 ("HID: intel-ish-hid: fw-loader: only load for matching devices")
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
>  drivers/hid/intel-ish-hid/ishtp-fw-loader.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
> index 945a9d0b68cd..26f376faf0e6 100644
> --- a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
> +++ b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
> @@ -76,9 +76,9 @@ enum ish_loader_commands {
>  #define LOADER_XFER_MODE_ISHTP			BIT(1)
>  
>  /* ISH Transport Loader client unique GUID */
> -static const guid_t loader_ishtp_guid =
> -	GUID_INIT(0xc804d06a, 0x55bd, 0x4ea7,
> -		  0xad, 0xed, 0x1e, 0x31, 0x22, 0x8c, 0x76, 0xdc);
> +#define ISHTP_GUID GUID_INIT(0xc804d06a, 0x55bd, 0x4ea7, \
> +		  0xad, 0xed, 0x1e, 0x31, 0x22, 0x8c, 0x76, 0xdc)
> +static const guid_t loader_ishtp_guid = ISHTP_GUID;
>  
>  #define FILENAME_SIZE				256
>  
> @@ -1064,7 +1064,7 @@ static struct ishtp_cl_driver	loader_ishtp_cl_driver = {
>  };
>  
>  static const struct ishtp_device_id loader_ishtp_id_table[] = {
> -	{ loader_ishtp_guid },
> +	{ ISHTP_GUID },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(ishtp, loader_ishtp_id_table);
> 
> base-commit: 64355db3caf6468dc711995239efe0cbcd7d0091
> -- 
> 2.33.1
> 

Please drop this whole series and use the patch
"HID: intel-ish-hid: fix module device-id handling"[0]
from Arnd instead.

It adds proper device table support to the ISHTP bus itself also preventing
unused-variable warnings for the device table when the drivers are built-in.

Thanks,
Thomas

[0] https://lore.kernel.org/lkml/20211111085842.2846422-1-arnd@kernel.org/
