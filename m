Return-Path: <linux-input+bounces-16528-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD96CB31F1
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 15:15:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 394463064AFD
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 14:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4352A21423C;
	Wed, 10 Dec 2025 14:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="MrCwcTk8"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5D42AD3D;
	Wed, 10 Dec 2025 14:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765375876; cv=none; b=X1Fh1dFz2g72Dpawpj3RFodyZDEgr0equq0zl+RP4jXe4xI/3hgpGJWlvLrFZFQA4FIVJMI5RB76tty70ysjELowsKJ2gbXMHPLOto1pdXRXlZAIYbZpytCp1/17oJjU7Wt0jHzw0aKoN8M6D0MiwYBBMfL3pRF1ESDhx+LyOFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765375876; c=relaxed/simple;
	bh=WxYrgRVlLCNDY0uhvZ8ftFvD1WI4oAIoacSsM7/kt/o=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=c9/x1YfvT4KchEXvhAVA2OBKHbu9zky8XiLIZ8nfV/ImDpTYm7/L6R6hX3Yyz35nNbEn7AQnuen+kHQfPpD4VF4p95eUKDKaDNMW6UFUXvWIdQawuVIqkdn2QkCMdQISd5EjuoghKwK2HxbMml2oQgb7HtQ9E+Dxit1Sqz+TIEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=MrCwcTk8; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1765375866; x=1765980666; i=markus.elfring@web.de;
	bh=WxYrgRVlLCNDY0uhvZ8ftFvD1WI4oAIoacSsM7/kt/o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=MrCwcTk83baAgmK2abkOoUBZ6VtFKrtQKhypYmEYVRArHCd9dNItWHR34Em88y+n
	 Pz06tzqhwiTU3v5Jh0k2rAcNTXhAnnC+4yCPRDMpIZnnnHDL55/cKxlbIHHq0nsCV
	 Si7VE4+1N1obDlptq+kuvqsVoRvtwNni1nsCCUTJIOOfRc0z9yE3kOW8Lnfz3Ny7V
	 aRB8jKQrCc660Kf+y5KVen1TrF8hOcsjlrJ+lIk3LTYpcn/PiNk5jwajLzlG7Whm1
	 mV7wnJWp+ExvGqhoYUsJMpyEsP/i1aRr7GPrL9inncxk9GXzGRa4+GT28BYoaZfuf
	 CdT1jSaHKqSzow4C7g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.204]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M604t-1vMyyg454l-00De3k; Wed, 10
 Dec 2025 15:11:06 +0100
Message-ID: <316d6242-fbfa-4c9e-addd-e9f76facf9d7@web.de>
Date: Wed, 10 Dec 2025 15:11:03 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vulab@iscas.ac.cn, linux-input@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>,
 Julien Massot <julien.massot@collabora.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20251210030013.913-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] input: mtk-pmic-keys: Fix potential NULL pointer
 dereference in probe()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251210030013.913-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3NLIcH6EOiMkLulEs8N2HjgtCPpZ5VO8qqh+IBN9Gn8kpA2SV9n
 COgI7SFk4IrzcHRIixTvZy3jyol8RmDRKZ4fXJgSr5G7vIjAOvnUOavVORxnv7xD3WWQTzJ
 CGqez5MTufx7DEocfHnwoSdChEoyi6lKngqcTx8u1t9R365z84uKTCswY/2mkF7xKTQlhQK
 63H3+u5O+NOdkr67ovgaQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pHlVGJTePEU=;mdcylC0h0yfJ/m9bNMUj8DT7CPU
 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
 JGGSDq7Zbn9zqoohvpPgGIIQ+0RFJ

> of_match_device() may return NULL when the device node
> does not match any entry in the driver's match table.
> The current code dereferences of_id->data unconditionally,
> which can lead to a NULL pointer dereference.
=E2=80=A6

Under which circumstances would you get into the mood to take more desirab=
le
word wrap preferences better into account?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.18#n658

Regards,
Markus

