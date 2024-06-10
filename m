Return-Path: <linux-input+bounces-4293-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEE090235C
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 16:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C95F282EC8
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 14:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671AA8527D;
	Mon, 10 Jun 2024 14:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="WANH/A4J"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21E07828B;
	Mon, 10 Jun 2024 14:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718028024; cv=none; b=oecCThTea40qzDMX4DN40t2fIsOXdt5EAv0v/inMKMqtkbwAq/VS8pPjhhiKGabv3PQkqX7b2hCg6zm8k/6G5luEOcrdys6KqQBGQMbf6EXCtmLeKCgxcHJH5K0iSToc7gm45b3+ToEHlfm3XR/Rn+e1a3YVTP1fRPFwiLV6zVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718028024; c=relaxed/simple;
	bh=OivKIx2YVYFNn4yBS0kD3T4+lw2b3yA3ITA6saGmjpk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=nYXtIn93rBe5vekkX61IIS8iLYeqiuhY4tCxsLoPDCSDeS9lVEYMeUKBbYGIZKumBlT/y6dOcVhbv/KkXomTs5rDd+oX3pD4J50fCB26uKMldVqFCnIHswZF7w+LzWspJQmHHklmXa9V94+w+sB9MYHEaYZwrGNyMKxbT0xKwTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=WANH/A4J; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718028016; x=1718632816; i=markus.elfring@web.de;
	bh=NFA/GkooZx57xjxG7PY69atG559C02yxsw4Yq2npLaM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=WANH/A4JcpregaEHnRyeoKS3sV7MV+WHcBuT2qsCEKeKT39A4M2fg8xJ+nM9Mv7B
	 3Bw6lM+7OzES/hWUHbbbrCVYGofOmbA8TSP8rmZveEfutewJVm2snEJeuchP1YyTS
	 71biG3YXD/kq5XeDDlGF1n2NnOuKBoha6NcExboGt5iktN+pMhOzNT42d1IujXUJe
	 Tjz09w6fjxNKWFCOHTZoPLSptL7jj9vZf1JY1i4WhldiAm8DK7FXYWZ9nqDnPCXQX
	 x4CgzfOXO2cUw5RrCriZYefN7+/+JVeegEX7Zs4JFZKtn8ROmtmq3ZZIDD+5H9MHI
	 LWPyQO80inC047WeRA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MQ8ai-1s3YWm1gZs-00XpsS; Mon, 10
 Jun 2024 16:00:16 +0200
Message-ID: <5444cd06-108b-4b67-8698-9b40ce637ec7@web.de>
Date: Mon, 10 Jun 2024 16:00:15 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 John Keeping <jkeeping@inmusicbrands.com>, Marek Vasut <marex@denx.de>
References: <20240609234757.610273-1-dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 1/3] Input: ili210x - use kvmalloc() to allocate buffer
 for firmware update
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240609234757.610273-1-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3pj7CXHIr5kPUQ8GQvi3sgPd+VN6HjGCNbqywjEsTRgkwpHIqVC
 uvBS4itsFFtRd0eg1Vkh1B1+VIz7OZHS+KuMWcgsyai9RFIe6jRabYRwerCCpAyKoN+UmLq
 fLmquaOpUSfD1BMW0Qig9t7UDiQp9QU6ByE+lssnin6yNuvCD/Q9W41HpB+wIYutGg12jNE
 BiYOfaTaIRewsvR6XHFtg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aDSqvEHHl8k=;YvYaZALWG9OvUWOmnnWYq0NRF6C
 5Ik4IGUOTvLnPbFHPkteh7rJQFAGlTD3T9KGFYG4JQNQsa2/jdDPMblk/jdNWhEMgUYSyPp16
 KlMiaskbdW6AGQ6w0OvN5vTpIJGMK2i9APa8HKqghcsXwI9ZLleLbRaqZcBs/FiKjxAHSdh4e
 Bmhf5fibmQ4n8kIQ/MHTVNgDMffs0lOnnSb2CPGu+pGy3chR7J3qgsanaddJpcg4aV7WnZ0jZ
 X+CS6ISp4crYsC3AsFUDmSxvf4hAsbpDoz/feHMqrg7RxGiIV1C/Y+BM0mBCkatyYjFrLr7gu
 vkp/N/Qps+YNR6LEikfGQflHHhlHRdPUWahUtVFn0hBQB2BClvZK3ceEq3ZpbooswJQJoUR9H
 4uK55Omu2brLTHO5LAQJzUSzqO0lXP40pQ2ghXZffoTUT9c2sCaDwsbpnYTl4/LcWAyzdDLsA
 BwkhfIunZ5B6tGe0KHDHivBoMesZ1PCQ6jf7pc33MswxcUd/qMPwmGDptxENxFrt3CqB66mG2
 QFFWUtKETK3MA86FQ9SUxxfrzSitmSTtjA6iq5G3r6dmyz1zism6N6xWidfiETnZMZ1wi0W6j
 DWn0kXArcECX5j9AGgNA2c4ihigYSORF9SQNbisZCx5dozEuHu/H8xxQ6VvPMF7iUx+JJei7t
 H0s95OE3s3eV60Y0JifvdEZrbThVn1Ke3bKwTnnv0ygMEBkYao7y+EKux7uzABJqnMWOueHJ4
 m3wEOr3soUlbmpD8kyTHI6y1twXwibJo8fTH6AoeQbF/PNKtRuTCUSbKYkLmJ3O82/nVcV4EZ
 smBdxl5jhMV5T5KyscT8W9qD8lj4G3BtmVkVEY7VlmJIs=

> Allocating a contiguous buffer of 64K may fail is memory is sufficiently
=E2=80=A6

                                                 if?


I find that cover letters can be helpful for presented patch series.

Regards,
Markus

