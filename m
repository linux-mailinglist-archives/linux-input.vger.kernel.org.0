Return-Path: <linux-input+bounces-11019-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 231EFA6A840
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 15:19:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B207885BBA
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 14:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BADD222580;
	Thu, 20 Mar 2025 14:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b="hf4C7rB8"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6015822258E;
	Thu, 20 Mar 2025 14:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742480249; cv=none; b=lJnFEoVnggmxjVpTw154+OF6HA/7N4Lwbdu/7hm2mIePCwfApuXPgdy00gLcahxMzykS5u13Ao9rUZxzwgvO+igZklp6OLi2+FuILDXLuz4cRoDkShVB8p5ALIMM9sn0TF+W8keRnOeT2ki850+BcfPydES0Q+ZUGtdbdSpZ6O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742480249; c=relaxed/simple;
	bh=O5+PMMImWSlLIZMHvHFfTGwuJGQlGWVt+Bfj8MRQI0Q=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ScliododI9MZ9sg5enz1nkLzOsp48DG3t/rxIPHHezSUjrlCqN+f47crHEZFZs/dB/PbevE5+EznanU9geh1zb4J6A5MFI5nza5/Cyi6xBwiFHuv3foa9BsN/SF7rn5EgNubyzVWla14Mda6+f5QsBcZLrxk/LhWry5aCccgNCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn; spf=pass smtp.mailfrom=m.fudan.edu.cn; dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b=hf4C7rB8; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m.fudan.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=m.fudan.edu.cn;
	s=sorc2401; t=1742480188;
	bh=O5+PMMImWSlLIZMHvHFfTGwuJGQlGWVt+Bfj8MRQI0Q=;
	h=Mime-Version:Subject:From:Date:Message-Id:To;
	b=hf4C7rB8bFmh+o9Yf1ummK6fEoFdrhM4PhbDdP9QZ6gUgOeDP8+O259wczqzUvXNI
	 WIKyXpbU/J8e363oBKIfGTrdXMsw9JDaE0cAhKDjTqjhyauVG06qqAsq/fgrSQRNh+
	 /m314NTRSh/1vi4uswS+11GvyFULbC8+xxb+TXV4=
X-QQ-mid: bizesmtpsz14t1742480180thbid1
X-QQ-Originating-IP: He84DqGcpyn07WS2Zc1FpA8Hw1bftlnlA1zC6PWKZiQ=
Received: from smtpclient.apple ( [202.120.235.103])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 20 Mar 2025 22:16:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7772875267381703017
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
In-Reply-To: <62d91b68-2137-4a3a-a78a-c765402edd35@suse.com>
Date: Thu, 20 Mar 2025 22:16:07 +0800
Cc: =?utf-8?B?55m954OB5YaJ?= <baishuoran@hrbeu.edu.cn>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "jjtan24@m.fudan.edu.cn" <jjtan24@m.fudan.edu.cn>,
 linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org,
 syzkaller@googlegroups.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <E720A166-B87D-49C3-BD89-FC09694D3721@m.fudan.edu.cn>
References: <559eddf1.5c68.195b1d950ef.Coremail.baishuoran@hrbeu.edu.cn>
 <62d91b68-2137-4a3a-a78a-c765402edd35@suse.com>
To: Oliver Neukum <oneukum@suse.com>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:m.fudan.edu.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MoDvVhotnPBEQdOczHKalWZc/d74TdNh6kqey4zIsae5LTBmOXkGxfrJ
	IhMGR16aMXMKVpmBv2M4t4oTdGCl4K1NdWxxWVS0yXuC6aYkPXltumANXrpeKr+qSQt+A1T
	ZYJy2CDim7D+Iujh2YEVjW4vNeOqzpdtF+KNkLWnHOt8A0e1ftsUINV7uOV9KnQy/c5oJXI
	Ih0SzICakhXKstRHDTWfe5JB6FAiuwGCfZxLahkRS0xv5z1Qxvp+2LlZeCNseiFh98Dmux9
	nz70n3GuyzwPK6M2hxOnzMaeaXZG+xyVmrv8m+Y7yYLDJ/Zpy4ejWDNGIXFw1yJvvZdJ/ZX
	UBLpbQV36raghIFkChRT0SyvDD8CtQwbl7w/si/YnJ2CFyed/XD6hfg11hhQfroull8uKDK
	WURIq85EtFVcmXJEPEbADOL35VqaavWE0V5gKnharjOvXZe9UqvGyhOqp71sKzHd6D0YSIP
	YUQ768d1cUbHhXEAxM8HQmnB04Ln/D2jNhgUxO/z+sh6zBLlvDOdlmxG1/U+ODAWezPg1H5
	b3xoWqjbbOyifYmuRzDJ1K0cjADb5brzCRwUhMJYTCKjkK8jXK10RYT8+vW1cgP0zo5X475
	fYLvgI0fDLhIiNe2UamM1RgyTkK2o9Zx3ey1nTBqVvJMRBL3YCstbm6DiEhzyWcSUABSB0m
	zz1rTe/tT9tiun5qQ7hr3TaWvwIc/bCZN3kcKFYrwSRnjSKBOKDFiC4rohK+fCxNnZP5OXV
	tpiSA8rNRGa4xP/eS1p9gBM2NaJHwCH+RVm/6jZbjyZlEHm/2hHUB2KH/3aGTcuhUA0hV2N
	n9rlRzirMEe0s4GPq3X7+RCkhI3ekLs4nji8mKlFZBsOLAGET3H8ZMMVsmdkfqEzQWGe9aK
	sqLamSg9BCJ+I/K9zU+zeN047EzZ9QNJzqgXSgDb/CCn0xHq9bihBxMstbX82tW1ERrE0EF
	7pQ99zoantfAGUTnKSUNzmG7tz7OaTReVblDhy5b2a7qxMQ==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0



> 2025=E5=B9=B43=E6=9C=8820=E6=97=A5 21:35=EF=BC=8COliver Neukum =
<oneukum@suse.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
>=20
> On 20.03.25 05:39, =E7=99=BD=E7=83=81=E5=86=89 wrote:
>> Dear Maintainers,
>> When using our customized Syzkaller to fuzz the latest Linux kernel, =
the following crash (94th)was triggered.
>=20
> Hi,
>=20
> is there a way to use the syzkaller for testing a patch?
>=20
> Regards
> Oliver
> <0001-USB-cm109-fix-race-between-restarting-and-close.patch>


Thanks,

I=E2=80=99ll test the patch for multiple rounds to check if it works.

Best,
Kun=

