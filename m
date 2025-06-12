Return-Path: <linux-input+bounces-12829-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C66AD6ACE
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 10:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3574C16EBBA
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 08:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36435215F72;
	Thu, 12 Jun 2025 08:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DdUDD7o1"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE291940A2;
	Thu, 12 Jun 2025 08:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749717049; cv=none; b=e2+w0LQozT5Ws9DyMETps3y3hwGO7TF9wrlhV66pHU6logmIQtudGE3e8x/Hubm/yxGhJ2LXTOkNUB7JrPuUhSbS2uA2JjGR1a6rcMdZ6G1GDjOx2nJ6lcO6GgI1OXP12P8GMVK7ahyN41jqWGUZUARZRpWrX3yY3Aybr8+bpiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749717049; c=relaxed/simple;
	bh=kJ/jJ5JX+h3hG/J1a/d7WH1D+//rRhim17U9BppFgPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lLlThf7wF4pT3rJsCEn+U0M/haALu4wUMAodB/PrYCLTIPFZvU4iP6s+VLwY7bAkl1j+jbZlhtPJ90hhtKBG8d5/Xpd+0Wi1fqKOFCOAqQbtXIG7BRsTdjAb2VZ4wPkjYPNsthEhR5/gW8QWOX67tNH1kk4++YvAfuCmSbhj+Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DdUDD7o1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749717044;
	bh=kJ/jJ5JX+h3hG/J1a/d7WH1D+//rRhim17U9BppFgPY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DdUDD7o1urnDds6sPWstmEAf84EnTxUGPuMl1tLm7JKFhAlBl1NMIUbpZIK5r9CtD
	 gRFJx5dhUbEZK0i3jJY03xhOARr7wNRLcOgHEhK9XqOny5BxD/AzG06R5rQiJcG1uX
	 HaEy/gvHO9Vj8iv5NhPZC9RDatwa83e+X2iRFQchy1Lp3jtd2rzv3ukZegVEG2OtLF
	 0qMPOfsEKvcvKK+nPFRa5zGG5BZPbPmrcBfQT3rMoZcQ2mS82UtK8i5nXBu8M5HOum
	 JlP9U2J4Iqo1YHDj6GDZfUNKXFgDiOeF/20OM2XsTVWvnifc65wC/7QxVIBTeQ8fhi
	 ySTEn+i7A6YzQ==
Received: from [192.168.1.90] (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0956917E06BF;
	Thu, 12 Jun 2025 10:30:44 +0200 (CEST)
Message-ID: <3aaf7e6f-7b81-408a-bcdd-de835b3ca7dc@collabora.com>
Date: Thu, 12 Jun 2025 11:30:34 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] HID: playstation: Add spaces around arithmetic
 operators
To: Roderick Colenbrander <thunderbird2k@gmail.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
 <20250526-dualsense-hid-jack-v1-2-a65fee4a60cc@collabora.com>
 <CAEc3jaAyybX3C80aB5p2Eeu+U2ZD_07Z_52=5Rn2TG-fqbN8DQ@mail.gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAEc3jaAyybX3C80aB5p2Eeu+U2ZD_07Z_52=5Rn2TG-fqbN8DQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Roderick,

On 6/10/25 7:19 AM, Roderick Colenbrander wrote:
> Hi Christian,
> 
> We could change some of this. I guess checkpatch changed some output
> since original submission or is more strict in --strict mode. Though I
> have an opinion on these kind of silly patches.

As I've already mentioned earlier, disabling the strict mode would be
an error-prone workflow which I try to avoid as much as possible.

And I'd still prefer to do additional cleanup work and provide these 
kind of "silly" patches, rather then minimizing my diffs and grow the
overall inconsistency.

Thanks,
Cristian

