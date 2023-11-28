Return-Path: <linux-input+bounces-277-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 741087FB025
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 03:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32B3E28193C
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 02:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDAF8ED3;
	Tue, 28 Nov 2023 02:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fz504EKO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F382818E;
	Mon, 27 Nov 2023 18:36:22 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a00cbb83c82so704843566b.2;
        Mon, 27 Nov 2023 18:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701138981; x=1701743781; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMfQiZRGZNh8CgJ4/FyHU6ngG5/rgJQq7TyrI1Hz6Vg=;
        b=Fz504EKO2XZ7GxVTveKqqsBXkd6SgVf7FBb+Zh5eIzP1iMHGCt/DBSQKuhumdi4fbZ
         gt1AJCc9ZRRxo6YRSx29rKlidfLz5Qg8EBN6ZY/I4GidUT8w2bdZ8HgHvCbCwgyjg9TZ
         DoJczt883JhRezI3rrbPCCqjHfgR/5cxsXWd6/PaNbqLkWuQJamA8rlBSjolvIrlMXgZ
         aB6pvOE/HUfdv16s4LUM1OZfZs8SIK3mL5SnM++zekBbgxd0Wp5vWib/krSHaqyoCdBc
         0WhnqZwl3o9zADF7foeZpce45BRKEqVlRt3XMj9nATQ60RLox4y51PfypaLAJ935AkHD
         NZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701138981; x=1701743781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMfQiZRGZNh8CgJ4/FyHU6ngG5/rgJQq7TyrI1Hz6Vg=;
        b=QEVkbjFlmYRFZRUSuwKTJ1aRxdsC5HPmwn/S2GsuQF5ftHhFpbbvAASNJZhMdkA9uD
         pG6pihncfz7PynnY+KZXaRlF4oeG2nO3kf3AeMhj67yYpNeJlGyHq2Dpx37IFaqtR1r7
         ds0iRK4BrdZlEOMvKbU1IR6X0KwG9d1ToMzV013s38rKo8siRput3tdZoyLtljwpbNnT
         GlWuKbSszL+IU9Yd63P0J8Zj9EH/x3waCavdzf1GY4IOX/2KePfXkvatxFxer/mLimmK
         IKOocD4qRvE3HAx7/PayA6/Adi6bZx7Q8OBkH1ebd5uhxx7ZqIK8ZkZC7WjFICH/Cd7r
         JzwQ==
X-Gm-Message-State: AOJu0YxDf+vk0NFbFxKPFcc3i5i8b/Qom7p/H6UyYwzQvRiH+Dzy5C9u
	ka5UMNWv9wYBq/HmktIS+cMBk3a6YnVOPJsGgyk=
X-Google-Smtp-Source: AGHT+IFZHVqhstMsbHwZz+ZcsuCceHtOMAoSoOM72h7xOQf9lWwOG6N72/rf85Cz3A8SPR9FBUbCMqR+dBxO8sLLP/4=
X-Received: by 2002:a17:906:7497:b0:a15:ce29:6dcd with SMTP id
 e23-20020a170906749700b00a15ce296dcdmr113047ejl.7.1701138981283; Mon, 27 Nov
 2023 18:36:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231126001544.747151-1-akoskovich@pm.me> <87bkbeei6g.fsf@protonmail.com>
 <7gnt80t5c023J-Vo_c1TvJFYJ3OOpw3iaxcEtXDhFQQLmnE4eKK4VZH_sjd6hzrTtG5GwLwvgC0lD6UAeEAxJwA7N9qGsxmgONPCyDD03IM=@pm.me>
In-Reply-To: <7gnt80t5c023J-Vo_c1TvJFYJ3OOpw3iaxcEtXDhFQQLmnE4eKK4VZH_sjd6hzrTtG5GwLwvgC0lD6UAeEAxJwA7N9qGsxmgONPCyDD03IM=@pm.me>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Mon, 27 Nov 2023 18:36:09 -0800
Message-ID: <CAEc3jaA4qJVSTKZmU+PN5zHhPw0NZmf_8XAuX9PkFBwcFdEfkw@mail.gmail.com>
Subject: Re: [PATCH 1/1] hid-playstation: Fix button maps for the DualSense
 Edge controller
To: Alexander Koskovich <AKoskovich@pm.me>
Cc: Rahul Rameshbabu <sergeantsagara@protonmail.com>, roderick.colenbrander@sony.com, 
	jikos@kernel.org, benjamin.tissoires@redhat.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Supertuxkart uses SDL2, which doesn't have the proper evdev (or for
Windows dinput) mappings when not using the native hidapi/hidraw
backends.

Thanks,
Roderick

On Mon, Nov 27, 2023 at 6:19=E2=80=AFPM Alexander Koskovich <AKoskovich@pm.=
me> wrote:
>
> To clarify, I did test this patch locally on Fedora Rawhide and confirm i=
t works with games. It does resolve the issue, and is a workaround.
> It's not just Steam/Proton I'm seeing this issue in, I'm seeing it in nat=
ive Linux games like SuperTuxKart.
>
>
>
> On Monday, November 27th, 2023 at 9:16 PM, Rahul Rameshbabu <sergeantsaga=
ra@protonmail.com> wrote:
>
>
> >
> >
> > On Sun, 26 Nov, 2023 00:15:49 +0000 "Alexander Koskovich" AKoskovich@pm=
.me wrote:
> >
> > > This brings functionality of the DualSense Edge controller inline
> > > with the stock PS5 controller.
> > >
> > > Signed-off-by: Alexander Koskovich akoskovich@pm.me
> > > ---
> >
> >
> > Will provide a follow-up to the relevant discussion.
> >
> > https://lore.kernel.org/linux-input/P8jVfYBAwiM_8MIgshN0osVVfshfBH2-oZC=
Quqoqh0Hy76_031zuZvYXWl0edtfTUwDOSNlc5priSRXI3G5dboVh5VPbcdxzAcEF7EvUVgo=3D=
@protonmail.com/T/#t
> >
> > Since I assume this patch was not actually tested to resolve the issue
> > based on the evtest results, I think we should drop this patch. Will
> > mention some details I might have with regards to the behavior you are
> > seeing with Steam/Proton specifically.
> >
> > --
> > Thanks,
> >
> > Rahul Rameshbabu
>

