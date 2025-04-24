Return-Path: <linux-input+bounces-11965-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1FFA9A916
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 11:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 389C23A87A6
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 09:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D2B41F4188;
	Thu, 24 Apr 2025 09:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G6aF0kmb"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D69A1EDA35;
	Thu, 24 Apr 2025 09:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745488426; cv=none; b=StVZktMr0UyarrJHT0VVDs6yEzRvIMhFiJ7hequ3SrY29Dx1UuHFoStxGp1+4i5h91gJv0dCiXdm1gClwBjWLurJO8FvoSSbBVub13DJr4GFJXcG8kEfc6VfFmtEFrMRz0F0rByHovruRzZgNSsBh9zBNwXf3+6Z/dflbil+/uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745488426; c=relaxed/simple;
	bh=Kf3sD9YNojFkQuv/bmYxCNWVzyVLIGYklDeXpqeXHdY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DeQZcGQdvt4fjlmr8mhKVZUYSqOtjZSPW6EIwRBLG9Qq/uQOurBG2GkCQFomRSRY6wxoVwYSyEsD3UAC6Y6u/PDQP0bc09qMss84IvHhP6yl0zw8xFpw0Wxb6iQoatNpxu1z2euPtJg10RN7Gm7qo+aulZzRrhA2EdtnY7+HF60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G6aF0kmb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF9FC4CEE3;
	Thu, 24 Apr 2025 09:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745488426;
	bh=Kf3sD9YNojFkQuv/bmYxCNWVzyVLIGYklDeXpqeXHdY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=G6aF0kmbdwZ0RSyFJDCEHZyKhVQSrWB4stsZiRH2hM0QJdyPwCvUePkSRrUsdD0Vt
	 4C4uIvxZSyASMxjapLZtOZLKmALM630p+NmnSbvxWKMtRqtoT7lcroFypuh/Nb+UDJ
	 T2XGl/4e0OyJeV/rc008amANtPjlVN1iIs/iPLQYuQXIKY/BGMk5Jk5MesQVnt0ANC
	 KI7zEyFekyANbVf6NdlZUW+ivfJTu2I4wBMNjnxP7Aut2XLXLCGtvgnca2qs/8ONdR
	 ghFLaZoqsgU0Ntcoct6K/6NwjXwxD501tVyA/OM5qabsbl5GFbUfYTBhwgVtwil8hF
	 p882Xi+1o5a1g==
Date: Thu, 24 Apr 2025 11:53:43 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Qasim Ijaz <qasdev00@gmail.com>
cc: ping.cheng@wacom.com, jason.gerecke@wacom.com, bentiss@kernel.org, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: wacom: handle kzalloc() allocation failure in
 wacom_wac_queue_flush()
In-Reply-To: <20250329002003.36600-1-qasdev00@gmail.com>
Message-ID: <247781nr-qp6o-94q0-nq26-1sq70287r9r9@xreary.bet>
References: <20250329002003.36600-1-qasdev00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 29 Mar 2025, Qasim Ijaz wrote:

> During wacom_wac_queue_flush() the code calls 
> kzalloc() to allocate a zero initialised buffer 
> which it uses as a storage buffer to get data 
> from the fifo via kfifo_out(). However it does not
> check kzalloc() for allocation failure which returns 
> NULL and could potentially lead to a NULL deref.
>  
> Fix this by checking for kzalloc() failure and skipping
> the current entry if allocation failure occurs.
> 
> Fixes: 5e013ad20689 ("HID: wacom: Remove static WACOM_PKGLEN_MAX limit")
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> ---
>  drivers/hid/wacom_sys.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> index 97393a3083ca..666b7eb0fdfe 100644
> --- a/drivers/hid/wacom_sys.c
> +++ b/drivers/hid/wacom_sys.c
> @@ -70,10 +70,16 @@ static void wacom_wac_queue_flush(struct hid_device *hdev,
>  {
>  	while (!kfifo_is_empty(fifo)) {
>  		int size = kfifo_peek_len(fifo);
> -		u8 *buf = kzalloc(size, GFP_KERNEL);
> +		u8 *buf;
>  		unsigned int count;
>  		int err;
>  
> +		buf = kzalloc(size, GFP_KERNEL);
> +		if (!buf) {
> +			kfifo_skip(fifo);
> +			continue;
> +		}
> +
>  		count = kfifo_out(fifo, buf, size);
>  		if (count != size) {
>  			// Hard to say what is the "right" action in this

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


