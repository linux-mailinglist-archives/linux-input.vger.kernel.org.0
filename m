Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA8AB2B9E00
	for <lists+linux-input@lfdr.de>; Fri, 20 Nov 2020 00:17:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgKSXPd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 18:15:33 -0500
Received: from mail-02.mail-europe.com ([51.89.119.103]:35210 "EHLO
        mail-02.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726123AbgKSXPd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 18:15:33 -0500
Date:   Thu, 19 Nov 2020 23:15:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnobb.ca;
        s=protonmail; t=1605827729;
        bh=2M/cwX2s8QTP29dEcsVSLHr0DAdErpskw62WjCcD0aQ=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=szCmrb2ddLvisBh6IEOsMBgdwxoS5LvLl5PEaVDKUK6BGfB2Gs+FE17kA5AlovAcC
         BQc4a1yKxAngIqbHQI9o5AOngswSm9Ot6fFnm1erBmgC3ydd3SLAhpNHN8HwzMt5D2
         cXEY/y9XDAN5uTsZfSQV4MYEi97kglz7ELFZ7dkI=
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
From:   Chris Schnobb <chris@schnobb.ca>
Reply-To: Chris Schnobb <chris@schnobb.ca>
Subject: Re: Error on Lenovo P1 Gen 2 touchpad
Message-ID: <uLBLQ4Zd4Pe7BW1TVzZwuUIYReVkCQzt4M7Xkia1DotrwIEWcKYraQHkYE7PFaw-KPweOJxO-C39LLHlegDUtgpPw3TSZIGW9jgYHJ-R-Vc=@schnobb.ca>
In-Reply-To: <SCtSERiaMAU86tbf3Uj3hjHq5D4BD2TSTsEyCWgZ33JrXjJB3o7XJMkhhnwKR8g7WnUsjQWyqXCExpsR1KffafSd3or4G3ZNfuTECNM9PTE=@schnobb.ca>
References: <SCtSERiaMAU86tbf3Uj3hjHq5D4BD2TSTsEyCWgZ33JrXjJB3o7XJMkhhnwKR8g7WnUsjQWyqXCExpsR1KffafSd3or4G3ZNfuTECNM9PTE=@schnobb.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

I get this message on my Lenovo P1 Gen2 thinkpad in dmesg, the touchpad dos=
n't work that great either and the message says to report this.

[=C2=A0=C2=A0=C2=A0 1.914651] psmouse serio1: synaptics: queried max coordi=
nates: x [..5678], y [..4690]
[=C2=A0=C2=A0=C2=A0 1.943609] psmouse serio1: synaptics: queried min coordi=
nates: x [1266..], y [1160..]
[=C2=A0=C2=A0=C2=A0 1.943612] psmouse serio1: synaptics: Your touchpad (PNP=
: LEN0402 PNP0f13) says it can support a different bus. If i2c-hid and hid-=
rmi are not used, you might want to try setting psmouse.synaptics_intertouc=
h to 1 and report this to linux-input@vger.kernel.org.
[=C2=A0=C2=A0=C2=A0 2.000336] psmouse serio1: synaptics: Touchpad model: 1,=
 fw: 10.32, id: 0x1e2a1, caps: 0xf00aa3/0x940300/0x12e800/0x500000, board i=
d: 3512, fw id: 2956703
[=C2=A0=C2=A0=C2=A0 2.000338] psmouse serio1: synaptics: serio: Synaptics p=
ass-through port at isa0060/serio1/input0

Thanks,
Chris Schnobb
