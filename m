Return-Path: <linux-input+bounces-15707-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D76FFC083CC
	for <lists+linux-input@lfdr.de>; Sat, 25 Oct 2025 00:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3FD334E2622
	for <lists+linux-input@lfdr.de>; Fri, 24 Oct 2025 22:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9C430C370;
	Fri, 24 Oct 2025 22:28:56 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (cosgizsys.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B68B298CD7;
	Fri, 24 Oct 2025 22:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761344936; cv=none; b=FqbaCIse8mA8jApWKWByN8A5/oXFSUEhRcslgUGOfM8hUPj+VT0M2DiwoMTRk5uLA+cK85kiTqU6j1ivo3+oMhpodgPYVCCletxjDZ5KOGVijMQfzFh9gJCND5qr1jNi5FDBKVmj9AJyUm8wLDOqfVD7fnLKFauFFGsiZg9GJH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761344936; c=relaxed/simple;
	bh=QHxcs+HJMIReAOMTo277EoOXPg3/J1JtzmXCMluHG5w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ie3IKFyTPMqMILwTDwSEXBzDFJt4O8sRtCDMlNjUX3L5V0t81PjVw+ky5N3T8k4J2ZkzJu6KqTtU+ii+N9L3p4cAE6UQxJgRVwk9ZoIlSeQN+aN63fyvHaD0/5rsdp4/9ka4PR7Ygjv8X84BULEDw9HajrAkeAh6pCgayc8cEWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.100] (c-71-193-224-155.hsd1.wa.comcast.net [71.193.224.155])
	by host11.cruzio.com (Postfix) with ESMTPSA id C43702129961;
	Fri, 24 Oct 2025 15:28:53 -0700 (PDT)
Message-ID: <c7aab08b-52fa-41ef-a7fb-118298bb93aa@cosmicgizmosystems.com>
Date: Fri, 24 Oct 2025 15:28:53 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
Subject: Re: [PATCH v2] HID: quirks: Add device descriptor for 4c4a:4155
To: zhangheng <zhangheng@kylinos.cn>, jikos@kernel.org, bentiss@kernel.org,
 staffan.melin@oscillator.se
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 1114557@bugs.debian.org, stable@vger.kernel.org
References: <20250923022445.3276026-1-zhangheng@kylinos.cn>
 <e0dde746-3761-414e-8df1-eb8557cadbf8@cosmicgizmosystems.com>
 <e605f642-c967-4d41-8145-a10e8f48fb1b@kylinos.cn>
 <365f9f8e-549e-42e1-ac8c-7ff1f42c6977@cosmicgizmosystems.com>
 <8f0155d4-72a7-45ec-a272-7892e783bbed@kylinos.cn>
Content-Language: en-US
In-Reply-To: <8f0155d4-72a7-45ec-a272-7892e783bbed@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Zhang,

Since the manufacturer has verified that all the microphones have the 
same serial number you could add the test for that as well if you want.

The report descriptor is clearly for a keyboard/keypad and should be 
ignored.

In any case, the current v3 attached patch does resolve the conflict.

Reviewed-by: Terry Junge <linuxhid@cosmicgizmosystems.com>

On 10/23/2025 8:32 PM, zhangheng wrote:
> Hi Terry Junge，
> 
> I have made the changes as per your suggestion.
> mic.txt is the microphone report descriptor and is working properly.
> 
> 
> 

