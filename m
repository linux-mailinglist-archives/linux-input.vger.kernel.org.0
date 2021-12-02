Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4BDF46689F
	for <lists+linux-input@lfdr.de>; Thu,  2 Dec 2021 17:48:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359694AbhLBQwO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Dec 2021 11:52:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33170 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1359444AbhLBQwO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 2 Dec 2021 11:52:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638463730;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1q1RzJ+2t0CHGLzbZhstdiq3rb2yHdihH6eKJNd/eIc=;
        b=guRuN1Yz2VMshMWvHTCpFhjMgGmq0d7/aQckN2GBKjqHUtwOY+138Y2rYd5UvuVotNPRz9
        18G7YsB1OvsdMmgdoPnH2LN5YykUo8nVpdYQ4jPVgbWimkKgOPngZCnVveBy5DKGMEfKwW
        GjC0AK4HI7hDoEJVIcObD/yu8+ha3Fw=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-Q5C2ScI6PY6Zt5L1x7DoOQ-1; Thu, 02 Dec 2021 11:48:47 -0500
X-MC-Unique: Q5C2ScI6PY6Zt5L1x7DoOQ-1
Received: by mail-pl1-f199.google.com with SMTP id i3-20020a170902c94300b0014287dc7dcbso71244pla.16
        for <linux-input@vger.kernel.org>; Thu, 02 Dec 2021 08:48:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1q1RzJ+2t0CHGLzbZhstdiq3rb2yHdihH6eKJNd/eIc=;
        b=UEBmDU9IaG3/qYl7z7KcGmvfvol1VGCbOy1DSNNRRmm9mATEv/ojeMeugPp6vCBH84
         NpRmmQ3GpmjpbYNI3G1oEVRa4fCZf7CnZRJmBHAB9qGg2UeYOgS/0nyB9oLX0i3srJS/
         XxcqbG3w3Wb3Va5zrYmpe4jgiOkSzaY6RccZk/4Jl4ROZ4pjW6nNSiG2sb+JU+1fhqgI
         mWuncKbNWGaZ7ANlhp3aEqzqqMXsgbyuY3gfFux207mRxszyJW6IpvTNgDFWvJWx0c01
         MroUwDb0Q1lgsXAlKfFlSWB/K3uHr/8K/kxRugzHEVgL6O8J8FLPRvEvjOl4qjb4XXrh
         ofUw==
X-Gm-Message-State: AOAM532lfviOqgftgNgful3R1buTpJkwWyWED5G6GyNRwAKrgKLE+QG8
        HAF9jZ0X+VRV/Gdd+MUAehVqZyjEvB+3cknOjptEsGsLgFA5jPHsQHXhOsgHbjtBeaUuxiwc+X6
        Vmo4QUl5L1GALfsNLSYG2JiGuvTUhLKep080icyY=
X-Received: by 2002:a17:90b:224f:: with SMTP id hk15mr7254308pjb.173.1638463726620;
        Thu, 02 Dec 2021 08:48:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxihkDeddhgXH3xtiHhnyw1kUwlg/OjbbEA+77GtMBGAFVas/jDWzBFYJsI719V12l/7vWviDpGdt1TXgQoSsk=
X-Received: by 2002:a17:90b:224f:: with SMTP id hk15mr7254279pjb.173.1638463726357;
 Thu, 02 Dec 2021 08:48:46 -0800 (PST)
MIME-Version: 1.0
References: <20211202095334.14399-1-benjamin.tissoires@redhat.com> <YaiypPqBRtHDjmMs@kroah.com>
In-Reply-To: <YaiypPqBRtHDjmMs@kroah.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 2 Dec 2021 17:48:35 +0100
Message-ID: <CAO-hwJKOnC3EXQAH8w5gcmQijFs-=TXac2-ZgTx6zMBbrt=X4A@mail.gmail.com>
Subject: Re: [PATCH 0/4] HID: followup of uhid crashes, and couple of core
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 2, 2021 at 12:49 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Dec 02, 2021 at 10:53:30AM +0100, Benjamin Tissoires wrote:
> > Hi,
> >
> > this is a followup of Greg's series[0].
> > hid-sony is having a wrong error path leading to unreleased
> > hidraw nodes, and bigbenff is having a crash when used with
> > a wrong report descriptor in uhid.
> >
> > Those 2 first patches should IMO go into 5.16.
> >
> > The 2 others are some core changes I had locally stacked and
> > which should be ready to go now. They can be scheduled for 5.16
> > or 5.17, there is no rush for them.
> >
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>

Patches 1 and 2 are applied to hid.git branch for-5.16/upstream-fixes
Patches 3 and 4 are applied to hid.git branch for-5.17/core

Cheers,
Benjamin

