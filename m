Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA56B144426
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2020 19:19:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729080AbgAUSTR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Jan 2020 13:19:17 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:41053 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728186AbgAUSTQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Jan 2020 13:19:16 -0500
Received: by mail-ed1-f68.google.com with SMTP id c26so3956487eds.8
        for <linux-input@vger.kernel.org>; Tue, 21 Jan 2020 10:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gLheq0HdqUTiqpysx4xrBJXQzj1ZOZjBAEJlXpHvXC0=;
        b=lMMpm3vZ8wMxI2BDMNyKyd9/DyYUNVsDNMNJOReRs3/2q0nYoRakmtFh8x5EYJFLfJ
         xpQ6ZrFbakWj5bXBHl5SkGGFLuGt1w1qhGHp7cXozV+y2Lh19qx3yGnOPkxGGBFP6776
         7KpP4TI4y2mFaCBSBCMaw8z5gmAmskldbeYK1VMnbQAGcToaLk8e3gIcjwk8pd+mswJL
         3+C3DuPNDRI6h5JhfBjWt9f0tqKlQ7Po0vNP5FkWRUD7NiZRD+MyNWWRMRKaCmvCzJAm
         6awfPqY307N4y6hWjiUF7XjNegev3OC3kDlJLeSnEQ3ktj/Jc6XVrJDd2mmc9l8shVKm
         RY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gLheq0HdqUTiqpysx4xrBJXQzj1ZOZjBAEJlXpHvXC0=;
        b=HkHzjP/OPLey9OkNYbPX9CkTFE6nYt5sJPh+QkzBR2s8DbcgbD42eOUh4NJdP5Ag7t
         Z+Cs2bRkAbluY8Hh17WeJTCQE66EeB2Xley1JF7cWrEjeJUfaxJMeClMVGzzDgQBvAhW
         ab59NPVHuykXJVZmUbbFdz9t0w0mT5229uWhJtJY9GA+iSVUMtPZY8qmODcuG7sHvhfo
         yQQ2GtpW+e54ervnE00HLlIU0PfslALYiduJhORei9cOQ/J97a53+b0q5ytt7wtggDlE
         7TT5/OYG8zddqZ5HFkbwR90HwBClSKeN+P1NZEq7fLhK3dBnEdze5OQ3dY79VT3El8dA
         eIlQ==
X-Gm-Message-State: APjAAAUYEGCyBoEmjebyBfe2u0kTzL8nAJ1jpmxoZEWdE9z7X+4PcuBF
        dI553s0rRhIp5ShrkqT/H008c64gpaDCcZBR7LkEaA==
X-Google-Smtp-Source: APXvYqye4Rk0fd+Lr0Qy3pe8yjxXCqM6sGWrir4DrbcZaM0QTB8GeXxQ5h8pLB9Mc3Ftziav9YfJUzW/+WVXX6ncwZE=
X-Received: by 2002:a05:6402:3088:: with SMTP id de8mr5108502edb.332.1579630754711;
 Tue, 21 Jan 2020 10:19:14 -0800 (PST)
MIME-Version: 1.0
References: <20191230012720.2368987-1-djogorchock@gmail.com>
 <20191230012720.2368987-12-djogorchock@gmail.com> <CAEc3jaBy9c=GTXX1iuQsCn8N2vg4zG1trzddRtsmQLsX4YO7oA@mail.gmail.com>
 <CAEVj2tnt4FnQiiaVJgbaKaeGQqMk6CUkmvy2KjRk2Ew79USaaw@mail.gmail.com>
 <CAEc3jaBsxOD1Cs1231+mabVqx2dLGZ0hW8aH3dbXFbt5n50Qpw@mail.gmail.com>
 <CAPh2-TB=UZhHAWfsyPBpATT79qeKzzOwo41VDPpid6NH7kUYJA@mail.gmail.com>
 <CAEVj2tnxVNXLje3Y0+2Rnfr9Pje88cfvmvOXHk1UuL8g9W3j0w@mail.gmail.com>
 <CAEc3jaBo2LHh==_K8_EM+NVQ+pkO6HvoTVtq145dBicPQO-Suw@mail.gmail.com>
 <CAPh2-TBNHH=RjZcgKzXCKysKKX23yGesXq-AzqaWr1+y4+gAdQ@mail.gmail.com>
 <CAKF84v26=X8OLPavdE52tprm=WOynUXRz2aDjz5Bvqw6rdTZQg@mail.gmail.com> <CAEVj2t=J+RiYMWdhxe0AocEtdV_j2Bqd2ABkSMm8UetMkE+e=g@mail.gmail.com>
In-Reply-To: <CAEVj2t=J+RiYMWdhxe0AocEtdV_j2Bqd2ABkSMm8UetMkE+e=g@mail.gmail.com>
From:   Siarhei Vishniakou <svv@google.com>
Date:   Tue, 21 Jan 2020 10:19:03 -0800
Message-ID: <CAKF84v0+LW_5qpj02UM39GKPy5o8g+_GK-9F7DTfqKkxcerQhA@mail.gmail.com>
Subject: Re: [PATCH v10 11/12] HID: nintendo: add IMU support
To:     Daniel Ogorchock <djogorchock@gmail.com>
Cc:     Carl Mueller <carmueller@gmail.com>,
        Roderick Colenbrander <thunderbird2k@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        Billy Laws <blaws05@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        "Colenbrander, Roelof" <Roderick.Colenbrander@sony.com>,
        s.jegen@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Daniel,

I wonder if it would make sense to fold some of the patches into the
first patch?

As an example, the first patch essentially adds the basic joystick
functionality, and at the same time it uses subcommands to communicate
with the device, for things like retrieving the calibration data.
Somewhere later in the patch series, there is a patch that improves
subcommand reliability. Maybe the 'improve subcommands' patch can be
combined with the first patch?
