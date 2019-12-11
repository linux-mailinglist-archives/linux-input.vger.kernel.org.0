Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA3BC11AD85
	for <lists+linux-input@lfdr.de>; Wed, 11 Dec 2019 15:33:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729949AbfLKOdL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Dec 2019 09:33:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:37818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729879AbfLKOdJ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Dec 2019 09:33:09 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5EDD920836;
        Wed, 11 Dec 2019 14:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576074788;
        bh=lMF4SVdFYe5teruCSar5UwlZMqXNu/N0r9+0gD8Ka60=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=yCmdZl5DM2uvBmxzfAagmgsJ75JL0KLzwgm++pntwZls8SZjCe1t/YsC5MgXg2nTG
         JP5lXZIDjKtMckfVnVp9Yi5gSKPRZ+CPOj7/bEzwYSC4QqbQWByuadqhj2ik5b6+a2
         j4ptD5uPGOio30igPgWLtsFA1p8B8pGndg2iJw2c=
Date:   Wed, 11 Dec 2019 15:33:05 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Marcel Holtmann <marcel@holtmann.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        abhishekpandit@chromium.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: hidraw: add support uniq ioctl
In-Reply-To: <20191204034109.21944-1-marcel@holtmann.org>
Message-ID: <nycvar.YFH.7.76.1912111532550.4603@cbobk.fhfr.pm>
References: <20191204034109.21944-1-marcel@holtmann.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 4 Dec 2019, Marcel Holtmann wrote:

> Add support for reading out the uniq information from the underlying HID
> device. This might be the iSerialNumber in case of USB or the BD_ADDR in
> case of Bluetooth.
> 
> Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
> ---
>  drivers/hid/hidraw.c        | 9 +++++++++
>  include/uapi/linux/hidraw.h | 1 +
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/hid/hidraw.c b/drivers/hid/hidraw.c
> index bbc6ec1aa5cb..039304069fd0 100644
> --- a/drivers/hid/hidraw.c
> +++ b/drivers/hid/hidraw.c
> @@ -450,6 +450,15 @@ static long hidraw_ioctl(struct file *file, unsigned int cmd,
>  						-EFAULT : len;
>  					break;
>  				}
> +
> +				if (_IOC_NR(cmd) == _IOC_NR(HIDIOCGRAWUNIQ(0))) {
> +					int len = strlen(hid->uniq) + 1;
> +					if (len > _IOC_SIZE(cmd))
> +						len = _IOC_SIZE(cmd);
> +					ret = copy_to_user(user_arg, hid->uniq, len) ?
> +						-EFAULT : len;
> +					break;
> +				}

Queued for 5.6. Thanks,

-- 
Jiri Kosina
SUSE Labs

