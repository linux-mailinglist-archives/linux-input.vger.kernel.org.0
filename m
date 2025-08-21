Return-Path: <linux-input+bounces-14227-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DDDB2EEDD
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 08:58:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BB34171B48
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 06:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2D32E88B3;
	Thu, 21 Aug 2025 06:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iyD74Lzo"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89972E88AA;
	Thu, 21 Aug 2025 06:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755759397; cv=none; b=SBGWvzyG4riRtfl/IgSQdL0xvUDeNHEMrUQgdAX8l54XPyv1IyFSsFXQRmQCW0fDzFYptkUgTxNf+w0NyEH1uhIMNRGovCDu3O360fSTmuJkG/1a66WTAzm4YQu0fd26G9aaUDbKmXqUHhl4R7cuTERYeASvIGSL8fMFher4cY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755759397; c=relaxed/simple;
	bh=zqrGrPWDA12jmUEme9JEM61Z57Zt0G3OsRiJIV/ySg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fC3PX9rJZqtOe4JMB1m3CjEgVHGJaaX/x06rzP8wvzeiZBnEtqIkN8SRge0m13jinHh+aGNItQ7VT+wl1/qlcsjsooH9j1QFeyQDmVRYHiNP9OJm5158KEFnprh/simyaHSkdtncywObLKroiv5mjDnIan6Ih9Rc76M3dkmfpkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iyD74Lzo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4885BC4CEED;
	Thu, 21 Aug 2025 06:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755759396;
	bh=zqrGrPWDA12jmUEme9JEM61Z57Zt0G3OsRiJIV/ySg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iyD74Lzovz2uZ37J4b4iVwSRutyTD5uROxOH5k+6sgLAvyYukgeA2hCLgd3ndqtMW
	 OFlBfsH/Y9kzH8m9jlDM+H0jD0JcAq13uHfx0VWQ/Jb0gP6Kz//kCjmefmvxbG/XJ1
	 34WSX6rfdlbYEC0STStRrB4TIJ8TFNv8q2vAM+Kf+Fo/RMPcXj/YEkc+Anberg8f6f
	 PcCzKzU23I8yTr9BjGcqrMka1ohTzTBsoJA4ngskzpnXZs7WQwgL9yFftqNnd2xNut
	 BIVDOdeXnaEMcgrK0aItlIF78GdE2/gHgjNZ0QDNCV13XSasmCQjA94losjyl05K5u
	 qaD3nEIEq+Z0w==
Date: Thu, 21 Aug 2025 08:56:32 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Peter Hutterer <peter.hutterer@who-t.net>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: tighten ioctl command parsing
Message-ID: <tsvy2y4x7xaut6y7fykuc7ltdf777rt2g32zt2biagts6hgjub@iidwntp527og>
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

On Jul 11 2025, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The handling for variable-length ioctl commands in hidraw_ioctl() is
> rather complex and the check for the data direction is incomplete.
> 
> Simplify this code using a switch() statement with the size masked
> out, to ensure the rest of the command is correctly matched.
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

Jiri pinged me about this one, and I gave it a go with the existing
tests I have in selftests... and turns out that this changes the logic
of the ioctl processing.

The removed block was in the default section of the switch/case
statement. Now it's added *after*, meaning that any ioctl that was
normally processed before are now caught in the default of the switch
statement below and return -ENOTTY.

Running tools/testing/selftests/hid/hid_bpf showed that.

Cheers,
Benjamin

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

