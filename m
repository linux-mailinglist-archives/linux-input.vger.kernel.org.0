Return-Path: <linux-input+bounces-12827-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D37CAD69CC
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 10:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D8811884E13
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 08:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EABE2AD0F;
	Thu, 12 Jun 2025 08:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qmNRT0yX"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4384E1E491B;
	Thu, 12 Jun 2025 08:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749715254; cv=none; b=TNJ/SKSE2neThbIuHM8/EWnlTAM6xIfHJmC3rN7A+Ttye47r3nHKbGSsQNkAMsbyTra/XG50iNWoF7Uai3/SFRpgzTl0LZZ+5cI4wRQMzFhQwKo8evca3rf5WNAwMNVyyZnRH7vNeCss65k70yVtDD0clGKoplIaLeJ8ZPj/iGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749715254; c=relaxed/simple;
	bh=desxjdnqsSZXQRH99BwWawmL+/3SeH9taYKGxgTXdFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJVAND1TTEBZ8Q7kDLuggw9W7xAd6il0RbzzvomZxhiBiNRoH3jiOA9e2xYbAZJBc7Hi7gx/P+cPXeJo64f6XE3w3b7zfxmb536SZ5iYVJk1nPkIegtjfyojnNjJqrXsvwYpE4Javjbxd+Iz4XLTIc2ZUdkVFvQgb0HwebR1sF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qmNRT0yX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749715250;
	bh=desxjdnqsSZXQRH99BwWawmL+/3SeH9taYKGxgTXdFE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qmNRT0yXgFMIOo2OXuX4dN0Xhn+L4mdLweHj8p2xfiU3NR50YBxwqg87Mk/EtY2hs
	 eL3QIDgaNeeySk5NtKAheI9W/vIpf4giP+cdDsIVjptdoV0d7oc2CyIWg4WZnkYFho
	 M2pAlqWzK9y30IS8x70G7zBKWZ5ez0UndXUDhxD8/HMhB++zGuchJqTcnE57VuF37i
	 qbdkS4Vzv55INGyjGpgRJhUC5WEKHz8r/icyvyjzVzWHbI75zdQcfNHUAJhoVVJeDa
	 0CJhl4SkJVAyA8S3SxQgTKvu8NFsWDVigfgXLR/IDRU2RU5l8coAQFg9TcnXyD9PQl
	 xqpV2r1gDYH/w==
Received: from [192.168.1.90] (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BBEAA17E1560;
	Thu, 12 Jun 2025 10:00:49 +0200 (CEST)
Message-ID: <6adf1ea5-53c3-47eb-ba4d-6c7e58dd05dd@collabora.com>
Date: Thu, 12 Jun 2025 11:00:38 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] HID: playstation: Add support for audio jack
 handling on DualSense
To: Roderick Colenbrander <thunderbird2k@gmail.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
 <CAEc3jaCoVgP=0v73ZTeAhd0wb2LpGqguEedY6haNLi_HNA_Mng@mail.gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAEc3jaCoVgP=0v73ZTeAhd0wb2LpGqguEedY6haNLi_HNA_Mng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Roderick,

On 6/10/25 7:01 AM, Roderick Colenbrander wrote:
> Hi Cristian,
> 
> Thanks for sharing your patches around audio. I need to have a closer
> look at some of those and how the console also behaves (we try to keep
> things in-sync'ish when possible). I need to double check the
> datasheets as well.

No worries, take your time!

> The series does contain some other patches around style and stuff.
> Some of them for me are entering that slippery slope of what to
> change. There are some different styles in use around the kernel (e.g.
> uint32_t etcetera is fine). But then if you use super strict mode on
> checkpatch half the kernel almost needs to be touched. I'm a bit
> skeptical on those kind of patches.

While I can understand that some of these patches might be perceived as
unnecessary noise, I still think the sooner we do this type of cleanup,
the better.  And the rationale is that we should aim for consistency, at
least for the actively maintained code.  This should also encourage any
new contributor who might touch the code to comply with the recommended
style and/or best practices, instead of potentially falling into the
trap of taking as reference some obsolete or non-conformant constructs,
which would only bring additional mess.

As a matter of fact, I initially planned to just focus on fixing up the
patches introduced as part of this series, in order to make checkpatch
happy.  While doing it, I quickly realized some additional
inconsistencies, hence I extended a bit the scope of the cleanup.  That
highlighted even more issues and after a few iterations I eventually
ended up fixing them all.

I'm aware that some of these checkpatch reports could be silenced by
operating in non-strict mode, by I don't really like the idea.  The
reason is that some (or most?!) maintainers prefer or even demand using
the strict mode, hence it's hard or impossible to always have then right
switch set, particularly when touching multiple subsystems.

Thanks,
Cristian

