Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE842FE747
	for <lists+linux-input@lfdr.de>; Thu, 21 Jan 2021 11:16:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727900AbhAUKOu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jan 2021 05:14:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728814AbhAUKOk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jan 2021 05:14:40 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B6EBC061757
        for <linux-input@vger.kernel.org>; Thu, 21 Jan 2021 02:13:55 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id d14so1061778qkc.13
        for <linux-input@vger.kernel.org>; Thu, 21 Jan 2021 02:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=6wqsQE7fwIc4TSBX6UnnGBA1lojbGUyBNZxIV/YDZlk=;
        b=Wj+ItNm1z+UTdxUspyrKqlNVUhYY9mOyYHxu9ASO/orixeM6jfhtHYPxHBxYwTS0L4
         ze4IH+qtoHUZ9X1yNSXPpaBAGlSHOSsPclAW2tjDClXibqs+v6T0AtSlj5Lnp3kleOks
         n0c/Z6zD7rHKywMtPqSi8fvwzfVR0py80tj8+gELcAJPmjyiasHzfn1Ec74cOjZTCq+0
         MeSEc+/3BKQGPBPIMWCiJQNGxwZFnRLpaIuOCBhXqnsYObrb/mSHmeNtVep02aZXIEUW
         gEuZM0DlCgKrv+SWVVhzz8Em1gh8zPpNQeKbHRmS0Ugt34U+tS3Ev2817hD5oYKLMHdd
         3ggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=6wqsQE7fwIc4TSBX6UnnGBA1lojbGUyBNZxIV/YDZlk=;
        b=OhRJ9wMJaeT1GE1ytCyQyTwpU/ZNmEgeIWalwih9AiJHZf12SQD09wbl3vyj44if1r
         hA/9e50Co8mjCcgOx+WcPFjzys8MYxdfj8SJDgTjQTjT4DfEAXtVVag+8yoPRURjMQql
         PNyg9RwCnEPwmo52ztYlvpBI1zmqV3++X/zypQdwNU8P7c3fBjR/FNgbDDnvtvH/ehZH
         Cv1/E4uOIocVk7meuFB3McyRaiSwhKn4RNRYGzfpzhaT2BeYK54/J5uBOuVQIHB0n1YQ
         cITuLIxc4I1f2h2artfmI9qtos36gtk+VpiPkvAXHba32HFO0nrw8HGFU1Eh/SAN2k7b
         jjLg==
X-Gm-Message-State: AOAM532bfbUTTsofpwq/878oHF0hr2L/gKfCBgG38ZsF35FuftNt5eZm
        DcCo3Hl1js0vBp7KpUJocwHKDvpT7OXif2ZephDqRWNhxFla
X-Google-Smtp-Source: ABdhPJzPiWsx++OpKtGwD+Lnwao7sdg+b/rLqhQyphn3271UYZHefBcyx3Bmtd51dP0QK9+6BJv7CzZETZMzmYWCDkw=
X-Received: by 2002:a05:620a:51:: with SMTP id t17mr13326199qkt.414.1611224034389;
 Thu, 21 Jan 2021 02:13:54 -0800 (PST)
MIME-Version: 1.0
From:   =?UTF-8?B?TWljaGHFgiBLb3BlxIc=?= <mkopec12@gmail.com>
Date:   Thu, 21 Jan 2021 11:13:43 +0100
Message-ID: <CAMWMcgD8-R3cuRkgSRsAzx1_Ukh-iWNqmMW9z-Aw4Z2O8gxB2w@mail.gmail.com>
Subject: "psmouse.synaptics_intertouch=1" fails on Lenovo T14 AMD
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

I found the following messages in dmesg on my Lenovo Thinkpad T14 AMD
and I'm following the suggestion to report them here:

[    1.664239] psmouse serio1: synaptics: queried max coordinates: x
[..5678], y [..4694]
[    1.703482] psmouse serio1: synaptics: queried min coordinates: x
[1266..], y [1162..]
[    1.703492] psmouse serio1: synaptics: Your touchpad (PNP: LEN2064
PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi
are not used, you might want to try setting
psmouse.synaptics_intertouch to 1 and report this to
linux-input@vger.kernel.org.
[    1.770075] psmouse serio1: synaptics: Touchpad model: 1, fw:
10.32, id: 0x1e2a1, caps: 0xf014a3/0x940300/0x12e800/0x500000, board
id: 3471, fw id: 2909640
[    1.770092] psmouse serio1: synaptics: serio: Synaptics
pass-through port at isa0060/serio1/input0
[    1.812535] input: SynPS/2 Synaptics TouchPad as
/devices/platform/i8042/serio1/input/input6

However, booting with "psmouse.synaptics_intertouch=3D1"  results in the
following messages:

[    1.701068] psmouse serio1: synaptics: queried max coordinates: x
[..5678], y [..4694]
[    1.741218] psmouse serio1: synaptics: queried min coordinates: x
[1266..], y [1162..]
[    1.741222] psmouse serio1: synaptics: Trying to set up SMBus access
[    1.744456] psmouse serio1: synaptics: SMbus companion is not ready yet
[    1.820409] psmouse serio1: synaptics: Touchpad model: 1, fw:
10.32, id: 0x1e2a1, caps: 0xf014a3/0x940300/0x12e800/0x500000, board
id: 3471, fw id: 2909640
[    1.820416] psmouse serio1: synaptics: serio: Synaptics
pass-through port at isa0060/serio1/input0
[    1.872540] input: SynPS/2 Synaptics TouchPad as
/devices/platform/i8042/serio1/input/input6

after which the touchpad works in exactly the same way as when booted
without the parameter.

My kernel is compiled with HID_I2C and HID_RMI enabled. Am I missing
some configuration here or is this expected behavior?
Please let me know if there's any additional relevant information I can pro=
vide.

Thanks and best regards,
Micha=C5=82 Kope=C4=87
