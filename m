Return-Path: <linux-input+bounces-13692-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24394B12E88
	for <lists+linux-input@lfdr.de>; Sun, 27 Jul 2025 10:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37FFF1637EE
	for <lists+linux-input@lfdr.de>; Sun, 27 Jul 2025 08:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F83D2B9BA;
	Sun, 27 Jul 2025 08:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/g0uEYv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CCD3214;
	Sun, 27 Jul 2025 08:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753604532; cv=none; b=T3HuYyht0iP5utrx3EtkLCVtsZlwcVGT7Jh3cSInS/hJL4VojmE9jE2xgchmHRvndnxgRxPUyJM0A3/tJg52UwsvTUAyTIXJWwk9cbxyDWVBdJsoMnxT3AGwG1kW80cvn23UpC/HIHaCjNw0LaYpijd4RZTv9OTRBihve+XktyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753604532; c=relaxed/simple;
	bh=ydjtJsvOiZXoQZTnFrL6IFQmD1HLfDxemeu+MrUXYJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aBKpL64Noq0vRqPrXMgwNTxMWKLIu6QCnXVj6aGqD/Z9wFDAhoTJmISl4f1afcaRKzuF7YlD+WnmzyVUibBYkVU1Hnqw64diIwnH5UyHpwkh09FcSg14QzbujQtX1448kFRiaSx6oV7k0B9xgqqG9vwwAxw0WArkHvW+j4zeqdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/g0uEYv; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2400f746440so1261965ad.2;
        Sun, 27 Jul 2025 01:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753604529; x=1754209329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XqcNKA/gbxxiW0lgpESTVfa8VL6JShBfAqjMDP/7/OI=;
        b=F/g0uEYvp27EIPnGNqmzKXS1Zxgsr+0DXGTDzHbUPrWXPDz6Zn6LbV2yrp/hrsBI+h
         HyV1P66dETs6G63JEvZ4zVM5ax6W5JVQL5PtYRKOZlLnlwqgZI6k1DcQrZHXb2UDvXij
         UKhmwK9esGkxwld+v7X9w4RPFU4FraEC+L2b6zCyCWTLNEVeqlCAbt/aOv9Ik7ZSNz9t
         H/GrwrPNE/dIQuGD5SfTcikwVRySfKCblukiLAjz3DsfoL4ch1Y9+j4ASHb4t/kjtLEG
         PAtvL3VyZHqG2Fv1+IbMTCoWLQnyuxeF4f280qXOsF4JIdPqMZxEIIpCIWwStsS0U0o+
         j0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753604529; x=1754209329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqcNKA/gbxxiW0lgpESTVfa8VL6JShBfAqjMDP/7/OI=;
        b=cvYG+jk6jPbMRhn+xqYcd1rJZHNYKZGEReYK5TuzaBh+9DLDzBFE4Rmn1acEOntFFn
         BpP/6U1y85ft3VyMrgKU6R06j4g8xtR7PI10jrGJm+b7lACuKottX7ikcivVeh+gzhsj
         AgzH7OWIwcila9m+yzqFAdGHdBFM8j2W30IReADNkkjGpwvb+7D+itkkST9h+xyeCcZH
         FxZYFc1QcGfTvqZAgjDy1BEw1pGPnpdgZ0XYIZUhvkQgLnHeBmQSKAYZpBLSdvH/uv/l
         BRJLYEqP2zPc092hHtgGnPnDbtmUeaWhV/BrFj894skXJr201R5eEOy9QaBfXsIPQMnI
         fWhw==
X-Forwarded-Encrypted: i=1; AJvYcCU0qZg5HiCiTXG2+9zwaMQcqxEuTFYXiX1g91V9cynI5xn+Z7IWUDFTq+6PV/US4hHAofHyWOpdPS7w/R8=@vger.kernel.org, AJvYcCUh0wKzy6qYOdIJIYZ12igaDAD8Ytk0yt4HKnn9v+nph2aNGIls1LcSdArsr33VK49JXefBd1xFG9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDYCdcq1LSzrKe+gVBIyy+7DLc1hmvD4iDnWbAFFYFYVAWQXYO
	LhjsK/K87Rvk1gqcD9j+r5jCW52mlRHiDjhqwhOdiuf1LgEHAZ/MOmXa
X-Gm-Gg: ASbGnctILwnauzmmYc8d9bDQnrAAvzvrFhxj5D9GIROoh1+b45dvAFiqNJEcZRldgdz
	D2CS60PsIdswtfR6ihGOrSTPYuVcpZUjjjT8zci4K8PMKZhRE0BZAH842ZSrzNBNm0dX1PLtNRX
	6fQjdlekBnZGS0MofM/1LQ855FNmOUq3jtZttHxCEFaJG7vgUxGiHjKoKzeCuuqF2p+8tvcYzwl
	J2btz1hhP5o6+WpYplwjcTNmp7IgijtQ8gZIqE7XaVWt2aJzKKsexEcKhGTdif8JtfK6K2aD1+d
	CKMepTroLE9gAGeOcwh5JHezliXEmpb9BJHd45irhj1WGMfIlMW7hOeiAcCAHGZ1HfGLNI+yWLR
	K2yCGWF7i4PbXRWjboOXvNpY=
X-Google-Smtp-Source: AGHT+IGTJWbWswrU2jdGzYsRJE9pTNAizS4aLsHe60vdB4HWxa0H7LiPAsbhEnsKI8qqjoZXOYV6Ww==
X-Received: by 2002:a17:902:e5cc:b0:234:eb6:a35d with SMTP id d9443c01a7336-23fb30acdedmr129631885ad.27.1753604528868;
        Sun, 27 Jul 2025 01:22:08 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:152b:d3db:2a19:4eb0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fe648707asm18587435ad.135.2025.07.27.01.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 01:22:08 -0700 (PDT)
Date: Sun, 27 Jul 2025 01:22:05 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vicki Pfau <vi@endrift.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: Fix capitalization of XBox -> Xbox
Message-ID: <juqrd6zovledbgasfxgzwdhrgipslp3danfaxztbh4p5mhrkp5@bbwp2uhhphaj>
References: <20250702034500.124741-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702034500.124741-1-vi@endrift.com>

On Tue, Jul 01, 2025 at 08:45:00PM -0700, Vicki Pfau wrote:
> This also improves the phrasing of "an example" listing two examples.
> 
> Signed-off-by: Vicki Pfau <vi@endrift.com>

Applied, thank you.

-- 
Dmitry

