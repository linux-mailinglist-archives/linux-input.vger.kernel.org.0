Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2C883321BE
	for <lists+linux-input@lfdr.de>; Tue,  9 Mar 2021 10:14:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbhCIJOC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Mar 2021 04:14:02 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:64466 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbhCIJNi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 Mar 2021 04:13:38 -0500
Date:   Tue, 09 Mar 2021 09:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1615281217;
        bh=sNTnDSqUeDhRH8xUYxr2RpNhvOAHOylXr5XSQarV8oI=;
        h=Date:To:From:Reply-To:Subject:From;
        b=uRnh/tYIBTHnfwV9BSuuCRj4RY310qTHwj8v7g8C7kmOJ+7uTxAIKI3FJcyKdvfj6
         tt9iiScNkibgAdOlM2kULTEkMC5pjwz4q1G/iCZH028PM+IMsEYMr1Wdo5ZrldDfRm
         +vkwPVIYGbACkQNZu1THImGz4EiRFWISa67tKUbk=
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
From:   flostriker <flostriker@protonmail.com>
Reply-To: flostriker <flostriker@protonmail.com>
Subject: Possible kernel bug touchpad X1E gen 2
Message-ID: <EiWZbhVISDvzXhUId048zSb_Uz5PQjydjqHZDVDAEyFkY3C31zDsxWdccxkLlkixNloF5m3Lu-0Dd391gy_jVBoHgKqwt-cEFK330ux_wJs=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

L.S.

After upgrading to kernel 5.10 on my Lenovo x1 extreme gen 2, I started hav=
ing touchpad issues. At the time I submitted a bug report that I have linke=
d below. I saw the following patch when looking at github:=C2=A0Input: syna=
ptics - enable InterTouch for ThinkPad P1/X1E gen 2.
I then emailed Jason Donenfeld to ask his advice on where I should go with =
my bug. He recommended that I send an email to this mailing list. He also a=
dvised me to attach my dmesg output, so I have also added that to my bug re=
port.

Thank you for reading my email and looking into this.
Yours sincerely,
Flo Striker

Bug report:=C2=A0https://bugzilla.kernel.org/show_bug.cgi?id=3D211661
