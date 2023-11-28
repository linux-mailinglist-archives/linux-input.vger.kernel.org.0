Return-Path: <linux-input+bounces-276-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C24C7FB020
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 03:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16751281C3E
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 02:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC05BCA73;
	Tue, 28 Nov 2023 02:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="G/Tyry1m"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CAF71A3;
	Mon, 27 Nov 2023 18:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1701138881; x=1701398081;
	bh=OmKNEOhmfI/LCTYuOTunAYKjcYUROIpp2HXRooB1X0c=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=G/Tyry1mef+qYx4ORvjLEUpkl/SmR23hN7EF5XOK6up6aRgShlTdw5GQrMUcB5BMh
	 THAj8GGw6nVPY90y/c+9xu7/GN2s2rxe5i3/d6WVOgDwn+BWgwlZFoqjPVoYDcJLJu
	 q2XcoH8GXbVJGoZxduA4W52hVEI263vxjhjeyhcrmABPwi6l5j7Lsu9BVEYmYo+OCk
	 H2stKxvlclJZghpNzLr3Cq/c+ussVQEpIJxrKYaPlLwd6Aa8BUVUcldZwQnA3zTPTi
	 u3UoTmStQbSD6oZc44wOnGbNPErgS6ejUkQDtHNFKT+CjVLSHlvFDBPcEqcVQkxHV0
	 oTwBdTpyUX2JQ==
Date: Tue, 28 Nov 2023 02:34:34 +0000
To: Alexander Koskovich <AKoskovich@pm.me>
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: roderick.colenbrander@sony.com, jikos@kernel.org, benjamin.tissoires@redhat.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] hid-playstation: Fix button maps for the DualSense Edge controller
Message-ID: <8734wqehc9.fsf@protonmail.com>
Feedback-ID: 26003777:user:proton
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 28 Nov, 2023 02:19:42 +0000 "Alexander Koskovich" <AKoskovich@pm.me=
> wrote:
> To clarify, I did test this patch locally on Fedora Rawhide and confirm i=
t works with games. It does resolve the issue, and is a workaround.
> It's not just Steam/Proton I'm seeing this issue in, I'm seeing it in nat=
ive Linux games like SuperTuxKart.
>

Thanks for confirming. I am not that familiar with stk but I believe it
uses SDL2, which might be your common culprit.

  https://github.com/supertuxkart/stk-code/blob/a57ac415bbaf8e22a1c35f3ac09=
49c4dca322637/src/input/sdl_controller.cpp#L288

>
>
> On Monday, November 27th, 2023 at 9:16 PM, Rahul Rameshbabu <sergeantsaga=
ra@protonmail.com> wrote:
>
>
>>=20
>>=20
>> On Sun, 26 Nov, 2023 00:15:49 +0000 "Alexander Koskovich" AKoskovich@pm.=
me wrote:
>>=20
>> > This brings functionality of the DualSense Edge controller inline
>> > with the stock PS5 controller.
>> >=20
>> > Signed-off-by: Alexander Koskovich akoskovich@pm.me
>> > ---
>>=20
>>=20
>> Will provide a follow-up to the relevant discussion.
>>=20
>> https://lore.kernel.org/linux-input/P8jVfYBAwiM_8MIgshN0osVVfshfBH2-oZCQ=
uqoqh0Hy76_031zuZvYXWl0edtfTUwDOSNlc5priSRXI3G5dboVh5VPbcdxzAcEF7EvUVgo=3D@=
protonmail.com/T/#t
>>=20
>> Since I assume this patch was not actually tested to resolve the issue
>> based on the evtest results, I think we should drop this patch. Will
>> mention some details I might have with regards to the behavior you are
>> seeing with Steam/Proton specifically.
>>=20
>> --
>> Thanks,
>>=20
>> Rahul Rameshbabu



