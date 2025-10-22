Return-Path: <linux-input+bounces-15648-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C04BFA41E
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 08:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8F3934E1A8E
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 06:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61DD72EE263;
	Wed, 22 Oct 2025 06:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="dQSsE+um"
X-Original-To: linux-input@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8761723BD01;
	Wed, 22 Oct 2025 06:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761115033; cv=none; b=QDiHL/XcRBj+n+lf5O1jwPQCYosDsduPhhRsb2nYiokUp4r6pyk/hiOqGb1fupmTqs7aFMgr3CLQkRYn3Bb2RO1qJugOzUQyNMfrfllGjxoiRxYzXgARY2G38TvrnYTcz1yUqSEX9dJZHIWwkC/GD81aTZHGjgG62GxynEEHsMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761115033; c=relaxed/simple;
	bh=OzAEORfzHoNn8pD9aVd4weKw60QOxSKY+z6zfXNRlw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=an2sSNLMdodWxq0GCBuQCyEIlFQRyo8/RuP4UWdpqpaNSBRAY3wBEtD/648hr7RQ2sHZZaQt3jGWpc5olL/pp2//smcl/OyqWhcKn1L1uEbV1cdcD3UTkZIVO/Qjph3g3GX8DVahnaP+QGlDdkBEo2Frbbwl7AJGxfJ9pI5GxuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=dQSsE+um; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rhn4FhOs6gCpkc5XDX70aSILx2mEcUnwnt/38g3JO/I=; b=dQSsE+umHZR/wE2zO4mXaW1EAE
	YPbvcfIeBeXHSgyWoGjWt44fc0prDaDZ8acUgpn57DZwL1/OKce3qsFx47mKwa3j3FqnsTD2g4i72
	T9s1q5fjdsJiJeR48snT+3dF3CNxZV2C1TfpvZhkP9pPDEO4wHz4SIVwrHj4Z3vK65WUhyKMsf+11
	Vkp0MC4B0dzGowJ/0Scd1AiXDed/JqyIpyTbA2WfWrHD9YX67l6Sb8FCFJ9WzHA1ZfBGIfZjViUT1
	n8F7Wr1jMLCtWVI8L7ZJZ4xZkcgRSUOI74XQ4OtNM6hp7gXW8nFpftykpxCK19IAYP2qf6Z/yhKxL
	ViKAhWsg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <carnil@debian.org>)
	id 1vBRxN-007Ay9-HR; Wed, 22 Oct 2025 06:04:21 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
	id 8E4A3BE2EE7; Wed, 22 Oct 2025 08:04:20 +0200 (CEST)
Date: Wed, 22 Oct 2025 08:04:20 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: zhangheng <zhangheng@kylinos.cn>, 1114557@bugs.debian.org
Cc: Linux Hid <linuxhid@cosmicgizmosystems.com>, jikos@kernel.org,
	bentiss@kernel.org, staffan.melin@oscillator.se,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Bug#1114557: [PATCH v2] HID: quirks: Add device descriptor for
 4c4a:4155
Message-ID: <aPhz5L-ECc8CzA0a@eldamar.lan>
References: <20250923022445.3276026-1-zhangheng@kylinos.cn>
 <e0dde746-3761-414e-8df1-eb8557cadbf8@cosmicgizmosystems.com>
 <175716941557.2355.4359402692624340645.reportbug@debianduo>
 <e605f642-c967-4d41-8145-a10e8f48fb1b@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e605f642-c967-4d41-8145-a10e8f48fb1b@kylinos.cn>
X-Debian-User: carnil

Hi,

On Mon, Oct 13, 2025 at 04:32:39PM +0800, zhangheng wrote:
> It happened to be the holiday, so communication was a bit troublesome.
> 
> However, after a brief discussion with the microphone manufacturer,
> 
> it was found that the serial number was still 20201111000001 on another
> 
> microphone device. So, should we add it?

As this issue still affects one of our users in Debian, is there
anything which can be done to unblock the situation? Does that mean
that the proposed patch is not good for the microphone device?

My understanding is that it fixes at least Staffan's case which
regressed from 1a8953f4f774 ("HID: Add IGNORE quirk for
SMARTLINKTECHNOLOGY").

Regards,
Salvatore

