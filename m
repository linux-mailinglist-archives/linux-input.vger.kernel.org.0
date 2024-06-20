Return-Path: <linux-input+bounces-4521-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9544F911535
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 23:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F2FB1F23254
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 21:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2532D7FBBD;
	Thu, 20 Jun 2024 21:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSaXWL7d"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A188005C;
	Thu, 20 Jun 2024 21:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718920698; cv=none; b=fzWOMsk8huYv0NNQXkfhdqLUJoJWN98Uy3wse41E4wtur3HMoo51ZrK9FbRrm1JYGdUrkAY9lfHgCrU+SR+Kgp36LP6WcPG7/iH6eAawcp1M9P68SQ/qY1C+EGU5MppLjaziLoM1LIWakhd8vumoDwC+rPvwQz1hpsiUD5U1iHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718920698; c=relaxed/simple;
	bh=IJpxsMCvKjR1Y3uzMKdhc2UWB48SmmmPiTJaVKmQ6fE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EF2tKNapljeTtr0FyYYSzYZGAGaHHm7y4YyZTOgVJIJbLvrWIkHl8TE9CcMgse9SxL6IqEUKqdoQBJi7nXrIxNopNGWVAHiCLJ1xHTXtDP/vcSF85CYjZKjLA6+vK4b+XHu4grQ7BCBj6JluPK0Uwe1FldEmcD298OA2yQZDO74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WSaXWL7d; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f9e2affc8cso4126055ad.2;
        Thu, 20 Jun 2024 14:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718920696; x=1719525496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nEu9njmOBLU9CVgPbB/t3MDsh+9riexrS/cimnJp+wc=;
        b=WSaXWL7dEJeRNjcYSnfqo4FXGsxHbdEFnrat8iWHpTjVfR9OHr30SW9F+bHI9wIbxr
         M/UnojHSbVJXyyRwkjBWU8yAyR7qNjLqu4gRa6dpXySearIZqAeNCskTMzDaKV7QzGiE
         5RSJEZgWOCtBTePbdZcLYc4pE+xjL0MY3eRMV/EjtbePgjXwzUoI6/1uf8LPyx2Vd+HX
         C6+N14rDR+Sm46Z5IYyHLE6OSWhNOaChGdJ0kB9gN+VBVuIdJrLkQuzaknm2C4DvKRqU
         5VuLg5blTJi8JQ9zBJy6hQWgXjSCnQPNuI53mz03buP5OU6J6Cyn2o5ntLxSSHnF3Ub3
         gLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718920696; x=1719525496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEu9njmOBLU9CVgPbB/t3MDsh+9riexrS/cimnJp+wc=;
        b=L6BwvPbX5sMjetHNGJwCsAF3tf5/LO04IIQ8UuZkOYoBQeHCuHHAKeHBXcUOUTYGli
         nwCvkjPSlRHy3AhFd8ppN31ag8S+DCeb4wo2/KApwtMa5jv91gRs6ReCrv+hU2/RIrmF
         rgxqbkQne26ee6vpdtweikN74u64soz40JFMCu2zdQdZt60kBYZZKpjJ3YG0OFp5KBTp
         i6frwUwvsvqzVGb/dnSrs6rJ7AGuS+bnQ2hJfMJ/rh40XpCWXTTfZ1KL21etd0uvMUfa
         az8eSlAuw/Ci/5empOwySS8hv2WI5J5xxk6X3PBdG5fgQ3J6+H6zUB/XrooDWupgpETn
         9Npg==
X-Forwarded-Encrypted: i=1; AJvYcCWpbqMdwz7f/XdDcAc6FJrsFrRGVak1sIUh+Kdy01jjRpoXfn0UROh44f9LChseopko6eXHxg/RYlT7vqabG3ALwq9oNK++qWR5VvBLRvGyhzf6d4m4UApAoOvLNbs6GxjmAxNsgDl65e+bj3Bddh19eSpvMm3XVEA7tsf5DdUhZJSansgmuOsYV/I=
X-Gm-Message-State: AOJu0YwG8Q+Q4Jo11zySWApnWqInNAT+2JbVHKhsRxkCBItv7Yp4eNa4
	mQ7TfWVrHyNDkx1feyyK3qzGi1K8Uy0AK63Evpavole5DeNa9N0t
X-Google-Smtp-Source: AGHT+IEx85JtygkOhTxh9LtqPQhqw2TibZBQwYlLCTHDNRf5ubcy2SAzhS7X3RgcVTMtGtPLmHzW4g==
X-Received: by 2002:a17:902:d488:b0:1f6:91a1:88cb with SMTP id d9443c01a7336-1f9aa3edfd2mr82090865ad.31.1718920695935;
        Thu, 20 Jun 2024 14:58:15 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:36d9:2b1f:59f:8e9e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3205f3sm1007355ad.76.2024.06.20.14.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 14:58:15 -0700 (PDT)
Date: Thu, 20 Jun 2024 14:58:13 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 2/2] Input: ims-pcu - drop repeated "input" in error
 message
Message-ID: <ZnSl9dslWlNv9qNj@google.com>
References: <20240619-ims-pcu-counted_by-v1-0-3ee0ead2e57d@gmail.com>
 <20240619-ims-pcu-counted_by-v1-2-3ee0ead2e57d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619-ims-pcu-counted_by-v1-2-3ee0ead2e57d@gmail.com>

On Wed, Jun 19, 2024 at 11:13:22PM +0200, Javier Carrasco wrote:
> This case of the common error message upon failure of
> input_allocate_device() repeats the word "input".
> 
> Drop one "input" from the error message.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied, thank you.

-- 
Dmitry

