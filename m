Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC401F8800
	for <lists+linux-input@lfdr.de>; Sun, 14 Jun 2020 11:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726919AbgFNJSE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Jun 2020 05:18:04 -0400
Received: from mout.web.de ([212.227.17.12]:49041 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726900AbgFNJSD (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Jun 2020 05:18:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1592126274;
        bh=TISY3EZssvH50ZFWglrAf1p5P4JbXnkonXNkHeVQ62I=;
        h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
        b=IQ5ErSkP+1m9914jxIwQW2l6kf+vKCu3yCmCXIBuTn+MeVaj3Psd6LhMc/ToRHsVp
         bTMSf4mFiEnyr6ZyIVISwDYYGWhPwEumvrqDX+DCYCwmc1ikf+2pJT3HzB6XfAqIzw
         LCp8SkA0I7h/MlZxqr7sUtNinCwmwKgwzY/jtlR0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.103.145]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MyvBA-1iyMQi2WxO-00vsRL; Sun, 14
 Jun 2020 11:17:54 +0200
Cc:     Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
        Stephen McCamant <smccaman@umn.edu>,
        Qiushi Wu <wu000273@umn.edu>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: bma150: fix ref count leak in bma150_open
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To:     Navid Emamdoost <navid.emamdoost@gmail.com>,
        linux-input@vger.kernel.org
Message-ID: <da86c987-5fbc-b20d-549d-6b0910ef8709@web.de>
Date:   Sun, 14 Jun 2020 11:17:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yP5ZB9EZcCfVG3ImcGG/nlzZX+GhjzHZrBh7unHuwa3yxmVo9if
 zpGOUx/few1j/LHzoK+nz+9huv9pAg2DWdexejtAUhlDGc2AwXA7kk0nDiLg9vpwAo4LH3Q
 YQfxXhKVYfRPAIESLSmFJ2zbn5Skr7v1naIEz4hUY5u8WTpR09yvC2qfAVWtCP1LLIYiitB
 nfPn5cni9/tzDKLt08IEg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SwWi2GZC8GE=:R0F2yk9qwhc0/4W4jTeA+7
 +ho7VLtA6UqoMGwU5QwiO5noSPFcNahz1AAXwiyN0p3mpZHodzWF/GeNN4X6WYfVIqmxNAmE9
 mdcY+8n7NcNE/6NMMewcjuWDFeW1Cve+o9vXvjU/DgC0VUsC4CYYOEkBXftiHtxKS2jH5FaPq
 XHXnnd9fwxgEDR7ROA3GRIDeb7vwYjoR32Uq7Z4kDsBvOosxy7jZnU5MM1ni1RGEJAvwxVcjq
 bTnlF0Z5aLeR5Qs826RcVHwXJvDt7uzMXmu8Z0BhQUUijmmVq4Ds8TvuBPrvFTXQ9jna6yqEz
 +fs4npSgHZyOwQdqgO9S8cysuwkbJfnaiodyXOOGHAqs4/4vkt+T7tEMugLD3Qnjza6fXHFnl
 F5Jhu/GT12wLJ8BZKqAX6nCBNLau5izEVd0XHtIWh/HHzR8T59XVHRJVo8IOfPZys+56KuAkC
 pvlCjUP1FyNcbLw0xRAL0tTxela0edBrjwFmiGo2k1D+o7X9iG0bgT3TfZAAi+IktV93MPLcA
 XKpcqu4AhBCvD6UbA2rFMmOYUXO8TpJ658HES2W0cJE/kryBamIdyAvUjHzInbXc319dI3Jsf
 +IFyMV6qK4YTv+1rslC2W+y5501nhBCku6rkNeg+3Z+aIlzN4iMJKNieRgavDjzuWKBsoEcUA
 Nrbb69zxNMcC/OdaJzgXAublY4/dm+Jd0qXU11Tx3T3ztkX/tpQZudqxxVGJ4GuhMlOMk4yhX
 PnUT3jb1SVVkqGd7Qq/WplPBXYCoHk+p8JerNPf1MTPfV/JNm2bJoSG4vNdWTaY9nfX7UYtVL
 o6sq37WYaso3iu62KYh1k837iV5VJHIoE88OeVnkfD/oDifd4NEZISwaUuK1AOf5IUf7BH2NN
 BZtozx2iQJzm/Qms8ZTn++D4VJwM5nqGpoYwkERpDLFFE0MhFrrO9W4Fo+UoSqx85eNCAmJYj
 DQxzA+i1v3DYEeIjpe+bfGnSjVli2UvcxLmN8hoQSc40FmYeIICSrdhV1zvjkAG6YdnDabOpi
 H1d3fwcoHbz+TEhs0BEPqZ5XpZ6FwOCLcLhRWj0gQ0N2S3TPOp5pFydxheIuXV6ExO+tTBYY6
 zPDqshonjIkfyGQUt/tEaEVhSxpsuQVh3HfdNBiApu9XeVfcQwd82cUzNJYX/5slwaF4Pgvhn
 qHs6DCCNOfatZqkM0BFoTC+lj7BOQXflCwTHvjZ1Q+LZFUJG4nYJgw5VCAJxSk6VUKE4uaAGP
 As3Ym1R4yuAn34UtD
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> in bma150_open, =E2=80=A6

* Can the term =E2=80=9Creference count=E2=80=9D become relevant also for =
this commit message
  besides other possible adjustments?

* Will the tag =E2=80=9CFixes=E2=80=9D become helpful?


=E2=80=A6
> +++ b/drivers/input/misc/bma150.c
=E2=80=A6
> @@ -357,10 +357,13 @@  static int bma150_open(struct input_dev *input)
>  	if (bma150->mode !=3D BMA150_MODE_NORMAL) {
>  		error =3D bma150_set_mode(bma150, BMA150_MODE_NORMAL);
>  		if (error)
> -			return error;
> +			goto out;
>  	}
>
>  	return 0;
> +out:
> +	pm_runtime_put(&bma150->client->dev);
> +	return error;
>  }
=E2=80=A6

Perhaps use the label =E2=80=9Cput_runtime=E2=80=9D instead?

Regards,
Markus
