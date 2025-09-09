Return-Path: <linux-input+bounces-14552-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB638B4A0C8
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 06:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71EF54E30D2
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 04:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8EC22459C9;
	Tue,  9 Sep 2025 04:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Cp4FCX26"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-24431.protonmail.ch (mail-24431.protonmail.ch [109.224.244.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969A5EEA6
	for <linux-input@vger.kernel.org>; Tue,  9 Sep 2025 04:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757392759; cv=none; b=pO0pNBG4sm3rfB1bYoJ7MIgF+nmWOzJ3rA2SvVJ/oENv9y82pHwY1k6cMxqatQVW9RBKY7JDPC5lo2mmPhh12Cm2J+FOU1ZjBKFTUqZoHLIlC0p3ucFM9/NxAi8KhJX92ijJPsxoPeZPM1pvLvAljE+XHgIFkWyY2qhnZtSD2Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757392759; c=relaxed/simple;
	bh=JixMWv1ls3A7bvg1cHOcjuKY04txdsUhUP420BZoSUQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=r8+yPF6+BG1ENNlSCnIIN4Xj1hQfv1nnH7KYh8fgS9W+FJaBvPzQ/bXHR8aixQgYKhE4S7OF/bLifw4737C8SC/CF0R5hMsAoJF30GlBSHw38g+zH/5FP1bWkxoyBP5yEK3aRpRQrlaDyer3Sqqx6gUGraGR4QDZxKp4EcfvRa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Cp4FCX26; arc=none smtp.client-ip=109.224.244.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1757392748; x=1757651948;
	bh=JixMWv1ls3A7bvg1cHOcjuKY04txdsUhUP420BZoSUQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Cp4FCX26u/f1EHo8CHhetrcfvH9BZrfGiPZ5WNAkNlaV6lOKtkfXCt0OJgJLaEWgu
	 Wa+Bp+A0gqFSFICyoSPvfgyCpAcriYRhgGJTKQo6iCsGVmEP7LvuCP7STiGVzm7oFg
	 04C5PVCSWXMLwzWw2hsqGLJsbXvaWFch7LuakiDZjLHjlUh1EM43WtleHakcq9/VHe
	 50EO/Y5qMRAubl0Hc0IrKoZLXceVlSwvJGp7HxnFpw3wC8Ari2QqGahc8/27DBom4y
	 ihD06BoOVZbbJSCmHjukpstxMnv6W4zwrLZzhkzvIDeP1FqlJ5Kh86IYrpSIrB743t
	 MrqYK/4dgRS9w==
Date: Tue, 09 Sep 2025 04:38:56 +0000
To: "masaki.ota@jp.alps.com" <masaki.ota@jp.alps.com>
From: demetriatemp <demetriatemp@proton.me>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>
Subject: =?utf-8?Q?Plain_text_ver._libinput_issue_318_=E3=81=AB=E3=81=A4=E3=81=84=E3=81=A6_/_Regarding_libinput_issue_318?=
Message-ID: <aEof_8P42kKfo-l6X6pPKXMOSr9PR3d2hEtW97VySH0018ZeiJADfLwCsXpL-aLcD5gstuDIerxjzVa95bKlEzeB5IZUpj54TB84bj2nsSo=@proton.me>
Feedback-ID: 159134615:user:proton
X-Pm-Message-ID: a093d6f03cd4d7a89ab69f727702945019486cab
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

There is an English version below.
---

=E3=81=93=E3=82=93=E3=81=AB=E3=81=A1=E3=81=AF=E3=80=82

Linux=E3=81=AE=E5=88=9D=E5=BF=83=E8=80=85=E3=81=A7=E3=80=81=E3=83=8F=
=E3=83=BC=E3=83=89=E3=82=A6=E3=82=A7=E3=82=A2=E3=81=8C=E6=AD=A3=E5=B8=B8=
=E3=81=AB=E5=8B=95=E4=BD=9C=E3=81=97=E3=81=BE=E3=81=9B=E3=82=93=E3=80=82

libinput#318 =E3=81=AB=E3=81=A4=E3=81=84=E3=81=A6=E3=81=A7=E3=81=99=
=E3=80=82

https://gitlab.freedesktop.org/libinput/libinput/-/issues/318

=E3=81=9D=E3=81=93=E3=81=AB=E3=81=AF=E5=95=8F=E9=A1=8C=E3=81=AE=E8=AA=AC=
=E6=98=8E=E3=81=A8=E5=BD=B9=E7=AB=8B=E3=81=A4=E3=83=95=E3=82=A1=E3=82=A4=
=E3=83=AB=E3=81=8C=E3=81=82=E3=82=8A=E3=81=BE=E3=81=99=E3=80=82

=E3=81=82=E3=81=9F=E3=81=97=E3=81=AE=E3=83=A2=E3=83=87=E3=83=AB=E3=81=AFX2=
=E3=81=A7=E3=81=99=E3=81=91=E3=81=A9=E3=80=81Jon West=E3=81=95=E3=82=93=
=E3=81=8C=E4=BF=AE=E6=AD=A3=E3=81=97=E3=81=9F=E3=83=95=E3=82=A1=E3=82=A4=
=E3=83=AB=E3=81=AF=E5=8B=95=E4=BD=9C=E3=81=99=E3=82=8B=E3=81=A8=E6=80=9D=
=E3=81=84=E3=81=BE=E3=81=99=E3=80=82

=E3=82=AB=E3=83=BC=E3=83=8D=E3=83=AB 6.16.5 =E3=81=A8=E3=81=AE diff =
=E3=82=92=E4=BD=9C=E6=88=90=E3=81=97=E3=81=BE=E3=81=97=E3=81=9F=E3=81=8C=
=E3=80=81=E3=83=91=E3=83=83=E3=83=81=E3=81=AF=E5=8F=A4=E3=81=8F=E3=81=A6=
=E3=80=81=E3=82=AB=E3=83=BC=E3=83=8D=E3=83=AB=E3=81=AE=E6=96=B0=E3=81=97=
=E3=81=84=E5=A4=89=E6=9B=B4=E3=81=8C=E5=85=83=E3=81=AB=E6=88=BB=E3=81=A3=
=E3=81=A6=E3=81=97=E3=81=BE=E3=81=84=E3=81=BE=E3=81=99=E3=80=82

=E5=BF=85=E8=A6=81=E3=81=AE=E5=A4=89=E6=9B=B4=E3=81=AF=E5=88=86=E3=81=8B=
=E3=82=89=E3=81=AA=E3=81=84=E3=81=AE=E3=81=A7=E3=80=81=E3=82=A2=E3=83=83=
=E3=83=97=E3=83=AD=E3=83=BC=E3=83=89=E3=81=97=E3=81=BE=E3=81=9B=E3=82=93=
=E3=81=A7=E3=81=97=E3=81=9F=E3=80=82

=E3=82=A2=E3=83=83=E3=83=97=E3=82=B9=E3=83=88=E3=83=AA=E3=83=BC=E3=83=A0=
=E3=81=A7=E4=BF=AE=E6=AD=A3=E3=81=97=E3=81=A6=E3=81=84=E3=81=9F=E3=81=A0=
=E3=81=91=E3=81=AA=E3=81=84=E3=81=A7=E3=81=97=E3=82=87=E3=81=86=E3=81=8B=
=EF=BC=9F

=E3=81=82=E3=81=9F=E3=81=97=E3=83=97=E3=83=AD=E3=82=B0=E3=83=A9=E3=83=9E=
=E3=83=BC=E3=81=A7=E3=81=AF=E3=81=AA=E3=81=84=E3=81=AE=E3=81=A7=E3=80=81=
=E3=81=93=E3=81=AE=E5=95=8F=E9=A1=8C=E3=82=92=E5=A0=B1=E5=91=8A=E3=81=99=
=E3=82=8B=E3=81=97=E3=81=8B=E3=81=A7=E3=81=8D=E3=81=BE=E3=81=9B=E3=82=93=
=E3=80=82

=E3=81=94=E8=8B=A6=E5=8A=B4=E6=A7=98=E3=81=A7=E3=81=97=E3=81=9F=E3=80=82

=E6=97=A5=E6=9C=AC=E8=AA=9E=E3=81=8C=E4=B8=8B=E6=89=8B=E3=81=A7=E3=81=94=
=E3=82=81=E3=82=93=E3=81=AA=E3=81=95=E3=81=84=E3=80=82

---

Hello.

I'm new to Linux and my hardware isn't working properly.

I'm referring to libinput#318

https://gitlab.freedesktop.org/libinput/libinput/-/issues/318

It has a description of the problem and helpful files.

My model is an X2, but I think Jon West's modified file will work.

I created a diff with kernel 6.16.5, but the patch is old and reverts the n=
ew kernel changes.

I don't know what changes are necessary so I didn't upload it.

Could this please be fixed upstream?

I'm not a programmer, so all I can do is report this issue.

Thank you all for your hard work.

