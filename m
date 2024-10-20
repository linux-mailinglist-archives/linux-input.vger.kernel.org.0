Return-Path: <linux-input+bounces-7567-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 858EA9A5264
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 06:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB8001C211BA
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 04:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB93B666;
	Sun, 20 Oct 2024 04:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4yhR0NJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E731FC0A;
	Sun, 20 Oct 2024 04:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729398017; cv=none; b=ek9fSvus6QyFOVaqab7OmuS3cx3S3D92QbyqCnvnoN6tcLNBXEX53pqr0iYllq7PyTbos2stO5uFcJXeh8Sd6zbNfdj0PVKeBDrx7nKRCPMA8E93dnX2RqKOXfVc4grUTVE4pIi1yo0zVWI9/HCTNkXmmAHwOqx5KJY78SBH9sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729398017; c=relaxed/simple;
	bh=ucoKzAfhP4N1DBoA72ymTI/rTVDTjLWtsVOIvJWbPsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XMoryxJjvvlQ4gBrgfF8bOMQcak9ZkyZ5P3aYhnJau40dvGCmLtHj1/6c+bdxDS/YSphKX0aEEpEvPU6TZgoqGouN700QIN/+kz6CAFWevWuO3L5W/OTsL4b9qqmPBnPOjgLUO2cDNnu8UYwWLv1DrRsXr5WcOuaJrhh4WhOEnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4yhR0NJ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20cd76c513cso29377625ad.3;
        Sat, 19 Oct 2024 21:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729398013; x=1730002813; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tptjKfYEQQF+U0/Q+FaHDkTW1qtsrHC+9O21DSZ+nB4=;
        b=Z4yhR0NJjNanVbll735lp6QbtbMwtg0VT4+I9JwiF0Z8L9ssDUesTp86EZfXjFLRLS
         hmC09C6ue389GyeUJBrP++0vAQeU5wIh1IpynpQ04wyYd7tspBm6GpaMCY2CzkVv0GZj
         OpQYLUIPe1U76coH4ZW+LOhRxJegF3cHngXRIP+FoTGeyPGF+qsYiZn+YwhBdPKJL6lG
         XhqMh4K4NZCk4MBFFuzir/rNVvCaLG87XUORLT9LF3MQIqodPXb/viONJlAsSZ/nT5MG
         4N97zf2jU2a1EM2mcbkb/i82WNlxCdTAWtQLw5wX5qF+gtTm5gbALr4j61WzDMQmx9q+
         9VdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729398013; x=1730002813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tptjKfYEQQF+U0/Q+FaHDkTW1qtsrHC+9O21DSZ+nB4=;
        b=EaAnmD1RSYQgMybEgMGFPdedjGEoXIjqqiChu+XX3yKtOUiGYKdWtdLAPLmsDN+zyS
         3GOiDSmSDnX/RH5qbZL7AIz3u5dch/9dw5YjbopVAemFCdXO5DdH+Hu5rTJSFE78mTnR
         dKGr1J6sZeb9Gr3GEYs7zjo14L5h7AbsIJA4nhtG45K+2IYWdrRmRBHE7/mEQvAlkHo4
         Iz7Tg9cQgHL3SFJ4SYhQ0+mW1Xa3yJZ8gBEqL22oRda7PvkOfPdbgiSC/TOx6cItZ+m9
         pThcRvft9idxTxTZbYl0trn0mQ9237lBhXQFyUxVESaHPyFNXaZwKztYQ0I+odnoymS9
         a30w==
X-Forwarded-Encrypted: i=1; AJvYcCW0BxExHkNyWXraSrf/rfeFxfefVBkinD19YLE0nkZUVcKYSIsP8divq/YMP7LKgGk8K+aBRCwBaem+3A==@vger.kernel.org, AJvYcCWttrj8N+cVao+gPnao98AWqMdxdkNZfAXfGMRvsaB4DNE6AnX2c3ggkLI1VOGRiQos9S+pNWzD0rmTWWjt@vger.kernel.org
X-Gm-Message-State: AOJu0YxhiPEihIE2Tc9jEejyay2jQxSGiP4kusYJ6TZ1WzKR7Eund9Ya
	vap9RDk/TBFEh/1gzD5MCm44i+0BlnfavU4H7DBnuEcNQeHPkMeX
X-Google-Smtp-Source: AGHT+IH4soPnB60xIfxMOaiMsildnpr5Xj1NAwq8oNtm2eFEI+8djQ/DtBOvtVOIoBtzygMoxkZyLg==
X-Received: by 2002:a17:903:22d1:b0:20c:5cdd:a91 with SMTP id d9443c01a7336-20e5a9338b3mr105516805ad.41.1729398013446;
        Sat, 19 Oct 2024 21:20:13 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ce:a853:5ea4:fdb6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7eee3c88sm4452675ad.43.2024.10.19.21.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 21:20:13 -0700 (PDT)
Date: Sat, 19 Oct 2024 21:20:10 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 09/10] Input: raspberrypi-ts - use cleanup facility for
 device_node
Message-ID: <ZxSE-iBTWc2ZRfik@google.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-9-ebc62138fbf8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-9-ebc62138fbf8@gmail.com>

On Thu, Oct 10, 2024 at 11:25:59PM +0200, Javier Carrasco wrote:
> Use the '__free(device_node)' macro to automatically free the device
> node, removing the need for explicit calls to 'of_node_put()' to
> decrement its refcount.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied, thank you.

-- 
Dmitry

