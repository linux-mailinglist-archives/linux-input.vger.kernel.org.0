Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99F22306471
	for <lists+linux-input@lfdr.de>; Wed, 27 Jan 2021 20:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231150AbhA0TuO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Jan 2021 14:50:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231253AbhA0TnK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Jan 2021 14:43:10 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF3DBC061573;
        Wed, 27 Jan 2021 11:42:20 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id q131so1875586pfq.10;
        Wed, 27 Jan 2021 11:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=X9ffNFlIUOYVUPnD1D6PGLhxnOW/mJ8sX1Tm/n1QVRc=;
        b=ezPnDL2LMwRcLe65hsEsXmLKlGtJdCsB6uCpnqhGFf696p0/UOcI+4RnnEu/dusIjw
         KrBR172CEf1HjdgIDWKQx16bTRpBkwGAOge5JFy4TzCCjj69ZNbk3Btd1zg7GA9sCR9x
         BRw9uAy1DObBWEdjQ73jCstu51vL5uPbuBifN4xRfwgAxJiL3sX8KbEeNMPWIGHKI7Ox
         7RyrXnZ3NuHJ0vrQ1nwFyiT5cTi6Ryn45XlNEbjzA8mYWOJdZAcBnhJ2WtrWcAp2qn3A
         mtworgbfOL8HXHFs2o9uRQyHR1Sj87entcIK4Ryo2FvZBT0LPRigECq0SqPDnKocPTab
         lPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X9ffNFlIUOYVUPnD1D6PGLhxnOW/mJ8sX1Tm/n1QVRc=;
        b=tivL7ODtwZVwwnwgcq1wqXLFKGkzJ+ENC3/CzFVL9SmaUzIThZKvCOjH+AFMBYTi8E
         klJulFzJ5XOe5YxGnXDWpglxsskCDtQjxTXkmTJVZdyY9dBHuFgKDNQW4ZeyymI0JNzu
         t9SyZCIPdoc9Si0JShGDSIQapAxYyMa+xVpD5buaUFDhKgPE/jPi51buxi0j37/UT/HD
         3JINT4aHyjWwUJGqTZWgxY++RKL0VctCa6CpYzSLIXoksetTJjS/Mn2T1cGgBQDDpWd4
         zoTyt1RhPLtpmDRQB33sNypdClBawZbJK41bax1wf3GRM/mf/BQwP4pbpsn2nfcz2o7/
         1ESQ==
X-Gm-Message-State: AOAM530MZufZK7vWkZwDebSEkd4FuXe289gqd5/RrialOeTG7y81gh+4
        JrEt9uM5dNyFVr7oW9mYgFoFJ7g2Uog=
X-Google-Smtp-Source: ABdhPJwjLoRW6RHZSMApr5bBgvGKK1SJNLsW6E8ygt4XuhYvFKuiiEzuhh8bLcenhYSg8AEgNq2o3Q==
X-Received: by 2002:a62:9248:0:b029:1ae:8b24:34c8 with SMTP id o69-20020a6292480000b02901ae8b2434c8mr11939333pfd.67.1611776540348;
        Wed, 27 Jan 2021 11:42:20 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id e68sm3222040pfe.23.2021.01.27.11.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 11:42:18 -0800 (PST)
Date:   Wed, 27 Jan 2021 11:42:15 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Samuel Holland <samuel@sholland.org>,
        Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh@kernel.org>,
        =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, Lee Jones <lee.jones@linaro.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v5 05/20] Input: axp20x-pek: Bail out if AXP has no
 interrupt line connected
Message-ID: <YBHCF2tWIX4MeMia@google.com>
References: <20210127172500.13356-1-andre.przywara@arm.com>
 <20210127172500.13356-6-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127172500.13356-6-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Andre,

On Wed, Jan 27, 2021 at 05:24:45PM +0000, Andre Przywara wrote:
> On at least one board (Orangepi Zero2) the AXP305 PMIC does not have its
> interrupt line connected to the CPU (mostly because the H616 SoC does
> not feature an NMI pin anymore).
> After allowing the AXP driver to proceed without an "interrupts"
> property [1], the axp20x-pek driver crashes with a NULL pointer
> dereference (see below).
> 
> Check for the regmap_irqc member to be not NULL before proceeding with
> probe. This gets normally filled by the call to regmap_add_irq_chip(),
> which we allow to skip now, when the DT node lacks an interrupt
> property.

No, the driver is not the right place to patch this; regmap should be
fixed so it does not crash instead.

Thanks.

-- 
Dmitry
