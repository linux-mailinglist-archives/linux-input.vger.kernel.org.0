Return-Path: <linux-input+bounces-11453-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D062CA77641
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 10:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8997C169DEF
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 08:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACCB21EA7C1;
	Tue,  1 Apr 2025 08:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="FJmDqwPY"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA691E9B1B;
	Tue,  1 Apr 2025 08:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743495673; cv=none; b=se0S1D9x1eNvIEryBZz0B6f7FKKgMi2m8rcdOeD+ytqVu4/ijWK8SHJ4c0VUJIFkk9U0b/bc4LEZmaQldkP5FyIvZpbpJZiPs+VYqt4PoOJPkueb0LuLq1i0Rw+Jxk80t8O67gonN7KF5b2mqZOSk6SqELztyK8uc2NpnNZvs4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743495673; c=relaxed/simple;
	bh=iDp3i76P7nltLE56CGPuQknvLt6dx4P35+X9ePCkn+E=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=VXN0zA5G2ui8TK2CAtQsuh3GspvHm4Z9D+iw90zKV7k2mHF0KmBqEnM32/hNDuEkK+Tnk3IyhqaDpFayeA1XZrNsil7/YRh3aqdDwReZkT0bkv0uJpIb7guDkieOvNWqhgCtNvz1DNldJSw6+5xXgTCMAUclOckS7q1zs76ifSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=FJmDqwPY; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743495663; x=1744100463; i=markus.elfring@web.de;
	bh=uC5wNSqw1TVoR6gwih/W0kkJUpvzGVmrpS7xhNb79n0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FJmDqwPYaCgxeiTnQH2BeTN1ZwqTAOiCUuRjQKjl4nG2ZT1e4xkskDg71P7A/eXT
	 QP/uemlZ3XiWuhpD4DjNZ8wykR3h6og8CJtDqxWRmYl8qpeH+16anheqjDzsZXpJV
	 b+Q4sIY9Md94qPSOP6xpo2rl1pgg8m3FZO6cq+BlHi/aQSPou+HK9Gv9+kRYcWvcf
	 SR6pIeJFKAzmaKZHzOgJxkFR0TmEDDf0GuiqFRNDkZ0lKOcmBiYFm+kF3t+CAQRBu
	 FnFBBjXeYtTJWtim2p4CVK2Q+RDC/30Tw41YzZbKEttXoJa5QC2ot8cyGREEa8c+p
	 4njqG2RawF2A3qWAqw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.54]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MMXx5-1tiHMW0JjL-00LC1o; Tue, 01
 Apr 2025 10:21:03 +0200
Message-ID: <a73250f0-8fbd-40a7-b4b6-bc45050c9289@web.de>
Date: Tue, 1 Apr 2025 10:21:02 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>, linux-input@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>
References: <20250401063157.19655-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v2] HID: uclogic: Add NULL check in
 uclogic_input_configured
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250401063157.19655-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:858SxB372tSJkxHmXDAP//8ot2/jHXlBSCnO91dFuM7RXH3CzXn
 fGAoJcIdv6ZvVQnFZDx7W22j7WRjrmZL3IhnlleOK4sHn6z0v9NPOl9/plBZNj6B8gOi49U
 3r1ISPX6NaRS3rwDwVIKwx30tzGvbrjG6fmFWh8C9xzrsFdpyyHjRdz4gM6TQ0bhVTD5ym4
 o7g4rlsaxmj7auPPppX5g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Q4kB+EsBL+E=;e8VkyjdCBx3ODDNLfLSFlvpL7xe
 wPqoKA9lWH3/r3HWPxpJ8xacZJZmZzhUkJA7bGBwq6gWv6dl5CvVANEGWBhm1UbWWBw1atzf/
 MZkUp/ozdql/D4Jewat3wvsALAvqIkLIoyXQRhh79slWx2CyOG/wYFfqykEhy2sEs5bDr+XXq
 a3aLMbTvtEwSq9YMtiVJFFk8mZDsh/cu7Y68Iax8CrAmWyGN/T/cznJ6++4Y4L3bF83ZNe1qW
 TVH0sXy/Mnmcfc5Y1Qz2Thu3E9Jz6OyFfhegeTsklQytSPW2O81uXSw/U1UShwcwu+VgT3+VU
 3kA3HAh5oF0msMwErklef4M5NHyoq4Fzpx/uBA/VnCgCUqPRiZo6C9cTOUp8bp7x9wUop4dDN
 I3z4z/6p2RaZauamzSh5JSZwPGJ8rBLtg88xFXzUBBZw2XLHGoqtT+JY3WwMmsQSbByZ9vipR
 gbqZ1SsDtnQGS716dlOgAdFgbas1lFwc1yacfDl4EfZzpbjGvtRfjC76ZnBAXOWhtE5h+WhtX
 X4soo2qJYju3e5wCe+gEbOwNLYwZRsNpnsGQ1nEMNGpROXZeH/7/ir+KBIvtLs+cXsuKJ46RN
 vdBd3FvwnpPtpJAJIskUga3BmIgHreALriglywreL7F73IFWiYdCEVJUQ8qYOhxRD7ScbElfb
 adbJebBDogUaBUL2HJA4jo5l697Og33XNuEe9tUzwNkked1QyIZGoEJsifBParBxXgCg2sXPy
 Ek1NUvnmiAk8mRszQL5AIOkYD9Tbf6jP0/6O4Rnn3wyX753uz4WFYq1cYN0QfRWAz9knjS548
 MZOzmll3Ac1RlK2uIcu5NDD6c+BRRERNh7CK2TmdhgtzFhL9vsrWl1p2ufT7Wylb/5q7Y2cf/
 J+4qbn89WNXh+Qw2XgSq45DE+1e4byHF19PzAdCqwXXV5Zytjr+eVraUxv8gi7bbgAkXNo/8X
 DWpzfRKGnpMMksa/LMtTvfMmusdVPZ4KIZYy3glndFveCYKEM0NuTJDLyBazz1trRUmNl36Lx
 aQVpm5ySDShk1JCJzDTynZZBxMteANjbU4NORET8EOnYYbqfMg7685Q/eq6Ypo50UxsZa4g4E
 mMc+i2+QfZp09N9r+b78VcrA/Q5rXsNOQl6LxGXBsJs13XABCa2xoQ1S7HlbJZYWO4aBquyq2
 rnfrgdUZxMa13CreMEjrLfHl210GA4Bqhd6Mpk0sRVMV0n9PMdBIZo7zeTuSmNKBuSgQVwPoB
 XSZCWSurK1mfATjywfblh3h95v4482vd4QA2nm8SNcWlzZWf4+gAhGUirkfVv6ENzGZZoE0Ll
 cBv55udXpkXPyh0fvS4pSvZ1xw3fPv99qubyHAJ3sxtmZ2FeXy5DeIgOZx48HplpEaBFJe7YB
 5Bm6zrZlz3XalNXZzBlbdog44MJNePQhQeznuM63keiucRQWz3PeiyP5i/ymeuDCXXMhmFoVX
 /DiRjNMepYv1a0zrxo49XuBfgs9nM4UUb3HWWEKOaDQIHYHcG

> devm_kasprintf() return NULL if memory allocation fails. Currently,
=E2=80=A6
                call?                               failed?


> Add NULL check after devm_kasprintf() to prevent this issue.

Do you propose to improve this function implementation a bit more?


=E2=80=A6
> ---
> V1 -> V2:
> Simplify the handing of the condition "suffix" with if/else suggested by=
 =E2=80=A6

* I imagine that there is a need to offer such adjustments
  in separate update steps.
  https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/Documentation/process/submitting-patches.rst?h=3Dv6.14#n81

* Can another tag become more helpful?
  https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/Documentation/process/submitting-patches.rst?h=3Dv6.14#n598


> The current implementation (directly returning -ENOMEM) is reasonable be=
cause:
=E2=80=A6

How much will such information influence the refinement of the change desc=
ription?


How do you think about to append parentheses to a function name
also in the summary phrase?

Regards,
Markus

