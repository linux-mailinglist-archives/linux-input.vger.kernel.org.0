Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9402862AE
	for <lists+linux-input@lfdr.de>; Wed,  7 Oct 2020 17:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728222AbgJGPzS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Oct 2020 11:55:18 -0400
Received: from mail.zx2c4.com ([192.95.5.64]:32799 "EHLO mail.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726129AbgJGPzS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 7 Oct 2020 11:55:18 -0400
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20c8e6c1
        for <linux-input@vger.kernel.org>;
        Wed, 7 Oct 2020 15:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to
        :content-type; s=mail; bh=IzkKBgkAYb2SjNahiWJ7BabZwlg=; b=CQwQZK
        znfgG+lLHfROf0qBtaZVjm3u6X+jRcZsO1MVz50QaYJDFMdIo0liy7shw8Ex+ID/
        bszSsAGG9PkC4XbajgEQtfpN+LPzUsELfJBLpuCQdsb0MtLOISG3ELh2rTDNilKX
        eVYeSBtVD4D7JQye0g2X5pi/d9Ld1aO2a53SSUIyBuwNY9AqXVmY/KkHltGodqnI
        cqqD4DnHBOncu5WZU79TbILa2kBYAymFn4GYDjTCsRXOylqkbhB3/e3YXLQw7UO5
        fkTyDxdJVbhrHzD4ueniS643/0LfmEwox3A5Kqr7Ai9pj2IBhHa+GwWUPeuOnLU8
        fmB4LD0e56y7CaHw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3ab80e33 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
        for <linux-input@vger.kernel.org>;
        Wed, 7 Oct 2020 15:22:36 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id n6so2828199ioc.12
        for <linux-input@vger.kernel.org>; Wed, 07 Oct 2020 08:55:15 -0700 (PDT)
X-Gm-Message-State: AOAM530ItwJh5eGWwMMe9ZRlyDeiyiSkCljWFNn+eURjASZXmywqowHS
        YO6+aEyCDVXdloGYGUKoR2ZxSNVVlROxdSo/wIA=
X-Google-Smtp-Source: ABdhPJzBTQC9Ja1J0AfMdiYWxLJlnNn5p9MR4dmSFwd4hQQJhKfzCk2xre4E91IFXuIVNRBlM/iSgsDtmJfWs62Nx2A=
X-Received: by 2002:a5d:8787:: with SMTP id f7mr2807973ion.79.1602086114464;
 Wed, 07 Oct 2020 08:55:14 -0700 (PDT)
MIME-Version: 1.0
References: <5bd2bb9d925cfc81392bd9bf93b31ce4fd81e107.camel@redhat.com>
 <20200930225046.173190-1-Jason@zx2c4.com> <20200930225046.173190-3-Jason@zx2c4.com>
In-Reply-To: <20200930225046.173190-3-Jason@zx2c4.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Wed, 7 Oct 2020 17:55:03 +0200
X-Gmail-Original-Message-ID: <CAHmME9rAu0nVTGaQK84MxODuR9Ym3Q1FTyw_sVStmUTs9kmifQ@mail.gmail.com>
Message-ID: <CAHmME9rAu0nVTGaQK84MxODuR9Ym3Q1FTyw_sVStmUTs9kmifQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] Input: synaptics - enable InterTouch for ThinkPad
 P1/X1E gen 2
To:     linux-input@vger.kernel.org,
        Vincent Huang <vincent.huang@tw.synaptics.com>,
        Lyude Paul <lyude@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Chris Heiny <chris.heiny@synaptics.com>,
        Sultan Alsawaf <sultan@kerneltoast.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Oddly, CPU usage seems exceedingly high when using the trackpoint, in
the rmi4 irq handler. Running perf-top indicates a hotspot in
i801_access calling "in     (%dx),%al", which makes sense. I wonder:
is this a culprit of expensive accesses in general, which Sultan
(CC'd) has been working on? Or are we hitting something different
here? Improper IRQ masking in the i801 code?

Jason
