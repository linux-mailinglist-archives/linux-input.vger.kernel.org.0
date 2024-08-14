Return-Path: <linux-input+bounces-5572-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF84952082
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2024 18:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 173151F24080
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2024 16:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B831BBBC7;
	Wed, 14 Aug 2024 16:53:13 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.enpas.org (zhong.enpas.org [46.38.239.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D001BB6AA;
	Wed, 14 Aug 2024 16:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.239.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723654393; cv=none; b=CrgMIXAVmIg30zpGsva4T6clgDUfF78oxpm6PS+phqcqGW/mvCDqcL0IftgWKR63gKFBNGpOgjkdTjwUrbQpLITaOEMczY2GCHtKCJOEjLIVTdZwjQGdgxtaqYzkik0q0vLguDVvm3l1JTzhVAOglpN5k0KIe9WvljvVgisy2j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723654393; c=relaxed/simple;
	bh=gpdNjsprcuVnwg5M1W2jRJgd74H9IOHH+spvYYV9M+w=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=uUQIED4WuzQiOF8BWr35+CEE0lxx9+3OrcL4IdQEiJjtIP32dtp0EuPS3AuBAjdcyPraAZYcXTHrxe1F93dU+bEhcKtHf//KbULoogxuZz/12lP0XD2kw2uw2dlZWtqs/IkLgY6tuFysCHgW/b29mb190CRdmtQdngkP7XXRBiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org; spf=pass smtp.mailfrom=enpas.org; arc=none smtp.client-ip=46.38.239.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enpas.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.enpas.org (Postfix) with ESMTPSA id 827B710022E;
	Wed, 14 Aug 2024 16:53:05 +0000 (UTC)
Message-ID: <915c0ca6-4898-489d-a107-17033b94c2e0@enpas.org>
Date: Thu, 15 Aug 2024 01:53:02 +0900
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hid-playstation: DS4: Update rumble and lightbar
 together
Content-Language: en-US
From: Max Staudt <max@enpas.org>
To: Roderick Colenbrander <thunderbird2k@gmail.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>,
 Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 nathaniel.lewis@sony.com
References: <20240811130906.3682-1-max@enpas.org>
 <CAEc3jaBELzAnffyE4mzQeNAiH-F5AhQqMGvMKoL6yu4naHBo+w@mail.gmail.com>
 <1ff1239d-2f90-4c8d-8b68-b0e0fa2340da@enpas.org>
In-Reply-To: <1ff1239d-2f90-4c8d-8b68-b0e0fa2340da@enpas.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/15/24 01:40, Max Staudt wrote:
> On another note, I've dumped hid->rdesc for my controller which shows 
> this problem. It is different from my Sony DS4 2.0 controllers, which 
> all have the same descriptor. Do you prefer to guard this hack by a 
> quirk, which activates on, say, a CRC32 match of the HID descriptor?

Since I forgot to write this in my last email:

Thank you for pushing me to look harder for a difference by which I 
could tell the controllers apart. I didn't know about hid->rdesc before, 
and therefore missed this opportunity. Sorry about that!


Max


