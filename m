Return-Path: <linux-input+bounces-15911-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2ADC3C979
	for <lists+linux-input@lfdr.de>; Thu, 06 Nov 2025 17:54:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 73B094E37F4
	for <lists+linux-input@lfdr.de>; Thu,  6 Nov 2025 16:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619D82D77E2;
	Thu,  6 Nov 2025 16:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yp9lJ7tq"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300491F3FE2;
	Thu,  6 Nov 2025 16:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762447819; cv=none; b=FEBfwcJuCcJ8Fsa68fBcEYv2MvXEoKzp9Wx+68k29lIV7CzQUs4tCIVSUGyGoQChW8wxDKHXw3661y32+rjUSCle9h/vzX959MsqR2L6JiSQ7JWgmHr6XfWyK9c4lMOxCDyEkEh8W8K2Ar4z9T76R2XdJ1aCbu1+scwKfkSnqfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762447819; c=relaxed/simple;
	bh=KvdyJmvekEWVawBMqqcnfBNzoN1YlmW5ezzpgau2uyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=btm/F5UjBE9Wo0bPRqmCM7ceoNkwzhv8hWSZNEoann3qVcrOaVCU8/NgMt585rmF6RxyuTHTQk5sgQ6bWlkkF0He/FfbkLGNR225cx0nG420/8AQ2srAYd77BHyeRFOkmBVZMr+2JDCFIki5OLgdCX1MAExgZMHmtBIUXxCgcRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yp9lJ7tq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF29C4CEF7;
	Thu,  6 Nov 2025 16:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762447818;
	bh=KvdyJmvekEWVawBMqqcnfBNzoN1YlmW5ezzpgau2uyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yp9lJ7tqI8vf0yB/lK4EA3ElNlFcFpG6Y0sbl0FWcpmze7ZSF1LCZj4hs7J2CfXtj
	 o6hAygtWhl1d6j7Y+406ADdmYNNKkVzvj+usFKWymIT81yeJQmww9hmubxEZzaEolv
	 /rMpLx59dvsu8EwhOBjR2zZ3BuC2ynnW10B0H1ZAPVUDfrUKlUWYWeCbFJHh4NvWYM
	 7/bewPGPnB4w0/MX8iy/O5nv9tIuRw/U/z/6XUECoBkijZWyVmHtPJf5djFX5pVwL3
	 8qUgc1bO04gQYc5xonohcsKtcEs2IST5ejuNuv8fi36qQzK7flWBpJGJjKYcWrLhOJ
	 vkh5aYmHMa9Dg==
Date: Thu, 6 Nov 2025 17:50:13 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hid/hid-multitouch: Keep latency normal on deactivate
 for reactivation gesture
Message-ID: <s2pc7whgvrwaldkgkle4ydkyc26q75senkmtesv57du6x7bxoa@mq3ght3dksdr>
References: <20251106154636.985427-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106154636.985427-1-wse@tuxedocomputers.com>

On Nov 06 2025, Werner Sembach wrote:
> Uniwill devices have a built in gesture in the touchpad to de- and
> reactivate it by double taping the upper left corner. This gesture stops
> working when latency is set to high, so this patch keeps the latency on
> normal.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
> Or should I better implement this as a quirk?

Yeah, I guess a quirk would be appreciated. The high latency on close
was introduced on purpose for saving energy purpose. So this patch is
rather not nice for those systems where it matters.

Cheers,
Benjamin

> 
>  drivers/hid/hid-multitouch.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 179dc316b4b51..df64cb6c41699 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -1998,7 +1998,7 @@ static void mt_on_hid_hw_open(struct hid_device *hdev)
>  
>  static void mt_on_hid_hw_close(struct hid_device *hdev)
>  {
> -	mt_set_modes(hdev, HID_LATENCY_HIGH, TOUCHPAD_REPORT_NONE);
> +	mt_set_modes(hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_NONE);
>  }
>  
>  /*
> -- 
> 2.43.0
> 

