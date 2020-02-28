Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BFE0172D94
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2020 01:44:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730253AbgB1Aoq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Feb 2020 19:44:46 -0500
Received: from hermes.aosc.io ([199.195.250.187]:44592 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730146AbgB1Aoq (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Feb 2020 19:44:46 -0500
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender: icenowy@aosc.io)
        by hermes.aosc.io (Postfix) with ESMTPSA id 9DF2E4B0B3;
        Fri, 28 Feb 2020 00:44:42 +0000 (UTC)
Date:   Fri, 28 Feb 2020 08:44:37 +0800
In-Reply-To: <e7857a3196443ac2a2a997bc9e4799d15168c527.camel@hadess.net>
References: <20200227160802.7043-1-icenowy@aosc.io> <e7857a3196443ac2a2a997bc9e4799d15168c527.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/3] Add support for Goodix GT917S touch controller
To:     Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Ondrej Jirman <megous@megous.com>
CC:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Icenowy Zheng <icenowy@aosc.io>
Message-ID: <5E54F9AB-DC0C-48CD-99BA-62EBE6946495@aosc.io>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
        t=1582850685;
        h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references;
        bh=NAFUq00PW+nua6xf4tYptxv1aZHSpu8B2mMuSueIzaA=;
        b=fOJN5p9RfsVAGICO1NHkkmMIMEHk3JjDILNtVHKCHgXBpmVaIkqniWEqzUPpwMpXDpIUMn
        ep5zbgpBcT8pul0AgxhvmYJHA4NjqA5lRE5zTtoGgpd41BzIDnJVKRFFYQIkN0nZQmP1J8
        /CYooStDI/7HTyYN8YfQxSapVids5RY=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B42=E6=9C=8828=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=881=
:51:54, Bastien Nocera <hadess@hadess=2Enet> =E5=86=99=E5=88=B0:
>On Fri, 2020-02-28 at 00:07 +0800, Icenowy Zheng wrote:
>> This patchset introduces support for Goodix GT917S touch controller=2E
>>=20
>> The major difference with other touch controllers from Goodix is that
>> the ID string is no longer number-only (it contains a 'S'), so an
>> additional patch is introduced for migrating the ID to a string=2E
>>=20
>> Icenowy Zheng (3):
>>   dt-bindings: input: touchscreen: add compatible string for Goodix
>>     GT917S
>>   Input: goodix - use string-based chip ID
>
>I'd put the dt-bindings patch after this change, but I don't think it
>matters much in this case=2E
>
>>   Input: goodix - Add support for Goodix GT917S
>
>I didn't receive that last patch, whether on my address or the linux-
>input@ list=2E

My ISP works poorly recently and it's never sent=2E

I will sent v3 now including it=2E

>
>Cheers

--=20
=E4=BD=BF=E7=94=A8 K-9 Mail =E5=8F=91=E9=80=81=E8=87=AA=E6=88=91=E7=9A=84A=
ndroid=E8=AE=BE=E5=A4=87=E3=80=82
