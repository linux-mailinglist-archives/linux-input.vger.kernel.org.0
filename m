Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16D5F1090C7
	for <lists+linux-input@lfdr.de>; Mon, 25 Nov 2019 16:11:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728247AbfKYPLi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Nov 2019 10:11:38 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27492 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727758AbfKYPLh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Nov 2019 10:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574694696;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=B8aq+4dXm9sTBa7CCt2OVKoRFspOMELtHpVefAUQASU=;
        b=XQzSwAVGZK+slxbbpYWKJbABz+Fl9rqx5WEWAx+wt/JtRWlebj3acnckMAk+Eb7qqncjtx
        zoI8Jefb9VbvUnq76NN4Di8W8BFA2+zTPvPyh6NiLOl+swv4K/VOLuohFV+PwtZMN86zf+
        rUsKRJxQebCjK3wj+HG9/TlPgLN8ZTE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-aTT-cyfMOzuZD-QaKie4Gg-1; Mon, 25 Nov 2019 10:11:35 -0500
Received: by mail-qk1-f198.google.com with SMTP id a129so9749156qkg.22
        for <linux-input@vger.kernel.org>; Mon, 25 Nov 2019 07:11:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SRvrk26Tw+YwS7iqlsr/BOs6fc+cs/57lcBe2woWPLA=;
        b=bGGrLqlFO5b+7O/biEGr4iVooCGZq3DAJGOdL8JgHeP3XF1ivasInCNQr9HONlHPad
         ct3RZqJXWt2jBVQDxoia1mItH+9kb8x/N7wCRyR4uioGLe3TKzZwY2qKuQclM3WCCDc+
         8x28tCVvtDRuxCWGpEPq1Ahujwq50yINrIzMezkadyeKRz9RIvMNFpTFMVwZSUPd7XKI
         SZlHY8D8/eT975Q6VDunroOS2SA+QpeYi6Ig19wJn80ZziHBd10Z7eCyT1fW+RvuF/rw
         dDz52P4nqXrNJzf3WzpMTa9+rfYyiHrQn5vWibzUXkd09Zakzs2jDeQTVQSUuTaCqtmH
         TOmg==
X-Gm-Message-State: APjAAAW4TNFI4S1gO7XjMd9NB4TNYIrD8x30yIuTSkoI7AKW92aLPyEE
        Gqv3g4lwBVxNFhb2uO4pEenUIHELEDOFQIfomWOLZ0lNGEO5ptqxRuSzWlTF1v4bFcIBH/9EyzR
        MqO5knnUy5Bi0xEqh5ReVu1iDCcGkUhBOqn83gbQ=
X-Received: by 2002:ac8:35ac:: with SMTP id k41mr10694196qtb.345.1574694694962;
        Mon, 25 Nov 2019 07:11:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqwwPbijPHkJf3lYg1Hh/+67Ez1Uid4YWzNyZ/Ykn4lB0wgAxoRj1JnbGOvXIYJUvTi4BNJ1NfDfylHT3OtPPqU=
X-Received: by 2002:ac8:35ac:: with SMTP id k41mr10694172qtb.345.1574694694776;
 Mon, 25 Nov 2019 07:11:34 -0800 (PST)
MIME-Version: 1.0
References: <CAO-hwJL_P92-PvyDO2gEPovAQ3vmoH4jpQd-9w5G2ug1UPjc7A@mail.gmail.com>
 <0000000000007c225e05982ab601@google.com>
In-Reply-To: <0000000000007c225e05982ab601@google.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 25 Nov 2019 16:11:23 +0100
Message-ID: <CAO-hwJLO_yoBbROW6fHGc8QAXdPLXKroQd1EfVaEq=x6qyDy=A@mail.gmail.com>
Subject: Re: KMSAN: uninit-value in lg4ff_set_autocenter_default
To:     syzbot <syzbot+1234691fec1b8ceba8b1@syzkaller.appspotmail.com>
Cc:     glider@google.com, Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
X-MC-Unique: aTT-cyfMOzuZD-QaKie4Gg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

#syz fix: HID: Fix assumption that devices have inputs

Looks like d9d4b1e46d9543a82c23f6df03f4ad697dab361b was the proper fix

Cheers,
Benjamin

On Mon, Nov 25, 2019 at 1:15 PM syzbot
<syzbot+1234691fec1b8ceba8b1@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot has tested the proposed patch and the reproducer did not trigger
> crash:
>
> Reported-and-tested-by:
> syzbot+1234691fec1b8ceba8b1@syzkaller.appspotmail.com
>
> Tested on:
>
> commit:         4a1d41e3 net: kasan: kmsan: support CONFIG_GENERIC_CSUM o=
n..
> git tree:       https://github.com/google/kmsan.git master
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3Da8247e2b2298a=
f08
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D1234691fec1b8ce=
ba8b1
> compiler:       clang version 9.0.0 (/home/glider/llvm/clang
> 80fee25776c2fb61e74c1ecb1a523375c2500b69)
>
> Note: testing is done by a robot and is best-effort only.
>

