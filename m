Return-Path: <linux-input+bounces-15800-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF8DC1FAA3
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 11:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEC183B2536
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 10:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69469351FD5;
	Thu, 30 Oct 2025 10:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GzQksU+6"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9FF351FCA;
	Thu, 30 Oct 2025 10:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761821810; cv=none; b=g3iricvierTp941IJLkhEyA9W9Gli5lRNVkocwIZcNP0FrAq2oEPEKLYsQms2Lj7mdiQuv8y0EAJ175cn6XEuUE+3EVQdQYQdYMFzFg57LZcBPA8v7WWl35QQZXk4sM4zkQCcne08h7TdVwxIx0JB+buFYwZSxYGwGSx2qYhv8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761821810; c=relaxed/simple;
	bh=ICa0jBeLDYTp1OFS3sONiqerMGPweNYYRFQJBtI1vqw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dLJVq+9Q19tUgfXjNQFnW7fHmB4nt71+vDxYXppAnu8nPJSwVwutYMeB6EuXTDw8QihXeOJdQmeZMw7zguYZV2sXvBbybwTfKw+CvYKFzKfhx2k4bYnB79yMmIJN1bm9DIDyru/bJtBvXDwK0P6mwd2n44Va+0o1rzrQ4kcOx4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GzQksU+6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6735AC4CEF1;
	Thu, 30 Oct 2025 10:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761821809;
	bh=ICa0jBeLDYTp1OFS3sONiqerMGPweNYYRFQJBtI1vqw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GzQksU+6MmjMFHlx0H7HwsF36RUc8ZhHbOEuEbfp5tbN4Zi6vDSL16EIkwhGC/ekw
	 A59wkFGYnEPWkr1uDEIMtscEtzRYLGYZ0x9ZzKeecho3pkM7vgIf2d6W/bJZ3qI/+s
	 lJ3XywzOxRR4K7Fzadj5SJn3EOelKB1YUNLe0e0iW6tnhIhO73L9bjI4RoGXK1fK/U
	 O8RaJCOlTpavyJnl6ox+NXRu6sPXrh1Myyb4OI7IYfITkrFYg3IS06ucqVm8Hf2S7r
	 hRY4RTQo9qciutKWbWH+6RJnaPOQhq94zJcr/Kfp3Gs/5lHrZcBzLi50/mtcyksRUp
	 LqvnLuqlLUBpw==
Date: Thu, 30 Oct 2025 11:56:47 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: April Grimoire <april@aprilg.moe>
cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: apple: Add SONiX AK870 PRO to non_apple_keyboards
 quirk list
In-Reply-To: <20251022163726.19667-1-april@aprilg.moe>
Message-ID: <2o2no85n-8s8s-9355-7s78-p954496s741o@xreary.bet>
References: <20251022163726.19667-1-april@aprilg.moe>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Oct 2025, April Grimoire wrote:

> SONiX AK870 PRO keyboard pretends to be an apple keyboard by VID:PID,
> rendering function keys not treated properly. Despite being a
> SONiX USB DEVICE, it uses a different name, so adding it to the list.
> 
> Signed-off-by: April Grimoire <april@aprilg.moe>
> ---
>  drivers/hid/hid-apple.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
> index 61404d7a4..57da4f86a 100644
> --- a/drivers/hid/hid-apple.c
> +++ b/drivers/hid/hid-apple.c
> @@ -355,6 +355,7 @@ static const struct apple_key_translation swapped_fn_leftctrl_keys[] = {
>  
>  static const struct apple_non_apple_keyboard non_apple_keyboards[] = {
>  	{ "SONiX USB DEVICE" },
> +	{ "SONiX AK870 PRO" },
>  	{ "Keychron" },
>  	{ "AONE" },
>  	{ "GANSS" },

Appplied, thanks.

-- 
Jiri Kosina
SUSE Labs


