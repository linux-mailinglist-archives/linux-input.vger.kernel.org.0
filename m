Return-Path: <linux-input+bounces-11966-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1FEA9A91F
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 11:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3B66466EF2
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 09:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9CB186A;
	Thu, 24 Apr 2025 09:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YOI7yZga"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CCC85931;
	Thu, 24 Apr 2025 09:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745488485; cv=none; b=uvP6aECU0chgdmeZ3LTcSiSK+YbMpLqupkWVyzM62VS9rg8PFIBTB1yCTuBhCWK4A0Oje99x5eK+c2Y6GV5zBT54aPlbTa/ucdvdaCywBGrxXuRXTalFlIhh2e7YtGgqU9UCUR6m4RqhtbaffnUtWLLAiIIr27O9fglWwtNaOQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745488485; c=relaxed/simple;
	bh=0jd23SVOOLUSpDIZ1qV++pO7HM+TcwBWFJ7gJIkNaI8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=U8bTpY1r+eRzexix8+mdtKMOKHLhViq6sCn3dgCtXGFkvtf2gsjr/kOiqL8Tff8i0OMOSYgt/rSeNNOZmYnO80Lrt/Hx7ftz5FZsIFHmYFC+trHCstFHT/ThI88QYSmPy6LEgnfvl658Z6/y/yZ0w7d6yFAF2oelT32CImmFv/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YOI7yZga; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79011C4CEE3;
	Thu, 24 Apr 2025 09:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745488484;
	bh=0jd23SVOOLUSpDIZ1qV++pO7HM+TcwBWFJ7gJIkNaI8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YOI7yZgao3/QIhCaQL7Hw7CUTx1OwVs2cU68NSUFg+zAUpOiqThBqzzueUbw2UEFz
	 394VOHCMr4Ez5L3DHWMReljuD66IGbXaQru7Zx0sx23NMMaE61+hOST/L+uwKq7e+z
	 ejeElOh/fUGLNehfyMznM2WkB9kUdOkJOnR/vQOExTxFbW5Za4wzvIZTGrhOYhd2oY
	 xavZYjyt+DeJGZNfiCpt1pmENsRdVs0VGNY9PaBoSXCh0PHzKOP1JZMETNxh8ah8Py
	 uI2G1Hor3nKHFv1ocWCv29qLHzD4YiWp9jT0KMsv3qSCn1u1K3Uyj52NkjS5J5CpFN
	 VmC3Xysq60aFQ==
Date: Thu, 24 Apr 2025 11:54:42 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Qasim Ijaz <qasdev00@gmail.com>
cc: ping.cheng@wacom.com, jason.gerecke@wacom.com, bentiss@kernel.org, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] HID: wacom: fix memory leak on size mismatch in
 wacom_wac_queue_flush()
In-Reply-To: <20250414183309.11460-1-qasdev00@gmail.com>
Message-ID: <4n6pq9np-r49s-84o9-89q3-1021ssq14qsn@xreary.bet>
References: <20250414183309.11460-1-qasdev00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 14 Apr 2025, Qasim Ijaz wrote:

> In wacom_wac_queue_flush() the code allocates zero initialised
> buffer which it uses as a storage buffer for copying data from
> a fifo via kfifo_out(). The kfifo_out() function returns the
> number of elements it has copied. The code checks if the number
> of copied elements does not equal the size of the fifo record,
> if it does not it simply skips the entry and continues to the
> next iteration. However it does not release the storage buffer
> leading to a memory leak.
> 
> Fix the memory leak by freeing the buffer on size mismatch.
> 
> Fixes: 5e013ad20689 ("HID: wacom: Remove static WACOM_PKGLEN_MAX limit")
> Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> ---
>  drivers/hid/wacom_sys.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> index 666b7eb0fdfe..3e4f823f8ee8 100644
> --- a/drivers/hid/wacom_sys.c
> +++ b/drivers/hid/wacom_sys.c
> @@ -87,6 +87,7 @@ static void wacom_wac_queue_flush(struct hid_device *hdev,
>  			// to flush seems reasonable enough, however.
>  			hid_warn(hdev, "%s: removed fifo entry with unexpected size\n",
>  				 __func__);
> +			kfree(buf);
>  			continue;
>  		}
>  		err = hid_report_raw_event(hdev, HID_INPUT_REPORT, buf, size, false);

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


