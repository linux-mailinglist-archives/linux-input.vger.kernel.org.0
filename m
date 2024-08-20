Return-Path: <linux-input+bounces-5701-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFB4957CE9
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 07:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B133C1F22B56
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 05:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8BA53368;
	Tue, 20 Aug 2024 05:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="B8LAFvfd"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955AC282FD;
	Tue, 20 Aug 2024 05:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724133398; cv=none; b=CVMK04knES7kum6pkIt0tm9eNctCjY7BMNl8I9MRCTS1Dn2q8nb8NYZNMgHr124ppMK/BYb9IoZ748NiS8qqflYWZEgC/Dzl1e1TL2CtnAVmzFrvVpawxi5Fpe0HEHSr1KzLy5Riyshl9UT09yEG6epKdzPv+9xl7DC6yYWVNLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724133398; c=relaxed/simple;
	bh=/T96K+NbQzRyW3FBdbjmQDnJD01rT2r10zUZb02whf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fXUvy8CR21ZZp4CLMhH6HAc+Je62bQFlDJXXvH7x2UbScX2z0591EkKBQ0G1oEzEHZCTV1aZ6MsxI2ca8eiB/ykvTk5WT7QG8sFCEDFBI5z4HQxo6lLS88vcnDCIY79qNeNAnIU4Ik0WQ9Juj+LLkfwlOXSbA0Q75R3u5uDs4hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=B8LAFvfd; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1724133377; x=1724738177; i=markus.elfring@web.de;
	bh=/T96K+NbQzRyW3FBdbjmQDnJD01rT2r10zUZb02whf8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=B8LAFvfdiSQAmFl1tzAHUxUS88wzuY6l1C8lZDkmNx71Pjz7DsiEVP2YlZ3PsGgE
	 NPoyut5o44cSvc5tdejlQ6IvYBtOtqg4Ly0YFJhskIZ3bn+FXQtKesedGCVTgPO9O
	 HWZuoK8lMUnyParEcBFt+xHDFj9vmd9tYX4ftVYScvOkVBZzqYhGv45bzrHWQH30A
	 94FaXn2WCPQZfc2Cw3qFVzoLnoa0afagzM9V0i3tO5qASY7rd6zTcCyHgf8tcKTGU
	 ZlAEMWmlQVpVIQOaKAsz7iGQhlhFIdqVA+Yy6dzEDub4rrFJPn+V65y2FGw0RXkJI
	 VfRsoqaYON/mH64R3g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Md6tr-1s83Uo1naF-00ZJJo; Tue, 20
 Aug 2024 07:56:17 +0200
Message-ID: <65b8f7e4-358f-4943-8ce0-c28e4c947016@web.de>
Date: Tue, 20 Aug 2024 07:56:04 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] HID: corsair-void: Add Corsair Void headset family driver
To: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
 linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>
References: <20240818231940.34635-5-stuart.a.hayhurst@gmail.com>
 <bd07e14e-eae8-4264-b275-9efdf635cd82@web.de>
 <CALTg27mgOx3W3WENxFh0sEEeNYKEjrZCEQGoBi9=vjgiaZnZtQ@mail.gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CALTg27mgOx3W3WENxFh0sEEeNYKEjrZCEQGoBi9=vjgiaZnZtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gSBI88V9AqT7FeztE2iptZ7QY2OrtK1bkHxM00usoFMjIY46E7r
 Xmw26ItlUdTiNOKSA1G5nK5YbGKxOSSOJ5x3oiNWyaN3HhpcafY4DRUjN0RQjfDa+GLq930
 Pvrawq+p1IaOzWCHD69dcVJIDhmOd3eE4TywtPtgpgpQWjPcRq7ZD2Ou7oUn7WeD6TszyDY
 Ht7qQQ8BNuF3N/qz3kQCw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:e4WGaG05sRg=;bC9mPtFzqYOtqk7kIVxIgvsFuoG
 nQaqxHfNJ2cS3sSvr5f9QvfoKr0+YXuGrSXFnoUT5K8aWrhmWCVBqsGttnGOkXJDmxH5zuXtV
 CCJMT3hliZyEfx2uIMQiI7MMzeXtg1x+7m4PXsb4QeCANW/tG4jqRFikTPUebsFchxzAZZ47l
 U7mZUs0l3UPowm2xoHvJHN2OB5E7mojoTSnLOTwS02fBl5Oxuub1SiOJSmSsr2tPkmB29TE4M
 wI5hrZ4JIDOZgizAHUFL9jglZs185OFSfxKEXXuodaRzZqfmstPqvhm1gQfgt5SMBiRNDxDMl
 DMfF5ANOqNmGb0KsWhyI9NKgcDmeFjPiE7Wc2aDiG2fY/GhaIIj5dbh50saq2LqxnivFp9zV0
 emKEzMxRfiv+yxTK8r6+HzuctmZw64H4CxMIl+Lv17DiN19xxlEUZcftdduxteN+PwVtbx4hx
 5m/CnVAEXTiZUpUvdqmHoZkLb9iXGJWPLVoteIZYxny4NIPPt8uK7jSRQa5O99EmVqhoMPgM7
 v3fi/ycRzwXVOGmA8JirSt9rTEtqPW9yqSKmR9tWobz5EED/lBIWSW9J3ur/dmJ3LRUt0WNEi
 8xWf5+J0NrrDAn/4Xv4EB4mQsrHYarbxmpgvQ0DBTMbIDmH8mFjBOBKyFzCaQXn7oJKc36Gpb
 IW6aONzrxPJTX85m4FT3XyVLuSO6C/Gg7OZrFBVD12KCjp74LAK4jb9OsShdjYdoPUN5UwkZP
 fb/TS4AQ08YJFoObdtqkj8r3WMhiyyAZpE1UBHPKcP5HC8mifhpHea/uUBJjwadSfUMLQ1Joo
 EmPLtIRcp2Ag0X4Aspr+55nQ==

>> * Would you like to reduce scopes for such local variables?
>
> I thought the kernel programming style put the local variables at the
> start of the function?

This was the case for a while.

Increasing applications of scope-based resource management provide
further opportunities for smaller scopes according to some local variables=
,
don't they?


>> Can such a size determination be explained better?
>
> Well it allocates 3 bytes and immediately fills them, so I'm not sure
> what I'd write except stating the obvious.
> Unless you mean why it has to be allocated rather than just using the st=
ack?

How do you think about to collaborate with other data structures
than character arrays?

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?h=3Dv6.11-rc4#n953


Regards,
Markus

