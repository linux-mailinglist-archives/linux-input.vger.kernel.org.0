Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80B85357724
	for <lists+linux-input@lfdr.de>; Wed,  7 Apr 2021 23:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234330AbhDGVsM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Apr 2021 17:48:12 -0400
Received: from msg-1.mailo.com ([213.182.54.11]:35406 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234355AbhDGVsL (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 7 Apr 2021 17:48:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1617832078; bh=ZIy8hSp59ll56c4qvqx86LyoTzWGobAhgcqSKpxCnhA=;
        h=X-EA-Auth:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
         References:Content-Type:MIME-Version:Content-Transfer-Encoding;
        b=RxQ0OIpHZCBoSv1bNuM2TPUR2wIyxjZLk9Tdt52C/Of1Kx9j9KE92dnP0tj7fj9Zz
         JJWbRHHmyFTqck3XbXF5fUwg6cXeEWYSe6PIH29wDbaWYbujG1rxGb5PR819ltgWPZ
         Y8Kv2ZZBuKDxs7uWq9Tn5DieaoLqn1IICvECiz7E=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
        via proxy.mailoo.org [213.182.55.207]
        Wed,  7 Apr 2021 23:47:58 +0200 (CEST)
X-EA-Auth: qNlXV06Q65Pry9GERbc3tJje5sYbo8/0f8LxW4cdwtnNQDQ6I2QviKWC73MpDr8+7eED8NDgf3ltgZyRsjBKUkUpcGBc69EIGOMtjUlll90=
Message-ID: <cfba65e2a8cc2cbcee7cf088a53a226788619b04.camel@mailoo.org>
Subject: Re: [PATCH v6 2/2] Input: add MStar MSG2638 touchscreen driver
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 07 Apr 2021 23:47:55 +0200
In-Reply-To: <20210305153815.126937-2-vincent.knecht@mailoo.org>
References: <20210305153815.126937-1-vincent.knecht@mailoo.org>
         <20210305153815.126937-2-vincent.knecht@mailoo.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Le vendredi 05 mars 2021 =C3=A0 16:38 +0100, Vincent Knecht a =C3=A9crit=C2=
=A0:
> Add support for the msg2638 touchscreen IC from MStar.
> Firmware handling, wakeup gestures and other specialties are not supporte=
d.
> This driver reuses zinitix.c structure, while the checksum and irq handle=
r
> functions are based on out-of-tree driver for Alcatel Idol 3 (4.7").
>=20
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
> Changed in v6:
> - minor formatting changes
> - mention wakeup gestures not being supported (yet?) in commit message
> - do not scale coordinates in the driver (Dmitry)
> - multiple suggestions from Linus W.
> =C2=A0 - include linux/gpio/consumer.h instead of linux/gpio.h
> =C2=A0 - rename delay defines to include time unit like _MS and _US
> =C2=A0 - rename `error` variable to `ret`
> =C2=A0 - move enable_irq() call from msg2638_power_on() to msg2638_start(=
)
> =C2=A0 - remove CONFIG_OF #ifdef around of_device_id struct

Hello,

just a little gentle ping: do I need to change anything to get this merged =
?
So far seems to work fine with idol347 port of postmarketOS :-)



