Return-Path: <linux-input+bounces-12623-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76974AC6B80
	for <lists+linux-input@lfdr.de>; Wed, 28 May 2025 16:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D71C53B30B3
	for <lists+linux-input@lfdr.de>; Wed, 28 May 2025 14:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A54D3C01;
	Wed, 28 May 2025 14:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=proton.me header.i=@proton.me header.b="NwZ40fLX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F96C1F37D3
	for <linux-input@vger.kernel.org>; Wed, 28 May 2025 14:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748441676; cv=none; b=b6WO5J3AukkTXZtZGIeIhgQ4SbrLBlld/ufYBozVWTOK11ZO1vzLBinKcZfHwLrvAKwvaCIGE8rqlctxE/oGsG0kB3HrWyPFv004o1TM+m7cROUCyRm+IjpprlVrPqWLIHM8twfmhKe9B4jy9pSZR7RFnbDWYXYYicR+gy/LM98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748441676; c=relaxed/simple;
	bh=/Hp8hg5q431cSV2PsuYaORqBm49MKgRf3Ri8+4gt3rE=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=R26+TNM0kbCjy2/0BGVpenEUFXioBQRy4/SJKBqpzCVnhQryIk2CxLE6JNcgcS32Fe58bWHQTQlXzZl3cCUYY47+Ab3gxsZEEvOXgC9pdPRflkY6doprqxmYS2sXxNEmWEbG97G0YcgG+zSLZ+ayipD4dFanW/Oq0VfuUPYOCks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=NwZ40fLX; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1748441664; x=1748700864;
	bh=/Hp8hg5q431cSV2PsuYaORqBm49MKgRf3Ri8+4gt3rE=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=NwZ40fLX6f383o7+xJkGZyiYQ27lQULbvDhuraAsKL4Ch5igp/sMGbUagDr0UA8k9
	 Gt+P3D0rXSpaOhopa91mk/THPu25ZJKWsK26uQYdfD3Y/Euth7kfrCWUPo3xkcnCml
	 TxcN3wBWPEH/5HFsn6/J9mck7AtBF/NMU6XydK+0yMgc5cRIUYJlNT/UGbDCmI/LoN
	 h+W8sWKdJ1+knl8qRV4E+SBpyvXr5meKJnh3G3NUtXIOVHIB+ymS60emRq74M2FAbf
	 lqkGZYbE/k0J8TKYyKRUVaL3yv4vefu0J5OdD1Syb0O6auWblvRNHkXEyE9cjedWVz
	 KpA+yju+DuaxA==
Date: Wed, 28 May 2025 14:14:18 +0000
To: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
From: agski33 <agski33@proton.me>
Subject: ELAN1206 Touchpad Bugzilla 219799
Message-ID: <z9A_-FfhGGSZqAHPl-DnF-qPhbI563CsiUUiC8nhdhcZUZYkgpkruvHQ6Vdt8Jt0s0ogm9tCNXFAfn06utR9Zwh_UNTUy4whJ2Z9oVcfPEA=@proton.me>
Feedback-ID: 68827333:user:proton
X-Pm-Message-ID: 78eda988553ed350f987778f388f92c208de09e9
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello all,
I am currently experiencing the issue that was previously reported in the f=
ollowing BugZilla entry:=C2=A0https://bugzilla.kernel.org/show_bug.cgi?id=
=3D219799.=C2=A0 I noticed that the bug was marked as NEEDINFO so I attempt=
ed to fill in the relevant information.


=C2=A0From my testing, it seems like IDMA transfers relating to the touchpa=
d input are taking too long and causing timeouts within hid-multitouch.=
=C2=A0=C2=A0


I contacted ASUS in an attempt to obtain information relating to the workin=
gs of the touchpad that may assist with this issue, however I believe it is=
 unlikely that I will be able to obtain anything useful from them.


I am wondering if anyone has any additional suggestions for next debugging =
steps or things that I may try - would be happy to provide any additional i=
nformation or do additional debugging etc.


System Details:
Device: ASUS Q528EH with ELAN1206 Touchpad
Kernel versions: 6.9-rc6 is where the issue starts, persists through all ke=
rnel versions after including latest.
Symptoms: Touchpad cursor will not move.=C2=A0=C2=A0
=C2=A0Additional Observations: Something of potential interest that I notic=
ed was that it appeared the touchpad is sending data byte by byte when doin=
g an IDMA transfer, not sure if that is normal or not.


Any suggestions for next steps are appreciated!=C2=A0 Thank you in advance =
for your time and input.


Thank you,
Aaron Gdanski

