Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 381411415B8
	for <lists+linux-input@lfdr.de>; Sat, 18 Jan 2020 04:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgARDtm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Jan 2020 22:49:42 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:42570 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbgARDtm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Jan 2020 22:49:42 -0500
Received: by mail-vs1-f68.google.com with SMTP id b79so16081890vsd.9
        for <linux-input@vger.kernel.org>; Fri, 17 Jan 2020 19:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bC/ga2H8mZtIpOUNa8zw6QxWCrVfCjpv9ixr/PKYGhw=;
        b=IIA90VaRtZXpt4X1B0/epGtgr+4+VFaHXz1b2z0oyMPXzhnBE8tu/Dj1Al67sjf1dr
         WTP3YhIwkJPT5e1ZkaMcxKd4y7ow7foLrtFyzMVLMOUGbFH8zBN8xbTczKkdyRD9jQnw
         dsgSDbRGFRNS3gGMOFepEjbdnlTaLSrYvF+UGIjh3DArKD2tYLbUxCJhB8HVsBJ+HD2t
         PC9ZzkYOB1IfOIX3jZepeFcmIm60+lAzod9nOBAEy5Pl1KenYfH1UuDlxNotH7kHiykx
         qykcJytb7SATtR2Gvpxb9fwMPxO4Bs8i5zYDN5PlxgtdgeOEPnFDmX69qA8WBIJIBy5A
         7SYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bC/ga2H8mZtIpOUNa8zw6QxWCrVfCjpv9ixr/PKYGhw=;
        b=ivXFRN7cItb/fiW9eGQYmGkoheZzCaMz9fSttUlkgVQjkjJPEzCZQgQWwpn5R/dCmX
         Iz7EMr1AmMm+o8KMgCBeoK0ANPcI5nqCzXERwLnw4FxJ6/MA0gSulHdjb3YYqL27rGJR
         cfcv/XzKCW3IxfS2+Sf0OC333XlEUPRVYps2553LP4VpjYRSF0oZy6JaOoXXK8IYSJBR
         KIEepWFQqAVllL9ZWApZ4NNXBsbOSqpNPRl2xkbFT4SGfBKGaA6o5Znqmbo1I8bPMWJF
         NwgtA2Zkbm8Jv6h2hbeg2VovvsVpoO/NcxK9Pjw/+wxclipoCd4peZOk3HurlXjMghDe
         vq7Q==
X-Gm-Message-State: APjAAAVHEKmyKwsvFsMwvU7Ez1glJaIqy37LG22TKXY9RNurCpZ9uRCC
        PShgqEPu1b3m56ruqwuKmc7MjfYh2yr3du7bkfE=
X-Google-Smtp-Source: APXvYqx8pE/+wWJSrm7RZxLFTRaZNxRdY7V8K1olK56chvwcaKzvpkEEicuSYR3FsKNhdY20HFmNKf7l90N/1q1P6H4=
X-Received: by 2002:a05:6102:3024:: with SMTP id v4mr6917603vsa.220.1579319381221;
 Fri, 17 Jan 2020 19:49:41 -0800 (PST)
MIME-Version: 1.0
References: <20191230012720.2368987-1-djogorchock@gmail.com>
 <20191230012720.2368987-12-djogorchock@gmail.com> <CAEc3jaBy9c=GTXX1iuQsCn8N2vg4zG1trzddRtsmQLsX4YO7oA@mail.gmail.com>
 <CAEVj2tnt4FnQiiaVJgbaKaeGQqMk6CUkmvy2KjRk2Ew79USaaw@mail.gmail.com>
 <CAEc3jaBsxOD1Cs1231+mabVqx2dLGZ0hW8aH3dbXFbt5n50Qpw@mail.gmail.com>
 <CAPh2-TB=UZhHAWfsyPBpATT79qeKzzOwo41VDPpid6NH7kUYJA@mail.gmail.com>
 <CAEVj2tnxVNXLje3Y0+2Rnfr9Pje88cfvmvOXHk1UuL8g9W3j0w@mail.gmail.com>
 <CAEc3jaBo2LHh==_K8_EM+NVQ+pkO6HvoTVtq145dBicPQO-Suw@mail.gmail.com>
 <CAPh2-TBNHH=RjZcgKzXCKysKKX23yGesXq-AzqaWr1+y4+gAdQ@mail.gmail.com> <CAKF84v26=X8OLPavdE52tprm=WOynUXRz2aDjz5Bvqw6rdTZQg@mail.gmail.com>
In-Reply-To: <CAKF84v26=X8OLPavdE52tprm=WOynUXRz2aDjz5Bvqw6rdTZQg@mail.gmail.com>
From:   Daniel Ogorchock <djogorchock@gmail.com>
Date:   Fri, 17 Jan 2020 21:49:29 -0600
Message-ID: <CAEVj2t=J+RiYMWdhxe0AocEtdV_j2Bqd2ABkSMm8UetMkE+e=g@mail.gmail.com>
Subject: Re: [PATCH v10 11/12] HID: nintendo: add IMU support
To:     Siarhei Vishniakou <svv@google.com>
Cc:     Carl Mueller <carmueller@gmail.com>,
        Roderick Colenbrander <thunderbird2k@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        Billy Laws <blaws05@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        "Colenbrander, Roelof" <Roderick.Colenbrander@sony.com>,
        s.jegen@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Siarhei,

Thanks for catching that. I'll fix it for the next rev. I'll also do a
sanity check compilation for each patch in the series.

-Daniel

On Thu, Jan 9, 2020 at 2:55 PM Siarhei Vishniakou <svv@google.com> wrote:
>
> Hi Daniel,
>
> I just tried to build the first patch in isolation, and I'm hitting a bui=
ld error: in the function nintendo_hid_remove, the variable "ctrl" is unuse=
d. It looks like it's first used in the rumble patch, 'add rumble support'.=
 Could you please move that variable declaration there?
>
> Also, in the same rumble patch, I'm seeing that the function 'joycon_enab=
le_rumble' is always called with the second parameter bool enable =3D true.=
 Maybe that parameter can be removed from the function definition?
