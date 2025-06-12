Return-Path: <linux-input+bounces-12832-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C4EAD6B87
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 11:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46FF87A10BA
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 08:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAEDD1F0E20;
	Thu, 12 Jun 2025 09:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="C8HvU0yV"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F0F221FD0;
	Thu, 12 Jun 2025 09:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749718805; cv=none; b=cddG27eDBcQdJbMLllcw96kdUr2/f+/2C1PTnYnwPe7mncNSSf8WAAAL+ooNVCw2Y3BX6qg7ERuSVqZNBcYh0YA4rA5b70K+ZX0onJKerr2EMLuODagbojr6BBVduc+O5w6gDzyOb89i3jB81qiwvdPEe+ckh7JAkPIfGIK/caI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749718805; c=relaxed/simple;
	bh=kHhLPDWvvA6AVs3yjJR6UrbgwzIuOKCZrcRtqfK7ezo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ck1GlUDA3agrDXDOsy+w2fH1+OyyIdPtA3eSp0bUOBHorfj8J2HirBH+7KprH3709KqEPj4nxnLKAQls5moImb/TjqCMZK+Af/VGm5cmivw1+rsfFQH5tT5yHdAbDwxeoVyLIQtOH5NxCXDMd9smnsAU/NhiW3UEW+eRjNmuE/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=C8HvU0yV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749718802;
	bh=kHhLPDWvvA6AVs3yjJR6UrbgwzIuOKCZrcRtqfK7ezo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C8HvU0yVeXaCoclHSrxyKg5U/Lxdtex+FePgFlni+i6kZSR+bHIg/LlFqNZ78yrcp
	 UBjlflJ/okk9le8gp284pWCXShS7Bb6mosU6k1WM687e30d9FbvdBvhZOKbG8Yfvsu
	 1V0PnsJaxcpt0oDSC1q4wR/I8TVrgUkpcFv998EBE6ZOuyiezcM/SK19Aa9kLV+dIC
	 X/eWJwSTDjQADnXb9rJ6H3mvW+iLrdAEfh5g1G7ct2dJSnEjAopX+zEA8hCtLQwaEv
	 VdFcr6O799GlmtxBmwaYYdk+zUhHOiMfTFuicHcxXb7s7cqWrVFdsBfcZEUVgqFR0/
	 Jdl7357vsyFog==
Received: from [192.168.1.90] (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B72F317E00A3;
	Thu, 12 Jun 2025 11:00:01 +0200 (CEST)
Message-ID: <a0388b52-917e-4542-940f-a177f870ca9f@collabora.com>
Date: Thu, 12 Jun 2025 11:59:56 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] HID: playstation: Rename DualSense input report
 status field
To: Roderick Colenbrander <thunderbird2k@gmail.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
 <20250526-dualsense-hid-jack-v1-9-a65fee4a60cc@collabora.com>
 <CAEc3jaC-jm0kG3oM1z5BgW4FnXfgKztFg3rFyNUzKHieXxFh-Q@mail.gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAEc3jaC-jm0kG3oM1z5BgW4FnXfgKztFg3rFyNUzKHieXxFh-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Roderick,

On 6/10/25 7:40 AM, Roderick Colenbrander wrote:
> Hi Christian,
> 
> At the time I didn't document all parts of the HID report as not
> everything was needed. When adding in the audio stuff, let's call this
> one by its official name. There are officially 3 bytes of status, so
> the correct thing is to technically make it a 3 byte array of status.
> The official register names contain DS_STATUS0_.., DS_STATUS1_..,
> etcetera in the name, so I would like to keep things aligned with our
> datasheets.

I don't have access to the datasheet, so thanks for pointing this out!
Will be handled v2.

Thanks,
Cristian

