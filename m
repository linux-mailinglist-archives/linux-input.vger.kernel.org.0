Return-Path: <linux-input+bounces-4520-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8D3911533
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 23:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DACADB212C6
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 21:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B668F8005C;
	Thu, 20 Jun 2024 21:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKMXSHPV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD2459148;
	Thu, 20 Jun 2024 21:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718920684; cv=none; b=V4Sh4pop6OlRGX2QqXM+AkaYYmP8PteNGCnLYbES6nkSaoQq/Y5ISTNwowNFLP21R9bIE4DBo6qsoRez84oPF1qh4FbNAS1RVZ0JGfQndbd7zeHnI108QomSuU1Orrdn5jWwCEJPgJNFSLuLO+Wsm2/h+qmGN1xdnGFkc7ZDGG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718920684; c=relaxed/simple;
	bh=beYmCT+ltRjbD4/v+kRgI7K1zSXG/s6cP+YEOZspq7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BT2AWKOBBWRtcqZDWdJA/NIB98awhctDCortfynrgZdN7txiuH8d321CJmKT73yPJgUt/kTDn1Fm2WvqECBoAzJSN5MRKl2SuWZMVJtsPMRqA1+i0afs5Ja+dgadIP/SyXGZIYdh4lbgVrbVJGorkV7v/50oYRh1APiQKRw3QFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKMXSHPV; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f6da06ba24so10397335ad.2;
        Thu, 20 Jun 2024 14:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718920683; x=1719525483; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gfB3QZ8xBZzZ655uwkS4EQea5sVZRz3H+t/hBs6DLOg=;
        b=nKMXSHPV56YBLjC9vXDzWqRe6gRrtge2jA17RpqzOtlWOqQ0JZZCIlpDnArGJK5gy9
         U5A1AFS/y9NO78t387dqe5Ezyo+o+zFkx08waie3VWlD/WmLafQOcPrWwPUE0Pdtjzn1
         6LWXOVFCHSAuTnOA4HP4+MjWBDFICiEmXPIleutifjRF96Bsmaq9NRL0bFcyeh0uBumm
         wUA9JOLmOWzq+kA5vnjxSIXdSX4ITekiplhQ03wldgLu1+s9VpPzuwMcniARq2XERJHZ
         eCSiqvUmkg4F59Lgp2RxYvbDw7qnepR/N0vEffIz/mpG1U4LohtL6qwxnwma/q8vFUyo
         j5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718920683; x=1719525483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfB3QZ8xBZzZ655uwkS4EQea5sVZRz3H+t/hBs6DLOg=;
        b=wbBBRdtHs+j6cQ7hN9BvscPjEHRQpVCmhcOZwLzFhgEzbpv5PDxgNF/g0mNPU6vrPI
         DA60zJ/9eMp3isWVolh4FgoFi8fdk2K9yanrDriOlVo0TSL5olODGNe6PGuSLvkHMhPF
         q6D2wGLpMAL1EkxaNxNE3HNH0Uy3XSOkAXKctIC+3lt+NXg2eVRX15GHxPIMNMw7dqbz
         KLe9tY6GqUYgUazPvsUZ9CEa8UqeqfbGnN2OJYy1leViwnoKWJLhImScgT7fEN5Dl//M
         sma6ZgCafKCzpol8FY+BoWlFrseEbZqLrzV7TTB+O92XzQAPQ4QIVNOIBF22VvJ22RFu
         fyJw==
X-Forwarded-Encrypted: i=1; AJvYcCUou8TCrFmY9aK4vtrSIr0VVj7c4Wz78YzvFgBCLCmkrfMxajCFDbUVgxIcAwc5DKnQinn12b8VRTYm+unk7U5y9dtBHRlYjG7HYHAs4NeYSZ7fxpGJaPflSZ9eSvBsSpFSix/cE19Evs3I9x1ELhE0T1XMdYayhxkfzppjZlNv6F8nP/V/+67A1aw=
X-Gm-Message-State: AOJu0YyDrqdRsX35dqAQfhUbOYXkQ0zP0H2TZxyhpb5yW5iM3+2DbiuH
	6RI9QDc952ZYVs7iIREswDpvyUQgocEkNV2UYmC3kSSBnlh5rdWAWtgyFg==
X-Google-Smtp-Source: AGHT+IHhfKN93+OlEKnOu65UteLFJfwRWhteLznYzQcgnpXqLZVg54gJbJBGs701omSJzURRA+pxbg==
X-Received: by 2002:a17:902:d484:b0:1f6:eb56:7831 with SMTP id d9443c01a7336-1f9aa47c414mr76645005ad.63.1718920682510;
        Thu, 20 Jun 2024 14:58:02 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:36d9:2b1f:59f:8e9e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3d507csm922165ad.192.2024.06.20.14.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 14:58:02 -0700 (PDT)
Date: Thu, 20 Jun 2024 14:57:59 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: ims-pcu - annotate struct ims_pcu_flash_fmt
 with __counted_by
Message-ID: <ZnSl50-Q9GCFHe_P@google.com>
References: <20240619-ims-pcu-counted_by-v1-0-3ee0ead2e57d@gmail.com>
 <20240619-ims-pcu-counted_by-v1-1-3ee0ead2e57d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619-ims-pcu-counted_by-v1-1-3ee0ead2e57d@gmail.com>

On Wed, Jun 19, 2024 at 11:13:21PM +0200, Javier Carrasco wrote:
> Use the __counted_by compiler attribute for the data[] flexible array
> member to improve the results of array bound sanitizers.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied, thank you.

-- 
Dmitry

