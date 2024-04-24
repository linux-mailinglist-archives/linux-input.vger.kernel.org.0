Return-Path: <linux-input+bounces-3241-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B92FE8B0857
	for <lists+linux-input@lfdr.de>; Wed, 24 Apr 2024 13:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57AC71F23127
	for <lists+linux-input@lfdr.de>; Wed, 24 Apr 2024 11:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EAE315A49F;
	Wed, 24 Apr 2024 11:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=carewolf.com header.i=@carewolf.com header.b="Ql7E73PQ";
	dkim=permerror (0-bit key) header.d=carewolf.com header.i=@carewolf.com header.b="emaho29s"
X-Original-To: linux-input@vger.kernel.org
Received: from mailrelay3-3.pub.mailoutpod3-cph3.one.com (mailrelay3-3.pub.mailoutpod3-cph3.one.com [46.30.212.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D6113DDD9
	for <linux-input@vger.kernel.org>; Wed, 24 Apr 2024 11:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713958285; cv=none; b=EXXcYunOMlHlGdL78VdA5OEbgcYzouFUWuGCysGWwN0CttiUOePgDUyyn6vikZ+iJEUPaeiG5mvIqPCHGIB5u+GSp1XoM1PHX9v86y7M/yy0LydQ6ij0W4zz54w80pQFzYGAlj1jlKOJlmnizuWKSZpR2Yl8GPDpnuJB57gNV7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713958285; c=relaxed/simple;
	bh=WocI+kydEoNLGIxyswwT0BVFsa3elCOtzeRHRUN1NhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TGdcQ2YWj7Q5JoOdrlukJtVodjxeLWyegvQqb9XJ5NdlK9YqzD/Ft0RuTzrev31fs6DWKslN80hHnWY8sI2V1kMrL+IeKM6qvG557yOXB0IxEusL7xLlhHIQVDoFCBgit/kLKnDRiC1vXdl0+bGOF97StkQ3cB+9IiRIbgNNFG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=carewolf.com; spf=none smtp.mailfrom=carewolf.com; dkim=pass (2048-bit key) header.d=carewolf.com header.i=@carewolf.com header.b=Ql7E73PQ; dkim=permerror (0-bit key) header.d=carewolf.com header.i=@carewolf.com header.b=emaho29s; arc=none smtp.client-ip=46.30.212.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=carewolf.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=carewolf.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=carewolf.com; s=rsa2;
	h=content-type:content-transfer-encoding:mime-version:references:in-reply-to:
	 message-id:date:subject:cc:to:from:from;
	bh=DgHUUp6tFzs7q+y8o0cewN7ouY8O3uwxHNhxLT5MdMM=;
	b=Ql7E73PQaaBBz23wRVVjcFHxCVr3A30rOUfJr5j0RhyDsRuRgxuL+2+qDNZwk8lC4rqkCZtwtiOjT
	 AG5SFXGrZHpQXf1cmSu6uZGUNKkoBL77RP3Rv/TEEEqz7SjrER/Aa+XZgwAecyDkR4PC6T3X6Ig3q4
	 dfC+Q4h1KTgyWMS6TQNzzwldhvrOOsfykkWbEmPx+2DMgNrE0/M+wDGJHRKec1qRqWYCyElUOEXErz
	 Hn1l+pDyd1zH1jTjsdY/XChCZjRYp9V9wrvB75uDt3S1xZUO8Jq3BhOPigbIrpAcyQ1UF/NpX21zWv
	 OBFxiT0YtjDw2Rcm8ehqyKRRsH/UZFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=carewolf.com; s=ed2;
	h=content-type:content-transfer-encoding:mime-version:references:in-reply-to:
	 message-id:date:subject:cc:to:from:from;
	bh=DgHUUp6tFzs7q+y8o0cewN7ouY8O3uwxHNhxLT5MdMM=;
	b=emaho29soRfaI+vnYU/WNGFUp+Nv0XqGhdUj7wtaz6Kub+TnHLyRdFflcOVM+7qdUK7VisaziOvrm
	 wnosuEsDA==
X-HalOne-ID: 02c7ceba-022e-11ef-9981-5166eb5bc2d3
Received: from twilight.localnet (dynamic-2a02-3103-004c-5300-7231-17da-dcd1-9a4a.310.pool.telefonica.de [2a02:3103:4c:5300:7231:17da:dcd1:9a4a])
	by mailrelay3.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 02c7ceba-022e-11ef-9981-5166eb5bc2d3;
	Wed, 24 Apr 2024 11:30:12 +0000 (UTC)
From: Allan Sandfeld Jensen <kde@carewolf.com>
To: Benjamin Tissoires <bentiss@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org
Cc: benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
Subject: Re: [PATCH] Logitech Anywhere 3SB support
Date: Wed, 24 Apr 2024 13:30:11 +0200
Message-ID: <6092750.lOV4Wx5bFT@twilight>
In-Reply-To: <fe2980e3-3204-4572-9c7c-1e960727e1d4@redhat.com>
References:
 <20240413095453.14816-1-kde@carewolf.com>
 <ntsifcsfo5i6xisxbgfjdpe4uenygqxrt3v5sceflgipznw6cb@gnhvkjmglrtg>
 <fe2980e3-3204-4572-9c7c-1e960727e1d4@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Monday 15 April 2024 20:31:14 CEST Hans de Goede wrote:
> Hi,
> 
> On 4/15/24 5:54 PM, Benjamin Tissoires wrote:
> > [Ccing Hans as well for input]
> > 
> > On Apr 13 2024, kde@carewolf.com wrote:
> >> From: Allan Sandfeld Jensen <allan.jensen@qt.io>
> > 
> > FWIW, this patch neesd a commit description and signed-offs
> > 

Will add.

> 
> FWIW I'm also not in favor of stretching drivers/hid/hid-logitech-dj.c
> even further to also support the new bolt stuff.
> 
> AFAIK the new bolt stuff is significantly different.
> 
> Allan, I see in your other reply that you are mainly after
> highres scrolling and since the bolt receiver does not do
> per paired device addressing I wonder if you cannot just
> get that by treating the bolt receiver as a wired HIDPP
> device and just directly listing it as such in
> hid-logitech-hidpp.c ?
> 
> The whole purpose of hid-logitech-dj.c is to create 1 virtual
> hidpp devices per paired device and with bolt that is not
> possible, so I think that we should circumvent hid-logitech-dj.c
> for bolt and if we want to use any hidpp features do so
> by directly listing the receivers in hid-logitech-hidpp.c .
> 
I think the bolt receiver is able to separate devices, but yes, it appears the 
way it transmits device IDs and pairs has changed (some new registers it looks 
like). I am removing this part of the patch. I am not adding the Bolt receiver 
to hid-logitech-hidpp.c either though, because it doesnt work for me, and I 
havent invested time yet to figure out what would be needed to get it to work.

I will transmit a patch with just the new bluetooth ID, and add a few more I 
managed to find to fill out hid-logitech-hidpp.c

Best regards
Allan Sandfeld Jensen



