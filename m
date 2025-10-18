Return-Path: <linux-input+bounces-15586-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23450BEC73B
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 06:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1AE16E1AF2
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 04:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF41251795;
	Sat, 18 Oct 2025 04:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Te+kOhnY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14121632DD
	for <linux-input@vger.kernel.org>; Sat, 18 Oct 2025 04:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760762094; cv=none; b=ZUgAaIwJiqFwNQsI3bpo6ngZ8VPXCqce+7FWtgMyZUSZm1A8uecCtRVIVqB9Cfk/jiu3AtD2ePRBzlSXWiiVXpCFqyk/UcGrn6XJeD7ORuf0LPKuYk/7W9AArAbd/W83zdDUWV/bR0Qz7j/HhJEYTAgU8mIbY3p1o3LRIvFngGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760762094; c=relaxed/simple;
	bh=GxR14wtXNDXoVG4QYMZdHFm6watYk/xR3Ph2wB/HFgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXXW/exV/1GS96n/RQj4exVnnNH1OK7ABzc/XxQptWUi+YVUleg7C8HQAzC7Hv0+p539YZ8P+t3ctDI7S3gABNU9jluXczrpmvDs+R8lzBGknawzTpHkcSgKU3ZuFRDP+9Hzj0WYC52pUSqZhZnaV+7XuD+melDujUVrzuxOSDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Te+kOhnY; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b60971c17acso2122269a12.3
        for <linux-input@vger.kernel.org>; Fri, 17 Oct 2025 21:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760762091; x=1761366891; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MvkiGnJycOUUb9mLccpGWZ9e0R42gUUGVNQEgcKUgVk=;
        b=Te+kOhnYivh5nlVMIqnn2sAClZL71svnEaGQx9q0BUedVrLtFuTITJrA4njAzfOh1b
         GDcaG8Fwzo+tCBgfJ17KsuAJhqNFDA8gAjqXGzLO2/LQsY7DKZosKLeoYkLjW3bCsaJM
         6++KONnE3gCsDrLcINpyGAXZ4AEGQS5pXKHdwIGNNgi3hxvNV6mLhZ/1UUPYUvMZOHGp
         yq1YFYleS7756PSxeJd9vSLFqDeAQJSMlGNeWQ8HBfLZaeCsvwdxTuqeyXnwX8v3ePn0
         CxjKLWOFISHi6Sikez0ftDbTSPm904xFA9S13vJU0vdIll9pGaofa/4eq7WfZb4nlZjg
         eLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760762091; x=1761366891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvkiGnJycOUUb9mLccpGWZ9e0R42gUUGVNQEgcKUgVk=;
        b=XTBjM1Y90XTcmEoEbDs8tZ7h974f/nKjY+CLKnthU9t/QA0BfvyVWiUpMuOrQymVEC
         DizeozFzqrVd31KrLjGeDiuXtk59U9XdalOjQZeE7HM4ONVnFSAkKuFLyaRCU7hm0xP1
         6m0QtAB+3PVbN0580CHIk/jeNMfEr2iL+bAxjVfK+YOEaQpWsodlz63+dydriZZE+wf2
         bQCXhiLdp59RnqoWyIvVX5MYu/J56w4kq8JYL2nBfCAQRLJXDhVpe5aUyhtAzRRaZFwr
         Fnji7GkVynhk3wnK+9eOBx7kpzjeXt1EdE8Mnbkgml5/vD/ZCcsGC6l8hFnWWQJ6PBOH
         tO2g==
X-Forwarded-Encrypted: i=1; AJvYcCUdqX+52X6QAq7bA1Hjss6/inVVXRzyLjqLnrGt0hofdmkvCna2LrcsRVleogUSS8lpRwPqblZENduqlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMNOuyBt1f96wZ4jLtM/Gi0cNjBzbCnma07TPCppEmCoav/bcK
	ALbdcb9zognGvBMESJOGMPkUvCoiczOshKBglG9NN+M6wta1DoxeN2ogtb3xmA==
X-Gm-Gg: ASbGncsL/E35HAgwk64vRIJ8WDXJ1vBJY1cmb4UPpTmPzhWy+B89R8RPThW+KiJJflr
	i6by5IJ7cggLYr8MgVb3pgQH2WqmC5CQBkP7TbhmUfccyniaaIFq9j9WIGvmrwsNN177SMVPFht
	vXG9ZSw3EAITEYbZPHt2tcLhDCYBZlnOr5eojhi4foaLOZ22pBIIHZcvpgWc8ymlnoaGByNmKtb
	gJbLwNHU9CBLiiXVQIDIS3G7ccT8VWQV3YxEes+rmWi5qyZo3/Y6RE7gooxFNlsinFNvKgm+6ZO
	6oh9I22BYBotgQnOJ4GomPk2gzv3EWdb+LqHS0bRvZZdJcu7Sm6GtKIhqsHYBb25U9cINUImJd8
	m55p3YFGKkcES1Hpih7DCIIz3MYfpk5blr10Adt/pWiDAVNJet8Yd6RXU7rcbWn//bdJzKeEAC3
	vFF5mpIPMC4MvHXYGITlT7HuHoXrNPnnNXWV7T53GIvCOgsKjxmHQ=
X-Google-Smtp-Source: AGHT+IFuzxQOBI65vs3bpYxRhSg0TCMcUgkWO67CR9Y3kZQOPuLiNCx2YD5UCXS09TDtIujDvVhhEg==
X-Received: by 2002:a17:903:46c8:b0:27e:e77f:57f3 with SMTP id d9443c01a7336-290c9cb613bmr76175445ad.14.1760762091145;
        Fri, 17 Oct 2025 21:34:51 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:5e2d:c6df:afce:809b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2924700a883sm12500915ad.49.2025.10.17.21.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 21:34:50 -0700 (PDT)
Date: Fri, 17 Oct 2025 21:34:48 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, 
	krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, 
	kernel@collabora.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: input: Convert MELFAS MIP4 Touchscreen
 to DT schema
Message-ID: <fxbpnzrxbmp3j3urthrvaws2cffjlbt76poareemwbsx4z6oro@tp7dy6qhinlb>
References: <20251001183809.83472-1-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001183809.83472-1-ariel.dalessandro@collabora.com>

On Wed, Oct 01, 2025 at 03:38:09PM -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for MELFAS MIP4 Touchscreen
> controller to a DT schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thank you.

-- 
Dmitry

