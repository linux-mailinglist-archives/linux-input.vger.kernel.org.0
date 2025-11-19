Return-Path: <linux-input+bounces-16225-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D61C71157
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 21:52:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id DCCE528E55
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 20:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F54329E4B;
	Wed, 19 Nov 2025 20:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K9pAnURB"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED00C320CD3;
	Wed, 19 Nov 2025 20:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763585523; cv=none; b=XeUUwFv/o8c5/VDocpIL4zYtP2j13vbtwCg2IP1rgb36LfvxB7u7zEY2iJC66oUJSDzFwv98pcyFDIgA5vGlmhgvSpjw/YW9Y4dWhWowco83WaqPoP225HK4f7DUJ7pCSV9FUfUnEFTBC+QuZFCapi+hGA6t5/zIsjWc8yBzhRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763585523; c=relaxed/simple;
	bh=SKp+XcTfi0WtFPO1GX+ErYo9qHrQz3L11v4H9u1rYJo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MdUUw2s9ZzvY15+ew5nldgjMZukZPzufluE2iNPybZfD1XlnIpdMxuzIzrrwbQ7fj1qDRm+OdQZOBrJJ+AwS7pX3zTRjXwbM81Rdg88r22yPkcmyhQd9HQul0AAPxs7Gtu+Sx2nGdDVPRWQzOjc+AhNYcJEeD46RIxcwghBQI9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K9pAnURB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28759C116B1;
	Wed, 19 Nov 2025 20:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763585522;
	bh=SKp+XcTfi0WtFPO1GX+ErYo9qHrQz3L11v4H9u1rYJo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=K9pAnURBGlX/O/AEnPX2K53eUAozonX1D9PSSYggmK753uXmk6EoUh15g1+1zILS0
	 QSLWSvKlX7K/DGixF0Zq+AjKV0l3+a8rInRh8AeGsUnrs4z0VT4W2aFbUB8IYumFZw
	 gU08+Qrd39IjJClfxWILLV8JYCyuYDmhx8kd3UKVFKTpcmQ6nFxi10fNc8/LxfiHE+
	 JOex+45j7iijIJsrjNxDNIFEaZ/JxSuJKAh5otKt+BHhtgYr3RZQI5roXSMS/b5AkV
	 3oRblXJ4lAFkHPyziEWCZ5FBoxgBrJ8/F0v2WUM7Jbo8XgdsjZs9Eqo5SJU6SceuCZ
	 gEhn5fA6rsBIA==
Date: Wed, 19 Nov 2025 21:51:59 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Oliver Neukum <oneukum@suse.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] hid: hid-pl: handle probe errors
In-Reply-To: <20251119090957.1936249-1-oneukum@suse.com>
Message-ID: <pn15s620-1266-r549-3qr3-70o9025189q5@xreary.bet>
References: <20251119090957.1936249-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Nov 2025, Oliver Neukum wrote:

> Errors in init must be reported back or we'll
> follow a NULL pointer the first time FF is used.
> 
> Fixes: 20eb127906709 ("hid: force feedback driver for PantherLord USB/PS2 2in1 Adapter")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/hid/hid-pl.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-pl.c b/drivers/hid/hid-pl.c
> index 3c8827081dea..dc11d5322fc0 100644
> --- a/drivers/hid/hid-pl.c
> +++ b/drivers/hid/hid-pl.c
> @@ -194,9 +194,14 @@ static int pl_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  		goto err;
>  	}
>  
> -	plff_init(hdev);
> +	ret = plff_init(hdev);
> +	if (ret)
> +		goto stop;
>  
>  	return 0;
> +
> +stop:
> +	hid_hw_stop(hdev);
>  err:

Thanks for the patch, makes sense and I'm going to apply it shortly.

Where is 2/2 though? I don't see it anywhere.

-- 
Jiri Kosina
SUSE Labs


