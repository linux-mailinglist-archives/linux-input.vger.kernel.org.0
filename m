Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C80A1E38F3
	for <lists+linux-input@lfdr.de>; Wed, 27 May 2020 08:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbgE0GTX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Wed, 27 May 2020 02:19:23 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:47647 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgE0GTX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 May 2020 02:19:23 -0400
Received: from mail-pf1-f200.google.com ([209.85.210.200])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jdpPN-0004Y7-Fs
        for linux-input@vger.kernel.org; Wed, 27 May 2020 06:19:21 +0000
Received: by mail-pf1-f200.google.com with SMTP id 194so18820250pfb.15
        for <linux-input@vger.kernel.org>; Tue, 26 May 2020 23:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=g3G10oTdQUGktU+UO7WQ3PW2TAHAFN2Zb3zq425YYyk=;
        b=EJhpnVEZjt8OB9+UhvY0A2hW+CACFsPyMLVGRJ27R+r7QMyzlcjV90Qa7Fb0R+Lcq+
         ZbSpwB63ldG5Oe3zvdr/EgTKSEPQfyUfaSGPWE0QxV5kan7Z6A9pvWxJ0Bw0eh+bjk62
         ww8Xvwo2lkTQh7eSlRWrU7CNHsdrPINQCsrR6SsLa9Ua2XDZNBVTsRHUgad3Pu6v705+
         h5o8PEduiBJTAltPnw0bERUqpbcWXNPznZv47OtoM1TTLse2xyUj7mW+Y0flo9jHpjrI
         l29XkO6zUtrlIlawGrA/Hh8xulL/206xyElPQDPv7ZYLN4SMyB3NIcso31FgDvw9Gccw
         j9Cw==
X-Gm-Message-State: AOAM531g6nZd59Jiqf5jA639Vm00N8V68Db/b1xXGwIaWqFVEtGOEkN3
        cpe52NrNwl59x5xxUSP6vaxjUpnlQSfAMY/wVYdi4n8Wqf3IjFt1Y/9+KCnprnqLMH7yVrZch4h
        aIjD813y5djGEoVzxueE7igd6BSRzLW+oagc21GCu
X-Received: by 2002:a17:902:b110:: with SMTP id q16mr3231238plr.221.1590560360149;
        Tue, 26 May 2020 23:19:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBIb9+Qpyu2p2CRX6M0xxGWgWILNhjV3F4UW8F6y8Qt/zVz7kocYeSWmjCgzKGw9FxwL0PDg==
X-Received: by 2002:a17:902:b110:: with SMTP id q16mr3231222plr.221.1590560359845;
        Tue, 26 May 2020 23:19:19 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id y4sm1165764pfq.10.2020.05.26.23.19.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 May 2020 23:19:19 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] HID: multitouch: Remove MT_CLS_WIN_8_DUAL
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <CAO-hwJ+mTjVpBiY9vHXA2Y6D+cXYemixFJ++i+KwZZ25Z6LHHA@mail.gmail.com>
Date:   Wed, 27 May 2020 14:19:16 +0800
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <A51B9D28-88BF-42EB-9161-8E3081B128D2@canonical.com>
References: <20200414091842.25972-1-kai.heng.feng@canonical.com>
 <nycvar.YFH.7.76.2005261023250.25812@cbobk.fhfr.pm>
 <CAO-hwJ+mTjVpBiY9vHXA2Y6D+cXYemixFJ++i+KwZZ25Z6LHHA@mail.gmail.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



> On May 26, 2020, at 16:43, Benjamin Tissoires <benjamin.tissoires@redhat.com> wrote:
> 
> On Tue, May 26, 2020 at 10:24 AM Jiri Kosina <jikos@kernel.org> wrote:
>> 
>> On Tue, 14 Apr 2020, Kai-Heng Feng wrote:
>> 
>>> After commit c23e2043d5f7 ("HID: multitouch: do not filter mice nodes"),
>>> MT_CLS_WIN_8 also supports mouse nodes, hence make MT_CLS_WIN_8_DUAL
>>> redundant.
>>> 
>>> Remove MT_CLS_WIN_8_DUAL accordingly.
>> 
>> Benjamin, can I get your Ack on this one please?
> 
> Heh, funny enough I was trying to fix
> https://bugzilla.kernel.org/show_bug.cgi?id=207235 and was pondering
> this one too.
> 
> To fix #207235, I'll likely need to add a new class and quirk in
> hid-multitouch. I can't really find a generic solution for now, and we
> better have a local quirk for the 2 devices we currently have and
> backport those to stable. However, this patch will likely conflict
> (trivially), with the new quirks, so I was thinking:
> - submitting my quick and dirty quirk and mark it to stable
> - apply this one on top of it (this one really doesn't need to go to stable)
> 
> How does that sound?

Sounds good. I'll resend this patch once your patch lands in the tree.

Kai-Heng

> 
> Cheers,
> Benjamin
> 
>> 
>> Thanks,
>> 
>> --
>> Jiri Kosina
>> SUSE Labs
>> 
> 

