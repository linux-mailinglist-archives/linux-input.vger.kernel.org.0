Return-Path: <linux-input+bounces-10538-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6387AA4EEB7
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 21:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 434767A37C6
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 20:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54414255250;
	Tue,  4 Mar 2025 20:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mAwy1Ndl"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E9A156C76;
	Tue,  4 Mar 2025 20:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741121271; cv=none; b=bii/wVGR0hGgMJyCWLBgvpQiaG90tSnEjAbr0ThxH223faXmFAbiYUf+wg64JcWoEWgOUurNQwDwWgMtGfk3BakBDiFxfyBEkssPD32Uqe43Fyd5+c1Uc3GU0pjrBFGQae5I6nv3176UHb85UAQIDCWnzBsffR+gei7cxNsmwhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741121271; c=relaxed/simple;
	bh=8YjeZC0STAUEMN8Yn7Msxcjr0MuyyeihkUkLSg6nhMc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FvJJW8Dx6xO6z4n0TNk/WiOSfmjbHd7SVKLUm2JvPv6Pehzpy634oX3fx270DwHLr79oFPSpRDQZidKyoSLyaaLyRcbBfo54AN8SDpTSFgi/ATk/YFod3GZbAyuIp3nuMMTEkURtlZk9Z//BfYe0xcSSSs1xT6voyKO/cfOlDNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mAwy1Ndl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A42C4CEE5;
	Tue,  4 Mar 2025 20:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741121270;
	bh=8YjeZC0STAUEMN8Yn7Msxcjr0MuyyeihkUkLSg6nhMc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mAwy1NdlF7TFfwDvD6XFBEiD+hhzSfNDiL4q6vvOwZy/a8rqaxkcd6S+nf1PYjhWk
	 M3kumpeNG2hlfR9nITKN2aqVMAdfJ3TYJ3O2OYnQUIIhK2j2IRJ0dghNI5oYJtoyL0
	 DSjBDB31Hef1L3daRIAiz5xPhNFNi0SCO1mdNACwwlM9xSlMW5R9SEVNBbPqgkAaSY
	 a19X4rQ7876IBtxkbOfw4wKjbKCYgMjAJKGJ2XrhgfCkDhWitjKisDHKkwognaVxBy
	 OqZQaUo5M6j9KhnTtK/qtCAnidlELKkPPAI5uqZr9GcbGrBjZFSDPNc8JOXWQyCI2D
	 a/GoUrolGagMg==
Date: Tue, 4 Mar 2025 21:47:48 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Colin Ian King <colin.i.king@gmail.com>
cc: Even Xu <even.xu@intel.com>, Xinpeng Sun <xinpeng.sun@intel.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, linux-input@vger.kernel.org, 
    kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: intel-thc-hid: Fix spelling mistake "intput" ->
 "input"
In-Reply-To: <20250228084139.677391-1-colin.i.king@gmail.com>
Message-ID: <771711n0-rnp4-4n94-ps74-481n3nr2sr99@xreary.bet>
References: <20250228084139.677391-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 28 Feb 2025, Colin Ian King wrote:

> There is a spelling mistake in a dev_err_once message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
> index 7373238ceb18..918050af73e5 100644
> --- a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
> +++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
> @@ -107,7 +107,7 @@ static int quickspi_get_device_descriptor(struct quickspi_device *qsdev)
>  		return 0;
>  	}
>  
> -	dev_err_once(qsdev->dev, "Unexpected intput report type: %d\n", input_rep_type);
> +	dev_err_once(qsdev->dev, "Unexpected input report type: %d\n", input_rep_type);
>  	return -EINVAL;

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


