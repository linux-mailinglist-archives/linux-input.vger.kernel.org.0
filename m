Return-Path: <linux-input+bounces-12046-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B398A9F608
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 18:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 910AA3B7883
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 16:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D837326461D;
	Mon, 28 Apr 2025 16:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLhV7aGI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E28384A3E;
	Mon, 28 Apr 2025 16:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745858533; cv=none; b=QRSXpi/lGhXrA8Ijxw7ookdz0jLUnOaPn8A8dk5Ule+rkMObghj9YkD31uuhRYYMW93OfIgh3m/WLHUiT48Qcni0TZO/CBz18EEu6kxF9YeavP6t7r7qm15GidcYBzDRCNcO7ClFHxnWg1MC8F3ms55t461zathvo4Rd8CmVY3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745858533; c=relaxed/simple;
	bh=nwNUFQCEbDbEfDNeRJ6NxdNzfcCFX1fusXAT4A5sVU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e5QHkvrYZQkMprpyDVqztV8rlSFgFQKM44rSclXsk0FSaSxIirbON9VOgrjq/zubdGG4jPLmMVQZfURvmE6cgo6eT7U+odArAOsyp1Iy1P6ChfUcwfqr19JwPtzYaEEfLktcK8eBzyXuoQi1xwUBeXJ9KRyhMpzm+XHAY3ospcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLhV7aGI; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-af9a6b3da82so3241194a12.0;
        Mon, 28 Apr 2025 09:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745858531; x=1746463331; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5DagT191PUrxqNoIjJ1w3Cfp9IxiWt5tMd8A85d8XbY=;
        b=NLhV7aGIehZPBMvb8jG64Oor12l4Q8ltB1aqVT/kD1VUXT82h4YcyuQ6XcKRL5nK8P
         euoQXjW4E6QJAqZdJdwg0+iCO9+8upDllfi8jge8opb8UFtGZyVfJFC6fCMCEtUwnn3n
         YIXXc9C4ZkRLaNJ/k8o2bolvJOMLa4exiQGy8bwn6orGJYkeNcbV8dvT/998bMlKk2wW
         PsGv7Ic8rFLJXCP/As743QNc8sH1B5X1W6JskACsvOnvFcTr8WnudsToTkeMEl9JYBc5
         U70f1662klwRvPxIUcJuLNNpZq+p0lZNCMrPS8X2rsactPl5cRMRGi2cZIN8HjCoUqqR
         /dUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745858531; x=1746463331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DagT191PUrxqNoIjJ1w3Cfp9IxiWt5tMd8A85d8XbY=;
        b=rmNoWOsH9q3Tuy3lGp5XmkdGaMkP6nMDe4L62lQVWARzutFHmL2UGwsyssq+XamFJx
         t4eoQZ6CGh09mdDlUhDOxCo/OhSNR5QTiiqet7h5/DQUYjsXvGL/dHnTIb/81yVHxisV
         1D0xa0KlxCfM7BpinY8pN2Z2vFVQhKW0QAe8TA/93mOdh8D2+9vPDSCnfcKjLzkp5+W3
         2oqsJj15p5FEa7eP+SNQ8iOTFrB7xsWOCYLRtl/XFOqCJaP+1188t/7Vf/OR6RsSceMo
         bR1QNFctqrrk/Ie7Vet2NsGiq2GmskUkcWeszbhP8EfFZzFcGWBztDZkMKrdHkDfhTp4
         OKWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZtVwBBj4T2H/kuoXULiJgXoGXTQv47v0b7nxHL4hYmph62g5wC5TYv6xdSd5g2YNKbf+t5VUasMDs5w==@vger.kernel.org, AJvYcCWHBZu3qQOWD4UaEMAfCreiNmbw/TP4g6KElNiSRH+xQYSnwRJBKoHzLLDxVNNGcI6F4yjBctaVub9U6TaN@vger.kernel.org
X-Gm-Message-State: AOJu0YxhAjbIlWWAcDtTfa50KUnsejgWfSAfNdS3ptaMN+cLC/nCmA1k
	aAsMhWQjG6XkOIxM2SrzpxeiKDXuzcdBXI+KhMg2UaVVASVaZ+38
X-Gm-Gg: ASbGnctgP0WmJrnzO++rvssOpHKrqQkVVFCIi/i93B4zrHFhWTi9YAGLpSNTCo29fpl
	nD/BmCoZroTIAcxIeToqLbtOaqUiShXXtwOAfD+nTLbw28LiiDbCv5P/HYiQD6bXd2+7roIWUHJ
	7zdVWlUaVZfDs/FON4cJr1w77p5MAgxhmkD1Rn6X7IjBO9k0Hbcu5GlMVvwvblwbxoQLUsCxzIo
	F9rdzTYr1JDK/sOtxMuumcqO8Gc6O13h4L9cXOVi+Zscn+dczTvn05BG5y6KOYeQHrSRQkaIwFL
	DKSE3j6lkiIhc8RUAWNdk+EDcuaIkJNG4Ef3V5uN
X-Google-Smtp-Source: AGHT+IHtkkcAiAjErI22upOMtY/779xLxpGrsL6Tvz8VbAlABPzIvN91V7aqT4IXp3nDp8Jr5JDPQw==
X-Received: by 2002:a17:90a:be0c:b0:30a:fe:140f with SMTP id 98e67ed59e1d1-30a00fe141bmr10741164a91.28.1745858531367;
        Mon, 28 Apr 2025 09:42:11 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:67d:4372:d1e6:def0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f77371efsm8287434a91.9.2025.04.28.09.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:42:11 -0700 (PDT)
Date: Mon, 28 Apr 2025 09:42:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] MAINTAINERS: .mailmap: update Mattijs
 Korpershoek's email address
Message-ID: <aaudepakzqnbbda5vynji77uuxvfmw7e3r5odfqowbtppkokmn@tbymrf3mohrz>
References: <20250428-keypad-maintainers-v1-1-4e9c4afba415@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428-keypad-maintainers-v1-1-4e9c4afba415@kernel.org>

On Mon, Apr 28, 2025 at 10:40:17AM +0200, Mattijs Korpershoek wrote:
> Update Mattijs Korpershoek's email address to @kernel.org.
> 
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>

Applied, thank you.

-- 
Dmitry

