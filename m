Return-Path: <linux-input+bounces-13495-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCA5B01849
	for <lists+linux-input@lfdr.de>; Fri, 11 Jul 2025 11:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88D463B9A5F
	for <lists+linux-input@lfdr.de>; Fri, 11 Jul 2025 09:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD7D279DC5;
	Fri, 11 Jul 2025 09:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="taGRs2Aa"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E659D252292;
	Fri, 11 Jul 2025 09:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752226859; cv=none; b=SUk5zeXW7X+YVdjY2jMhet3BP9VpnGtFG4NaZn/f563JBxU89JQFbSQvwy7K4A1eLaKo3Re0oMQFbwV9/Oq6I1p8gstaC6k1WiVBl5GLOLLN9tGsbLO2qofc/vCBHWIsLRJne6xsPUMJdB1trv0jyV0a6UHJGiX/2hxQqeD2+is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752226859; c=relaxed/simple;
	bh=a35eaIuy9geDI1l3k8b955uTPnCKhmY71YLzZ8WE7X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sK9fUCg2tNiUEopgQG/OOrpYf3miApLp9UP7Q7ONtP3kPv8IThm7JfxbvcIHD5fWQc8NAEYNu1BPU0kiY5kynCZu97MjcpiJBM+MLpEKKecBr4sbx7k8i+IiF1mF9mkoMyAnh6jhcIOyjSdBI/L6qlc0Uy5EJ2RDBnz38WGYx4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=taGRs2Aa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F20C4CEEF;
	Fri, 11 Jul 2025 09:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752226858;
	bh=a35eaIuy9geDI1l3k8b955uTPnCKhmY71YLzZ8WE7X0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=taGRs2AaiUikmNzzwN9vxzg649shOcERtn02aLbQ/GARLsFOjXxeCw9BqKTogEqvB
	 AGZbKtWtIO877L/Zbag0hmin+Txi7nR5ekpejvPSXm/3W3ZVtEhke7RRa/o66si5AT
	 jxSf5azQTIpAk+K+wJjIreq/M2ALPlYBa7a+h8m4gfMTNg20y6ihl/H16Pjc2aLXNM
	 2PaXn7oUtejzbAa44ybiJ+s9AHel8Ad6YVJkdrtT5+kIH1ZrVP9ZAK3Sr6oPAbwrC2
	 T3RVVkk2lPR6DXYaMjq7PMFzsZyuFkCddn0ztnMuqlXfcLjWY5VFn0hBmbMCJbM2Rp
	 CPmAfupEbK7bQ==
Date: Fri, 11 Jul 2025 11:40:54 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Peter Hutterer <peter.hutterer@who-t.net>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: tighten ioctl command parsing
Message-ID: <cznzhmuizk6r3tv7ze6lqp3qoyfnu6ktmbwxbjpsf5phthsjoj@x46mthdr66l7>
References: <20250711072847.2836962-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711072847.2836962-1-arnd@kernel.org>

Hi Arnd,

On Jul 11 2025, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The handling for variable-length ioctl commands in hidraw_ioctl() is
> rather complex and the check for the data direction is incomplete.
> 
> Simplify this code using a switch() statement with the size masked
> out, to ensure the rest of the command is correctly matched.

How much "urgent" you believe this patch is. I would say 6.17 material,
but I'm not sure if your analysis regarding "the check for the data
direction is incomplete." would justify a 6.16 late fix.


Also, lately I added a new tools/testing/selftests/hid/hidraw.c to test
the latest HIDIOCREVOKE addition. I wonder if we should not add a couple
of checks there to ensure we get the different kind of other ioctls
tested before and after this patch.

Cheers,
Benjamin

> 
> Fixes: 9188e79ec3fd ("HID: add phys and name ioctls to hidraw")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/hid/hidraw.c | 123 ++++++++++++++++++-------------------------
>  1 file changed, 50 insertions(+), 73 deletions(-)
> 
> diff --git a/drivers/hid/hidraw.c b/drivers/hid/hidraw.c
> index c887f48756f4..cc657d60d689 100644
> --- a/drivers/hid/hidraw.c
> +++ b/drivers/hid/hidraw.c
> @@ -403,6 +403,8 @@ static long hidraw_ioctl(struct file *file, unsigned int cmd,
>  	struct hidraw *dev;
>  	struct hidraw_list *list = file->private_data;
>  	void __user *user_arg = (void __user*) arg;
> +	struct hid_device *hid;
> +	int len;
>  
>  	down_read(&minors_rwsem);
>  	dev = hidraw_table[minor];
> @@ -453,81 +455,56 @@ static long hidraw_ioctl(struct file *file, unsigned int cmd,
>  				break;
>  			}
>  		default:
> -			{
> -				struct hid_device *hid = dev->hid;
> -				if (_IOC_TYPE(cmd) != 'H') {
> -					ret = -EINVAL;
> -					break;
> -				}
> -
> -				if (_IOC_NR(cmd) == _IOC_NR(HIDIOCSFEATURE(0))) {
> -					int len = _IOC_SIZE(cmd);
> -					ret = hidraw_send_report(file, user_arg, len, HID_FEATURE_REPORT);
> -					break;
> -				}
> -				if (_IOC_NR(cmd) == _IOC_NR(HIDIOCGFEATURE(0))) {
> -					int len = _IOC_SIZE(cmd);
> -					ret = hidraw_get_report(file, user_arg, len, HID_FEATURE_REPORT);
> -					break;
> -				}
> -
> -				if (_IOC_NR(cmd) == _IOC_NR(HIDIOCSINPUT(0))) {
> -					int len = _IOC_SIZE(cmd);
> -					ret = hidraw_send_report(file, user_arg, len, HID_INPUT_REPORT);
> -					break;
> -				}
> -				if (_IOC_NR(cmd) == _IOC_NR(HIDIOCGINPUT(0))) {
> -					int len = _IOC_SIZE(cmd);
> -					ret = hidraw_get_report(file, user_arg, len, HID_INPUT_REPORT);
> -					break;
> -				}
> -
> -				if (_IOC_NR(cmd) == _IOC_NR(HIDIOCSOUTPUT(0))) {
> -					int len = _IOC_SIZE(cmd);
> -					ret = hidraw_send_report(file, user_arg, len, HID_OUTPUT_REPORT);
> -					break;
> -				}
> -				if (_IOC_NR(cmd) == _IOC_NR(HIDIOCGOUTPUT(0))) {
> -					int len = _IOC_SIZE(cmd);
> -					ret = hidraw_get_report(file, user_arg, len, HID_OUTPUT_REPORT);
> -					break;
> -				}
> -
> -				/* Begin Read-only ioctls. */
> -				if (_IOC_DIR(cmd) != _IOC_READ) {
> -					ret = -EINVAL;
> -					break;
> -				}
> -
> -				if (_IOC_NR(cmd) == _IOC_NR(HIDIOCGRAWNAME(0))) {
> -					int len = strlen(hid->name) + 1;
> -					if (len > _IOC_SIZE(cmd))
> -						len = _IOC_SIZE(cmd);
> -					ret = copy_to_user(user_arg, hid->name, len) ?
> -						-EFAULT : len;
> -					break;
> -				}
> -
> -				if (_IOC_NR(cmd) == _IOC_NR(HIDIOCGRAWPHYS(0))) {
> -					int len = strlen(hid->phys) + 1;
> -					if (len > _IOC_SIZE(cmd))
> -						len = _IOC_SIZE(cmd);
> -					ret = copy_to_user(user_arg, hid->phys, len) ?
> -						-EFAULT : len;
> -					break;
> -				}
> -
> -				if (_IOC_NR(cmd) == _IOC_NR(HIDIOCGRAWUNIQ(0))) {
> -					int len = strlen(hid->uniq) + 1;
> -					if (len > _IOC_SIZE(cmd))
> -						len = _IOC_SIZE(cmd);
> -					ret = copy_to_user(user_arg, hid->uniq, len) ?
> -						-EFAULT : len;
> -					break;
> -				}
> -			}
> +			break;
> +	}
>  
> +	hid = dev->hid;
> +	switch (cmd & ~IOCSIZE_MASK) {
> +	case HIDIOCSFEATURE(0):
> +		len = _IOC_SIZE(cmd);
> +		ret = hidraw_send_report(file, user_arg, len, HID_FEATURE_REPORT);
> +		break;
> +	case HIDIOCGFEATURE(0):
> +		len = _IOC_SIZE(cmd);
> +		ret = hidraw_get_report(file, user_arg, len, HID_FEATURE_REPORT);
> +		break;
> +	case HIDIOCSINPUT(0):
> +		len = _IOC_SIZE(cmd);
> +		ret = hidraw_send_report(file, user_arg, len, HID_INPUT_REPORT);
> +		break;
> +	case HIDIOCGINPUT(0):
> +		len = _IOC_SIZE(cmd);
> +		ret = hidraw_get_report(file, user_arg, len, HID_INPUT_REPORT);
> +		break;
> +	case HIDIOCSOUTPUT(0):
> +		len = _IOC_SIZE(cmd);
> +		ret = hidraw_send_report(file, user_arg, len, HID_OUTPUT_REPORT);
> +		break;
> +	case HIDIOCGOUTPUT(0):
> +		len = _IOC_SIZE(cmd);
> +		ret = hidraw_get_report(file, user_arg, len, HID_OUTPUT_REPORT);
> +		break;
> +	case HIDIOCGRAWNAME(0):
> +		len = strlen(hid->name) + 1;
> +		if (len > _IOC_SIZE(cmd))
> +			len = _IOC_SIZE(cmd);
> +		ret = copy_to_user(user_arg, hid->name, len) ?  -EFAULT : len;
> +		break;
> +	case HIDIOCGRAWPHYS(0):
> +		len = strlen(hid->phys) + 1;
> +		if (len > _IOC_SIZE(cmd))
> +			len = _IOC_SIZE(cmd);
> +		ret = copy_to_user(user_arg, hid->phys, len) ?  -EFAULT : len;
> +		break;
> +	case HIDIOCGRAWUNIQ(0):
> +		len = strlen(hid->uniq) + 1;
> +		if (len > _IOC_SIZE(cmd))
> +			len = _IOC_SIZE(cmd);
> +		ret = copy_to_user(user_arg, hid->uniq, len) ?  -EFAULT : len;
> +		break;
> +	default:
>  		ret = -ENOTTY;
> +		break;
>  	}
>  out:
>  	up_read(&minors_rwsem);
> -- 
> 2.39.5
> 

