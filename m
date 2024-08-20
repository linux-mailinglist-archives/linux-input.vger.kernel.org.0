Return-Path: <linux-input+bounces-5708-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CD59581E6
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 11:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BBF9283138
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 09:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F671891A4;
	Tue, 20 Aug 2024 09:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="PVY4QD1/"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38A318A924;
	Tue, 20 Aug 2024 09:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724145439; cv=none; b=uEtM+vz4RV6wPnOpy2kCDNaUXbJKS6OwTGwm7Oa88BtmFtADtwPl0OKJdf0BIZfU7cav3scfukIEaZJshSeuVkt5LrF/mdSZaNv1KRj2HR8KZ3m18TfM/4xt51DOGiIVmZ5btiFJg1zeTgDrPuq4VkrDC6/RzQ0uoBlXltQ6tUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724145439; c=relaxed/simple;
	bh=qsNrPekQyQCOG+RQSjVa2R71A/PmhgjNGcRM9kFUy3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P0E7I9TpzCgrTgPe439qhZB59mI7y2sddwYEqbevBdKWptwWB8/LYrkS6nsOjuEiFAo6nhnTOnTRAwe56YQ1rbpYigsD+lR8UWCEoUSw5w9NLOD+e2d4EdsfXp6Pxfo8cooBTn0VfuMUDeTICwGUyQKfGte8mU7Vr3wdWf6L+cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=PVY4QD1/; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1724145422; x=1724750222; i=markus.elfring@web.de;
	bh=oP+H1RPG9Zck7KLM0vu6hKBk5Z175xOHYoYt+ovcV/Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=PVY4QD1/oUuZTDaWl+2WIz4bJa8nmkBroUhiCsaGEkSFZqKDXiA3BEPHDBUr1Oxc
	 AiTLVfGi2MGleYN/4tJbmBBT1UUbgTzw9/ddl4enecIwUtiBqvUcgEHK9Pw+kkUCk
	 uDG4FbAeaNMWKET+rBF1daNUEyvCquULedttmBwpz4auYkHl97U7Ca/6fODy32AWu
	 t4aFREIdiVq7A7s13fEMJdmwdsoHzUORmKWh9nShu9vqp0nGibiXeV7P2X8JZiSHJ
	 1EvyRA+9TjDuh9gvEiKyx1LicCj0XrgIWvyXicxf89GXKLqAu0FL3FUBafPSf7VFe
	 Hfc9OqXD2OCfW+Y7fw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1McIki-1s8Mfy0nFc-00dR4i; Tue, 20
 Aug 2024 11:17:02 +0200
Message-ID: <64039307-fcfc-4e08-8727-c805964f7386@web.de>
Date: Tue, 20 Aug 2024 11:16:51 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] HID: corsair-void: Add Corsair Void headset family
 driver
To: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, linux-input@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>
References: <20240820002210.54014-3-stuart.a.hayhurst@gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240820002210.54014-3-stuart.a.hayhurst@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:r8To4IboEVhNbAeJuHFIVLHKX0+p6733RoBIxz/bcd6hycS7pS7
 54VSXtRAVUJJAbmQEvRxA9qCuhrm2X9QKNN5twTb/mar0CE+Suk4rWo0R7LQGYKFq41JI6P
 ue76uDlEcZlSVDcPDuNZKlZOvMVWbqaUEoSOWiTOpxRgaAmewp5OPqFRN3/odQs9eMI5elY
 66g6oty9UQHrMJ83E4OSg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yIaeqTHerJk=;RekuxpkpkNM2GXs8mA8YQlM3M6t
 SjLx/2peVlvgyMR049CWrY3UAGDdXY6zECU/qdRbhoYgHUeF1tN1YxjvqQWjxDSbQ3AmHygHe
 hoG76qKWPN/yuDQbjsXuVsnyN7sK5eQ2bpxjaQK3dc4gquaF5JiuA925eMILqh2IONH2D3Tqk
 qFuxKwa4kPB94YwJgd0JO4FM4GcsqYcLB+LYd9iPoZ1Yqh0HA5zZkh6vgCpYgdnB+IRyW06Ya
 DVT83jbJrzVSSPu+nwCpwjKAqT5yf2okb0vWeXJO9+2EfeJM0eTUNcYGmQSyXMy5RQUvhOBo0
 A9TOXiFqe8V1B/atDYRVCAblG7IRJPW51A2IkJkxYc9Cvv4gnrCZSUNANI16Ev8SGRwP7szhL
 rnysLGU3WnwVYr0I24bku3gYpUD0nYntW18BG88wYGHLHSc+ikd+1e23RpS1guAzIy4AETgz+
 HqQhrjX2g0rYN9b2wW3M0KxUOSyz3TULY0ExngMA5ZHuAImW1VgCNMH6JWq4WfAFxuOfnaaMQ
 pz3Yyr2jkRrZsBxfAGM7PwaqmS9AkBIImjyk/mMIjSgFTATps2D71/tg1Vu2jlQUsbdLp6IW+
 yEeTI1r2q6DNP+LzZDCqE5WJuwlDVmqpUU/3+GSfI2Tq4H9BWJkeFJB6zARG/oV3hmkmiNzOq
 q2qpo/8VWqQoSEFKbZdVWwgMZA0XFhmYFrjCHxzD+BuFGy2p55jZ/YAQMbmCj8RFvRs1eREmN
 nvCMLaD5lVM8S/5UsC8Z0+1H97WYi6ZQLHSxQFsV3Noc4kpMhOwC7TmePyAbHImIZZZjLAWcG
 ApaBzQpzSoAB2zQ7T3UT79vQ==

=E2=80=A6
> +++ b/drivers/hid/hid-corsair-void.c
> @@ -0,0 +1,842 @@
=E2=80=A6
> +static int corsair_void_set_sidetone_wireless(struct device *dev, const=
 char *buf,
> +					      unsigned char sidetone)
> +{
=E2=80=A6
> +	int ret =3D 0;
=E2=80=A6
> +	ret =3D hid_hw_raw_request(hid_dev, CORSAIR_VOID_SIDETONE_REQUEST_ID,
> +				 send_buf, 12, HID_FEATURE_REPORT,
> +				 HID_REQ_SET_REPORT);
> +
> +	return ret;
> +}

Would you like to return the value directly (without an intermediate local=
 variable)?

Regards,
Markus

