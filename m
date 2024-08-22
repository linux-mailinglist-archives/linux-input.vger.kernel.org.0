Return-Path: <linux-input+bounces-5740-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA4A95B403
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 13:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 457A41F22319
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 11:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A401C93C6;
	Thu, 22 Aug 2024 11:38:42 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.enpas.org (zhong.enpas.org [46.38.239.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0B01C93AA;
	Thu, 22 Aug 2024 11:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.239.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724326722; cv=none; b=LsaLe0D1O0EYI0cYg7RlN0PB/TPkaCi/YBRppxwwyJToglKUEUdsQT6fJzTYiP3asD8RJ43YKNEB8A9t4d555K6MZLzEmVGsZS1Ng0mPuUfx6Xn4BBbWmyFLE6+VNtnwfSKmlp5d1uiSLLm0TN3WQByKt3F6+tAuGUggrxI2Tws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724326722; c=relaxed/simple;
	bh=Ro82gGljlpSXIu23s78JkcgQvy3+Z38d/lJN97reotg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ellSBzfTeBoq9RA2cnXAnp29U+fsF2aM3IlA//4cC2EEU+pxGaEgzaDzZTA9AYK2D+hWgFRtA+87PO/QAFHECZGX7F+n38D2y8R175jz8kZJpboJG+liSHO8FXs5kUY9tfRJftk53+VtJiW6lgwTISQACaGNqqwgAD03DMDbRoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org; spf=pass smtp.mailfrom=enpas.org; arc=none smtp.client-ip=46.38.239.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enpas.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.enpas.org (Postfix) with ESMTPSA id C5AF0100225;
	Thu, 22 Aug 2024 11:38:36 +0000 (UTC)
Message-ID: <219825d3-22de-4cd7-8045-a7cde74bd9f2@enpas.org>
Date: Thu, 22 Aug 2024 13:38:36 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] hid-playstation: DS4: Update rumble and lightbar
 together
To: Jiri Kosina <jikos@kernel.org>
Cc: Roderick Colenbrander <thunderbird2k@gmail.com>,
 Roderick Colenbrander <roderick.colenbrander@sony.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240820142529.9380-1-max@enpas.org>
 <nycvar.YFH.7.76.2408211632590.12664@cbobk.fhfr.pm>
 <CAEc3jaD6sv=O+MbH5XtHvpXgXyzBROfLDYX2rGoa+3QCOJ-Srw@mail.gmail.com>
 <0b58bf46-503e-48c6-ad1c-e54a5c13e7a2@enpas.org>
 <nycvar.YFH.7.76.2408220025070.12664@cbobk.fhfr.pm>
Content-Language: en-US
From: Max Staudt <max@enpas.org>
In-Reply-To: <nycvar.YFH.7.76.2408220025070.12664@cbobk.fhfr.pm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/22/24 00:25, Jiri Kosina wrote:
> On Wed, 21 Aug 2024, Max Staudt wrote:
> 
>>> My gut feeling is that the previous fix is less fragile, so let's opt
>>> for that one.
>>
>> Let me know if you wish for me to resend v2 with a Signed-off-by. Or, I guess
>> Jiri might just manually patch it in - please see this as permission to do so
>> if you prefer this.
> 
> Now in hid.git:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=for-6.12/hid-playstation


Thank you all for your help in getting this patch landed!


Max


