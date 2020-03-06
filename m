Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6218817B6DD
	for <lists+linux-input@lfdr.de>; Fri,  6 Mar 2020 07:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbgCFGkR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Fri, 6 Mar 2020 01:40:17 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:44406 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbgCFGkR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Mar 2020 01:40:17 -0500
Received: from mail-wm1-f70.google.com ([209.85.128.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <chia-lin.kao@canonical.com>)
        id 1jA6ec-0007AY-Qk
        for linux-input@vger.kernel.org; Fri, 06 Mar 2020 06:40:14 +0000
Received: by mail-wm1-f70.google.com with SMTP id w12so259310wmc.3
        for <linux-input@vger.kernel.org>; Thu, 05 Mar 2020 22:40:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EpKnowuU59lPtoZuyG1qUEH+kEQ22uKgOl7ZuBWQsiA=;
        b=enxgZdYdagpLbY5K+bIlPBwKKuXypYJDPcOULa8H9QBIfrxDhIH4gCBo78UucAb6TG
         syMrS7yZ31iGDYzpW3jL6qfbhJ7KsjsAclnebyxyFlltIkShwUMsFqn1DAc0m8VlLCJC
         gaIJ6llplRFv8lgeuFJ48Z8wBirjQ3QJRFMKjvgBs0+IKWcK9HDgrDNWB9x8kWKe6gyi
         0oqWQLTIJF0OQx0f7sIuf8ROlHOFe9bOrN4TAwRb2DFhLh2pVcniJY67mA1EvnzGhlvC
         qroUwZT196zmsiGDZLdDFIH9KipAFRU+9HiLkZfYJeuSp46l4qo1fJC/k6wva4v+6/Pc
         cw+g==
X-Gm-Message-State: ANhLgQ3WzXsV2u3M6jnxmGyqka1+MbQSP+x6bS4pm9G+NRBZXGL9HJph
        QiiWP52ZduIwvAZBsUGEtbOBeCuqbJ9lC+5eFZXo/G9Q+nGDs+m9MCtG40F9LYmVTkT94G9KMV5
        mmIwaOaxv97/xHjMKLoXhf1RjGfHkoq1OYXGXGhxOXYmnr1SagMGTupcm
X-Received: by 2002:a5d:4c52:: with SMTP id n18mr2392155wrt.403.1583476814553;
        Thu, 05 Mar 2020 22:40:14 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtW31iSGk+adXSK/Yr7Qi7q8DHETQMzekXTWHtim33Iv76ZWOnxUcuVVs8w7irYklXu27ruDt3hjgo/EiwdBc4=
X-Received: by 2002:a5d:4c52:: with SMTP id n18mr2392114wrt.403.1583476814289;
 Thu, 05 Mar 2020 22:40:14 -0800 (PST)
MIME-Version: 1.0
References: <20200305064423.16196-1-acelan.kao@canonical.com> <20200306041642.GD217608@dtor-ws>
In-Reply-To: <20200306041642.GD217608@dtor-ws>
From:   AceLan Kao <acelan.kao@canonical.com>
Date:   Fri, 6 Mar 2020 14:40:03 +0800
Message-ID: <CAFv23Q=W8-hafqBkBeT0HXGBb6kJC=1dHwnGv57=Z3NTOH0-6w@mail.gmail.com>
Subject: Re: [PATCH] Input: i8042 - Fix the selftest retry logic
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Enrico Weigelt <info@metux.net>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-input@vger.kernel.org,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

We have a Dell desktop with ps2 addon card, after S3, the ps2 keyboard
lost function and got below errors
Jan 15 07:10:08 Rh-MT kernel: [  346.575353] i8042: i8042 controller
selftest timeout
Jan 15 07:10:08 Rh-MT kernel: [  346.575358] PM: Device i8042 failed
to resume: error -19

Adding this patch, I found the selftest passes at the second retry and
the keyboard continue working fine.

Best regards,
AceLan Kao.

Dmitry Torokhov <dmitry.torokhov@gmail.com> 於 2020年3月6日 週五 下午12:16寫道：
>
> Hi AceLan,
>
> On Thu, Mar 05, 2020 at 02:44:23PM +0800, AceLan Kao wrote:
> > It returns -NODEV at the first selftest timeout, so the retry logic
> > doesn't work. Move the return outside of the while loop to make it real
> > retry 5 times before returns -ENODEV.
>
> The retry logic here was for the controller not returning the expected
> selftest value, not the controller refusing to communicate at all.
>
> Could you pease tell me what device requires this change?
>
> Thanks.
>
> --
> Dmitry
