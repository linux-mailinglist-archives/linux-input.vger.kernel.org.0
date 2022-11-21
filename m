Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8B36631990
	for <lists+linux-input@lfdr.de>; Mon, 21 Nov 2022 06:42:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbiKUFmK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Nov 2022 00:42:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiKUFmH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Nov 2022 00:42:07 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DE191145E
        for <linux-input@vger.kernel.org>; Sun, 20 Nov 2022 21:42:06 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id g10so9612695plo.11
        for <linux-input@vger.kernel.org>; Sun, 20 Nov 2022 21:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZGvG+W/40zPsPbCCeJjKB2j+plitC/P5Yq0/drbFvEE=;
        b=QWrKSIQ2b3y7RnEJNexlfDV3/d0Tn1isJkoJkMS87Gny5eeFX07XzYkkyKVpQp5vso
         eOML69fFfVOIc+Nr5h1CU3G7fOYL+SsUyILykZHtLjLl27v6ZLFtrtbLTVp39akhdprn
         YbKvvXaLKOUY4xped7+nH5WhJDqoNbj2xW1k5F74bPwGgTGw9cVsAS/4lwHEoCrmQ3RX
         XMM5jGa+AAOTdGsQxJLrjeoOWQbyjTwXXIkNJM8xjUWjCUomAz0/cq+nDz3xhrbbwycF
         VFAU5Dg79yC/8PGBb2RehdvHlUpdLCGO9uS27M7CIUopxmVVrjm2S0qczjzCbyx1TpFN
         HCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZGvG+W/40zPsPbCCeJjKB2j+plitC/P5Yq0/drbFvEE=;
        b=ZiRJlG6RBRHLVLoiT8GeS0URNUm1Bfj2mfvKVwrkHl4h3Wfq/F/QTuWi1KCGX+yKC8
         YIzyfWKn88pFSmFn1BT2AGnTuHZ69YmeT6U5kmHRlODQjJlz1X5VmYyy1pjK/yYIRFp8
         iBHGJNBL3dj1tkciwC1w/b0Zy+mBbm7Zu/ovQYSF3rcZ9KtUPdaXCjRIOyrI09TRzkOu
         gofccZim6WsBuO9EAIL5E/mKYDt4WF4ooldPmxpa9KFV9V6/FYbOtreeqGgU4F35kVWm
         2cWiryQx3i/Y3tTVI2p+a9ug+QOXYueB1Vt+/ZXE2ilPij7IW2rJpOPzwvWcUemImQhN
         qlIQ==
X-Gm-Message-State: ANoB5pk1acVOWTbL3cC3iu6DPNbcAFTFz4wcgNK1D+wVaFlEbxPDo1cg
        oLjip1AHNhSFMAQ2nGMN3aNQ0YbEssy7RQ==
X-Google-Smtp-Source: AA0mqf4UZB2xM/ve3vUjerWckTf9MrJakDUWN3dPKZp2dxwL1ERUhfaFdsuF5tiJA5NMJ7B3GvXuQA==
X-Received: by 2002:a17:902:ab46:b0:186:8502:cde5 with SMTP id ij6-20020a170902ab4600b001868502cde5mr10481747plb.121.1669009326029;
        Sun, 20 Nov 2022 21:42:06 -0800 (PST)
Received: from [10.1.1.173] ([220.244.252.98])
        by smtp.gmail.com with ESMTPSA id b1-20020a62a101000000b0056cc538baf0sm7638571pff.114.2022.11.20.21.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Nov 2022 21:42:05 -0800 (PST)
Message-ID: <1cba8dde-cf86-9e44-296b-aefaf0a8b21b@gmail.com>
Date:   Mon, 21 Nov 2022 16:42:00 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] hid: add info to Kconfig
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org
References: <20221120033456.4332-1-albert.zhou.50@gmail.com>
 <Y3p2czhlHeg5Rf/l@nixie71>
Content-Language: en-AU
From:   Albert Zhou <albert.zhou.50@gmail.com>
Autocrypt: addr=albert.zhou.50@gmail.com; keydata=
 xjMEYkX5gxYJKwYBBAHaRw8BAQdAsW8QQjKnmpKC5G1d1QFYNvd9ddMxwYZs+xTT0dyqvtbN
 JkFsYmVydCBaaG91IDxhbGJlcnQuemhvdS41MEBnbWFpbC5jb20+wosEExYIADMWIQRLx2w8
 czp1EBJaieEhj+NExaaGfQUCYkX5gwIbAwULCQgHAgYVCAkKCwIFFgIDAQAACgkQIY/jRMWm
 hn2rKAEAlOVVAsYIpmGTEng+e/HHT7JJjCjcX4lh+pFZdUy2DGgBAM/EwKNYoNB43H5EJpb8
 I68MS+ZZSQ3swJWAu1OJKXIJzjgEYkX5gxIKKwYBBAGXVQEFAQEHQNk/Nf/E1Uttgm29quUB
 Xgc9RDwqKTHbtHLS5SOkZzhUAwEIB8J4BBgWCAAgFiEES8dsPHM6dRASWonhIY/jRMWmhn0F
 AmJF+YMCGwwACgkQIY/jRMWmhn0KRwD7Bv1kWYB2m8c5tRQUg7i3zIaJ4kpfqMj4bwYQ9xEk
 e3oA/11CMCzdPMcoveB279og31mtUISG5mXMDJmiE4y61akN
In-Reply-To: <Y3p2czhlHeg5Rf/l@nixie71>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FjbuYMu0gqiCMZ9GdkfYxnFs"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FjbuYMu0gqiCMZ9GdkfYxnFs
Content-Type: multipart/mixed; boundary="------------7cCVyPHWvChcNonosbhqx5QP";
 protected-headers="v1"
From: Albert Zhou <albert.zhou.50@gmail.com>
To: Jeff LaBundy <jeff@labundy.com>
Cc: jikos@kernel.org, benjamin.tissoires@redhat.com,
 linux-input@vger.kernel.org
Message-ID: <1cba8dde-cf86-9e44-296b-aefaf0a8b21b@gmail.com>
Subject: Re: [PATCH] hid: add info to Kconfig
References: <20221120033456.4332-1-albert.zhou.50@gmail.com>
 <Y3p2czhlHeg5Rf/l@nixie71>
In-Reply-To: <Y3p2czhlHeg5Rf/l@nixie71>

--------------7cCVyPHWvChcNonosbhqx5QP
Content-Type: multipart/mixed; boundary="------------0qrqpEtvxpPGr0LYmk0lONrv"

--------------0qrqpEtvxpPGr0LYmk0lONrv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEvMTEvMjIgMDU6NDgsIEplZmYgTGFCdW5keSB3cm90ZToNCj4gVGhpcyBpcyBqdXN0
IG15IG9waW5pb24sIGJ1dCB0aGUgaW50ZW50IGlzIHRvIGRlc2NyaWJlIHdoYXQNCj4gdGhl
IGZlYXR1cmUgZG9lcywgbm90IG1ha2UgY2xhaW1zIGFib3V0IHdoYXQgcHJvZHVjdHMgbWln
aHQNCj4gaGFwcGVuIHRvIHVzZSBpdCBhcyBvZiB0b2RheS4NCj4gDQo+IEZ1cnRoZXJtb3Jl
LCAibmV3ZXIiIGlzIHJlbGF0aXZlLiBUaGlzIHN0YXRlbWVudCB3b24ndCBoYXZlDQo+IHRo
ZSBzYW1lIG1lYW5pbmcgeWVhcnMgZnJvbSBub3cuIEkgdGhpbmsgdGhlIGRlc2NyaXB0aW9u
IGlzDQo+IGZpbmUgYXMtaXMuDQoNCkhpIEplZmYsDQoNCkN1cnJlbnRseSB0aGUgbG9uZyBs
aXN0IG9mIHN1cHBvcnRlZCBwcm9kdWN0cyBjb25zaXN0cyBhbG1vc3QNCmV4Y2x1c2l2ZWx5
IG9mIHRvdWNoc2NyZWVuIGRldmljZXMsIGdpdmluZyB0aGUgZmFsc2UgaW1wcmVzc2lvbiBp
dCdzIG5vdA0KcmVsZXZhbnQgZm9yIGxhcHRvcCB0b3VjaHBhZHMuDQoNCkFjdHVhbGx5IEkg
dHVybmVkIHRoaXMgb2ZmIGJlY2F1c2UgSSB0aG91Z2h0IEkgd291bGRuJ3QgbmVlZCBpdCwg
YnV0DQpsYXRlciBJIGRpc2NvdmVyZWQgaXQncyB1c2VkIGZvciBteSB0b3VjaHBhZCwgd2hp
Y2ggaXMgd2h5IEkgdGhvdWdodCBpdA0KbWlnaHQgYmUgdXNlZnVsIHRvIGFkZCB0aGlzIHRv
IHRoZSBoZWxwIG1lc3NhZ2UuDQoNCiBGcm9tIEFsYmVydCBaaG91DQo=
--------------0qrqpEtvxpPGr0LYmk0lONrv
Content-Type: application/pgp-keys; name="OpenPGP_0x218FE344C5A6867D.asc"
Content-Disposition: attachment; filename="OpenPGP_0x218FE344C5A6867D.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEYkX5gxYJKwYBBAHaRw8BAQdAsW8QQjKnmpKC5G1d1QFYNvd9ddMxwYZs+xTT
0dyqvtbNJkFsYmVydCBaaG91IDxhbGJlcnQuemhvdS41MEBnbWFpbC5jb20+wosE
ExYIADMWIQRLx2w8czp1EBJaieEhj+NExaaGfQUCYkX5gwIbAwULCQgHAgYVCAkK
CwIFFgIDAQAACgkQIY/jRMWmhn2rKAEAlOVVAsYIpmGTEng+e/HHT7JJjCjcX4lh
+pFZdUy2DGgBAM/EwKNYoNB43H5EJpb8I68MS+ZZSQ3swJWAu1OJKXIJzjgEYkX5
gxIKKwYBBAGXVQEFAQEHQNk/Nf/E1Uttgm29quUBXgc9RDwqKTHbtHLS5SOkZzhU
AwEIB8J4BBgWCAAgFiEES8dsPHM6dRASWonhIY/jRMWmhn0FAmJF+YMCGwwACgkQ
IY/jRMWmhn0KRwD7Bv1kWYB2m8c5tRQUg7i3zIaJ4kpfqMj4bwYQ9xEke3oA/11C
MCzdPMcoveB279og31mtUISG5mXMDJmiE4y61akN
=3D+2qf
-----END PGP PUBLIC KEY BLOCK-----

--------------0qrqpEtvxpPGr0LYmk0lONrv--

--------------7cCVyPHWvChcNonosbhqx5QP--

--------------FjbuYMu0gqiCMZ9GdkfYxnFs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRLx2w8czp1EBJaieEhj+NExaaGfQUCY3sPqAUDAAAAAAAKCRAhj+NExaaGfZX8
AP4qdNFONX8U/r39kMsgAl7xJYAjYs2NI38SfJ7d0rH7NwEAvAlzE/327FWLFgEifddLGuIJbBA/
EqdXhadRMLGAPg8=
=hLSi
-----END PGP SIGNATURE-----

--------------FjbuYMu0gqiCMZ9GdkfYxnFs--
