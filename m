Return-Path: <linux-input+bounces-5859-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7879995E523
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 22:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 213661F214B5
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 20:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A07D313D28F;
	Sun, 25 Aug 2024 20:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="u043YocN"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708051803A;
	Sun, 25 Aug 2024 20:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724617634; cv=none; b=dZjHYaVTfN/i4zbYPUrKfDVCFD+0KNaYQRUj1IPKkrOb3DnevbE1bglaize+JJ5BKlJozcgC4/GSnqv48GWB/8mcbmUWJ3ZW3Vrzixb3BujWH4a9EdcWFHYQRYL45oZHHkiO9+vmqk9O83qvOJu3otS/0OvuNVzjMdOQYIiOsNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724617634; c=relaxed/simple;
	bh=eA09jemE7xkLxSctCuVNbSiyK4FvPa5Snh8jF7TjOvU=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=AOV/Pc8dzNtRFugsQvMK2WcvJhTcn1Yv5A46swF4jFCQsNULFRmrGsQMlCZsqB7wNT0YJ5J8E4TLGcjPjhb/5U7DZn9HiyZdujykgDeNDcpJtJvkyMuZlfxvaAEw0lic44W23+Q0a4eHqlKPt4a2tueXyOpR6VskL2HkU0Gq3pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=u043YocN; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1724617608; x=1725222408; i=markus.elfring@web.de;
	bh=eA09jemE7xkLxSctCuVNbSiyK4FvPa5Snh8jF7TjOvU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=u043YocNbBAblqVhzJxO2S+bWvPmuqOYyxafTK9zUq9ChdmwDpo17yUbtoDwtUEe
	 mtij9sPoKlwyFIDZK1xeSNBlOg3Fk4syBE3QdFvCX4x0bjCcXjKQuvTTV3Vis9k/p
	 OIcg3qKlQ9vtgWb2uwgaH3NKlFF8W/DRQKwzEmItzaIXadPYg/8izwoD/U7SD5YuB
	 9CC8jLtOZZoVJZFabfSWQAgCBFqdprQG+7k/3gUKlQCH3kfBcJuKSct0gl4dxAG40
	 VMFrQH09XP9CVmriHEapCTGLKQ/GRJhVSMq+oV3D9QEp2LYljHr1XvDr0IG/7cgMo
	 Ypf27nMRtdEbKyEK4w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N9cLf-1s5UvV2zCf-00yY8D; Sun, 25
 Aug 2024 22:26:48 +0200
Message-ID: <08a8ad8a-e555-4d15-8292-17ef8df59686@web.de>
Date: Sun, 25 Aug 2024 22:26:47 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Erick Archer <erick.archer@outlook.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>
References: <ZsrBkWIpyEqzClUG@google.com>
Subject: Re: [PATCH] Input: alps - use guard notation when acquiring mutex
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <ZsrBkWIpyEqzClUG@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pEnG2rCchP1mLvoSSPHLpEOptsApcUbwDfBWvvMUTPYBzOGUgga
 9TwP7ieqlyg6tt+vvXtZMXazSRTVNfBM+ZnWB2S0fPqzdIWeLUhoyqIziwQtC0NZh40Jf8Y
 kE+GjbFtECzKS5BWnooMs7ICDCfNTtHdpjPHf8JIm1f9tvCGqObV0nNmU2KqB6zRv4WxM94
 lNy78UFFG2qxbgJejjMRA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Pwe7XZDpCkM=;lch53AI1jYtpOOGgUZfecRxoSsy
 GVzbRbgujntXlaBFcOOsBRL+Vw+yYZxI70foaD0LDjBqmkXOqueWxYlCTKFSQjuLn19hN0xFa
 RXxBt/ZyL6weMhO/0eiH6JlNZYz/gQ2KPXiRxzauzNnvuRcNz0jK+R8//MslFCZtZ9nFYlbET
 Abb5b5AKQ1eJfo6e4no663PIpGPSR6Cdb7bcNdiitumhfLdO0l0Uz8m9LRl60qcQE1oTZQHB2
 CxI/okO8wUXmaLr95j8yLqh3TfyKG4SsSWD4Ml/17+9grpFVuhk6DYCgVDq3tkQ2ZYn7nsitS
 FwBIEiYpTOWqupaK+a+sZKoSQoG5Yula+z4r2voo0q1NhPmnm7uDeZpfNdJCeK6PwaGJKLkjs
 16DyL3pGHuSozom9I1CGB0Ny6Z6QWFytmUiVveqLd8Y4k89bwan/plVaRBZDl2ATcjU7z+jEK
 87dBzxX2hfLK+gukNzLSzDDtZwW5o6n9WZNIG9oqErsvtBQ2KECktG7icgvnanc88i3DCpR6n
 +rt615o9s6FZAqqIXUQl60NBhUzGv0ofPnxSwaZnMS3cb82E4KEy/74b42nejd+6toxqldjx4
 Evaac45nSIhaTq1zXDVMzIez8/uILh/IFPLtv2XwGNNe473yV0WHDYuQmdc124CRSwpz29E8X
 Ccb/e0RQbiu8pJV34QaKsy6tzs7TrQg7c7nNpuPuNfmvEKV7jnQsD33ZpQgRA71Z2ATeIZbSA
 ODncRYtMC6sNbBMuFjHkylaeSkU4t/4Vu8CVL0X11MCw9Hwv5dFDHFHqzu+7sHbfU36Xjvhw+
 EEq52P4NIqgY9VtgQ0Afnncw==

> This makes the code =E2=80=A6

Would you ever like to improve such a change description with imperative w=
ordings?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.11-rc5#n94

Regards,
Markus

