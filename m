Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10FA21F8822
	for <lists+linux-input@lfdr.de>; Sun, 14 Jun 2020 11:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbgFNJdv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Jun 2020 05:33:51 -0400
Received: from mout.web.de ([217.72.192.78]:47213 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725265AbgFNJdu (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Jun 2020 05:33:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1592127215;
        bh=OH6G4YIWrOCwofY64qVP1rh+B9uREuwO7Gq1odxhXvk=;
        h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
        b=U0jPXtCFnPBfYEaxAxSelNX6cUFBGAfg1JgzjRH+hLtXlGcuQM74aeVCO9+pRY39P
         ehBvYzx2y/xPXn1CUeBPHTsa7G8z8kMPQr8FmbkWLBCT35D0+ME9h/y6ftcbhBGZSg
         hUBX3wk/NZj/UMpmHzgydOASOy2CUFzuNGQFX+b0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.103.145]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lheij-1j6NMk1fs1-00mreL; Sun, 14
 Jun 2020 11:33:35 +0200
Cc:     Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
        Stephen McCamant <smccaman@umn.edu>,
        Qiushi Wu <wu000273@umn.edu>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: stmfts: fix ref count leak in stmfts_input_open
From:   Markus Elfring <Markus.Elfring@web.de>
To:     Navid Emamdoost <navid.emamdoost@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <5b0147ab-f0bc-7380-6300-90e555534cb4@web.de>
Date:   Sun, 14 Jun 2020 11:33:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DAZlzO03MgQlRK84nwjKrl/6g/AAmCSSCTEfMQsrm11BvRkezO6
 AAp/YNWWVfr/8oNvMrLeS0iPKc0KALrvx1d2OqnM4t6VmmFhKuZS6cI5TH4rFcYhCIt4iUh
 LaGHHZ8iBDaMNS+uSR3t1hccjgf9MlOLVSWStBNsqD0sAtpSflZ9ZxQXW0MHNR1sjx2fkhI
 rIzmOSggGdZucVB3e/cMg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:urm8Ip8SAso=:E+BuA/MAZEHBAY2r3bwDk9
 ZbuYMm9lEN394lqdI6gELN7PULiRQi5r/lD89cpYkzwD38RNDmk6uD/RuiJPppQtOGaW+hMck
 gNJc7LVY7/xssUiowl2O4ol0xzZ2B3JPH0SZuyOFBZMKY1IbiFGhOoTaoFpgw2+vXh2ULtdtB
 SeIffR7BQKFcdeupwKW72dRAunGMXYjUlT+Dy7CbMyy0q1gEn/go7AJauM/rh5fbNbCAUR2a6
 yNMtttOvUW+aD8fNiwTQrjaZabZktVBWcv4GBVtd/1lh6Oo6gW3/EF3wxUejpfkKXhAZ2rqND
 XBUn0Jvarl2ZL79+eHDnT+KiSXx3m5R7yw8dvafVZUiHcZwYVfYaL54RRXmr6MDleLD3mMKTG
 g9ZYcfZs/m6NK3dTWO7xDXsTJ2NWPxoH0cw+VpFo8vU9Md/RTb53s/1RfCF6/TWG9fg9+b6Qe
 QDq3Om4+PvH3UWULDGpgSd+CeVlHn7P2jqmZriuhb4dYQAcTUjHTDx8t+WT9BNLDWS90hDQJO
 AHmSgxG4vB75mRQXC6xSy7JDb57UXzWqkdgECSuwmpdUlNGZJBWBLYTdvvzXH/eGOCZ3kzXa+
 WY5506lRHAM+8f2woeVGedGAXbYyCX9Llzwatheeou6uk9ljvW4Q0/pHX67dRpzZKC4VwqeVr
 aOpBCldA6uRSaTuc7uI6aGVwWabEEZTYQ4FGtgP+jQMFYEsotdGBxiq6iECpG7sEX7DX0UGmp
 PyFNsKjo9/3fc4ORTUFd6SuJsypwwnUWe6WReZpGfB0umEfxUidsv6Qhy5Ff5QMJlyVatXM/L
 T0eYvshWWzYLrNgTZxRobNeG+bi3QQ94v+l+2LlFKe/FkRUFortJ44WMp/zupZH9fE8FQNUZr
 /FGu3qepFbE0FPrD4I/J+2tz6DSBH6ofQ9dGJKLsW/ileyhETwiFoURSOYg1V97nQ+Y3R0GLc
 BBu7agcsVXFA2rqirp8xmQTFmQDI3PovpAUSX3noLlhODEzyBXOc71jSVKFbfUmmu871QyF0/
 /RfB2obzWeXfJnV3MIfq1vU9Fxi4jN+jieHIQ2UOY+t/pj25Noq2tIWHH2fQJdHuHA3sIB+Ou
 ce0hp+e/Re8ljmwDwgaFKX/hWZ9kw2XiFh/6xehqEqAjt1pbEoa2OmelWk9g+Q7EqdLSHNGCM
 VdTeM259cB9kBODF8d6CIFFVpgEsfJgD0iSgBHhNbsbfncS3iGLJ8s+N0Oqk9p370vxRYTM5O
 zRVKM1J+TXRdr6K9L
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> in stmfts_input_open, =E2=80=A6

* Can the term =E2=80=9Creference count=E2=80=9D become relevant also for =
this commit message
  besides other possible adjustments?

* Would you like to add the tag =E2=80=9CFixes=E2=80=9D?


=E2=80=A6
> +++ b/drivers/input/touchscreen/stmfts.c
=E2=80=A6
> @@ -367,6 +367,9 @@  static int stmfts_input_open(struct input_dev *dev)
>  	}
>
>  	return 0;
> +out:
> +	pm_runtime_put(&sdata->client->dev);
> +	return err;
>  }
=E2=80=A6

Perhaps use the label =E2=80=9Cput_runtime=E2=80=9D instead?

Regards,
Markus
