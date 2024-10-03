Return-Path: <linux-input+bounces-7043-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FBE98EE60
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2024 13:46:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A53D8B23E3B
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2024 11:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9406514F12D;
	Thu,  3 Oct 2024 11:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="larTJzim"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD4713D245;
	Thu,  3 Oct 2024 11:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727956001; cv=none; b=a7u0ypEg+p20zOekeAjcdHSJmOwDwf8rnWSpxtDrQJg82jF6IaieVLPBb+W/N6gPopxzh+ZDKOo1R+FoXEI/O5Z0X17hMkWk0OqHk+pSMFGuZiODcALY7O9fSb3uPSaVt9Ez3OGznbiMbdao32D1BumyLx3y/D3tdF0bKrp0has=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727956001; c=relaxed/simple;
	bh=sBxW+KZU+ioaWiugsFWBycVCH29FrwaIOZPhAdwh4+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nit/r1s0feFxHu3VFc62yMM6mRVtDMIqQcm71CsupfliPvTMcBRouyQs399bZX8pMunOKNLPBfR3Mv1lRWbvgF2izko3K26JxHahZapoyUY0/rgTeP3SZmzctD4rO0wOdz9FdCzsUewMrBTlMTXut24ZpBa+B/IXhlBjJZJaMe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=larTJzim; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20b7463dd89so8609145ad.2;
        Thu, 03 Oct 2024 04:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727955999; x=1728560799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dxoosp2XHhfn2bD9oac9bz/JCfWimb3Tn75xzIZVdsM=;
        b=larTJzimcrt6DRId/duJJfJvQju4LOPuxjBA35J9PxY7PqIYjhexaL7Qx8azFOT88O
         BaILYh90u5nKlVIed6uYYMtdxJ/w352JlV9mDkUVaHFB9wuiFxPq1jLKePatZ6wBrv1i
         bNyefSDo0HZm0f3vb6VujGVW1NxKFcYwSOaaYbWvsCSEB60/BEtCq/BU+8HvnsHGRJMQ
         NhqUnf+FNm0T1unhTNBwR+0s8E0YSfZxvnCKm96w+E/wgUo95mor+NM/hMVKCuFn1zAY
         wX3Yby9t0J0fIOSfS4DCknK4cPlm4ssKNf2OHgR5t5YQGfIyRb0by3KrOTarupSYa+Lq
         dhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727955999; x=1728560799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxoosp2XHhfn2bD9oac9bz/JCfWimb3Tn75xzIZVdsM=;
        b=TzUJuHkYXmVV7NataGRkXUk+GUL6TVp9Rdwor2Th5MlWS4m6CUnfRuVB684Cs/Xv5I
         6U2cKbXT5vExp85+RYmDRPPpxp5g7RYeK31jkIqtVr9P8naJqLpct0XnTpJsxPqQBGnU
         1Er+O0OlmRP/idVL2CoS7SD1tCxQxKvuogsFly/ZmItT4gOspcSmus4fu+RcJykZ4eHt
         +7odbD50Stt+2nNmOpJywrdoCsL6uhsjIJLVjhfx17VXtsmJ1TZADHgRGzHzOvgep3dH
         jYO1IIjeGSVPq1n+G7DkYg4Fu6+/o+PMiLx9+eTJ++eK7NQ7R9xo094dVLdDrm3Y/fHS
         SiQg==
X-Forwarded-Encrypted: i=1; AJvYcCX4YOuAbGXC6wCDkWhMh2J0+ChuNi3A0VkAoIzoL4Z+vsSI7to7yAkomcRqctSodu3lCefCGLMxrq+4px2B@vger.kernel.org, AJvYcCX7/NO8qp4iBb34H2QMClfsfdw+6/PWI1r2Vj15ccC+u4BW35GU7+rIMhLcHEfrvv57l61l4/KgMs8+pQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaXl3ZLDwzSWVH9E+c70QRLG3b8tvRGeXVN8xL+2e8ReGc0h0n
	St1v2RIlJvKTUGDWQgQYedtDbk8l3O/dEdq0RuYB3c7Uph4UvaZb
X-Google-Smtp-Source: AGHT+IE/nZh0I7/GCo28tPCNxTDPgf1eXfIKjjF4dp2s5mm77ovbV0hIFr+dPxydoiidBwnomT1TWQ==
X-Received: by 2002:a17:902:c405:b0:20b:84be:712c with SMTP id d9443c01a7336-20bc5a875e7mr107331865ad.55.1727955999406;
        Thu, 03 Oct 2024 04:46:39 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:fba0:f631:4ed6:4411])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20beeca6fb0sm7659275ad.75.2024.10.03.04.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 04:46:39 -0700 (PDT)
Date: Thu, 3 Oct 2024 04:46:35 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: hycon-hy46xx - add missing dependency on
 REGMAP_I2C
Message-ID: <Zv6EG6EYRJTFuf2o@google.com>
References: <20241002-input-hycon-hy46xx-select-remap-i2c-v1-1-08f6e83b268a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002-input-hycon-hy46xx-select-remap-i2c-v1-1-08f6e83b268a@gmail.com>

On Wed, Oct 02, 2024 at 10:56:37PM +0200, Javier Carrasco wrote:
> hideep makes use of regmap_i2c, and it has to be selected within its
> Kconfig entry to compile successfully.
> 
> Fixes: aa2f62cf211a ("Input: add driver for the Hycon HY46XX touchpanel series")
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied, thank you.

-- 
Dmitry

