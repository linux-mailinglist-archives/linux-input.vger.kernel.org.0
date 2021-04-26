Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69AD136B61F
	for <lists+linux-input@lfdr.de>; Mon, 26 Apr 2021 17:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233934AbhDZPs5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Apr 2021 11:48:57 -0400
Received: from mx09lb.world4you.com ([81.19.149.119]:58334 "EHLO
        mx09lb.world4you.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233923AbhDZPs5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Apr 2021 11:48:57 -0400
X-Greylist: delayed 1968 seconds by postgrey-1.27 at vger.kernel.org; Mon, 26 Apr 2021 11:48:57 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=liwjatan.at
        ; s=dkim11; h=Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:
        Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=SON6YoPhjtmaLQ5SRMrXtCvpMVodOho+LdoDnpVnZM4=; b=fCmJU4GJRGylD4BTbJV21mh2i0
        VoX9TABfowGbufBlHDSx9jSVDGpMsM56kB1nkt+Dzz/XVvcvmDG7LZM1Uw+ilB0TDrGSIhEttcFHx
        p3xInqMBnfiWXOSYkZnRmPXRAdF2PZGfNmQYKl5Fo3C6uUOSUDJOlYKCAcbTJ3uEwKmU=;
Received: from [62.163.171.130] (helo=titania.liwjatan.org)
        by mx09lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <HMWiesinger@liwjatan.at>)
        id 1lb2xK-0003Ep-PS
        for linux-input@vger.kernel.org; Mon, 26 Apr 2021 17:15:26 +0200
From:   Heinz Wiesinger <HMWiesinger@liwjatan.at>
To:     linux-input@vger.kernel.org
Subject: Lenovo Thinkpad T14 Gen 2 touchpad support
Date:   Mon, 26 Apr 2021 17:15:00 +0200
Message-ID: <4611864.OV4Wx5bFTl@titania.liwjatan.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart24938804.1r3eYUQgxm"; micalg="pgp-sha256"; protocol="application/pgp-signature"
X-AV-Do-Run: Yes
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--nextPart24938804.1r3eYUQgxm
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Heinz Wiesinger <HMWiesinger@liwjatan.at>
To: linux-input@vger.kernel.org
Subject: Lenovo Thinkpad T14 Gen 2 touchpad support
Date: Mon, 26 Apr 2021 17:15:00 +0200
Message-ID: <4611864.OV4Wx5bFTl@titania.liwjatan.org>

Hi!

I have a Lenovo T14 Gen 2 which isn't yet whitelisted for the synaptics RMI 
driver it seems (as of 5.11.16):

psmouse serio1: synaptics: queried max coordinates: x [..5678], y [..4694]
psmouse serio1: synaptics: queried min coordinates: x [1266..], y [1162..]
psmouse serio1: synaptics: Your touchpad (PNP: LEN2072 PNP0f13) says it can 
support a different bus. If i2c-hid and hid-rmi are not used, you might want to 
try setting psmouse.synaptics_intertouch to 1 and report this to linux-
input@vger.kernel.org.
psmouse serio1: synaptics: Touchpad model: 1, fw: 10.32, id: 0x1e2a1, caps: 
0xf01ea3/0x940300/0x12e800/0x500000, board id: 3471, fw id: 3324237
psmouse serio1: synaptics: serio: Synaptics pass-through port at isa0060/
serio1/input0
input: SynPS/2 Synaptics TouchPad as /devices/platform/i8042/serio1/input/
input6

Works fine with psmouse.synaptics_intertouch=1:

psmouse serio1: synaptics: queried max coordinates: x [..5678], y [..4694]
psmouse serio1: synaptics: queried min coordinates: x [1266..], y [1162..]
psmouse serio1: synaptics: Trying to set up SMBus access
rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer: Synaptics, product: 
TM3471-030, fw id: 3324237
input: Synaptics TM3471-030 as /devices/rmi4-00/input/input10

Grs,
Heinz
--nextPart24938804.1r3eYUQgxm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABEIAB0WIQQRpqSSOxrcqQ33x62nXtwz5SpGygUCYIbY9AAKCRCnXtwz5SpG
ylk/AP9SvSa+wFQhrw1jp2ioznlWz5YEglV9oveKna2wfVPMxwD9EVGL0coDBkTf
SvdfYj+OErI1UbRJO6vi7yQm53SrYfg=
=qR5a
-----END PGP SIGNATURE-----

--nextPart24938804.1r3eYUQgxm--



