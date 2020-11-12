Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3F432B00D4
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 09:04:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725966AbgKLIEc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 03:04:32 -0500
Received: from mout.gmx.net ([212.227.15.18]:41657 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725898AbgKLIEa (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 03:04:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1605168264;
        bh=gwhiVaxOEIeukBVgU+3WoDcm8giOfCiMV4D3MYQS5Zs=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=U740AVZtq2ABWskhx40zYT5ZXcmMYxYVH1OTdcazEzxZnsp0wyjQdLYvgunJnFUtg
         fgvEylOexdhUKU0IfMCxgT0w2v2wfeElCx86QO9dVQUeLneZCs1LRDFNhr8kL2C2IX
         jCwC2nVxGxBpYjAEAo8C7XstgrB4yUgFjuUDFblg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.55] ([95.91.192.147]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MrhQ6-1jyGTc14uS-00ngxn; Thu, 12
 Nov 2020 09:04:24 +0100
Subject: Re: [PATCH] Input: ads7846 - fix unaligned access on 7845
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Anatolij Gustschin <agust@denx.de>, linux-kernel@vger.kernel.org,
        Oleksij Rempel <o.rempel@pengutronix.de>
References: <20201112012742.GA3608551@dtor-ws>
From:   Oleksij Rempel <linux@rempel-privat.de>
Message-ID: <de67681c-b392-198c-f73e-4c9073d8f1e3@rempel-privat.de>
Date:   Thu, 12 Nov 2020 09:04:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201112012742.GA3608551@dtor-ws>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PiPo1pUv5Ey0Jy+o7aMWxpBMWlvIOOe9bwB4Gyk8pFi0DZGjx2z
 hbnzFN5u/CTCiETc7vZqgmjK6MqK6QG0ZrD9YImfUgQUNbpLB70vq0sxs5+/CfANhrW+eu5
 MgMnw9UfgpP8zvHD3Zs+GPm56/PeiwAzEjZF2Qs+o515oezykNAS2ISrggt1bXk/MxMCPw4
 Liy/QzjugR6+219590CDQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eUiVD8qYYUk=:LXcFSEaKaNX1fdc98Dxqif
 7yfU9RavMaTUJoW53wDj5eC/GmPhuvuCjPE+xwbeadwrVL3sswT2+Mpl9+8C4zQAMQEuvnZ7U
 y/kdmsixoOIhBBKBOPbh0XTxSel6TwtEw4LwQoWL+kmeWd8mG7NhZqNed3lTRf9UU0DQCeCBf
 NbzTh+OCmM2NjTgOH72CVva/iYf+Dm0gdQhsGWgGSD9lkvjfwADjW1kws8wW5YSkGARC3lt5s
 Dpl7UABjA2CWLvd7C9QwzwlKXKTvTGO6gM229AvHYQmzCn2Wb6vCDB9zzJpqy8BaW/vtrWlH8
 3DuCi+WYyNbhRxCj29QC8J+nINYIntv5JpXVyVUHFyAte7Lq4ZF94WPPOq3zpdqPK4mZEzZBG
 Naa7p/r8Z/cc9K8vIewrOVeINiTVBCg0wSNfG/buBlKsKnyp+PPWk+BXOtZkp/ctlznDg/m/r
 6g/hcSdSBvO66konq6b6bMNsbKmIsbaNSoxekjw9Y0inrczQVhFh6k0E5litW6iRRnK1ZNbxB
 IQxLSjenSZ4bGSd10dcWNKi0cJuJkOwomEhgFk0VPyLFfnwQ+TCDkqNWFJ26YeC2/hiVpYuZ2
 /SxQo9zyUZCtmy+R3lu7euZpuq0a5weHt1LorxJAsp0dCWbsT7mfzr65xyRJKS1HeI+CCvhCp
 fPaeOqbw00afx6ih9PF6ZopSIC/lhES4Fardrw4Co96Lp1dhcbrfO72TtHHPWze0RCqFwTpbD
 eFJkt2QLG8/FTjA4m9RM+mCBhoK9aS+Mny8YX/g2BX5rDRo0mpvnIgszC8NlSAG5Q6e1ydbRQ
 hmXNhSQacbAjGPQE3aBoVr2bVnZPXSBOsg0RYTy66mE8eUqMYFEldcSFCIHKsta1g7KjPwV1B
 UrRzel5lAAcfkmXj3ITg==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dmitry,

Am 12.11.20 um 02:27 schrieb Dmitry Torokhov:
> req->sample[1] is not naturally aligned at word boundary, and therefore
> we should use get_unaligned_be16() when accessing it.
>
> Fixes: 3eac5c7e44f3 ("Input: ads7846 - extend the driver for ads7845 con=
troller support")
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

I do not have ads7845, but i  assume i need to resend my patch with the sa=
me fix. Correct?

> ---
>
> Not tested on hardware, so if somebody has the controller and can verify
> that would be great.
>
>
>  drivers/input/touchscreen/ads7846.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchsc=
reen/ads7846.c
> index 95e89f675ad5..35d14bc44aff 100644
> --- a/drivers/input/touchscreen/ads7846.c
> +++ b/drivers/input/touchscreen/ads7846.c
> @@ -33,6 +33,7 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/module.h>
>  #include <asm/irq.h>
> +#include <asm/unaligned.h>
>
>  /*
>   * This code has been heavily tested on a Nokia 770, and lightly
> @@ -443,7 +444,7 @@ static int ads7845_read12_ser(struct device *dev, un=
signed command)
>
>  	if (status =3D=3D 0) {
>  		/* BE12 value, then padding */
> -		status =3D be16_to_cpu(*((u16 *)&req->sample[1]));
> +		status =3D get_unaligned_be16(&req->sample[1]);
>  		status =3D status >> 3;
>  		status &=3D 0x0fff;
>  	}
>


=2D-
Regards,
Oleksij
