Return-Path: <linux-input+bounces-11458-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4167DA77890
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 12:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE4F8169C08
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 10:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB1B1EB19A;
	Tue,  1 Apr 2025 10:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="RkWi3gZ6"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4172D1A239B;
	Tue,  1 Apr 2025 10:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743502449; cv=none; b=CAsUvRSgwYba8jH89aNE77cftwXpIVbWkYbahxl/1sHVAjqGgRlZns8v4prmotFm17lDZtsQib8nvBBObwPmez/280sDxFqANI8dkJmkNAMT8m2wrVsSZ4cbOKUKZb9iRe1XKI2tO1iMUIXXa+eKlkvYcr2W1aOfVceWSF1VCdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743502449; c=relaxed/simple;
	bh=McKwnExrQrNih0CSUm4L3NSUFStkSLEldMO8dlJEkFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FDFAVdyl80xNNQqWZgPXsQqZbQ5en/LaCvRX4dsqtvWHJJwdY6XklcgjxckQn4WO+riDa38oZ0E8/5Ol0AS9zZvSniX/Q9ijOMmNZlpvmp5F8f3CEkMpliEXQl0DGaa0rtOlN1GwAUhOhgC+Zgwb6ECqzlTURSUcGdpdVLm1qlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=RkWi3gZ6; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743502445; x=1744107245; i=markus.elfring@web.de;
	bh=x2hA+nymOs+xOz+5YmWPZmixDzfVS70Y3aDJ9V65nT4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=RkWi3gZ63zmfjU3Ej7UAXXIyCDdOrmkIJCQJVfLk3mUdmqbs69/HxrgWvUXYlExJ
	 Bi1j0VOu/dTVbRB8CarInq+nxo+5rC2lKvejqzd/PNLyctbTbRsJpg2XVvpcdpxqF
	 TuJycSExL0beuLfTTVCFTkkOqAVs7wKzEdplFZzTlvzmhhava/s4b0KQLWlQZIZsM
	 TWFPiNfAnfhKHpLjXTagkNVeRztrJTTM7QCT3PckOwnODQlMvkNVlQViT6R9w0sZ2
	 f1ebYXEanvoP3kHorko2KkLNogdommGda/1OJfZ1uBE1tOyOw+RQnBqZ7oH/T0pS/
	 vz3PT5L6gY+0oroMKw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.54]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mi537-1tUKcO0sJV-00jUeG; Tue, 01
 Apr 2025 12:14:05 +0200
Message-ID: <bf3ff4a5-e8e0-4d25-b878-1ee2308befcc@web.de>
Date: Tue, 1 Apr 2025 12:14:04 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] HID: uclogic: Add NULL check in
 uclogic_input_configured()
To: Henry Martin <bsdhenrymartin@gmail.com>, linux-input@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>
References: <a73250f0-8fbd-40a7-b4b6-bc45050c9289@web.de>
 <20250401094853.24143-1-bsdhenrymartin@gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250401094853.24143-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NDWXv86MNViM2Vfh8kvfUGfxKkEqT7mQgKjlyQoHBnNpj+rdxZg
 SevV+6SQdXqJ7mCiN0eAZO57dRYobsEW0TE98iki5bH/Pdtw3kH3T7QzWm/9liGZJHUvzOI
 /nWiS7G2+yK/Sw/hZJPetGxy09qz6WjRfkQeO3hZat44ahknGkh7+Nk5IjoHKLj2J7joT4T
 zN5CZfZ+gT2uy+zkSHJbQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:G1NXvm2GDQ4=;xXUadcyKMYMsqLezndAMRKd6ewR
 XSdNINu3XbpqZnlvO4hAW57UlKUwjHFGtrIsbEyUDGhmk0rkht+jlDjTfNKaJzXG4Lm6gxVVe
 0jXW48PvQ69FJFXXhi7YlgAVqHpt5/QTk0HuyfJcftX7UgO+YXmTvOsQZS7xlLmfLdPsuRFKT
 Gzw56ri7sZSshq9ysFx6nHDLhyfzeuyLtILbR1fDpBzi3eDvD2RbRLGONCG9eIwfZWm0ae/p5
 d+AsTLVEH/CTFAYXQsOMgcPo6BG0GBtYvh8lw9RltBS7hxsoxYKM9KXq2sk8a/EPOeaUJ5jxh
 M7R3kGRz1a7qsMkSTVd+O7i9ZR7xoGlZdfDIJMCOcUm3RNeZYZ+7+NgsoW36qCTdt6OYiLJ1z
 cClaUV0RBhLihuNlcxVNfSnmUzj1P6/75xRXnuyXF1JmT97mqRslw7GTi2pPPCoLlY5HRJ6mu
 ZllYfbGNA0rF4OH+TSXlINAenkhx9UQkFORMxE4ZIioeENIDdiRMws53Yoo8BxeEsf+2riIN2
 Vi62a7Wh67RrVHfKGe+wvj1miPZ9m45oaEkwv1FIlPyEh7du5DEHKSOpUDOAS7IHtfZB7LZiC
 2PbL5WIcfRePsxDH3Hf8HeGtMnMD2C2xlk7l1CU+7H2DefRDjGl6gQcPYtNQQNiqf1xduZ3BL
 Bo9WSFZhFLxUt0K3tsZcV79LVvdfDsAcCseUm3fOzOPIlSuXM9AemNkSOgGFEVvSUTVgquO9Z
 1wfep9+4UluRWaETsF4BgqP8lO6YcRMU3cRHkd7jqdWjgzgID4SpIsgSZ2ujzBLm9q79CjETb
 CUzcALAKIN3AkRfvj5ljNdtA8KdslQsJodz40G6CUPt++IAb1jQdWIb/3r1w5bo5Kn7DhQgd1
 sQvrZVS3YAX7gv4WX6e1/VlxvSp7RzSb8v5ofy2Nh3VS8Id8hv2RToLSX9rlY4vCD+Dz8ItSp
 JPdbtlxIr61VDERk33SIrKzMa80PeGDU+p3xS9heHIiUh845nKMqxI2QN0o72PI9qWm4gdqUU
 6x9KoKy4rQm5wo8+CRZ/MOSiisBxCMydXidCLXWtmEKAnOi9dEt5bifOjGnKWkELemAG9CRPD
 9JhPsrKabYRrweEUtpV864E83B68sPV5VJCt3Fh3eQZYz6xtCWSoFemqx2VS1bxDWqFCtcya8
 6yGF50vFMNRntfk3iLeM9K/dpDg+lnGf6JGywLUunfL2t0vp89s/tfTqEaz0P51cDSucOFXOR
 O7Ra2iEOeTXF0clVmrjmS5OvIWWopsFbfZU0w3HYKfaTn1d9e6hXs4pyHPzKa93pfONFMk0UQ
 r+SyXL6t1oLmEZRPumdGq0pNn4eVp7K0nBIshmUBVcWLjPZTzGPAsqyIpFDoDjMVlZAHY5yQI
 8A1NtVRF7nDUr+Ng/jyea23ONTKiGimaqbW80DzfPrVg0nETBhwzgXH6a8rQ9RuLeI+ZD74PP
 xCYrSRi2WeUdSvDsOdLdVTJxe4GhOkylyc97Cy2boiCdfOzjs

> devm_kasprintf() return NULL if memory allocation fails. Currently,
=E2=80=A6
                call?                               failed?


> Add NULL check after devm_kasprintf() to prevent this issue.

Do you propose to improve this function implementation a bit more?


=E2=80=A6
> ---
> V2 -> V3: Kept the original switch structure, only optimized the outer
> conditional checks while maintaining safety requirements.
> V1 -> V2: Simplify the handing of the condition "suffix" with if/else.

* Under which circumstances will you begin to care more to offer such adju=
stments
  in separate update steps?
  https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/Documentation/process/submitting-patches.rst?h=3Dv6.14#n81

* Can another tag become more helpful?
  https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/Documentation/process/submitting-patches.rst?h=3Dv6.14#n598


Can an other control flow variant be a bit nicer finally?

	if (suffix) {
=E2=80=A6
	} else {
=E2=80=A6
	}


Regards,
Markus

