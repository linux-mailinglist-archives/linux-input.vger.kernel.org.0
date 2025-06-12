Return-Path: <linux-input+bounces-12831-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE05EAD6B6A
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 10:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60E7E3AC449
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 08:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FACF20371F;
	Thu, 12 Jun 2025 08:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DtPe8Y1i"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A321DF75A;
	Thu, 12 Jun 2025 08:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749718355; cv=none; b=n3zDLUJdst2UGwrVJGBAnbVpsHb8eBFmzhpgbyos4ygQMviArGE6n4SFQkFwt8qIpRp9Hv7Z89vreQdsRMwdeCCEAxKVU2sIuJERSoWMI6VRgeN2oBBBRPpqyENpdcJ7/h6fClW0uDK20hTGnrNeqdYnlQI2miiUjewt7BdmvwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749718355; c=relaxed/simple;
	bh=4TBRPcDqLnwDSufC92i8YQc4oolIMbkdMHlqPtpmTiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pDnIR88FK3cZedEKITB7V+sN0lqB+uLoKgYp6BTTBWhV9kfH7A7j3GHu+Ok9OaNFynTLNvF37JBsxTeGp+GtgPGaeMGhz51GhIk82W0SLxPY6/Q3R1+byp35YxBiT3i/uQeqB9oHShiwPof2ORPC7EA8vnQHFWabM1dVVsVvSiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DtPe8Y1i; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749718351;
	bh=4TBRPcDqLnwDSufC92i8YQc4oolIMbkdMHlqPtpmTiE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DtPe8Y1ig+hYb3V3F5DSyrI3US7N7m59zAQ6I8iIYOXmAndIInxGDPBCtSLrhmsul
	 7OWRwKBOep6Oo3stI8g9d7ASkqCxlukz6cBDOVNCVnE7B9XBpuk4uhHeRnehWmh7og
	 sOqxIGNGO+6WLknAAHN67fEyeLjknErZiq9EDbpRs5HTmFT2Kn1BYMFMP0myJnBjJg
	 r6r86fpPoav49iEylRyS/VlJY1nr5EQVjxPwrXFcVd2r/XY/TaBEGctaVQF/esgYYg
	 f0kkcvWaB4cUnjqSaEk0O4RLtGUCjjvrWF0J6Kl3c3iFncRbhQTScggVMeRqrPuBdz
	 O6myVGhGzkl5A==
Received: from [192.168.1.90] (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3548A17E0FDB;
	Thu, 12 Jun 2025 10:52:31 +0200 (CEST)
Message-ID: <9cc6e90e-5bf1-474b-a326-532c3cb46ead@collabora.com>
Date: Thu, 12 Jun 2025 11:52:19 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] HID: playstation: Replace uint{32,16,8}_t with
 u{32,16,8}
To: Roderick Colenbrander <thunderbird2k@gmail.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
 <20250526-dualsense-hid-jack-v1-4-a65fee4a60cc@collabora.com>
 <CAEc3jaCX3MV7jTdmw3duS20UAMd0uZ0Ly5jzs3Hofa6SK3T3KQ@mail.gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAEc3jaCX3MV7jTdmw3duS20UAMd0uZ0Ly5jzs3Hofa6SK3T3KQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Roderick,

On 6/10/25 7:30 AM, Roderick Colenbrander wrote:
> Hi Christian,
> 
> I would rather skip this one. The use of uint32_t and family is fine
> and many drivers do the same thing.

That's again about ensuring consistency - even if it's not something
imposed by the maintainer(s), I'd very much prefer to submit patches
which comply with the recommended coding style and, consequently, 
do not generate any checkpatch complaints.

Thanks,
Cristian

