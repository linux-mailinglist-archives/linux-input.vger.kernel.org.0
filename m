Return-Path: <linux-input+bounces-7595-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1949A7317
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 21:20:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E11C31C21718
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 19:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501E61E1A3B;
	Mon, 21 Oct 2024 19:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zf2Y+SZP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B981EEE0;
	Mon, 21 Oct 2024 19:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729538407; cv=none; b=WbGUgougihCDi5xCo85MzU9GXlNPV9nQ0pW8bshWKz/ISezc5nP0+AQCgm1s2VLUTQbA9JN0h8fzV25DjGpZuakHn9cSRp/Gs5nqVZYEscW06SxL7V8qrodEwt/eDdhEYokFO2M8nXd6XFVhjfERj5G/A8PENtCvYST6rZxUv/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729538407; c=relaxed/simple;
	bh=GWxkYAuvukyefP09m8Gddhyv3iaEYaD+YF6g2gQsNqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2dlr3xY59iUAJrsp1gO9qR3Awlk0nUbnGrWAMDXs5qgcXsB6T9/HylAat2FydSklh5EP0ZU14jEpqWa60cHOtKorzGjj8zDFUdG27WChTmAHk00v9h9jyeE0E5DGzpakO7yH6UvekxYFDkB/z4qorzjsIQVGA6See57EYnhbm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zf2Y+SZP; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20c803787abso37447565ad.0;
        Mon, 21 Oct 2024 12:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729538405; x=1730143205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kF6W/N0f3ub28cEyMJY1MkQjoOhW/feAG72HvSg2jb0=;
        b=Zf2Y+SZP2kaRzD/1XmY30Sppof4zpTjvGfq3ZqjY59Vd6TBuTAviHBrEI5qYFpujnf
         TlTaIi23zWXRR/4rWa/b2uFuweLStW9Iyph7a7f1/OHg+g9bRtXbM0yXJlxcpX673zsI
         zAIz73tM7Wce23bmyUvyyx1jZMZLXaTeU89j9LAz67O0vPGjZ1RQNbtb/JHtdeAW54b2
         xMoEDGVPr8E6TTlOcIoNpX9o9OfP1T/k+mCwymZEKiG7TWe02GPJzLnIHoh9rRnuYaVW
         yHxH/RJcyQYdCwPnuLjYf/E4PkFj6VWz+LZMYMbZsXGKEZ/pvsE3UhOaXuZE97sROlzI
         TqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729538405; x=1730143205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kF6W/N0f3ub28cEyMJY1MkQjoOhW/feAG72HvSg2jb0=;
        b=AedIlFxMbx9niNgpNohEivB8CcbrK8RCYuwbGD0Hj+l+bYzFbdbS7GiOQ0ucJlzfqA
         EuVCAeTx1Vwd3ilWBUgpjh6uY3iW4lC6qyPCHzG87RaseaZ2FuX0SXUegj0VCSH5hrFh
         12TteVs771sgmo4edHUNy+c55SzbkofYuivBXvXyQlzdC4K26MqjQudxLjDtti55l1JA
         2w2ZL393hPTdDaGIE/Tr0FtwhD5iVWK3je0tD8Otg+ssj9mGZEqmYqrbBLjfLGauC2O+
         iGFq2dV8k4NC8BPRPPtmxWWygGpgZKNO9h4+dFZXi2b01FUgDvyLEtP8SoZUxUkTjzhv
         3oyA==
X-Forwarded-Encrypted: i=1; AJvYcCUiOHdEZLywH79vsNjdACDoEtVuq6NGqLBpjyfw2PTveJWjJs53kHNjI7qHIzwzXJpMFqpfUHXl26bmC/SsaDo=@vger.kernel.org, AJvYcCV9oXoJcGpWLzXOuaDtYbFFFVq/bixP/CxinUboug6MZ6EA5ShArBsR+REHrj3yFVWOVowtEOwrHAoC9y4W@vger.kernel.org
X-Gm-Message-State: AOJu0YxBUpur9Ds3dLCO6SJTp0Wk4sU+Lu+KiiLJnwqZTjKiwo7TglW5
	GzqvuJjk2uDS0qbFpG/r8E63b44W0fxKwYoMYBOqd+t3+4XAfrG889afwA==
X-Google-Smtp-Source: AGHT+IFiu/V+Al6AnpH1978JIRIl/PtGw3xGt5gNQaQu20nnmrJCjx79zbf/Mkv1+Ufs18WyBY++Yg==
X-Received: by 2002:a17:902:db0a:b0:20b:51c2:d792 with SMTP id d9443c01a7336-20e96d8b021mr10907415ad.2.1729538404640;
        Mon, 21 Oct 2024 12:20:04 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:3336:4a8a:d651:58bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7eee62cdsm29568965ad.5.2024.10.21.12.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 12:20:04 -0700 (PDT)
Date: Mon, 21 Oct 2024 12:20:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] Input: serio_raw: Fix uninitialized variable
 'written'
Message-ID: <ZxapYkZAgxXBTJsb@google.com>
References: <20241021144103.928386-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021144103.928386-1-colin.i.king@gmail.com>

Hi Colin,

On Mon, Oct 21, 2024 at 03:41:03PM +0100, Colin Ian King wrote:
> The variable written is not initialized and subsequent increments of the
> variable are using an uninitialized value. Fix this by initializating it
> at the start of the function.

Thank you for the patch but I already have one fixing this up queued.

> 
> Fixes: 5b53a9d40c4f ("Input: serio_raw - use guard notation for locks and other resources")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/input/serio/serio_raw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/serio/serio_raw.c b/drivers/input/serio/serio_raw.c
> index e058fef07f57..4d6395088986 100644
> --- a/drivers/input/serio/serio_raw.c
> +++ b/drivers/input/serio/serio_raw.c
> @@ -185,7 +185,7 @@ static ssize_t serio_raw_write(struct file *file, const char __user *buffer,
>  {
>  	struct serio_raw_client *client = file->private_data;
>  	struct serio_raw *serio_raw = client->serio_raw;
> -	int written;
> +	int written = 0;
>  	unsigned char c;
>  
>  	scoped_guard(mutex_intr, &serio_raw_mutex) {
> -- 
> 2.39.5
> 

-- 
Dmitry

