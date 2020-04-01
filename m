Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E90E019B6B1
	for <lists+linux-input@lfdr.de>; Wed,  1 Apr 2020 22:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732645AbgDAUCR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Apr 2020 16:02:17 -0400
Received: from mail-ed1-f41.google.com ([209.85.208.41]:42436 "EHLO
        mail-ed1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732385AbgDAUCQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Apr 2020 16:02:16 -0400
Received: by mail-ed1-f41.google.com with SMTP id cw6so1373927edb.9
        for <linux-input@vger.kernel.org>; Wed, 01 Apr 2020 13:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=UqVyLLgMQRMs9enXGFret4ueRSlufny8UHXXj/P9X8U=;
        b=tp4k8dikLJ8iugO0ZZS9qpHNxfZOpM+z2/9zFlhiX2efJ/OYFTmQr1tFyqGUxFjhHe
         CFrwovW9lE47A25UhL01mQTS/2ppa0kdu2qM6jmCklR30ntptTvAnpaMf/Pqbk3kQx3b
         WHkNpO8RXZgWtHdnw0PqsoLH3kdWuy8oaXEZCoIpGjWAWYIDn24deNWLEbYJWRb1uO3x
         IhpFJpztF5Zru387fTnENRpz2IpjVHQq7WCe1nLXKcvyNoJGNyhzEvoQQoldkRphajT2
         ShMZomyRwX+wgV8fZ3twl3ekIXgztNAt49GX9Hp5pGUni84Fbo3oObm6GACm0tRoG2gq
         Gq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=UqVyLLgMQRMs9enXGFret4ueRSlufny8UHXXj/P9X8U=;
        b=QagDJ5uSV3QxA6IoyMeY2SkGvryWStIrAFwM62k9J3BTXBQF3GveWwHB9D0G2lVoHa
         Lq7K7AtMsUZ6vYELdLt8cvRhE/JrQDLABtuuElc3gLA4dsd2f0u8yYpQcKXKMEUivqZp
         4H+FMsuOfxf5IXWjXiBY9AGSIUMXXz+NrLFYxKtBlsu8nINY06DUCpyrpNGE3mnb9OV6
         ecfPq9EUFTsb9hy5eDvfz9c6YuJ0y2u06tThTCXghNF81+QmUh3OpuM0YAT8xQ1GkOXS
         ndZUAMQEdLlVSuKhIRlsLIuMxhzaD0L5EuaVcoiD8xacl5cVZILLZlLozgCW3jsBrAnO
         z6iw==
X-Gm-Message-State: ANhLgQ3VoDDm/b6u93EO/mpHjAgNJim2bG8zcAoy0JKptR/6QQaxQDYJ
        N5+e31o13DT67Rtl+iIfk9zqc6KvgkErSklDnRTWERm2hPleHQ==
X-Google-Smtp-Source: ADFU+vvRYNvDiY+MwBgsyiIFqy+Nxei3x6IJcMaCzRi/WqlttarOWtZrnoRfDBXDGmQhaw7NajCkCNtcz+mCUo2JF1U=
X-Received: by 2002:a50:cfc6:: with SMTP id i6mr22517640edk.314.1585771335063;
 Wed, 01 Apr 2020 13:02:15 -0700 (PDT)
MIME-Version: 1.0
From:   Siarhei Vishniakou <svv@google.com>
Date:   Wed, 1 Apr 2020 13:02:03 -0700
Message-ID: <CAKF84v2gWnokoyhRe_feiWJcYOAPUcWwjaX93GkqmXqm8OzmYg@mail.gmail.com>
Subject: behaviour change for keyboards introduced by "HID: generic: create
 one input report per application type"
To:     Garfield Tan <xutan@google.com>,
        linux-input <linux-input@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jkosina@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello linux-input,

We have noticed a recent behavior change introduced by the commit:
https://github.com/torvalds/linux/commit/f07b3c1da92db108662f99417a212fc1ed=
dc44d1
HID: generic: create one input report per application type.

We have been looking into the behaviour of the Microsoft Designer
keyboard. Prior to these patches, the keyboard would report as a
single input_device to the user space. After these patches, the
keyboard is now split into 2 input devices: =E2=80=9CDesigner Keyboard
Consumer Control=E2=80=9D and =E2=80=9C"Designer Keyboard Keyboard". We not=
iced that
this behavior also applies to the keyboard Dell KB216. In the Dell
case, it is split into 3 devices, which include =E2=80=9CConsumer Control=
=E2=80=9D
(for some of the media keys) and =E2=80=9CSystem Control=E2=80=9D (for the =
sleep
button).

In both Microsoft and Dell cases, these are pretty standard keyboards,
although they do contain media keys and power/sleep keys.

Could you please confirm that this new behaviour is indeed
intentional, and that you wanted keyboards to be split in this
fashion?

Thanks,
Siarhei
