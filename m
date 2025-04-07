Return-Path: <linux-input+bounces-11549-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E791A7D292
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 05:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECFD616D516
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 03:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8548A21324F;
	Mon,  7 Apr 2025 03:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b="Y7iA9nao"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C178C364BA;
	Mon,  7 Apr 2025 03:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743997643; cv=none; b=hHKmRpdX2UBZtB+dm+5oBcSi6SuJpQ3PxCyKgDktVl3XdSTeKo+ho2c/6aTAsuAh2Gmc53ZOqM35cBnyiqTdTilU7RKD89nNmp6EmtWPKFUIJMyNaChMYOAopQpLnsVmY3NWFTDk6BlFIoYTeBjV3VNwMlMve6rxPDJMDbL1TnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743997643; c=relaxed/simple;
	bh=av44q1rYsp/AtchN3ThcrzvAT1OfT4epMdxLK3s6ET0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=i++MfS+3iXkyZiGfBI/fDFN/xzrWPDFVg9xdniUa5Arbhi58cTXWQTBHXRhKzBY34YjE3KE6kcEzNg5r0XZNHmUnv2x66G0VLGmt5KX0GhUd6/svMbDrPdaehaZ1vjyfk12QBnNr9d0fZ3JyOYM/5tRaUVCV1xyqASahsiBtuuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn; spf=pass smtp.mailfrom=m.fudan.edu.cn; dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b=Y7iA9nao; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m.fudan.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=m.fudan.edu.cn;
	s=sorc2401; t=1743997581;
	bh=av44q1rYsp/AtchN3ThcrzvAT1OfT4epMdxLK3s6ET0=;
	h=Mime-Version:Subject:From:Date:Message-Id:To;
	b=Y7iA9nao7Mio9G6TjFM82PtODgwwAWBc9NkOrbepHObzwlnEzVNfZbemdQPT9A6Bv
	 KYH18oB/g2YL18NzcCeSyFaHDP+3iZUVsL50H5cXXwWClLScN+V6EfXrCh1ZvKqWk9
	 IaKsiFqHSQbB78D8TYnELbJX5Q0NL+HmupHyF6ik=
X-QQ-mid: bizesmtpip4t1743997576t7187db
X-QQ-Originating-IP: MlVPqRNBtqlehSWEyKUNjaKSp8r3taGDpfdzKSriZgI=
Received: from smtpclient.apple ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Apr 2025 11:46:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4215720758617194204
EX-QQ-RecipientCnt: 8
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: WARNING in cm109_urb_irq_callback/usb_submit_urb
From: =?utf-8?B?6IOh54Sc?= <huk23@m.fudan.edu.cn>
In-Reply-To: <3F7A182E-605F-4545-BF77-E739E7A624A4@m.fudan.edu.cn>
Date: Mon, 7 Apr 2025 11:46:03 +0800
Cc: =?utf-8?B?55m954OB5YaJ?= <baishuoran@hrbeu.edu.cn>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "jjtan24@m.fudan.edu.cn" <jjtan24@m.fudan.edu.cn>,
 linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org,
 syzkaller@googlegroups.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <90A10616-43EF-42CB-A1B7-80D9E7FB9816@m.fudan.edu.cn>
References: <559eddf1.5c68.195b1d950ef.Coremail.baishuoran@hrbeu.edu.cn>
 <62d91b68-2137-4a3a-a78a-c765402edd35@suse.com>
 <3F7A182E-605F-4545-BF77-E739E7A624A4@m.fudan.edu.cn>
To: Oliver Neukum <oneukum@suse.com>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:m.fudan.edu.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MdlxueOE7DMoh3Nri4Oqb1+tlp453cqgvMfGnhDzQbDcb8fcLGKUcnM3
	dN90j6wL1SZ+Juy+5htG/x9SYKjoOKcTjD+tn3pgZSDkC1Sprq6i/kh27vOgUJ3+B2hbp/g
	U8qG+X7H3nulk9sqrZy4PAfN94116fimSuQxkiczVxQ12m/mYnYkcO0ggH9UMVN3GBQEuiX
	62Wxu6p8rGCzC5aSmWAWYDxWnXeGnU//2crXZJloqblaVPQHoTmOYTz0JYZxPVybYo+MPP3
	eKGvUpSCNK48z+REUgH6RLKeSKoS7ELWV5TXthUw8ihMV6WEEQyiu4XkUZFzJSV9sU0aio7
	QorZimg+iFqucAZGN7ohsNiqfBuqbUagJQr50yfneamk9Gaei5UP3dNLsEiE/q67WRvniOr
	xNqw+1PUHelKyPF//iosj45A8gkzc7ozxNypxLaYQl1OuwDSbo+DBIESqki6uMKv/WStrtx
	yZwaatxSeps602U71YNb9YdP6lTVVTPxNvrUoR/sNHSa0VNIbP4XIL2n7LMoY3FBNKtt070
	qIRE0SLjKp+Jpw6JM4w7G3E1KD6MDQ6gcVVFB1L23/S43cdFJQgrK9zOtawa1pYvlU069tP
	kC0Lk8gK+eGli+SL0S4V4TqYOLp9lc1igyGqeyKjQ0MwdZZPkD4kEoypu0f2xX1CjLTN71w
	5pbqnpSs3HJj+h/aCLQYaFJ5fGjGU4iawLqhychuUStxdlsOQ0PGc3p2TGqVXKmv6OW4IrQ
	vQghW6rFJjSXtpYvchYzgxv99WhmyCLQW/Xwq1hxosbXo/ZfEhXwB54zi7cLEvYWNzWE4C2
	L9tcK8UKLnHKPe7YsA2j+FjpsNo8BhsJD23lIwHOR6uL6P1YIUa1nmZJWiHu4vffTPSRIx7
	VGJGjoeBdSo10eUqvBcBA+D5tQ/89l1M07QOBj/3qvkna6QJK1ggK/ige05fb1g4Q+xfS84
	tp0NZFXD/khlmQWh7Xrp4Lhk8
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0


>=20
>=20
> Hi Oliver,
>=20
> Sorry for late, our servers have been down for a few days and we just =
managed to fix it today.
>=20
> We retested the patch you provided, but we found that the issue still =
exists, but may be somewhat different from the call trace from the =
previous issue. I have provided a screenshot in diff form and the full =
call trace log in the attachment.
>=20
>=20
> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94
> Thanks,
> Kun Hu
>=20
>=20
> <call trace.txt><diff.jpg>


Hi Oliver,

Was the information on these tests helpful to you? Please let me know if =
there are any tests you need.

=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94
Best,
Kun=

