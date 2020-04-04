Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F180519E739
	for <lists+linux-input@lfdr.de>; Sat,  4 Apr 2020 20:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbgDDS53 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Apr 2020 14:57:29 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:46807 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbgDDS53 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Apr 2020 14:57:29 -0400
Received: by mail-qt1-f195.google.com with SMTP id g7so9379479qtj.13
        for <linux-input@vger.kernel.org>; Sat, 04 Apr 2020 11:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=woYSdWQSg1xZ43FjqwNE5209gH0qPcBIZtwNdqgp24w=;
        b=g+BgP+y6EnIvgDbA89SScUXtDefkVCbWVUjBT/WjbfQ/xTnM12PlrfWCKyhL//1Dpq
         /aL+BwyeS3jO358fqU11hub2x7HL4DMYDqTIYjubm7iP8UqUD2ajJnRW3k7ZCPduyqNU
         qBmPHgHun5nslCVI7IpyP6s12JNLf6+9TCQxgbr9E1x6S9nDBUW4JvDTPyN1zjo3u4Cy
         yZCLex/dGx9Au5OuMh/AQ5z5yhXur3Y9ilj1vhrIndYtIUaVHGHAcNeAW9oQBti22TPN
         +MlhoTyLf0kO9sIHyxHut8oZ0BZkEKfQXJa2EMmVjrUlPXOvnBxBYD/zWaL3qUudo7Qr
         /u7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=woYSdWQSg1xZ43FjqwNE5209gH0qPcBIZtwNdqgp24w=;
        b=TGdIoYC40J3F58JSWIVIOZx3pYmGDzxTl7kKdMKvLcxRNSBvEQrttxTTQkvLkecv8r
         fJz0Y2SzecBlGy9gZMz87zEG72YUaJQS/d4xL21f9prZgqBs4SJN37zZwzqto+8TbocR
         QeZNjme9QkoR48kTsvWKLytPbRkgnTzcCEIVVgZ4a3kkdU8yyA8bmbfZO3yDye/2YVUR
         lQPK0LWqI+ZVZ3aO7nIhuNxvsQ4Ez+sMjM3bWu0ACIQ+cMCUjFuNl1AZFd/laPLdq66N
         cno124zMjZlkxl94jCIb++SaV3DYNe43lwzPOEAP6wZE9nh2vNXA4ieJwkRPwPMYaYTM
         36dQ==
X-Gm-Message-State: AGi0PuZ0dN6D08/c/+76nJvR+WyhuNvtvGq1WVQ6NRVGeXJ305nst/nq
        k88JiD5fWKVR/AX4gXypbbTsic9IjwqrQY4KzbB5qtRb/XU=
X-Google-Smtp-Source: APiQypK7eQkPvk1W9YfrlA/lZD9CUWUjK377PNAeZu+RgaqjTfVwRnXdBotqYxdn0n3C0U801SwsJxlgo0so5HtjMKI=
X-Received: by 2002:ac8:749a:: with SMTP id v26mr14520212qtq.182.1586026646709;
 Sat, 04 Apr 2020 11:57:26 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?B?RMSBdmlzIE1vc8SBbnM=?= <davispuh@gmail.com>
Date:   Sat, 4 Apr 2020 19:57:15 +0100
Message-ID: <CAOE4rSwYC3Uzex7cPFGFBeeGp=BhZX9KNe5T7dP8yN5mzHgOVg@mail.gmail.com>
Subject: psmouse.synaptics_intertouch
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

I'm using Lenovo ThinkPad E585 with 5.5.13 kernel and in dmesg I saw

apr 03 23:46:05 localhost kernel: psmouse serio1: synaptics: queried
max coordinates: x [..5676], y [..4690]
apr 03 23:46:05 localhost kernel: psmouse serio1: synaptics: queried
min coordinates: x [1266..], y [1162..]
apr 03 23:46:05 localhost kernel: psmouse serio1: synaptics: Your
touchpad (PNP: LEN2060 PNP0f13) says it can support a different bus.
If i2c-hid and hid-rmi are not used, you might want to try setting
psmouse.synaptics_intertouch to 1 and report this to
linux-input@vger.kernel.org.
apr 03 23:46:05 localhost kernel: psmouse serio1: synaptics: Touchpad
model: 1, fw: 8.16, id: 0x1e2b1, caps:
0xf02aa3/0x940300/0x12e800/0x400000, board id: 3383, fw id: 2731752
apr 03 23:46:05 localhost kernel: psmouse serio1: synaptics: serio:
Synaptics pass-through port at isa0060/serio1/input0
apr 03 23:46:05 localhost kernel: input: SynPS/2 Synaptics TouchPad as
/devices/platform/i8042/serio1/input/input20

So I added psmouse.synaptics_intertouch=3D1 to kernel options and don't
see any change regarding behavior, but that message is gone now.

Also by the way one time I added just "psmouse.synaptics_intertouch"
and that made touchpad not working with message
apr 04 13:59:45 localhost kernel: psmouse: `' invalid for parameter
`synaptics_intertouch'


Best regards,
D=C4=81vis
