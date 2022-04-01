Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 606E64EF80D
	for <lists+linux-input@lfdr.de>; Fri,  1 Apr 2022 18:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235894AbiDAQiw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 1 Apr 2022 12:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350072AbiDAQh6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 1 Apr 2022 12:37:58 -0400
X-Greylist: delayed 406 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 01 Apr 2022 09:15:28 PDT
Received: from mail.archlinux.org (mail.archlinux.org [95.216.189.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B064EDFD74
        for <linux-input@vger.kernel.org>; Fri,  1 Apr 2022 09:15:28 -0700 (PDT)
Received: from [IPv6:2001:8a0:f24a:dd00:f991:27cb:4afd:8a41] (unknown [IPv6:2001:8a0:f24a:dd00:f991:27cb:4afd:8a41])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.archlinux.org (Postfix) with ESMTPSA id 20B84E8DEB0;
        Fri,  1 Apr 2022 16:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-rsa; t=1648829307;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=GBYsoaBoWFPAVx/gvKxFpq/fWgJt+5n0dyx9b6qC8a4=;
        b=H8qz0TpG2csxsYDLfLIoGTNTGaVMcg/TrubpNVV9LQkKTfxW/4hDCDpK2dgOniURbJn6B7
        QAMOkLbQS+3TPTaCntyIEEe3AbdEtRRS/qjWuVtPFP9ZvG7xXPtjpP3nD335T9xTDhUTkk
        sto0+foWKAW5qtSXWDiIuDIRHGHzGX0yRynSzoBXj1FoFR3Wh7opW4yZ+h8m0J1PKeoG8S
        4jegzZB3yJ2PZgT3SABiyJqIlxPfN37EqJy6tYeaFq8mWURsXDnZos+DeyTkpcwfWh9syU
        CE1SaCPIRObBGedqEYE8fGwZVMnSso+gw9+3EHXglBiNCpjV+wAHxaM/9khbQO5cnvKC1r
        lfLPYRHDwRwtoEGnzumjeo5EHe2VVTOrD1SAJZhx2xD43GkBjn1Ul7FemYXLrULqkJgK/f
        zcaXhdUVNkC0TcbpwmFYk2yjpiAzw8puYhNXuBeMBKQVFTqYm8HxS483fOg0gE90BtfkTC
        FblIqPkBG0mRMq5A2N51qx1tnxeqZAFai4P+LyEfh5XmzVmezOGxG07Dm4xJj78TYf0yLn
        w142saKAHdVPLUQfp0i9OvCn26kWEqMRI4B29uRfnTunz+WIdjURUx7wVMRTa8epnL8Rui
        pNCPjNBppgRus+dB74O/ZvoILHDX327fNIxL01OhER/zaSra03Q9k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-ed25519; t=1648829307;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=GBYsoaBoWFPAVx/gvKxFpq/fWgJt+5n0dyx9b6qC8a4=;
        b=1wJm2OK9RFFvpPwrC97q3oeoQ3d7ULHZk0RQvHGrJvL4hp9P+vSl1DYCr+rC44xKgBRnAJ
        IkdLZ0JHLnZIGLCA==
Message-ID: <a2ccd37e20b210a1a35188c949d5658314a22c86.camel@archlinux.org>
Subject: Re: Battery indication for Logitech devices
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Marcos Alano <marcoshalano@gmail.com>,
        HID CORE LAYER <linux-input@vger.kernel.org>
Cc:     Nestor Lopez Casado <nlopezcasad@logitech.com>
In-Reply-To: <CAO3Us=nJbw6haHuCg6ZTwamggRFfKuTncg2r9XwDxjv0-ocZtw@mail.gmail.com>
References: <CAO3Us=nJbw6haHuCg6ZTwamggRFfKuTncg2r9XwDxjv0-ocZtw@mail.gmail.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-eb3joOeiyFDAKqShC1me"
Date:   Fri, 01 Apr 2022 17:08:04 +0100
MIME-Version: 1.0
User-Agent: Evolution 3.42.4 
Authentication-Results: mail.archlinux.org;
        auth=pass smtp.auth=ffy00 smtp.mailfrom=lains@archlinux.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-eb3joOeiyFDAKqShC1me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2022-04-01 at 06:44 -0300, Marcos Alano wrote:
> Hello fellow developers!
>=20
> We are having a discussion about a question and I think we can get
> help here. The discussion is
> https://gitlab.freedesktop.org/upower/upower/-/issues/166#note_1322354
> The problem is when we use a Logitech device, we get two discrepant
> information about battery level, one from Bluetooth stack and another
> one from HID++ module.
> The question here is: what is the most precise information, so we can
> deduplicate but keep the indicator precise?
>=20
> Thank you.
>=20

Hi Marcos,

I think the battery reported by the HID++ driver should be more accurate in
certain devices.

CCing Nestor as he may be able to clarify this further.

Cheers,
Filipe La=C3=ADns

--=-eb3joOeiyFDAKqShC1me
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAmJHI2MACgkQ+JPGdIFq
qV1QCA//f6p/Fv39ZsVOLlYWW0gJk7yC08lcdFIqJvph1uxOXFDo34BdhNovjRVl
25rEoBEI3IUmVZX5wkGWb1frWwZEbmAoTuMvdn+rzCR+MnHOaQUfSiwCkpC5Yh39
ulvhQmjVpnj76cWuza8hkhgHMmvzywpUK1RYoKL1GLjJcasWyr8LK/t5urVOP266
/D8/3Zs21PnYijXPOxWQUx6mGaO0bRWlw30NvLVb//oS8oSlybw8fdT3jjvNreJ0
JC/lFCjmlL+W19g8jzrgoLI1WlN3hFBaVTTwGXe09izq7TjTU1HGe5gORHV75pg7
e3WvInAufihrnFHGlWrL0Mk/y7y+O1sM8TeRMtiz80B3RUX/zMSd0TAyPcIsFBgq
NaOHFiOamw9ZemwMTZDYgjaBB5bFZU2uA6E1eNhaN92ol52s6UX8R98Ns3eVudw2
neI/yvNB/uGIqicAIJlRvpIjPqhvvhKZ+97sx4ahLLn2v66d0aVUEJgd9CASaVwQ
RFBz6Em7gvTogpHJ66bXEjKKNC/sbLPt31b8iiSlw03QUWduC/1I/I7QeTjrX6S5
OiyIGQuuJXoWaz6omg2c/cMeBUmFhDvVa5QbX4pS+SzJ2zI+oG/oyXWENpD2TEaf
hgo4PhTLkQKHrw553rYFaUyO9CCZs6iRMJ2AccNw5mAe5isrLjw=
=TYEO
-----END PGP SIGNATURE-----

--=-eb3joOeiyFDAKqShC1me--
