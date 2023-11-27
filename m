Return-Path: <linux-input+bounces-260-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E70117FA306
	for <lists+linux-input@lfdr.de>; Mon, 27 Nov 2023 15:38:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85B28B21108
	for <lists+linux-input@lfdr.de>; Mon, 27 Nov 2023 14:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1EE31728;
	Mon, 27 Nov 2023 14:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGOtLW9V"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18454EA
	for <linux-input@vger.kernel.org>; Mon, 27 Nov 2023 06:37:56 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a00191363c1so631737266b.0
        for <linux-input@vger.kernel.org>; Mon, 27 Nov 2023 06:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701095874; x=1701700674; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quXdQRz24dunOIxV0+tgT+GyOLZAZyd0m5jC6YhycjQ=;
        b=AGOtLW9VipzxbS5JYiutTdkfcREf5ybarpsmF35FmPBaR8P5J6JCZPdPEO2hwi0K89
         zGllor4U4qE9O9vzB0J7/tKx51GuH/Jmv/1oBeej7RyD5VnpEfzVacP6jUXBfwElfnDE
         GGFR2ZphclDhxAwY3beIitROprr91U3I9oXcRfSTGTFzmWL2uSM97vV59eFu3+JGQaqR
         Oeb61YhYhZnZTP0BgFn06ANRkpM1m7Gc7CgS530gqfXXXmqxZv3ZyMwlAKVElLEGxWcL
         tLFExXKNkgCllXvoADZCk+4inzixol2wi44fkId4Jpxgo+BADoPkIFHgc1wFKGXDLFzV
         BIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701095874; x=1701700674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quXdQRz24dunOIxV0+tgT+GyOLZAZyd0m5jC6YhycjQ=;
        b=ty4c9vUcvikZJarQVXIOKB0w/JM7glYk0c++lxCd9G7XW3zvRqDnWuLsD9vYuhK/dK
         x0t9ahLyrHR8CtW6aCW+0YPNNBb05WwPMp8UG6uRLsn/alU9RbQAfrOEF+bgalyFm5SL
         OnvHtGCwv5EZ1xNpQGWoxkxP+khRCgR1onMdMvW8wlHvDjMnWCdVaguJCXME1XEhtkJp
         8jRI4wmwKPFkRyBi1oPlUCIR+DKb/7l0nGDsc/7ulcBrVWqJlRu8IjgBvgkZGlRnS6oZ
         MruNahp8HxlHe29sOM3DnMeKpEc/bQbG09PPViGM5/p5892qJrT1eK0H+fc08bqI5ABn
         2Crw==
X-Gm-Message-State: AOJu0Yye1SqrfNeIx2mPTFznBi0RTTf6oCfNtAPuP11JvpgeTn22s+p5
	sY/SliWZkpUKunnolpYrXDmSC/EwPzPPb8PJgn2yf+CW
X-Google-Smtp-Source: AGHT+IHewFr/vlMQW7L5sxpSRozYczCn5dayhTtoKdl9tRgfwgomxtx2sbQE3XZNhmbjrj38VbC5+5ePzLX1YCwnkPY=
X-Received: by 2002:a17:907:3daa:b0:9a2:225a:8d01 with SMTP id
 he42-20020a1709073daa00b009a2225a8d01mr9983857ejc.7.1701095874278; Mon, 27
 Nov 2023 06:37:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <o-hu9PCGr9R5LPS2ZnqssxnR22SBfwuDa0xuSsPwr3op3vBs1lbSsyH7RZMxkw7Ro2EuEzXbekDPrbiFoJ_R2_TzDlQ1g5zDaCogEU2w0sI=@protonmail.com>
In-Reply-To: <o-hu9PCGr9R5LPS2ZnqssxnR22SBfwuDa0xuSsPwr3op3vBs1lbSsyH7RZMxkw7Ro2EuEzXbekDPrbiFoJ_R2_TzDlQ1g5zDaCogEU2w0sI=@protonmail.com>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Mon, 27 Nov 2023 06:37:42 -0800
Message-ID: <CAEc3jaBpdY0J8hwJ6FMBOi5JH3Z-pEPxP38RYD0Y74+9=cfUOw@mail.gmail.com>
Subject: Re: Wrong inputs on DualSense Edge Wireless Controller
To: Alexander Koskovich <AKoskovich@protonmail.com>
Cc: "roderick.colenbrander@sony.com" <roderick.colenbrander@sony.com>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

Sorry for the late reply, but I have been out for a few days. I'm not
aware of any button/axis mapping change between Edge and regular
DualSense. The HID reports stayed the same.

I just did a quick check on my laptop also on Fedora 38 / kernel 6.5
and the mapping seems to be fine. In evtest, triangle reports
BTN_NORTH, square BTN_WEST, etcetera.

The sticks, triggers and buttons seem to be fine as well. How are you
testing this?

Thanks,
Roderick

On Wed, Nov 22, 2023 at 4:18=E2=80=AFPM Alexander Koskovich
<AKoskovich@protonmail.com> wrote:
>
> [Resending email due to lack HTML message rejected]
>
> Hello,
>
> I am currently on Fedora 39 (6.5.12-300.fc39.x86_64) and I am noticing th=
at the inputs for this controller are wrong primarily on the right side of =
the controller.
>
> playstation 0005:054C:0DF2.000C: hidraw11: BLUETOOTH HID v1.00 Gamepad [D=
ualSense Edge Wireless Controller] on 10:3d:1c:fd:30:bc
> playstation 0005:054C:0DF2.000C: Registered DualSense controller hw_versi=
on=3D0x01000208 fw_version=3D0x01000036
>
> This is the current mapping that I'm seeing with the hid_playstation modu=
le loaded:
> "X" is actually "Square"
> "Square" is "Triangle"
> "Triangle" is "Circle"
> "Circle" is "X"
>
> Also the right joystick seems to be controlling "R2" instead of the right=
 joystick. "L2" and "R2" triggers control the joystick instead. It's overal=
l very weird. Has there been any similar reports to this?
>

