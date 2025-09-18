Return-Path: <linux-input+bounces-14834-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0A7B8306A
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 07:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BF317AC7DE
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 05:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53742D543A;
	Thu, 18 Sep 2025 05:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxAooJFS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415CE2BE7DB
	for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 05:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758173972; cv=none; b=ZnT8XTfVtdAXsgpRn7R2jeGCu6Xontgkn1IL6S5KTOTkEARcGvhaePQvn+3gUNmxoSarjSTZRfN5+0+CGY6W11L2FUEuJ0FbSaUDum4XmHk1BhmO+KCHuJb3bsPaGgoq9+lrh0cGa2dlh+OrW6B5h7IylgraOq2ph0kzHeEwEc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758173972; c=relaxed/simple;
	bh=SaZFIVOdd7T13NXyX4efJUKeQRYQgGhTx3tG1HJaIQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a61p6WMYT4L0bSGNuyjUuYSkfDMIHh9XujgMnR4PN9TT9UqEmYxQ8Seyi3J3ApLtvkw63PI9WWBlAyMMh3XJKTZsKtXrP6uwZh5WYHJCZ7AOC3s/ixCDFW6Dadl8EpmPqmDanCvsIT69fOBIGcnVfcyxnnMhHoTtajuftQvx3cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxAooJFS; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-32e372c413aso594332a91.0
        for <linux-input@vger.kernel.org>; Wed, 17 Sep 2025 22:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758173970; x=1758778770; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XoyqBQApAmmnvu4zkoApx4U/8ormdVXAKsPBgbJPU3k=;
        b=HxAooJFSifNaIZ7NuxlJxEjtHTqWCE+dKl+xuMb30iNwdM3eJbozKquQEWSKDB96EY
         qmffl0NL/w+cIB5hGyQrGxNoOwp2daQXjoEleHZ9DXi5DU8uvykBLdJ1/pjwdbrAl0Lb
         Cy0d7zNgBMI/JizBVFnM3XfUfi9fWlU+XT98+0+ET6cIGuBiE2XMINPcllvbmIUJgEfA
         ndejEnkn3NHDDysou4ov85ufesFJJTgj7NM927idZAGSebuk4KLxdPs4payENDiah5Sg
         flnjxrDOQDLqngm5oA26jSOuo5Z0RuPywbU6SraqWOdr5GDXXmTIIAPBkX+EKxY9CSof
         /eKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758173970; x=1758778770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoyqBQApAmmnvu4zkoApx4U/8ormdVXAKsPBgbJPU3k=;
        b=iZUbg7ZmAXitVnwVy962zhlpflY5hg+Vrqu3A8roac7MgPxrzLuPlDfPDAqPjcZuc7
         rKLncdejagc3IMa4pYRxbfZiUfFUultgeKLFWxvLQl9AFrAc+hv87zweLDpERF5Pn03h
         NeIg/pp2MfiFrHqHVlvUd0i2bEf6U/BpUrKSxXoCSKLSQJ/ZMGliDs3HB0Bc118Yi7HC
         TKnyRYkLgxDQNZ8xY12MJEwAeMnGu8lsn4G4cu+5PFpoHdblj6dDdVfZ9a2f99CJ0r5+
         hwDzpXVGkg74ZLuZrRBgnG21bQgVADr+scepv6aG9R51Xig9Zc+ljjX/DT0VKk1jbkgW
         Pb/A==
X-Forwarded-Encrypted: i=1; AJvYcCVhKQrqv8sf8ivnU0SCmpkEQIiV/yRvTyUapTS4GFRb/bSpcgCiurX6LzVsfvxfFv+l7FJ2HJp7IioSvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkOlL6wWOLbgCVpZJlR/P1e8keees/vmzFHozBYMJ0Lopkz3YK
	NW+DX3yTSV0NGd808LzJkyV/kRMGpUTbnXkaV37jeJstbcSbsRFd2vuG
X-Gm-Gg: ASbGncuYOVGlc3KWaXWKWx6F1H4s16fvYSl1dNpdQhJ2gcEHQynYkhZD3HRZT3KqZru
	ERGJEkb5FzNzs9lIoGGVhn6py+2w4tSJM+/KSK3K8aS87nRkQgubYSn5BOJ3KvcOzrmBcHvD8US
	u0wwN4YQWYxAsxEuWAQOpwFqb7Nvz9l7Y3sHWZi6ZU0mYE6M/Dn98UCVamlMPVxtcg+3VaIcPw1
	C3oadmvC/fj2esX7B336VYCreKIn1CMREV/drWjKDdu7lQWXfGrR7q54AntJM7k1wdomSWzXj2V
	MI5GsmuPZZ5lLvvQsi9B7ENyS7N7OyFPB4FmuqHB2WHVkgquGiLGY7KejCfaSMPGz5xsUdXcE1G
	1TtqIPZCEwmj2MhNFq0LpYRcHoTFCJ+T8wed2hxwwtg==
X-Google-Smtp-Source: AGHT+IGxd0JzuVVJrw68h5tXFHmcZpcwVF2x8DkVRvbM3jhAsZwEYZxEhWmJuR/xbYRB7Jc2BkkC4w==
X-Received: by 2002:a17:90b:3b49:b0:32b:8b8d:c2c6 with SMTP id 98e67ed59e1d1-32ee3f008ddmr5384286a91.14.1758173970420;
        Wed, 17 Sep 2025 22:39:30 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:194b:8358:5c91:3d3d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfec3db38sm1130199b3a.73.2025.09.17.22.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 22:39:29 -0700 (PDT)
Date: Wed, 17 Sep 2025 22:39:27 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Frank Li <Frank.Li@nxp.com>, Michael Trimarchi <michael@amarulasolutions.com>, 
	Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v4 1/6] Input: imx6ul_tsc - fix typo in register name
Message-ID: <z2kbkmqnvux2ys2mdghfbdwts5je4zkmmk3ctjaisno3kafqoh@xynqe4exjqzm>
References: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
 <20250917080534.1772202-2-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917080534.1772202-2-dario.binacchi@amarulasolutions.com>

On Wed, Sep 17, 2025 at 10:05:06AM +0200, Dario Binacchi wrote:
> From: Michael Trimarchi <michael@amarulasolutions.com>
> 
> Replace 'SETING' with 'SETTING'.
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 

Applied, thank you.

-- 
Dmitry

