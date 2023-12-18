Return-Path: <linux-input+bounces-846-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C01D7817D08
	for <lists+linux-input@lfdr.de>; Mon, 18 Dec 2023 22:56:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EA8B28473E
	for <lists+linux-input@lfdr.de>; Mon, 18 Dec 2023 21:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F52740B9;
	Mon, 18 Dec 2023 21:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="ZXJ2+BOL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A0B74E01
	for <linux-input@vger.kernel.org>; Mon, 18 Dec 2023 21:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1702936580; x=1703195780;
	bh=P6Ls9+0CYnVeBt8wHXM2KamkXWuYSq+IDj02EB8jPxQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZXJ2+BOLFAJnZKDLpEoacVHtTP3yl9M4TPct18ngZ6gf5rnzVfZXMljq43FFj3uGp
	 7s50s20z8oRfwH4lvkKhQH8qlapTqqlld+jVtrvH+/JvOWgeWPuAQx7PQjjI2c+7y3
	 oR/H6dVN1Xk829IR/dk7uuW10qg5hMfasMW+9Vyra0CGOswKGcbid8vYmruhAutpT2
	 sHgGHZgqF+IRQOql2xCeSPmEfqCTGCQ5Sw2cIbXNuUzEPXYeReUe1Zw/u1+3d9zr/U
	 t+ymmBDvSzTXGtCZPYuxxOITNbpuQOk+NulPsZiCcrUjELYO4sp4sa2wp0bmTyiU6k
	 Oe+IfplwPnsGQ==
Date: Mon, 18 Dec 2023 21:56:07 +0000
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: jikos@kernel.org, djogorchock@gmail.com, linux-input@vger.kernel.org, benjamin.tissoires@redhat.com, kernel@gpiccoli.net, kernel-dev@igalia.com
Subject: Re: [PATCH] HID: nintendo: Prevent divide-by-zero on code
Message-ID: <87y1dr89an.fsf@protonmail.com>
In-Reply-To: <dcd91e66-11ce-c576-5eb7-8756a1b6f222@igalia.com>
References: <20231205211628.993129-1-gpiccoli@igalia.com> <87o7enxn1x.fsf@protonmail.com> <dcd91e66-11ce-c576-5eb7-8756a1b6f222@igalia.com>
Feedback-ID: 26003777:user:proton
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 18 Dec, 2023 18:46:09 -0300 "Guilherme G. Piccoli" <gpiccoli@igalia=
.com> wrote:
>
> Hi Rahul, thanks for your review.
>
> I think I see ... I covered both bases in this patch, but IIUC after
> your points above and better looking the code:
>
> (a) imu_avg_delta_ms is set to JC_IMU_DFLT_AVG_DELTA_MS and it can only
> change iff imu_delta_samples_count >=3D JC_IMU_SAMPLES_PER_DELTA_AVG.
>
> (b) But the if path related with the imu_delta_samples_count is the one
> that also guards the divide-by-zero, so effectively that error condition
> cannot happen outside that if path, i.e., my hunk changed nothing.
> Ugh...my bad.

Right, no worries. I really appreciate this patch though for covering
the cases involving the gyro and the accelerometer.

>
> At the same time, the hunk is harmless - it's up to Jiri to decide, we
> can drop it (either directly by git rebasing or I can send a V2 if Jiri
> prefers), or we can keep it.

Agreed.

>
> I can try to test internally, github testing may be a bit uncertain in
> the timeframe (specially during holidays season). If Jiri thinks the
> hunk is harmless and no change is necessary, I'd rather not bother
> people for testing now (I don't have the HW).
>

Makes sense. Like discussed above, the change here is harmless in nature
but has no functional change at the same time.

--
Thanks,

Rahul Rameshbabu


