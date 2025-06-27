Return-Path: <linux-input+bounces-13143-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2F9AEBFC6
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 21:28:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07BDF16156A
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 19:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709482066F7;
	Fri, 27 Jun 2025 19:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NSp/PvDn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AF41F0E25
	for <linux-input@vger.kernel.org>; Fri, 27 Jun 2025 19:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751052478; cv=none; b=H4kx10AWSKZp4Ibe1u7XxCkW29krMvzEcrKVgZ4Tg2OLugbniCC0IhDhgQaT8LjdFlUm7OiMKEskSgWUDXY6N9Zgfo9PV9UQVeab0kGadCVRks9nRdJDNg++mSef2SrmHF5LgkEciUuv+vSLnfM4JYYhfuE40b6QXm8njaoPxKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751052478; c=relaxed/simple;
	bh=McwwWSGwe0kGvq0Zs3PXaMxPfax453sHE9GSYIEm6NA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czEmDo8hWeltVF9XlylQavz6BV2m2/ISX8OzV6CbWWUhID1M9PUS7XDaSOd7EwUeyH7axicUQmNhSuDl6AjP0LKM8U0Z1AzN5ad2+LINr7kvb8Q9c7lmvKGecXE9H3OtP9YdHEpVQxIUjVYA9MSYRlddRdcST/k9fk58H5ficgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NSp/PvDn; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-742c3d06de3so473088b3a.0
        for <linux-input@vger.kernel.org>; Fri, 27 Jun 2025 12:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751052476; x=1751657276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M5u47apymVn48MqxvdeEdJ8Blg6KzeCYU/F9J2WHiN4=;
        b=NSp/PvDnW+v+lZ1Et3XWtf/44c08Q524idyeKVYExU5ZByHZSl41Z5o8zhg+xMvCqb
         u6UNofJAHEgqt3BQK7w6H4BDAwNwRzFtAu5r38HER/Y2Ql2oeedM3R/OepuBjFZU+/O5
         DP38yivudtpUo+xeGlorVSXeP4mVy71S9cp5NAFqF7vdJSv8u/jld5a7BjUwpRYzkCN6
         RJ59eeqGZgUt8Rxkmy6HW75ZlAQpox77RzWkT1yOzhUOBpMWT7DSYpX2FGjAgZAi6fwX
         vEBUgywMb6IkoB72UnyHG9qkyqp/ZljD8Y/602XzDiElohvPOQ7z/SwJeaMqI8FazorG
         EOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751052476; x=1751657276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5u47apymVn48MqxvdeEdJ8Blg6KzeCYU/F9J2WHiN4=;
        b=pw74ik0S3so1SS7afr6Cyvr5IeO/Tw3METVxyi0d/V1D3edEI1zkMeMV5BHzebZM91
         r6xyux4LVgiZZwnt30M1VW+czaLyLEEPXIaHmu/BK3P9TaRtbQFQ5J9EUSCptY2SxSuG
         RQYs4L1CTIbbxJ8vLvCfoY4LfhXEltU5sX+NGFtjVt2ME18G5u8dXwvLsIeo4WAuu9vd
         2nyfAgmzW6dIGC5maXOtALM36OgAFvE6C6QCs+Qb9IriK6N0bN9lOLtd6+BJs5EFYeSY
         /+ZEV+8af44KotPSLi+7ZwkR1yHudEiL7/udzqBTJwuJw/6HV6/oOJ+wXXolCR74Szz/
         oFfA==
X-Forwarded-Encrypted: i=1; AJvYcCXXap4Z2zIHaQ0PM8Mz0Rqofxd47wfTGBSi8fkUypjiGPbmEMsGIlN1PEAQViuDkvFIT69AzJtH/g3kiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD82wU+U73NDCcMia0rwgG8mDKZVNBQY+KE1huTuhZ/t7EVCkB
	fVW20mxuJ3IaPSaGb58ysEPd6qZqL07Ucohy9MuIuk+163w6YntRD+Sq
X-Gm-Gg: ASbGncuRMX7DLTeFW9P9G2jyaHi/DbJPab+z5SlMpN2qtllXlcZLDrqXRouRmirIslx
	Q/D7+aWNZtpyXrXz7pVbgDGlGyupGnmwTHmgVX7q3Z5AAAPtrf8k0TZgf7hffUTGxNsFPZXbRXn
	DqdKOh3enOLCg0BfoUrBdr7tryj1jWJA6oMchl12maDrRJxkl/Go9gsfylfHTuJJZZEX4ucml3C
	8ZW9PGvv2qmzI0nPAwy3Znl/yswRjOJttIg0X8LBWV5KTv3q2g2CjKoKAd0baHVafTvgPOz1vTu
	vOSNFZlV+ohqInrkma5MSTdBdMs1N+526TfEmcIhSKdseg2BiEin8+mvK92us6RRFjOmELry
X-Google-Smtp-Source: AGHT+IEanJ95fIKzzhD8drDLJuxewJCUNFtq5lXeT3M9vbiTZ9PZZG6kgkNITb/Cd7ozshmYFH/tzg==
X-Received: by 2002:a17:903:350b:b0:234:f4da:7eef with SMTP id d9443c01a7336-23ac4666414mr69042435ad.52.1751052476126;
        Fri, 27 Jun 2025 12:27:56 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d0c7:d92:6a17:eb62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c1d3csm23176295ad.207.2025.06.27.12.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 12:27:55 -0700 (PDT)
Date: Fri, 27 Jun 2025 12:27:53 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: mario.limonciello@amd.com, rojtberg@gmail.com, 
	Vicki Pfau <vi@endrift.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: xpad: Adjust error handling for disconnect
Message-ID: <hmov2dzadsyd2eeghg5vcd5zvtre4l4qeeqkefbxjacxq4nafi@wms22effp6rs>
References: <20250609014718.236827-1-superm1@kernel.org>
 <20250609014718.236827-2-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609014718.236827-2-superm1@kernel.org>

On Sun, Jun 08, 2025 at 08:46:30PM -0500, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> When a device supporting xpad is disconnected it's expected that a
> URB will fail to transmit.
> 
> Only show an error message when the error isn't -ENODEV.
> 
> Cc: Vicki Pfau <vi@endrift.com>
> Fixes: 7fc595f4c0263 ("Input: xpad - correctly handle concurrent LED and FF requests")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Applied, thank you.

-- 
Dmitry

