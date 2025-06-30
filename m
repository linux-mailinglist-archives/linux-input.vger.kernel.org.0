Return-Path: <linux-input+bounces-13266-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92459AEEA1F
	for <lists+linux-input@lfdr.de>; Tue,  1 Jul 2025 00:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4D4017B749
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 22:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5AA621D59F;
	Mon, 30 Jun 2025 22:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="AcgUP7F5"
X-Original-To: linux-input@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783C45227;
	Mon, 30 Jun 2025 22:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751322220; cv=none; b=uTeF+ayHqX0Ul1vJAN1IOfIo9ZxE+qKFMTrwEaRGLyGe00Fc1LLx3D+hcp14JfpAqvOWIl6r2OuOSBL4XUmUEUTpGKe7SOWE6GeOc6+C07Lr/p2e0q4TSNgTxvGU9tKbVzBrsdP/f8EbWCLe974nJ4pSinP+tKUAKNN9AYcwjwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751322220; c=relaxed/simple;
	bh=HcakANzATe9tMLxVNbaluex5vdQKi8x1kHVi0Py7suc=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NURknI68wmqjvI4Yom0dxabP/kroVzBUic4QIG2IaMwSQb+0UWeFvo8flKJz+6eplHO6RlNuZaV1jVRetZcKgBm/2TQHoyzWpvg6m3maLUM1rY1KMmbAeVa0y+PagnH3d+CJSWBH0NwQwU5beS6ZY9TgSD7HUnxeGUaRm5H/Gnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=AcgUP7F5; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [100.65.217.140] (unknown [20.236.10.206])
	by linux.microsoft.com (Postfix) with ESMTPSA id 600CF201A4B1;
	Mon, 30 Jun 2025 15:23:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 600CF201A4B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1751322218;
	bh=DfXdfCU1JXYHWgM00Dwc4NWjntBjNe637EIYzIR8E9M=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=AcgUP7F5Xs4efIzQ5AVmdKa7P852sKqoOBD9OFtayslYiPtUbgrNCaPsB5x3Gld0L
	 LP1XW6CcFe5MMWGw+TQYVQ9v4jHISvIhVkeCZpleKKdszGvQhRpLVlunF5jrreMfri
	 Oz/KtwqHFyjwVxxQTH3wGx+4JaIlZHQAou0j86rs=
Message-ID: <44e48ee7-07a8-4bbc-a98b-095bb1d585a0@linux.microsoft.com>
Date: Mon, 30 Jun 2025 15:23:36 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Subject: Re: [PATCH] Input: mtk-pmic-keys: Fix null pointer dereference when
 no compatible data
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <20250630-mtk-pmic-keys-fix-crash-v1-1-e47351fa9d1f@collabora.com>
 <41f3cc74-694e-41be-b767-20c7561990b8@linux.microsoft.com>
 <667whxdsghpao5irl66oh66l5y55m4k6n3ztifaizbqtrzccju@cmghlz2yauxq>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <667whxdsghpao5irl66oh66l5y55m4k6n3ztifaizbqtrzccju@cmghlz2yauxq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/30/2025 2:46 PM, Dmitry Torokhov wrote:
> On Mon, Jun 30, 2025 at 01:18:40PM -0700, Easwar Hariharan wrote:
>>
>> Also, it may make sense to CC: stable@vger.kernel.org for backports
> 
> What for? Stable does not need a patch papering over an oops, it needs a
> patch making the keypad working on the affected device.
> 
> Thanks.
> 

I don't have a stake either way, it was simply a suggestion, since it qualifies
IMHO, per https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html,
the patch "...fixes a problem like an oops..."

The proper fix might well be, as Nicolas suggested, adding the required compatibles.

- Easwar (he/him)

