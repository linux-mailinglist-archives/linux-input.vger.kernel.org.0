Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 323222CDDC
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2019 19:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727489AbfE1Rp1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 May 2019 13:45:27 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:32889 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727462AbfE1Rp1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 May 2019 13:45:27 -0400
Received: by mail-qk1-f196.google.com with SMTP id p18so23923921qkk.0
        for <linux-input@vger.kernel.org>; Tue, 28 May 2019 10:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AAYtqa2DAr5N77/OMPYjghZagaZbPGB+Zztk+7V5jgU=;
        b=Z5+wS+jDucu/G28Su8dqKVlH6X2fG3zcFCM6OG4rD6roWj816dTdtg4y5NgHxn1gPz
         b+vCKAC1sZ4OUYNiEhlrNX9GhBdGtsVsfCBfwyuPjL++Yf3+GbK0sjbr5lzBoe2OXgDP
         FIEX49dGgvHbj33BReScZQG4xGeun3/kFUQeQVwbk7HF9x5WnJWPaBtACRwRlS0UvDCX
         TCESmHPR2ciRJFbgUfwrkQWqpeVqtQj3ybGZ6bMPW9Fd94ftPE69SV4zbmcfqWWRPcB+
         cxinic0OvFFiluVMgmJnvtGU4YKItjUC2+b8m7ijBHcZxCebzpVaqr4vnBikEjNDCjY6
         PR9Q==
X-Gm-Message-State: APjAAAVbCP0HuSJ44Fi7GGfiKpNP84csEbzOMrudSAJWHP0NXFmyAAas
        dVaB8D4FKmHKlqGcqfWu1aH9K6wDaOylDzQo3Jz2pQ==
X-Google-Smtp-Source: APXvYqz1xnUIVAN8WZEme5sRuWkK0m2Sb1s8935RgGJHI43BAZQampPfuKMjgr/Icm7bFwaGd4NsYX+joPPkLxIDo7g=
X-Received: by 2002:ac8:303c:: with SMTP id f57mr13204817qte.294.1559065526243;
 Tue, 28 May 2019 10:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <2c1684f6-9def-93dc-54ab-888142fd5e71@intel.com> <nycvar.YFH.7.76.1905281913140.1962@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.1905281913140.1962@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 28 May 2019 19:45:15 +0200
Message-ID: <CAO-hwJJzNAuFbdMVFZ4+h7J=bh6QHr_MioyK2yTV=M5R6CTm=A@mail.gmail.com>
Subject: Re: hid-related 5.2-rc1 boot hang
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Dave Hansen <dave.hansen@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, May 28, 2019 at 7:15 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Tue, 28 May 2019, Dave Hansen wrote:
>
> > I have a system that works fine on 5.1.  When updating to 5.2-rc1, it
> > hangs at boot waiting on an instance of systemd-udevd.  The kernel
> > backtrace (https://photos.app.goo.gl/EV8rf7FofWouvdeE8) looks like it's
> > doing an finit_module() that dives into the hid code and is waiting on a
> > request_module().
>
> Dave,
>
> thanks for the report.
>
> Just to confirm -- I guess reverting 4ceabaf79 and a025a18fe would work
> this around, right?
>

It would be also interesting to know which distribution and which
systemd version you are running (if you are on systemd).

This rings a bell as I recall  playing with
request_module/request_firmware a while ago, but Hans convinced me
that no such delay would be induced.

Cheers,
Benjamin
