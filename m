Return-Path: <linux-input+bounces-14835-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E8CB83070
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 07:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEB7F7AD889
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 05:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF3AE2D543A;
	Thu, 18 Sep 2025 05:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lOFgZ1XM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E272749EA
	for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 05:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758173981; cv=none; b=E3vETgTX3GELDeqEVvQ1/umcFZ7LZ/RKx0o3SeAJMqwtHiKwvv8KjQG+k1FlmujVGHzPHDhO+CcfZiq0hBuTqc5/FCQEBvdEShexSHRghlrFofqXRDsFFZlAPlx4DxfxZ/SIPhg5H1lyxfV0zVO5DUrmTgK4N5fqBgZ56Pydhkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758173981; c=relaxed/simple;
	bh=tL4EM/uHHsExhCxv0TtPtLPrn+LMaQDa3EkJi0o+RGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXkOAGdqMZXM7JAwZsLzARFbZj8KXslgbsnPmmoDXeCE5883xKp9SWtTp2rG+NGm3Teyi9fhz0XFRkHt7xIxQ1hU4eX2ONcpcQLHJJafSbmVwjSFM1eNbltcHCSoHAY0uxNBH/dR2tthBBnCiNKh57VijRHCLemjAuUn+UHenGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lOFgZ1XM; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3306d3ab2e4so213209a91.3
        for <linux-input@vger.kernel.org>; Wed, 17 Sep 2025 22:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758173979; x=1758778779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pYLuLD8UtvBpT7GojTBkQ4oUBcmarrpk57Y1mHE2Pls=;
        b=lOFgZ1XMgvKiQnC5JiuiEis6T9ipSClYNsvnERzofYAHa1KpxxlPaTlFUJc1wOBrIV
         yY2dnRqO5lLs+TkLQniGhK1Np7J0XZe4j8PXHe3mQ8QT1hlv3aEEtK1zbP6gexA0Npce
         oLHduHnm8FRBMubaZmag0HidKP9aEvtk5vb+5evgo97cExML17RPLyjWRZpH383bhj2K
         DpwF8D8t5sKkAIfT9kuJe3ZHDntwwIwWuu/LMH/fM1czCdZTtxCy0NaL5+Q+V9vAuamc
         cX21sxWopao8W3EwNamkSMU94rVAth2zkdORPMXH0YwZ5nyNoQlrevHhA+dz8qiy+JtW
         PusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758173979; x=1758778779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYLuLD8UtvBpT7GojTBkQ4oUBcmarrpk57Y1mHE2Pls=;
        b=YLQ8QACQVUtvgY97hnot35brThIfTyW0RcLgXExrDFDmZDCCoIRRTcbPgm7OcFBZXP
         On74msGbhFrBsKb5htlxLIEATdlVOpFDKWUFK0dzSSe66wzLN4JgblIZK8gb0fKnFwFR
         wreqZnU9On2Or7/SkW68Th1524d7kkO9/CnrVQ8HaK7qGmulo8eo52wqx5IklV9ciCuh
         T5MyEdbYTFlbXPDW1lvM8kYAIDWDSmqvHpGoVXH3NbuwB34e0+XpBYZcTYKJ60MLf1LM
         uWIFA9CN/mdUXcfEBOnpk8vFODtHK2Q+fdhVV1ZPQZ9G3RpzeMij2C1gTfJDa3MLsOsu
         YnTA==
X-Forwarded-Encrypted: i=1; AJvYcCXcSpNln8dWqIG9RBsuzMpDlREO9Qql8IzRFEGeB0fQWXZaRFv4kme4ffaZo69qiFGwfscyXOb/E61MRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy0wJqcQiE0MbG89SmCkZtq1wzH8oh82+nZshT2B3AspyK+NEs
	4k/kVPP9J08ejEvpUAg0ko0AYjJUizlaphVBNvZuVkqUNz76k+emo6zR
X-Gm-Gg: ASbGncsbGM2bRy8iItAR8diMg3b0/vNdqhW4XX34gm5OlXVYRVvopdbekLzZIJzlAZA
	2vNKSp2iH2m9/0swQDQu03HZOsUN8ou29ClXyZ9ESsak3wNv6I5XLUB494tyAsZdQ0WdIyGReEj
	4p4Z/pEXxtOIZ58aFanTmzN7zlyDZBbw9TF5bZIXLWT8JdqX7NaJbtqA3kLddjiQStTRa45uygO
	RsFmYiU8kbnnPEEDizfJhEMHlc3szOrby4pYzxI01IFOW8TreoU+Z+XpHZWdkzN2tKdqfqb8jSC
	FD2pwCTY8pP7u9HH8ki6e77EYLvq88FlMAK+s3bl/fHM2q3hRE9yWUK+0O3xnH0dYiosgPtEIx8
	KAMydNRBLumFl7MDMM7eJHnTy3U1Zm12qxbC00l8fdQ==
X-Google-Smtp-Source: AGHT+IHKTOfJ3BPX9Gvt+4rkN+1gu0cdFOaljvM9zc+7rWxc750973qp3+kLMzRM1HA3dLLSY8sf5Q==
X-Received: by 2002:a17:90b:384f:b0:32a:34d8:33d3 with SMTP id 98e67ed59e1d1-32ee3dbc98cmr6602993a91.0.1758173979532;
        Wed, 17 Sep 2025 22:39:39 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:194b:8358:5c91:3d3d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed26a592dsm4145943a91.10.2025.09.17.22.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 22:39:39 -0700 (PDT)
Date: Wed, 17 Sep 2025 22:39:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Michael Trimarchi <michael@amarulasolutions.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v4 2/6] Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and
 GENMASK macros
Message-ID: <jfhd77aocqhww5iz5wggmua45nvaf6oyggtkyggltacsjwgknm@juwsglvompqz>
References: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
 <20250917080534.1772202-3-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917080534.1772202-3-dario.binacchi@amarulasolutions.com>

On Wed, Sep 17, 2025 at 10:05:07AM +0200, Dario Binacchi wrote:
> Replace opencoded masking and shifting, with BIT(), GENMASK(),
> FIELD_GET() and FIELD_PREP() macros.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 

Applied, thank you.

-- 
Dmitry

