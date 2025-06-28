Return-Path: <linux-input+bounces-13152-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D46AAAEC3A9
	for <lists+linux-input@lfdr.de>; Sat, 28 Jun 2025 02:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFB2B1C26314
	for <lists+linux-input@lfdr.de>; Sat, 28 Jun 2025 00:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53BEE18B495;
	Sat, 28 Jun 2025 00:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m37lHUg/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0028189905
	for <linux-input@vger.kernel.org>; Sat, 28 Jun 2025 00:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751072202; cv=none; b=b1wfitBrWAzZ1LoKyKBA3RFV83BCgvXkTQXxNhhOohZZC6is+YzzxG+IuHs61iAQU93R+yoImh8zUjZ/Gf1zyRoUhzrbSJVk5xU+keaVc06//lZM/BKw3/o8jsItmFnnZmkYGROCjQEIxu+x8Qp0CHa4bDmm5aWocN4DsY/+3/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751072202; c=relaxed/simple;
	bh=h8rLv10TqIXazKSw7v1fcFTVYT0yDYsB0io4FeorvAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mN1jw7qvu4ztJex2Y3kMd9hj+r4k+0du84K+S+hSMnhkjCXjOSGdZWl2TggLEqakFNwIcxFs4aijmQmEi8VpuVOLKA8/d7XsCf1Z8iDNNH4DsAwmqbT+akD4Wr+ROnVWUXA3ojgaj9HyAUeCdLsTYlQqHKtmJdwrvyh2BH84FtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m37lHUg/; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-749248d06faso3088231b3a.2
        for <linux-input@vger.kernel.org>; Fri, 27 Jun 2025 17:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751072200; x=1751677000; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n/N9pHCJQlj65+ytlep2byxOJKnEUrXF0oCL+fPLA+k=;
        b=m37lHUg/Rza7cmfjq+cd7t4ffqQoWpJSLBv5qBxBKc5I19/nAjEpQ0R07L5Wddp7Os
         VIMXOvnqJUlaYlH5msG6xyGbY9lusyfSQX1vny8d3P8fkSo/3By3vomwLZZHBVjCdPrB
         DZw6REEc4qL1ug0kYpsSkX+jyJAcHear8jv/BG6SNBxtRHCix6PmmtP2M7xCTAJTU6GR
         BB6gvyutiY2EfE55Pkk9I4ha/U3epabjKMTsCAH4AAyM7s6FzRkWdN9xGxBPAPO2FaPV
         ou1mixWYcX/RxBUZu32rZSycJ5RPg8uWwSTtXOSjYlCxCl7T0bJal7XbwoDLhoPdHsUG
         W/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751072200; x=1751677000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/N9pHCJQlj65+ytlep2byxOJKnEUrXF0oCL+fPLA+k=;
        b=hULo+AAUnXFxbSBCIRVaKavYwLBm/4iDAtFPT7hvioS8I3HKbAYHJAR0J4w6JzFtlk
         GF0I/TMRV1Q4YzK4cWHmUb0TZl0XhayeMmqoieFI5CIOyd2WOlchhs8C36cx6qsfcIn0
         MrMGVj0mvXgdi/TU9SA49bX3Ftlfjx0jLJo4Buzu+uxzuOP/4Z2LB/ho4Aelmag4Bimk
         IglqTFjUIMpnmYsV58VIzSqm405m3kXtH1/zcbEE4Sa/rIhVmf6TjaodKsqGbHYYNhu8
         gbuv9SjwYpgHZYLs+qz/6RO7ar7I98FufHRHQ49m1iep148QVgo+yGpeCFzkotYWuuWP
         84KQ==
X-Gm-Message-State: AOJu0YzqEOYykpMXwbgZfPKuPc5bljxNZWY1NxY8RREEGlULXt9ke6hr
	+4tGyBnzZiNsG3llLd4gmFe4H90hRIwwfpQWXs/UmoaMBPchSmzi2oqq
X-Gm-Gg: ASbGncsLkZ/ZcD3QV7fR4oc5ooI/ZIjheE38oT85PPYKi7wLUhaQN0/oUJ+VBE1BimL
	vNqzDqPp/tP3XLIV9WCil9py8VDSomJRV5gAEjGkms7JQAt/Tv3+PCRBbD9Vj3MecmqTLDCL3dD
	IjSPi7nmvkJiZMzqT/GXQooHmWkZcydvPciGiyvzAByPuxbk1WAjaO114ZZHB9PogL6Ha6cFmao
	GXqfoJzrqbh/ZanQZYypYtBkbl9m1Mu06nXsaoKqyQRDg5X71Qnx2OUqdLEiUZRD4NUVM1xn3wE
	YoO9Igmn2XsMimiB7Y2HwGaC5tap8PKA2tQJW6Uz2jwtd8p+n9011MjFqs5evw==
X-Google-Smtp-Source: AGHT+IHYTyHNHWDdrDe/MLIQYXZ1iSdcpX/5XDOudbQf6CyGt1LW383ziCkhhmUjETZynKE3CVp2Ew==
X-Received: by 2002:a05:6a00:2e82:b0:736:5822:74b4 with SMTP id d2e1a72fcca58-74af6fc7eccmr6606744b3a.21.1751072199973;
        Fri, 27 Jun 2025 17:56:39 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d0c7:d92:6a17:eb62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55c7e89sm3356583b3a.109.2025.06.27.17.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 17:56:39 -0700 (PDT)
Date: Fri, 27 Jun 2025 17:56:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Nilton Perim Neto <niltonperimneto@gmail.com>
Cc: linux-input@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH] xpad - Added Acer NGR 200 Controller
Message-ID: <qdwwrbmk5lhdncuowjybc5ii4yztmbwmdirwlrvmup34hqrytr@ccc3w5zvcbqt>
References: <20250608060517.14967-1-niltonperimneto@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608060517.14967-1-niltonperimneto@gmail.com>

On Sun, Jun 08, 2025 at 03:04:45AM -0300, Nilton Perim Neto wrote:
> This patch adds the NGR 200 Xbox 360 to the xpad device tree and also Acer's VendorID
> 
> Signed-off-by: Nilton Perim Neto <niltonperimneto@gmail.com>

Applied, thank you.

-- 
Dmitry

