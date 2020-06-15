Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAD441F9D02
	for <lists+linux-input@lfdr.de>; Mon, 15 Jun 2020 18:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730135AbgFOQSs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Jun 2020 12:18:48 -0400
Received: from mout.web.de ([217.72.192.78]:33635 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729949AbgFOQSr (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Jun 2020 12:18:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1592237917;
        bh=BBSWKa1BT4odTyFowADUxBXtGZDSq9RZr94SarqThJU=;
        h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
        b=m/39FMsP8Msj4ar+AMgsGdlmZthUWHjaxpX3Aa6qINWWs7LuGYSCftAGuuRcCXDdC
         OYwXqLpPxvbB2tArrrFV4kLNMhB+xAdbWpxU5PzowXiwwhvlx8H9HZNIpzQNeB1r9W
         GCLLm2uzX56Ztb3n9jjrDdvTy2kJqDC4jAPAiAgA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.107.236]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N1d3a-1inQc11lXs-011wMh; Mon, 15
 Jun 2020 18:18:37 +0200
To:     Navid Emamdoost <navid.emamdoost@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
        Stephen McCamant <mccamant@cs.umn.edu>,
        Qiushi Wu <wu000273@umn.edu>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: Re: [PATCH v2] Input: bma150: fix ref count leak in bma150_open
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <3639cbd1-1ddc-2207-b119-b6a45723be04@web.de>
Date:   Mon, 15 Jun 2020 18:18:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VTqywmnqXhh1sFuWcRuMfoHDKipBL+RB+3+uSyworcNC9emE5aP
 EzURLgEhfzfhzG4NhBnAiRkOkPrAjdv3aIucrvzZxOH2X2IFWhfGFXfQELmhPGpxEBDWv/8
 DdEajUU3xxPzmRvJUbFStF5kRD20PjP/328646z5CCiebcwuDtf/Gnqf1STuMq/tahCO+hw
 vOdX8WlVtQt8Mb8o/mRnA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9Ptve2kG4dI=:DRAlfciNSwFpgAsznRzTnW
 i6arelAbDfkawyOrllVyB2ol0g59Yk+l748P89l2wO3/pvZauS5a6n9qcBu3u7sU3ocN3uoKp
 EhsedEeLYymje87vz6cXrPAf+LTGllMoFi/w6mlAnlMMexAviWEikKM4SMomVkq7UoDdPC98z
 QMr9kAw2Btz0eTamV2zswYyxMgPXjbmNn1HpxUEAG9HzqW622jJwt/ZGJ9h3MbJhdNukPeuYC
 EkS3G1e/4OvkUH11+0AKbtakwex1tZKIznKlsDKWZlsxAByzFsmMOJ4+lFJYobHa9QtCSl5Ny
 V6Wb6aq3wggqCHejfhnNwjsscoQrb85tOfkkuMdsuNA5F93GpQVkNMLaFo8wL0tKk90B62xTg
 7KdII6ypdG8POCjRCGe3y6y78MR7uRwsi8ddD8d9dn9pQ8BUWcJ/sSnAW4W4vynPYDkBsvimj
 GeXlrM0PxSFdX4l7Bph9uubI//tzoFwv5Tr3yJBAbD9Bo1vFU+t4ymPdkbuRrxSDHHZ2mfvyt
 E6atto23K0XqpnBPR6Jjgdxc9vVnqozgpYY/UWWhsp0aIXY7Yf+mL/4qSVcq0lvaF2RcAekn9
 MU9ufcy2LthrhuTIXslbnXkKXkz4Wu8PLaMkM6EYg//TYbHEOcCDlJ4uNDLIgR/eyJ2KX9qyv
 K/jXOk38n12Oc2GXFcpQb2IqwGsWCDVfdC7/jOfWUsP/L6sCh2y3dFLO7CQOH1NFuL+PJ3JzQ
 H9AgDGJVqdlOokG0I4tAKRMjmXBCgPDRltXNfWKSihN9mOOQsA5sdi1tbPrN2n6PE3OVMy8XG
 L9fO4WwnYYrn4ViziQhW4dos5oSEp742fdyUnPJn2H96ONPAL2llSRFkKs/YjcKbNGMAUN0BG
 6gF9eJ7hSrex5akBERscKJtGgMshS9DzPEh1PpfQTUj0zQts6zvSqXk7vDq6VkM4RIfqy1/oD
 BnZIieqYoGcXeaa2br+haPCrrEWSs8QDt6zmYb+AGX8mPOUOzurFvoFNJMQwQdUwoMazIor3e
 T1hJtbLjEwzmRAnZS/r2m5LegM6Pas5j0W8/JdDDvEeQhLl9ufOjwEG9MHeDEpa/LSSy7WAhk
 LyzEQ/lYmgoTLp0+gVwujRAChhUWox88Dt88GUJjutwcNUpmHtVZAAsAzYsdnrK1fkO1JG3Xg
 yBm88pfjfdrJ8hslc0yDuKzfduPSkX8y6RblF/d/JDN+gPb6hDlB+mgiYn4o4alGfzlgIPHVo
 nNLBTNLplUH3FOfyB
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> in bma150_open, =E2=80=A6

* Can the term =E2=80=9Creference count=E2=80=9D become relevant also for =
this commit message
  besides other possible adjustments?

* Would you like to add the tag =E2=80=9CFixes=E2=80=9D?


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
> +	pm_runtime_put_noidle(&bma150->client->dev);
> +	return error;
>  }
=E2=80=A6

Perhaps use the label =E2=80=9Cput_runtime=E2=80=9D instead?

Regards,
Markus
