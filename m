Return-Path: <linux-input+bounces-719-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A79AD80EDF1
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 14:46:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 636CD281266
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 13:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE3886ABAD;
	Tue, 12 Dec 2023 13:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ixahxs+d"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64CB710A
	for <linux-input@vger.kernel.org>; Tue, 12 Dec 2023 05:46:00 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a1db6816177so710010266b.0
        for <linux-input@vger.kernel.org>; Tue, 12 Dec 2023 05:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702388759; x=1702993559; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CR6YV6JXDxeQ/rjFiHQEN+mV93eZyCa8/ozpNXx5zdY=;
        b=Ixahxs+dTdQgT7cfaPrk8AB/dgQtuFqnWGJ/zVC7UhP1Pjdzk3mJOAuZqPw0pKGFtt
         FGC+KkChacxpn5dYWEghV16lm0Yy0mGQb4op8gr82awrlc+m08QUkesQJnNuQG3HHxYX
         grTmUrEWnr+MiAksFlTF+FcQrnRTxQRYhFacNQAOklxQxTG5/z5V/LCroM7uJf7JJ1o2
         ANM186mP0CflfZqtipRTaR/gE/HvYuTbKZru90zDCTOekaNVylf+tOpkD++MKPPMXp80
         1hJdzBm21adU01oIoFvKJsfE/dVbytKFCMcPlc4DGXk/BoGfvM8xpNM3ypoyABIfv/Vf
         egng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702388759; x=1702993559;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CR6YV6JXDxeQ/rjFiHQEN+mV93eZyCa8/ozpNXx5zdY=;
        b=WQNM/c1yDCeCB5xctHQQbGjfKY5eD5s0CqqaDnrzum/ukF6CN57CjGRFrF3kcxiZJj
         sc5/0mUqXlUd4ROK8dfeX+Yhxm1YVHyAU4vZ5ObmZV/62+bznTE7Ln9SjiW51P2BUwFW
         IQf/Zl2yYRP3f/MBPBZSL9bnlt+iBPiWMPC3/p6FpKnFIWi/oySrBEngUW8+ErMzvuiX
         K7R/JldOiP+miCju7ZlSYYXqS32RkVka1fDGtSn6AluwqIk7bJMFOU90u+YmFywUkt3y
         cOD3Mw8+ArC94lK2CwP6c5HFNX2blxOJ2jbVf+3sPIt5lm/3jTrSj01x98zoEhhYDG3l
         cEdg==
X-Gm-Message-State: AOJu0YwbxGAp0KGwrZwT6kRdxOS9NrebiABrmt2BrIlDW/Kl0xbNhQce
	Xi8huaiCkjYqjC/N2lbysQ0UOw==
X-Google-Smtp-Source: AGHT+IEFJ0vnmpojl9CH/qLn1bqqWTrJGuBttmFsV3UbQqrH8Yvp4fVhwqOcrCY3a28renNMA5BdMQ==
X-Received: by 2002:a17:907:e86:b0:a19:9b79:8b49 with SMTP id ho6-20020a1709070e8600b00a199b798b49mr2555735ejc.90.1702388758799;
        Tue, 12 Dec 2023 05:45:58 -0800 (PST)
Received: from localhost ([193.86.92.180])
        by smtp.gmail.com with ESMTPSA id tj10-20020a170907c24a00b00a1db7b77675sm6381621ejc.90.2023.12.12.05.45.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Dec 2023 05:45:57 -0800 (PST)
From: Jiri Kosina <jkosina@suse.com>
X-Google-Original-From: Jiri Kosina <jikos@kernel.org>
Date: Tue, 12 Dec 2023 14:45:58 +0100 (CET)
To: Mikhail Khvainitski <me@khvoinitsky.org>
cc: benjamin.tissoires@redhat.com, iam@valdikss.org.ru, jekhor@gmail.com, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: lenovo: Restrict detection of patched firmware only
 to USB cptkbd
In-Reply-To: <20231212133148.1000761-1-me@khvoinitsky.org>
Message-ID: <nycvar.YFH.7.76.2312121445510.24250@cbobk.fhfr.pm>
References: <CAMMabwM2jLvMHvOS151P3M7mQ9mGyAMsMcTS-HoWpeUW_GEFEg@mail.gmail.com> <20231212133148.1000761-1-me@khvoinitsky.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Dec 2023, Mikhail Khvainitski wrote:

> Commit 46a0a2c96f0f ("HID: lenovo: Detect quirk-free fw on cptkbd and
> stop applying workaround") introduced a regression for ThinkPad
> TrackPoint Keyboard II which has similar quirks to cptkbd (so it uses
> the same workarounds) but slightly different so that there are
> false-positives during detecting well-behaving firmware. This commit
> restricts detecting well-behaving firmware to the only model which
> known to have one and have stable enough quirks to not cause
> false-positives.
> 
> Fixes: 46a0a2c96f0f ("HID: lenovo: Detect quirk-free fw on cptkbd and stop applying workaround")
> Link: https://lore.kernel.org/linux-input/ZXRiiPsBKNasioqH@jekhomev/
> Link: https://bbs.archlinux.org/viewtopic.php?pid=2135468#p2135468
> Signed-off-by: Mikhail Khvainitski <me@khvoinitsky.org>
> Tested-by: Yauhen Kharuzhy <jekhor@gmail.com>
> ---
>  drivers/hid/hid-lenovo.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
> index 7c1b33be9d13..149a3c74346b 100644
> --- a/drivers/hid/hid-lenovo.c
> +++ b/drivers/hid/hid-lenovo.c
> @@ -692,7 +692,8 @@ static int lenovo_event_cptkbd(struct hid_device *hdev,
>  		 * so set middlebutton_state to 3
>  		 * to never apply workaround anymore
>  		 */
> -		if (cptkbd_data->middlebutton_state == 1 &&
> +		if (hdev->product == USB_DEVICE_ID_LENOVO_CUSBKBD &&
> +				cptkbd_data->middlebutton_state == 1 &&
>  				usage->type == EV_REL &&
>  				(usage->code == REL_X || usage->code == REL_Y)) {
>  			cptkbd_data->middlebutton_state = 3;

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


