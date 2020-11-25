Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 088E22C4310
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 16:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730278AbgKYPfV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Nov 2020 10:35:21 -0500
Received: from antispam.etsmtl.ca ([208.72.177.108]:41242 "EHLO
        antispam.etsmtl.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729153AbgKYPfU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Nov 2020 10:35:20 -0500
X-ASG-Debug-ID: 1606316878-1241590d82084a0001-vblZzk
Received: from relais.etsmtl.ca (relais.etsmtl.ca [142.137.1.25]) by antispam.etsmtl.ca with ESMTP id K8FADQDkNtthHKAZ (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 25 Nov 2020 10:08:08 -0500 (EST)
X-Barracuda-Envelope-From: Pascal.Giard@etsmtl.ca
X-Barracuda-Effective-Source-IP: relais.etsmtl.ca[142.137.1.25]
X-Barracuda-Apparent-Source-IP: 142.137.1.25
Content-Type: text/plain; charset="UTF-8"
DKIM-Signature: v=1; a=rsa-sha256; d=etsmtl.ca; s=bbb; c=relaxed/relaxed;
        t=1606316775; h=from:subject:to:date:ad-hoc;
        bh=khtPpAgLM6IxM2PgECfdudGn3b6vWer81Vnekdp2FKM=;
        b=PtYgt3b0Py32zpJbj2h2HegfI+psRRNvErFnEzrI0vyWcNLlwpcl6bYRPSCdqNSM6ngUBLIeINm
        9Ut7OKikyae3EfrMoaVhcVAATUDldOhmSF/Emj9ZFP36zg+od2gb3CITJEtwtezpisXFb2kZeHNA3
        1UDIgRytZGkJxAfob+k=
X-Gm-Message-State: AOAM531zmVnyid5DFtlkSzyWqTTCnK1WRdznmFrDNUsaQr0UCu+xI6u3
        TCvxpr/5wKlcu/IZukKJdnI5+oZwGF88Ha7KSHo=
X-Google-Smtp-Source: ABdhPJxOoO2zxjwUx1ep8qRtUfcUKqAPaPm+rt9vz4IGCeSK36SJozwZ/AynvR0VpOiSxvRsILkXbnXxqdVKhg+5OFI=
X-Received: by 2002:a05:6102:105a:: with SMTP id h26mr1288181vsq.45.1606316775114;
 Wed, 25 Nov 2020 07:06:15 -0800 (PST)
MIME-Version: 1.0
References: <acf595c3-1b0a-4d73-8087-784d89bdec91@email.android.com> <nycvar.YFH.7.76.2011251439500.3441@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2011251439500.3441@cbobk.fhfr.pm>
From:   Pascal Giard <pascal.giard@etsmtl.ca>
Date:   Wed, 25 Nov 2020 10:06:03 -0500
X-Gmail-Original-Message-ID: <CAJNNDm=2mh43JxrLkpPM6Nuag-9d1acyQH=uwJyQzxOy-gO8rA@mail.gmail.com>
Message-ID: <CAJNNDm=2mh43JxrLkpPM6Nuag-9d1acyQH=uwJyQzxOy-gO8rA@mail.gmail.com>
Subject: Re: [PATCH v2] HID: sony: support for ghlive ps3/wii u dongles
To:     Jiri Kosina <jikos@kernel.org>
X-ASG-Orig-Subj: Re: [PATCH v2] HID: sony: support for ghlive ps3/wii u dongles
CC:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Sanjay Govind <sanjay.govind9@gmail.com>
X-Originating-IP: [142.137.250.50]
X-ClientProxiedBy: FacteurB.ad.etsmtl.ca (10.162.28.15) To
 FacteurB.ad.etsmtl.ca (10.162.28.15)
X-Barracuda-Connect: relais.etsmtl.ca[142.137.1.25]
X-Barracuda-Start-Time: 1606316888
X-Barracuda-Encrypted: ECDHE-RSA-AES256-GCM-SHA384
X-Barracuda-URL: https://antispam.etsmtl.ca:8100/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at etsmtl.ca
X-Barracuda-Scan-Msg-Size: 943
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.1186 1.0000 -1.2821
X-Barracuda-Spam-Score: -1.28
X-Barracuda-Spam-Status: No, SCORE=-1.28 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=3.2 KILL_LEVEL=5.2 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.86116
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Apologies for the resend. I had not realized that gmail's app for
smartphones didn't really support plaintext.

On Wed, Nov 25, 2020 at 8:41 AM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Wed, 25 Nov 2020, Pascal.Giard@etsmtl.ca wrote:
>
> > Thank you for reviewing this new version.
> >
> > You are right, we could totally do without GHL_GUITAR_CONTROLLER.
> >
> > This can be seen as premature generalization or an excess of optimism;
> > I'm assuming that the PS4 also needs magic control messages to behave
> > correctly, and that I will figure those sooner than later. But I may be
> > assuming too much and this will be trivial to add when the time comes.
>
> Yeah, let's extend this only when really needed.

Fair.

> > Do you want me to submit a v3?
>
> Please do, thanks. I'll merge that one, I promise :) Sorry for not
> having catched this in v1 already.

No worries, will do.

Thanks again!

-Pascal
