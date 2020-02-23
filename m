Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBB07169725
	for <lists+linux-input@lfdr.de>; Sun, 23 Feb 2020 11:09:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726208AbgBWKJU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 Feb 2020 05:09:20 -0500
Received: from sonic303-20.consmr.mail.ir2.yahoo.com ([77.238.178.201]:39607
        "EHLO sonic303-20.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725980AbgBWKJT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 Feb 2020 05:09:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.no; s=s2048; t=1582452557; bh=3VUX6iHKUKGJOLIe65cU9fDCQTegwATkt7a5/jR1TAg=; h=Date:From:To:Subject:References:From:Subject; b=jBKDB+grS8jAgIUeuugQzV9oI2whoioobLWdnG2l8qidV3y15GIXlQ+p/ewYrwMC4AHfPpntvUluA65wwBD6ykFFAoeGaUqhFDSuYDMDQJX3Lbou9GNGsPjQzoM34ZD4yM0H8ANK/kCjV3+PDYoGMT+wj0jyZH5nC8Q80Ih347d5ic5UCPhJp8P10yfzG8rC3zCJA+WK4bi09SG8khl4on1Z614NqZdTa1Ls8pPArEAXvORp0if5KUQjB3yUv72bl1Jah54rgeblNMkWgJldFk4peLIXjC1MPkusOPFLCpT40EK5/BEIeMoXUqeCjvjHzMVG6rIJyQm6JEa0T8lyGw==
X-YMail-OSG: Hwlmv_oVM1mJDLdleLOmiEXVgfZgE6X7Bavj8uHP0fByNxOunJn2rZyYgpaKWUF
 Vqh9zoEJXpdLRJLhxLNM0xGUSNVVybysfFoYscIOCDCTiHA4dRHxaC_F7WrEZvN2odXSwSQYbSws
 6f9A5Sn7fzNXlmRkMAtTGTa2COo9cYposh5AUllyFFWhZdymbXmXSUVH4Kh692yeJJZjfxXGaPqn
 1_nbi5yyTlDBVsy0JV_ccEqmEexRWvoIKy4WkNpIvQBBUSf1sdag7QRfCss8.hN9MtaSaKnxGrHc
 5oJm07Hnh9lf2rgVF_e7WJ12LcshGJldIDMQqspwZJC3_VbjUiHm7zfpz4qr8QxebGYmJ4kxtMWN
 xPQVX70zvICPRTJugRR9kkKmQ7A6vtm8xwWnGi75JymgcyobXo3gflxqKG.zGMSK4D_1XfW.RCkX
 pjXQQHVls9iBItkVbJloXraLhe3OeVQaY2IVMV_J0YT4whJOoj_o1UX0FpDkzcU5R.e_GPtH9yd8
 58EC_.B0k62u93z4YXb.j9zu1LL.j3eRLc6X_4h3Iof65iOUsVWmjI8jCAw.gR3YRL1v8z4h84MS
 ZZ4VqQrbX.ouoLS9rUz5f0WMcvA4txgwo5TRzxwZKFIuJJU93gTeDibTSYI_w8_TSLs6z7le3ysc
 QxPztP4Bl1k0KS7pNcKt9vn1RQ2IX5WsdyqEIcxZKpWfrpczFTEVxTO8HEV1tO3Ny1u6oKVRtzcn
 CXkr7EZs2Kejlwtzt3aZdtkUdyc4RkBayPGiPL0qwxRPPzq51eAetCTp7nRp4iNRgTnBAlPZ6GA7
 LqGgLutLJTAemlxtyUHXYvVb.UEE3Q6LfdWkQaPh7KBbX_FJv_S_nqyccsbDhfkZdQvIFvHM.bZ6
 ODdKVScf7ehWDFbprZp2rldSH4W6COFDavh27hD67ZP8uJ7PAf1v_rG2GtZLH6roLMQ7_.DvaPQx
 0h8xOdiOyvotGQzJItU6.mDVZ4s2qzn3VQO3BzFmXn9TKuNoQiIQban_ZPv6sDi0SqNSVrDrTy3R
 Uw6alZvFHqKpwD9SkVXP1v38.HVJzgv0r_lJb0Mx0EpDG7ZWykvVu129TXo17EDCJizRQl8ZnSk9
 HjuJ2GOZl0.wGobUn4UNV.d9H4Nb.JzHy5XCX2c2SOJd00Fuv3169am4.62EMadHPoL5tJn4MukM
 YzX1.8ol_Ni8t1T1QEw9wB5NaA1a6VpswQLtuR2J3qNrvJieBiJq2gSOWUEmT7jNHo7nj0EN3RHQ
 byZqkoM8lZwsddBprl2N00nnECMiDXXlmeGLd1RlILvsuYEOf_i5CklCvSEXhd_7rEgGDviohluT
 z8RylYpQumQIFMqGvNKaInmpMGctP
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.ir2.yahoo.com with HTTP; Sun, 23 Feb 2020 10:09:17 +0000
Date:   Sun, 23 Feb 2020 10:09:14 +0000 (UTC)
From:   =?UTF-8?Q?Ole_J=C3=B8rgen_Br=C3=B8nner?= <olejorgenb@yahoo.no>
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Message-ID: <81245543.11565865.1582452554354@mail.yahoo.com>
Subject: psmouse.synaptics_intertouch=1 works for TM3145-006 (thinkpad
 T470s)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <81245543.11565865.1582452554354.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15199 YMailNorrin Mozilla/5.0 (X11; Linux x86_64; rv:72.0) Gecko/20100101 Firefox/72.0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

While debugging poor gesture (swipes etc.) performance for my touchpad I found this message in the boot log:

> smouse serio1: synaptics: Your touchpad (PNP: LEN007a PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi are not used, you might want to try setting psmouse.synaptics_intertouch to 1 and report this to linux-input@vger.kernel.org.

After setting psmouse.synaptics_intertouch=1 and rebooting the following appears:

> kernel: rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer: Synaptics, product: TM3145-006, fw id: 2491763
> kernel: input: Synaptics TM3145-006 as /devices/rmi4-00/input/input17
> kernel: serio: RMI4 PS/2 pass-through port at rmi4-00.fn03

and gestures works much better :)

I have not experienced issues with suspend etc. yet. (tested for a couple weeks)

Output from /proc/bus/input/devices:

I: Bus=001d Vendor=06cb Product=0000 Version=0000
N: Name="Synaptics TM3145-006"
P: Phys=rmi4-00/input0
S: Sysfs=/devices/rmi4-00/input/input17
U: Uniq=
H: Handlers=event9 mouse1 
B: PROP=5
B: EV=b
B: KEY=e520 10000 0 0 0 0
B: ABS=6f3800001000003
