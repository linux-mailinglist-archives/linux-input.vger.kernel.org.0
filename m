Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEEE32E298E
	for <lists+linux-input@lfdr.de>; Fri, 25 Dec 2020 04:34:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729120AbgLYDcf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Dec 2020 22:32:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729068AbgLYDcf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Dec 2020 22:32:35 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF17C061573
        for <linux-input@vger.kernel.org>; Thu, 24 Dec 2020 19:31:54 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id p5so3991226oif.7
        for <linux-input@vger.kernel.org>; Thu, 24 Dec 2020 19:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessos.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SynC+MR8CgDKalU0PqVPlvAW41eDQ0IYZhE8MVMG+6A=;
        b=C4ucTqhZbNSxGG4pXfkjOF1OKGgUaE4jm4v04RR8flrl2XwT8OHxErk1wmj9cduea5
         bc0nfBLapzJMUtfvUVw5wz4a9IKCMp/SXjNgcng7WRFobjNRTNhyHJjgP2Ab25oG1Ipy
         TEPvYn+GXpTq60P8AirVVtNemSw8zkn4hEJUGXj+rpby0JJCRUlU0QIBhWsAli9C0jz8
         sIWbyi+tFXcEUmUPFEdRjCXRi/lzOXWundJG3Xn1flKOHoAqESUzPgX1lHLjFZjOrdZr
         s4cPrdeE3eEQTS21dQBYKuGonL+05g3QffdwT5Snbkeh2PDxsKCtB5XukPC3gOG0MwYs
         raiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SynC+MR8CgDKalU0PqVPlvAW41eDQ0IYZhE8MVMG+6A=;
        b=pCUkCz2/ckmLRyEnQ3m5TMmJzRPesWKQpjgACMFCU+DLq+fR+smHuFoiHbposCDka+
         fuFnjv4cbfDn66aTmpVW/8QfO/uwkaQNdKv5z59G/9IioQqBDmBumXzU81CCtrFmFvbP
         0OHTDT0VBElddnzGAlFfJTtcaacVCabTxkQzouX9ShSBANVILX1rA8SZ641ZuDaE3cjY
         GsY4WrST5z6n9AFkHO6NOKNbTqVQnbZgiE547z+VeiGUB1sNAXCJz/JbeWIHBjFwXW7Y
         qC+fa/A0m208ce26DVlBCXOMd8fsBetN0pyiMMmwggFW7sSLmEmN9s9LXhiDvw9o1gQJ
         mQGA==
X-Gm-Message-State: AOAM530/cpUuvtHnOltQD8k5U+ORjgVMU2MuexB4jx1R/QtTBDuev68V
        EAAOOUlvg4sET6BJ2IUQth57MnDMH7vQ7LBLAw2Dh3h+X9921w==
X-Google-Smtp-Source: ABdhPJzJcj7xm1z3ruy0Gd9JulgRjo/2UJivCDGUYznyLmi1uktx0/HJCGLbLzK9SB6N0Za9j9PbNV/O/pgvhgSe5W4=
X-Received: by 2002:aca:909:: with SMTP id 9mr4413296oij.69.1608867114054;
 Thu, 24 Dec 2020 19:31:54 -0800 (PST)
MIME-Version: 1.0
References: <20201222073855.98490-1-jhp@endlessos.org> <20201224190602.GB22388@amd>
In-Reply-To: <20201224190602.GB22388@amd>
From:   Jian-Hong Pan <jhp@endlessos.org>
Date:   Fri, 25 Dec 2020 11:31:06 +0800
Message-ID: <CAPpJ_efqBY0_f2AVbMETXkXSWWCQz2ZD6Yx8ciyO4GBEiHyeYQ@mail.gmail.com>
Subject: Re: [PATCH] HID: Add Wireless Radio Control feature for Chicony devices
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        linux@endlessos.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Pavel Machek <pavel@ucw.cz> =E6=96=BC 2020=E5=B9=B412=E6=9C=8825=E6=97=A5 =
=E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=883:06=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue 2020-12-22 15:38:56, Jian-Hong Pan wrote:
> > Some Chicony's keyboards support airplane mode hotkey (Fn+F2) with
> > "Wireless Radio Control" feature. For example, the wireless keyboard
> > [04f2:1236] shipped with ASUS all-in-one desktop.
> >
> > After consulting Chicony for this hotkey, learned the device will send
> > with 0x11 as the report ID and 0x1 as the value when the key is pressed
> > down.
>
> Fun, how can airplane mode work on _wireless_ keyboard? :-).

Hmm! It is a funny point for this USB wireless keyboard!
But I guess this kind of combination (with the "desktop") will not be
used on an airplane :)

Jian-Hong Pan
