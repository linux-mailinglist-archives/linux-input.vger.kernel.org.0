Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5003D17115E
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2020 08:22:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728389AbgB0HWn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Feb 2020 02:22:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:36866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726999AbgB0HWn (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Feb 2020 02:22:43 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2491324656;
        Thu, 27 Feb 2020 07:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582788162;
        bh=RbDs5D0nGO+vLKC9chqe6xT6asU3XQm2I5A+ZEGGg30=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EeRVSMSKtTKj5BSkvh6pQaXH6NIeNegVZVhesmofU/epROFA3hT4OqohMnHScvyu2
         e5Saj4vzK4x/scPLcc111WKhiJAsL7js91cWKjJJHxIHJy21F7Kjvxqb9sdLNLwFa7
         i5KWB/DcoW699ImceiQkIh28aOI+h7k8iyTJbLio=
Date:   Thu, 27 Feb 2020 08:22:39 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     ycho1399@gmail.com
Cc:     linux-input@vger.kernel.org, voyandrea@gmail.com,
        andrea.ho@advantech.com.tw, oakley.ding@advantech.com.tw,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org
Subject: Re: [V1,1/1] Input/misc: add support for Advantech software defined
 button
Message-ID: <20200227072239.GA293173@kroah.com>
References: <20200227031721.17703-1-Andrea.Ho@advantech.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227031721.17703-1-Andrea.Ho@advantech.com.tw>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Feb 27, 2020 at 03:15:31AM +0000, ycho1399@gmail.com wrote:
> From: "Andrea.Ho" <Andrea.Ho@advantech.com.tw>
> 
> Advantech sw_button is a ACPI event trigger button.
> 
> With this driver, we can report KEY_EVENTs on the
> Advantech Tabletop Network Appliances products and it has been
> tested in FWA1112VC.
> 
> Add the software define button support to report KEY_EVENTs by
> different acts of pressing button (like double-click, long pressed
> and tick) that cloud be get on user interface and trigger the
> customized actions.
> 
> Signed-off-by: Andrea.Ho <Andrea.Ho@advantech.com.tw>
> ---
>  ...define.patch.EXPERIMENTAL-checkpatch-fixes | 554 ++++++++++++++++++
>  MAINTAINERS                                   |   5 +
>  drivers/input/misc/Kconfig                    |  11 +
>  drivers/input/misc/Makefile                   |   2 +-
>  drivers/input/misc/adv_swbutton.c             | 473 +++++++++++++++
>  5 files changed, 1044 insertions(+), 1 deletion(-)
>  create mode 100644 0001-Input-misc-add-support-for-Advantech-software-define.patch.EXPERIMENTAL-checkpatch-fixes
>  create mode 100644 drivers/input/misc/adv_swbutton.c
> 
> diff --git a/0001-Input-misc-add-support-for-Advantech-software-define.patch.EXPERIMENTAL-checkpatch-fixes b/0001-Input-misc-add-support-for-Advantech-software-define.patch.EXPERIMENTAL-checkpatch-fixes
> new file mode 100644
> index 000000000000..45e49aee5b47
> --- /dev/null
> +++ b/0001-Input-misc-add-support-for-Advantech-software-define.patch.EXPERIMENTAL-checkpatch-fixes

<snip>

I doubt you ment to commit the patch itself into the patch :(
