Return-Path: <linux-input+bounces-12076-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 989BEAA118A
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 18:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 900BF3AA24E
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 16:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E493D561;
	Tue, 29 Apr 2025 16:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuI4IVmA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CFC227E9E
	for <linux-input@vger.kernel.org>; Tue, 29 Apr 2025 16:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745944185; cv=none; b=NW4bdb0U88CC1rA88Lvn4ltA3BqwmJ2jNtopRsvrqyvv7YPWoPvm3YrT9ApWaVidb8Aik2BfVzlGbTOpszy04C+/yGJHixRJN51h8ef4LsKe9LyNbA7hbmOSrOowKq7dtAKkwCrpp3R7L94J7l8IvV94W9xnWV4irVf5mlx4vEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745944185; c=relaxed/simple;
	bh=oWnPuwv9rQYenfRDvn7G+/N0ceTGATxEw4goA/UKyHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/wqgAAhpMdAS75vUMVSFT202nojWOAWFdI2HzS4oaJtyqnd6Rqod/cElsMbKiprHkMuaYRyVti1INWp0edFf9BcSU6c0w5uN36cK/YqXLUJwwiVI6kwAc8qnAsYotLQZzez4zSo81rLmUDJGW+qjcVuasHgM2YoH9s1nhcZ+DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuI4IVmA; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2260c91576aso52732705ad.3
        for <linux-input@vger.kernel.org>; Tue, 29 Apr 2025 09:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745944183; x=1746548983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kV54NwFT6iZkwZlyhbM/53RtCc7p3xgDGL6ZU6s+YaI=;
        b=fuI4IVmA9hRnojAWHQwUQZ/DXV81BW4ijF2fzrP7qRmpZKdQRnf3evxIKKAxz4iXGj
         68r9JNgM1egh2q2fitQ9bpMfqZY7WzAe1Dr1h0qEjhO2/7CIgULXjFCAv+lVixFd3qt8
         2xJk6CeNfO74g5TL80nwCHW9n6/tFHCN/dfx3qv3WMD5lHsedfkY3t+mc53dHroMGnv1
         i8AaEGCxJ/YvcYsrlx1xFBJxPNVDx/dVQqOaTzfdhom4NOufvIwFsNry9CGEgi3+Sk7h
         CkhETNhZ0fB3HdzYXAjme9zS07mUSl0sBhJENeFIZT5GafYqQygmcZ05foVkuaRik5P3
         cqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745944183; x=1746548983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kV54NwFT6iZkwZlyhbM/53RtCc7p3xgDGL6ZU6s+YaI=;
        b=BTZN4cgLfKjZ9A10LQHIMdrrwwKgqp8BdEgrVhlXpnXO139idyX4clfeuazVJBnLyy
         322WCw01hKQiLFqUTzbMpiLACcgf/b8TzB6628EOyPy265t0YZZlCx8TplOY0xGXua0u
         ItoZMzB0zzeR9d8sw+KI43qkrUMdGtuFceWnII2CPpqMwAWooBas4qylwW+1vCtqNSP8
         iu6mzcTnktEiqz1tqnwPVZ+YXDKE/+RrUKH+CY2F3J1PJwojeFUAhQub9qc8mkdSKC/D
         JXoSacycFbMwmc/eXIpXvrbKX6W6qb875Z61ZkiPfWP3nShnT2avE+92xXNMpEiLo919
         fdSA==
X-Forwarded-Encrypted: i=1; AJvYcCUDSH9rn/rVRWMXxaqb9l7M5DcgnK0Y0vstWFnmg2OYxaRhlxxRfYbgzKxnEUUG63ubVw6+T+ysC9TKiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyENjGciYIRZECIWCWuTnhEsWODubGeeWqtP1qZR8yRsH8WsVye
	CE+Nnjkh9ZjERqBZTBjyPBfqtdu3ALuHf41hboUbKiaoktjTlX+P
X-Gm-Gg: ASbGncsFKdY+TBI2k+uurnt1fO+VBdugszM5/OPDfKDCBa8g+SvgCj0nzl8Y0OWNHhn
	wyxnoiV3+6+J4aganBOmc/vnZo0wa4Za1KxibhDM2K2VBqtJQaihnduyh1+1/LAejWC1jwamDzG
	E71WmbttPxWy21vzlxvqwvPkgIfzOnzUT+tzVDqflA6tTHs4UTWYdcKkr01VAKwtVushcvW8urV
	MH2UHpCxF1y+yGF+Uw0/aNARZSzuOnTGcySq3z7dIuY+KO5+EokTfuvnckp4YT49FD+x1gJLfmp
	nkqAFZjfQJZF050kkuSUnom7hX6qRdAaDG3vf6T75g==
X-Google-Smtp-Source: AGHT+IH7S2ba85QY5A3S71xSkb4HSg57bgRGtTvcCIed7g4fF8lrRFgDVMh3VVGTcfWTqLUWKDpqOQ==
X-Received: by 2002:a17:903:32c9:b0:223:53fb:e1dd with SMTP id d9443c01a7336-22df3534f10mr200405ad.9.1745944183295;
        Tue, 29 Apr 2025 09:29:43 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:adc2:8397:4f51:d5a0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd6ebsm104941775ad.80.2025.04.29.09.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 09:29:42 -0700 (PDT)
Date: Tue, 29 Apr 2025 09:29:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Gary Bisson <bisson.gary@gmail.com>
Cc: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, 
	linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] Input: mtk-pmic-keys - fix possible null pointer
 dereference
Message-ID: <3hpxs4acz4bgef7t3mvdhc2xr6o54vsxthwrpobmaxljo6lryw@lxpeojs5afk2>
References: <20250429122815.72724-1-bisson.gary@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429122815.72724-1-bisson.gary@gmail.com>

On Tue, Apr 29, 2025 at 02:28:15PM +0200, Gary Bisson wrote:
> In mtk_pmic_keys_probe, the regs parameter is only set if the button is
> parsed in the device tree. However, on hardware where the button is left
> floating, that node will most likely be removed not to enable that
> input. In that case the code will try to dereference a null pointer.
> 
> Let's use the regs struct instead as it is defined for all supported
> platforms. Note that it is ok setting the key reg even if that latter is
> disabled as the interrupt won't be enabled anyway.
> 
> Fixes: b581acb49aec5 ("Input: mtk-pmic-keys - transfer per-key bit in
> mtk_pmic_keys_regs")
> 
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>

Applied, thank you.

-- 
Dmitry

