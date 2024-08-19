Return-Path: <linux-input+bounces-5634-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A72379562A6
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 06:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BC8C282269
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 04:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8FD45007;
	Mon, 19 Aug 2024 04:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMlk48lS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19E12BD19;
	Mon, 19 Aug 2024 04:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724041908; cv=none; b=S/tI2GocIV5hnIZA1qag4BHIU6MAC13bbBtnGYWWsCLlCg9tKRx0X+Uy3HzaPVhTq5pxBYMs1PyKEG9qBY7+Uk8xWQK5a+gyZyeYSwheoBjBbsQwFr+Y+C0wbIjxr1IjsHvBws2J+DLpW8F/QHRd31ysBIlz87RrzCIO5Wq8EiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724041908; c=relaxed/simple;
	bh=xDGFKcKC/DzR7T7hJJly8ZelHW74kQX7NcH/afVh8b8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHK3udGb63mUNTM6/Y98lVAaiQEmdIUzgNmbrCrXzUbO0mmMzJz5yKkrEx85Wb2+n0TiRGQ/dRKflcTj6JPm93UZ6+iIcw3ryDjMXlFiiTq1LTckl7p6mVPxKCfEYTewdssQxVOa/v8gNILRgyOtMOPE/zQISUcKm7oIzUc1MXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMlk48lS; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-70d1a74a43bso2528557b3a.1;
        Sun, 18 Aug 2024 21:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724041906; x=1724646706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SfpJsY7O5Oh7P4xrQ0F5MpnYzbYc4Uv8Rvv2p35vvOI=;
        b=nMlk48lSdR+KlnQ6EJOmV/uVZnQ0yK1Aelwo7b0wMa8EUBm2YM3g5GqVvluvyeBssZ
         262YdoRx8ZxicEYrail7KC0nhLR2IPyGrv3hIYaoaGlV5mGG/zBnsZJxyBsKQZI8ys6z
         3/WbifC2Up8Pllykgq1hRbsowKRL8nf8zLCbwg7QeC6O2LARRSzr561xjXKoaSMYrkse
         yQZ+xnaft9VPXo2PUtHKxNhZddkCH8G5zZuERZcvdZW2qTiKgx+wmZZRBBObPRZ5OwrA
         21L7rvsVTUBdYPW7rJjSy6cZkO3zPIznRMMP8qvjOA0UZGE25F0tst/HzzRTlDbbaYKd
         BRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724041906; x=1724646706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfpJsY7O5Oh7P4xrQ0F5MpnYzbYc4Uv8Rvv2p35vvOI=;
        b=anvfojeHXit41+Ny2gJkm8do4tDGHakBPNWwRNyOfGVF6IfE7GXjOi5A0jUxDSMo/L
         57Q1wdJTjhkwOL3vAZlIwym2WITNgM/LhqHfXF/4yH2b6j2qCsXuPKSGXlEIDzEHueaA
         kNQkQo5yyg2SajZDprJKpsxE0+89OzjRAe61cobBVAnlwLLZHBQAtbym9PMsrh8EpomL
         VcbELVaCobUsffOnpcAeKKmOANJyd82hVWpLjhpfcXpFLMKd+UY/3+ONfNjGwP0PNdOm
         N1MoeGbb/iReiZ3yL5U3yUxMmzsS58ryqlHODg5Quj8BISLMtD5iEB5+jr7uHMWT4vGf
         OiIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwA5zlcJlyMiKyo11ps3OOe4Lqg2VSRyerrRSz7LFtjgDFjKUpWZ/8hqzNFcxAeUdzJIdD7yoXaEI/f9B0eOeu874g6EPJf0o0S+qRPRvTOvIXUgPw9fAs/K6SpA1udIkQrCQoypwj0Rw=
X-Gm-Message-State: AOJu0Yz1ywsuwbEcjYlap7xrye34sbh4z7V1qugaRz9OkSdQKtuni31g
	ypElmFx2xxO32DKPWdu2Dxe92vaPNi4tKjxzvixfkcWWXSIlkiHU2IdhXg==
X-Google-Smtp-Source: AGHT+IHfFFch7UZIeUDElc6M48fBXcbscYnICYgdhc7cmHLoookTU/hpwiBc+Kmq5+kciUO8UYdMMA==
X-Received: by 2002:a05:6a21:9186:b0:1c3:b234:5f54 with SMTP id adf61e73a8af0-1c905053866mr9207037637.48.1724041905682;
        Sun, 18 Aug 2024 21:31:45 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4eb5:4500:6efc:6c24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f0376ad3sm56297815ad.175.2024.08.18.21.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 21:31:45 -0700 (PDT)
Date: Sun, 18 Aug 2024 21:31:42 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: hdegoede@redhat.com, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] i8042: Add forcenorestore quirk to leave
 controller untouched even on s3
Message-ID: <ZsLKrnnsc1rh2KxW@google.com>
References: <20240104183118.779778-1-wse@tuxedocomputers.com>
 <20240104183118.779778-2-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104183118.779778-2-wse@tuxedocomputers.com>

On Thu, Jan 04, 2024 at 07:31:17PM +0100, Werner Sembach wrote:
> On s3 resume the i8042 driver tries to restore the controller to a known
> state by reinitializing things, however this can confuse the controller
> with different effects. Mostly occasionally unresponsive keyboards after
> resume.
> 
> These issues do not rise on s0ix resume as here the controller is assumed
> to preserved its state from before suspend.
> 
> This patch adds a quirk for devices where the reinitialization on s3 resume
> is not needed and might be harmful as described above. It does this by
> using the s0ix resume code path at selected locations.
> 
> This new quirk goes beyond what the preexisting reset=never quirk does,
> which only skips some reinitialization steps.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Cc: stable@vger.kernel.org

Applied, thank you.

-- 
Dmitry

