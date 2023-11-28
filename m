Return-Path: <linux-input+bounces-272-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C4E7FB004
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 03:19:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B83D6B210AA
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 02:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDB34C7B;
	Tue, 28 Nov 2023 02:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="gRPZ+jKM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3760A5
	for <linux-input@vger.kernel.org>; Mon, 27 Nov 2023 18:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1701137986; x=1701397186;
	bh=29w5NVRuek7/l0wHEq/U0JeFgdlkoLePKJ3LTCfQw+A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gRPZ+jKMrF07UYTmFzj2Y7vdBp0IIDNNf3RMvhzVmjos+f516TMJv7lOQERbDqXPr
	 0Kr6wWZvF+RVYRBs3UBgl3zRM5YHTSDqqoKd0XSQE44Hl/t1MdiB7T1jtkx75y8VOg
	 9C3QWA+zbqhNuSEiCkZH5FX57ezOB2xApBMbEQfsZrQ3K12ogBqa4SFMnvsw89LC/k
	 L4TcVPSq8/RGWyyg7Hw0i2YQ0LE4wYtHgYr0chbQ4CmOuMpL757fKMwhtKxb/WNR5i
	 VikLQjwXw5XiskU3158AzvcEXJXHx/VcVBpsQUgW6U2Jkbv5Y3aUtSb1TxCfv5XikG
	 J9OlWY2lSenag==
Date: Tue, 28 Nov 2023 02:19:42 +0000
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: roderick.colenbrander@sony.com, jikos@kernel.org, benjamin.tissoires@redhat.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] hid-playstation: Fix button maps for the DualSense Edge controller
Message-ID: <7gnt80t5c023J-Vo_c1TvJFYJ3OOpw3iaxcEtXDhFQQLmnE4eKK4VZH_sjd6hzrTtG5GwLwvgC0lD6UAeEAxJwA7N9qGsxmgONPCyDD03IM=@pm.me>
In-Reply-To: <87bkbeei6g.fsf@protonmail.com>
References: <20231126001544.747151-1-akoskovich@pm.me> <87bkbeei6g.fsf@protonmail.com>
Feedback-ID: 37836894:user:proton
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

To clarify, I did test this patch locally on Fedora Rawhide and confirm it =
works with games. It does resolve the issue, and is a workaround.
It's not just Steam/Proton I'm seeing this issue in, I'm seeing it in nativ=
e Linux games like SuperTuxKart.



On Monday, November 27th, 2023 at 9:16 PM, Rahul Rameshbabu <sergeantsagara=
@protonmail.com> wrote:


>=20
>=20
> On Sun, 26 Nov, 2023 00:15:49 +0000 "Alexander Koskovich" AKoskovich@pm.m=
e wrote:
>=20
> > This brings functionality of the DualSense Edge controller inline
> > with the stock PS5 controller.
> >=20
> > Signed-off-by: Alexander Koskovich akoskovich@pm.me
> > ---
>=20
>=20
> Will provide a follow-up to the relevant discussion.
>=20
> https://lore.kernel.org/linux-input/P8jVfYBAwiM_8MIgshN0osVVfshfBH2-oZCQu=
qoqh0Hy76_031zuZvYXWl0edtfTUwDOSNlc5priSRXI3G5dboVh5VPbcdxzAcEF7EvUVgo=3D@p=
rotonmail.com/T/#t
>=20
> Since I assume this patch was not actually tested to resolve the issue
> based on the evtest results, I think we should drop this patch. Will
> mention some details I might have with regards to the behavior you are
> seeing with Steam/Proton specifically.
>=20
> --
> Thanks,
>=20
> Rahul Rameshbabu

