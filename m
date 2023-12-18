Return-Path: <linux-input+bounces-844-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C54A0817C10
	for <lists+linux-input@lfdr.de>; Mon, 18 Dec 2023 21:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A86591C21846
	for <lists+linux-input@lfdr.de>; Mon, 18 Dec 2023 20:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1AE1DA29;
	Mon, 18 Dec 2023 20:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="g7rHvnfT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9771B3034F
	for <linux-input@vger.kernel.org>; Mon, 18 Dec 2023 20:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1702931993; x=1703191193;
	bh=PMtpZMgq7Hm6xyDBas+E8oXkYML9aV6VQmK9h6ITKZ0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=g7rHvnfT5DxK5uhoASnTfvxBgoEw1QZms1NeytRtcEV74UIi1ir8xH2lHbwRmjgyo
	 uxO9OL1HRv8AxyguatDM40SsZl24PZ76XFjx6ZmufUHgzN2zYrlcid4RKIccevnyRB
	 7E2CX+yDB3LsaLPUmkBu9AyHkPbL44z2+G9UdNsXPYy5fAy1lLFGro40/3t3SqXsBb
	 JaefwO5WXXnPWCbFZLAonk4ZksqbuRchMrnO6D84KQP7EqgokZbke8UQkIL3gO0n92
	 JgYxBdeejUO7LMTUNMlmDkW4yavzGdPkfC9+r0GnHKv5ugUbUNEAuifNVkEZYestKG
	 X3tNbQhjFaSAw==
Date: Mon, 18 Dec 2023 20:39:45 +0000
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: djogorchock@gmail.com, linux-input@vger.kernel.org, jikos@kernel.org, benjamin.tissoires@redhat.com, kernel@gpiccoli.net, kernel-dev@igalia.com
Subject: Re: [PATCH] HID: nintendo: Prevent divide-by-zero on code
Message-ID: <87o7enxn1x.fsf@protonmail.com>
In-Reply-To: <20231205211628.993129-1-gpiccoli@igalia.com>
References: <20231205211628.993129-1-gpiccoli@igalia.com>
Feedback-ID: 26003777:user:proton
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 05 Dec, 2023 18:15:51 -0300 "Guilherme G. Piccoli" <gpiccoli@igalia=
.com> wrote:
> It was reported [0] that adding a generic joycon to the system caused
> a kernel crash on Steam Deck, with the below panic spew:
>
> divide error: 0000 [#1] PREEMPT SMP NOPTI
> [...]
> Hardware name: Valve Jupiter/Jupiter, BIOS F7A0119 10/24/2023
> RIP: 0010:nintendo_hid_event+0x340/0xcc1 [hid_nintendo]
> [...]
> Call Trace:
>  [...]
>  ? exc_divide_error+0x38/0x50
>  ? nintendo_hid_event+0x340/0xcc1 [hid_nintendo]
>  ? asm_exc_divide_error+0x1a/0x20
>  ? nintendo_hid_event+0x307/0xcc1 [hid_nintendo]
>  hid_input_report+0x143/0x160
>  hidp_session_run+0x1ce/0x700 [hidp]
>
> Since it's a divide-by-0 error, by tracking the code for potential
> denominator issues, we've spotted 2 places in which this could happen;
> so let's guard against the possibility and log in the kernel if the
> condition happens. This is specially useful since some data that
> fills some denominators are read from the joycon HW in some cases,
> increasing the potential for flaws.
>
> [0] https://github.com/ValveSoftware/SteamOS/issues/1070
>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
>  drivers/hid/hid-nintendo.c | 27 ++++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> index 138f154fecef..23f3f96c8c85 100644
> --- a/drivers/hid/hid-nintendo.c
> +++ b/drivers/hid/hid-nintendo.c

[...]

> @@ -1163,16 +1176,16 @@ static void joycon_parse_imu_report(struct joycon=
_ctlr *ctlr,
>  =09=09    JC_IMU_SAMPLES_PER_DELTA_AVG) {
>  =09=09=09ctlr->imu_avg_delta_ms =3D ctlr->imu_delta_samples_sum /
>  =09=09=09=09=09=09 ctlr->imu_delta_samples_count;
> -=09=09=09/* don't ever want divide by zero shenanigans */
> -=09=09=09if (ctlr->imu_avg_delta_ms =3D=3D 0) {
> -=09=09=09=09ctlr->imu_avg_delta_ms =3D 1;
> -=09=09=09=09hid_warn(ctlr->hdev,
> -=09=09=09=09=09 "calculated avg imu delta of 0\n");
> -=09=09=09}
>  =09=09=09ctlr->imu_delta_samples_count =3D 0;
>  =09=09=09ctlr->imu_delta_samples_sum =3D 0;
>  =09=09}
>
> +=09=09/* don't ever want divide by zero shenanigans */
> +=09=09if (ctlr->imu_avg_delta_ms =3D=3D 0) {
> +=09=09=09ctlr->imu_avg_delta_ms =3D 1;
> +=09=09=09hid_warn(ctlr->hdev, "calculated avg imu delta of 0\n");
> +=09=09}
> +

Hi Guilherme,

I agree with the previous hunks you added and can see how those could
trigger the divide-by-zero issue you were seeing. However, I am not sure
if this hunk that I have left makes sense.

Reason being, is that the hid-nintendo driver has a special conditional
to prevent divide-by-zero in this case without this change.

1. If the first packet has not been received by the IMU, set
   imu_avg_delta_ms to JC_IMU_DFLT_AVG_DELTA_MS.
2. Only change imu_avg_delta_ms when imu_delta_samples_count >=3D
   JC_IMU_SAMPLES_PER_DELTA_AVG.
3. If that change leads to imu_avg_delta_ms being 0, set it to 1.

With this logic as-is, I do not see how a divide by zero could have
occurred in this specific path without your change. I might be missing
something, but I wanted to make sure to avoid integrating a hunk that
does not help.

Would it be possible to retest without this hunk?

>  =09=09/* useful for debugging IMU sample rate */
>  =09=09hid_dbg(ctlr->hdev,
>  =09=09=09"imu_report: ms=3D%u last_ms=3D%u delta=3D%u avg_delta=3D%u\n",

--
Thanks,

Rahul Rameshbabu



