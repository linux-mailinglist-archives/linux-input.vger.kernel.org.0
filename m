Return-Path: <linux-input+bounces-14797-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC28BB7D216
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 14:20:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D3523BB0F1
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 09:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EDD30C341;
	Wed, 17 Sep 2025 09:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="so7XiTxO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E28EEBD;
	Wed, 17 Sep 2025 09:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758102703; cv=none; b=eW0a/2ogpzr/Guxr2KGkfqS/hX+NdMvwaEjxsvFHWVkNGrsfjgp4lNXBaKq0+S7/C5wk4PD6RxbZmW8cB5b84HJLjqtOdqJu4hBCMJSRiczbry7Olt160I3LU5InLGNDJqkw1soRc/Y4TiqSWkvSaDnIaHp4ao5rGh/gSSgJUBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758102703; c=relaxed/simple;
	bh=8J4tD3WezGFvLQ7eQ6sV1btWqMNPBtvPGxyAHuy2lV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qTJm9nLx+n6EnJVEOQMaQZZT3N4ALzVgnHlppFr7GQU25zsqfuybqoWl+ZkEBdXsDD9dKu+nPUs88oXP401OfjuX+JmSlHU7qz1aMhGGgbIu3pCQI0MXfHfT5t9UARbS8+y8vzJhQFUrZwmBv4pBS3iG3JIxKNqOZqTGGyjZyQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=so7XiTxO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 689CDC4CEF0;
	Wed, 17 Sep 2025 09:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758102702;
	bh=8J4tD3WezGFvLQ7eQ6sV1btWqMNPBtvPGxyAHuy2lV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=so7XiTxOuNnP08p1xd/GOooo+aWnvf5FqzZ7dajH2KA5f87cYwP8ht1kjoVhoZEdK
	 3yS7VgByF9zDTPjQtukrNGqS2cEFyv06NAmPfqjLNUc7Jmo8otSfYep0EHwGQ7i5N/
	 p9ge+zoKlXLQGd9bP7iZTsOhJsMxny8CElajcyRnmQpON5UmBJeqgbvLxTNl9AFQNu
	 KrDww3omSjbr0M7cDMEd4VD1w8j11fJzgJztGsVx/V7cFZNAnh5N8JcvpDm9CPLH2l
	 HUHdHKUWuxlAFggIQjPH9NbSJQJT0u8wkaosghYQDy9W0oi9vMHFw8ipFGcBPHCpLz
	 y9rv9Xdz7gzRA==
Date: Wed, 17 Sep 2025 11:51:36 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, a.hindborg@kernel.org, 
	alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
	db48x@db48x.net, gary@garyguo.net, ojeda@kernel.org, tmgross@umich.edu, 
	peter.hutterer@who-t.net
Subject: Re: [PATCH v3 RESEND RESEND 1/3] HID: core: Change hid_driver to use
 a const char* for name
Message-ID: <bk7rp5zyw6n4txhgbyq4gi3cegi6fkwhvkk7gdvtqp3en7uidu@wgaohfzkp4i2>
References: <20250913161222.3889-1-sergeantsagara@protonmail.com>
 <20250913161222.3889-2-sergeantsagara@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250913161222.3889-2-sergeantsagara@protonmail.com>

On Sep 13 2025, Rahul Rameshbabu wrote:
> name is never mutated by the core HID stack. Making name a const char*
> simplifies passing the string from Rust to C. Otherwise, it becomes
> difficult to pass a 'static lifetime CStr from Rust to a char*, rather than
> a const char*, due to lack of guarantee that the underlying data of the
> CStr will not be mutated by the C code.
> 
> Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>

While we figure out the rest, I'm queueing this one patch in my test
setup and will probably merge it for 6.18. This way, the rest of the
series is purely rust and doesn't depend on anything on the HID tree.

Cheers,
Benjamin

> ---
>  include/linux/hid.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/hid.h b/include/linux/hid.h
> index 568a9d8c749b..d65c202783da 100644
> --- a/include/linux/hid.h
> +++ b/include/linux/hid.h
> @@ -816,7 +816,7 @@ struct hid_usage_id {
>   * zero from them.
>   */
>  struct hid_driver {
> -	char *name;
> +	const char *name;
>  	const struct hid_device_id *id_table;
>  
>  	struct list_head dyn_list;
> -- 
> 2.47.2
> 
> 

