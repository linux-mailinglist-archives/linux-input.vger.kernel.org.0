Return-Path: <linux-input+bounces-5121-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB7193943F
	for <lists+linux-input@lfdr.de>; Mon, 22 Jul 2024 21:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB7F928210B
	for <lists+linux-input@lfdr.de>; Mon, 22 Jul 2024 19:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77BCB16EBE9;
	Mon, 22 Jul 2024 19:31:04 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.enpas.org (zhong.enpas.org [46.38.239.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46741BF54;
	Mon, 22 Jul 2024 19:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.239.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721676664; cv=none; b=s/XJs8ZJBoUXi2+waTRzilwcUULEid9si8tc/6ShsznvmiF3GgV5ZNMxUlsxTlPjdCbXtSAEOSx6MZziSauc6J5Qk0vjVUsBIdxsb/93Xh0QAErh4XdJPeo3LaFhp45zCC7RmS4Br63IEbPcMDQBCThU9pgQD9aTP6oE5+6ZzGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721676664; c=relaxed/simple;
	bh=PdkihwyRSa1fRWOQEZU/r0Yz3LbDBGeUurrTpVXaKpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOxpV5dAjESo1k+78nnQcal6nJ8fziR4GHc3WoFFwMyLcCYlCLHxSDcKGnhUETQbQ62ctCMxf0+BOV2Xk3E1WxANJn7hcvyjjyCHSsI9f0gZBkHJSuW7q8wHNkTU1pqAu625gpXf1h048O5kpNGY0FjzLRWqWM0aqmoMVO+JOiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org; spf=pass smtp.mailfrom=enpas.org; arc=none smtp.client-ip=46.38.239.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enpas.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.enpas.org (Postfix) with ESMTPSA id C301510021F;
	Mon, 22 Jul 2024 19:30:58 +0000 (UTC)
Message-ID: <cde0bcf3-eb31-48ae-93a6-e630ba80a068@enpas.org>
Date: Tue, 23 Jul 2024 04:30:53 +0900
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] hid-playstation: DS4: Update rumble and lightbar
 together
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Roderick Colenbrander <thunderbird2k@gmail.com>,
 Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Roderick Colenbrander <roderick.colenbrander@sony.com>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240616163055.75174-1-max@enpas.org>
 <CAEc3jaCkH5JwNTpHRZYsekbwX+G6T5tMTLD0+O6E7Q2hqcAFHw@mail.gmail.com>
 <dedb2c39-fc28-4cba-802f-5d56f23db722@enpas.org>
 <CAEc3jaC-Tmd2XtK9H2sipBJAhCf16dMWx46r8Hs4p9At3LC_Jg@mail.gmail.com>
 <afda41dc-7b36-4ddd-abfc-c9430d8c9503@enpas.org>
 <CAEc3jaB7ijeXCUKOhpORx4Omf8edSmc1HKe9bk22V1mz=cLa+g@mail.gmail.com>
 <5b42961b-8ca6-4245-b16c-d703255e5aea@enpas.org>
 <bf096319-c44d-4bbf-bbcb-374d3cce0ca7@enpas.org>
 <rktgvill7zgcggiir54ixh3ele4zeqatoxwshamebtvvcnz4z5@nmmh5wgwnqmf>
Content-Language: en-US
From: Max Staudt <max@enpas.org>
Autocrypt: addr=max@enpas.org; keydata=
 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
 PsRBqTJGs7jw5gOWMMchFaemEnEJtg==
In-Reply-To: <rktgvill7zgcggiir54ixh3ele4zeqatoxwshamebtvvcnz4z5@nmmh5wgwnqmf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/24 01:49, Benjamin Tissoires wrote:
> Is there anyway to detect that the device can not support the current
> behavior? And if so then dynamically switch to the new behaviour?

Sadly, no, otherwise I would have used that already :(


Also, the change that my patch makes is in the "dialect" of the wire 
protocol. This seemingly changes zero in the original Sony device's 
behaviour, both from what my tests have shown, and from what I gather 
from Roderick's emails. HID traces on the web confirm that the PS4 may 
output such or similar reports as well. Hence I don't understand why we 
would want to make a distinction at all, if the driver can simply only 
speak the "dialect" that works on most devices.



Max


