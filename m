Return-Path: <linux-input+bounces-12830-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85993AD6B28
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 10:43:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6DCF3ACCB9
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 08:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F962153CB;
	Thu, 12 Jun 2025 08:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="P7Cloj61"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC302222A0;
	Thu, 12 Jun 2025 08:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749717694; cv=none; b=SUfhlWtYN48w29WBwzYUstnURqFFczYWBFghsDIyE+MjGN1dvcwy+IxEfVlktGIUGk1alV0+NNXBV9FnsaNqplmDMpZxrp61oE7/E5+pboJxSioAIkLG2pOA/EbNvBHGekEDp01nqwXKHYx4vW6V5Nc8PKv+fr0SzLzyxDXBOrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749717694; c=relaxed/simple;
	bh=ceuO3byIRRm+MqMZlU6KysEwLuLv1zbJ6tHnEEr8Wf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oSuqlR9XYfd+xD18Phi3huf1YBSMgtJPYNYdvkrKUNiJY59yB3o03XsVj95erltsZUR0t7/4VUnH4mRcAFkNdjogS8vabdHtGuOrjs7fuS7njvm2gxWKT2315j97J+AmDjw2hueSRvFiOfxZWWT/1JdHOtzMwF/rL2I3Z4kcXTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=P7Cloj61; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749717690;
	bh=ceuO3byIRRm+MqMZlU6KysEwLuLv1zbJ6tHnEEr8Wf4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P7Cloj61ekFKIP3wKs4Our4enhTRTBleSgxEycbY6EyeW3jq1OGAGOwH3tVXRHcqL
	 epa37gtqTbfKY6LzdX6zCeJccIumG+GldnRSHzEqPvqS5zj2kSu1B8CgOTOSUcHOmk
	 ACHu8RhFqrwL6BjKVAmz+kbyC/mwmAg248C9ApnjlNc8nwG9xlFkgacyU74WeTnMAD
	 +LpargqRTWPTCeZ8CTTXfxYXxtBR6QjGqC4jJp7i2mrMBF3pGlMFECWI7VV6QT5wcj
	 bIspE6hBvpnZi2hjmN6OAUYofmbOlIaY2vaoAb1dl5DC83MVw1A1K9SiPeELJiJl1C
	 BV4Xi2fK5DbfA==
Received: from [192.168.1.90] (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1C6B917E00A3;
	Thu, 12 Jun 2025 10:41:30 +0200 (CEST)
Message-ID: <110d6ab5-3977-44c1-8790-badb66108e81@collabora.com>
Date: Thu, 12 Jun 2025 11:41:15 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] HID: playstation: Simplify locking with guard() and
 scoped_guard()
To: Roderick Colenbrander <thunderbird2k@gmail.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
 <20250526-dualsense-hid-jack-v1-3-a65fee4a60cc@collabora.com>
 <CAEc3jaDRCD66B3Y7V4Ehzw2GPUNLXV8DmLfEcDhjRokOeXc8Xw@mail.gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAEc3jaDRCD66B3Y7V4Ehzw2GPUNLXV8DmLfEcDhjRokOeXc8Xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Roderick,

On 6/10/25 7:28 AM, Roderick Colenbrander wrote:
> Hi Christian,
> 
> This patch look fine and does simplify some things. Though in terms of
> size the patch is a bit long, so it took some careful looking at the
> code.
Yeah, sorry for the long list of changes - I had a final round of
inspection before sending the patch out just to make sure I haven't
introduced a regression or something.  But that's not a guaranty, 
obviously, hence thanks a lot for checking this out!

Regards,
Cristian

