Return-Path: <linux-input+bounces-13935-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E565CB225D8
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 13:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA80D1AA57DC
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 11:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5C32E764B;
	Tue, 12 Aug 2025 11:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="pF7b0Zvy"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C054C1A3BD7;
	Tue, 12 Aug 2025 11:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754997880; cv=none; b=gZ6VA3t9NQlaZtTPgBGaesng9/YwNxE7T0D9b5fVy7/1ega9uX+Gx3LBApZwASI+Hj+yoMiNeSOu77Bcw+xXUklUj0XrLkgxGrcLeHDlFdvEqNbxnfFnTj60o6ZzJdfWXG7pLP+NYweDl8zjC8Qlov1T/stuUz2iqL5izqT0B6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754997880; c=relaxed/simple;
	bh=45Dy6gQb8loEX6TyXyH+nq3qRDls59/QcAWjgvqqwlY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=LnfNY81A7S/rjB45D07dc8tEt9g+z1rjmX5X8jlVJW5ZPCspHTAKH6VtGdx4xC6W0KElPQCZoVVD5caXHabAwIP9FsMLxge2ZKyCMutsyR4ndgTkjMwomUTgDC90HKTt8o9MUMFbi2EjZsk5jRAzhSl7umB755npzeu/LOm5YGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=pF7b0Zvy; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1754997875; x=1755602675; i=markus.elfring@web.de;
	bh=45Dy6gQb8loEX6TyXyH+nq3qRDls59/QcAWjgvqqwlY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pF7b0Zvy8SrF9FkOQwslTvBW9ACzAZ3goEqYS+a3lSiskJPvY4jhsG4+lGKwLSax
	 ikud7Kmany3KKuRBNsuQkT5MV3zkPILNyzUw0OHG01tMGI5yNl2n/lmFrYN1+5/cQ
	 3LvZ42yAR4UTLz2bZxAXOXrauyr97iVk3+41iWyspieoiXtKqWnr67CKVE4RQOVsX
	 raTPfXrh1qVjTbfAWmxvyUE+zLmSJFdp8T3x2LS9NydcAdTClGf4nRQYiSrQMUPzN
	 zr6EltE0pGeeCYsN0gIFp1tcIOhuRwIEHz/ufhP2i5Bnax5jmib4RPYop1+pAo5lB
	 zgda6n9Xj9xj/s9d2A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.213]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N8Epo-1uYmUl2lU0-00xg6b; Tue, 12
 Aug 2025 13:24:35 +0200
Message-ID: <4094a083-e049-4c8e-bc37-0ce62db5f11e@web.de>
Date: Tue, 12 Aug 2025 13:24:34 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Leo L. Schwab" <ewhac@ewhac.org>, linux-input@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Kate Hsuan <hpa@redhat.com>
References: <20250812065327.515098-2-ewhac@ewhac.org>
Subject: Re: [PATCH v2] HID: lg-g15 - Add support for Logitech G13.
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250812065327.515098-2-ewhac@ewhac.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:R7y3YS8Npxf/74EHOiFQbc/7W9QXJ6B+eNIJZlfX5NY7BG7XsM6
 /Cx62DVnd8dF1Iu9fM2G/Spia2TlqjDhbuHxEm8fYD3Qn2nxErqXPpuAuIN/ZT/DsbNP4fp
 KDwX5ODaf8nU/srI6X524S/lRiOLOgjpoWGghNqSLyDHt7FV6PVRrKR74zcDWXOQwKO2cx2
 Vz8SRjvmJyjssCjjuugPg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0AxgLV633VU=;xYEboo4VVH3bjzMMuZ5BCzWz/f5
 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
 SO38nnuQAzA==

=E2=80=A6
> Supports input event generation for all keys and the thumbstick, and
> exposes all LEDs.

See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.17-rc1#n94

Regards,
Markus

