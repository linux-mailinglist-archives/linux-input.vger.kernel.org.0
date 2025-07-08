Return-Path: <linux-input+bounces-13416-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3A0AFC69D
	for <lists+linux-input@lfdr.de>; Tue,  8 Jul 2025 11:05:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32C0C3AD50E
	for <lists+linux-input@lfdr.de>; Tue,  8 Jul 2025 09:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D4329ACFA;
	Tue,  8 Jul 2025 09:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="aIZ2IWRI"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCA52C08BC
	for <linux-input@vger.kernel.org>; Tue,  8 Jul 2025 09:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751965496; cv=none; b=VJWCOyGVLnxGMkN0E3FvOJ6hc7hiDa1a9tE/3Y2VmFGj5cDr53lzVrE6F/tafikQGy6wwpeC18HmSAkclAswYg3XtHDm97F70ZhhJ499GfHIn576EBzqviHPddJhSQbaqkdmvF5W6rIHQxWLZpglSI3bXapBt6n1TQb6WBv+yjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751965496; c=relaxed/simple;
	bh=40I04tv8WXyaaAiYm9OL97CICCJSu6v1jQGVGnngsJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sz4TybmyWaQoHhB+WpOzNGc+Er8tBHYd655IYb3bgXD/O6cECBWhMNwYSbq+wyvc3PLGj/vXv01wxxe9XOSFuHH2EGhPLIIiaVa3r2j5ZtAgPCkibbamD+0KFLIylM7fFTK7Dhx5A/4hGr5Scwv8yhYgRsB9Cc6SdNOSx9B2vqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=aIZ2IWRI; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1751965486; bh=40I04tv8WXyaaAiYm9OL97CICCJSu6v1jQGVGnngsJQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aIZ2IWRIim4BCMER9H918pJUKWqdZs5P5qV2/riLY1fuVIeK704tgWmwDYA/pBpk3
	 10zsP63Iv9ssu2Ie0aV20zzBKk7zvnJ+AA1CqtEcwMMoQctEEQKM/N4UlKaE/929d9
	 tTblO7zalFVZlTBcG67AryeKTAvJHsH8AktTETOuS8DJjmPVH+1vgkxuSFUm0ePbSV
	 rsML8cthjz3jmUSzZ9FZAUdazWYOoBLgnEzZk2EtaVwMZH2th4ZBN7y2rVj6o0OmTr
	 y2QeWJQFfJCa5diHo4Ri7Qz9vyINHx941UDX6+5TlTFXgPnY95odEsJm0Xrr5VZu0w
	 z6m03rthu5ucA==
Received: from [192.168.0.22] (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 4158BA0F7;
	Tue,  8 Jul 2025 02:04:46 -0700 (PDT)
Message-ID: <9dcfe619-686f-40f4-a0a9-c56d8f9cdcaf@endrift.com>
Date: Tue, 8 Jul 2025 02:04:45 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Changed Acer NGR200 to XTYPE_XBOX360 fixed the table
 because
To: Greg KH <gregkh@linuxfoundation.org>,
 Nilton Perim Neto <niltonperimneto@gmail.com>
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
References: <92a568ca-e08f-423a-9de0-3f5b2946e721@endrift.com>
 <20250708033126.26216-2-niltonperimneto@gmail.com>
 <2025070840-marauding-popular-517f@gregkh>
Content-Language: en-US
From: Vicki Pfau <vi@endrift.com>
In-Reply-To: <2025070840-marauding-popular-517f@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/8/25 1:15 AM, Greg KH wrote:
> On Tue, Jul 08, 2025 at 12:31:27AM -0300, Nilton Perim Neto wrote:
>> You're correct Vicki
>> I wrote the wrong xtype in the device tree,
>> But now it is fine.
> 
> Very odd changelog text :(
> 

Yes, I'm not really sure what's going on there. It appears to be a replacement for an already-in-tree patch (22c69d786ef8 ("Input: xpad - support Acer NGR 200 Controller")), and won't apply on top of it. It's also worth noting that that patch put the entry in the wrong place in the table to begin with, so drafting up a new patch on top of the tree that fixes the table entry and moves it into the right place is probably the best way to proceed here instead.

Vicki

