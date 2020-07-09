Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7527821AB41
	for <lists+linux-input@lfdr.de>; Fri, 10 Jul 2020 01:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbgGIXKk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Jul 2020 19:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbgGIXKk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Jul 2020 19:10:40 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE229C08C5CE
        for <linux-input@vger.kernel.org>; Thu,  9 Jul 2020 16:10:39 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id e8so4314610ljb.0
        for <linux-input@vger.kernel.org>; Thu, 09 Jul 2020 16:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FF/lFFDb0gZxEKkkT1AnhvvZBRIPHewkh4yufXgF540=;
        b=rBRTdUI6/hheZrNqW9JqfBoxczQQ7V/obHSYqCGQkgH2OjrQ75nBHcAWdvqU66sMBe
         Tubj0sj+k0A10kIRRCXreFEFpP0juon2qz42D0hvJKeUhLdyWtb1x7YAqcYZ8QOSREYL
         pRoChYrKGLkFLiqtids7EGekG4z1KtEbwsryjOzWEa6QshqbQW0yxR2s+Hl156T4wEiQ
         I7ZpaPRzbspIpDxbrKbq18dG2z6XI3eQDshAZBB1iSFRNdPVaj/NGju2dVzGO7kPqB7l
         6e8yni2Sa0l689RagBGrm1gvKkMMG7PxKRFdQpuWZ0hvNd/pI/gKVIRLZE1mevdG9+cn
         Vr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FF/lFFDb0gZxEKkkT1AnhvvZBRIPHewkh4yufXgF540=;
        b=jCg408F10rxIOGDMeu5IluF8XLotFhbM9VU98sx0tJXXsxGNVkD96HlYNCla3IagCL
         bCQhXnoKFP2eqZHd2d+JwUm+NrDPv6OSba+6ouyyMA0rfn8n6nG81RWH+ktRGiRd4tO8
         jxoWwB1vRL3OzLOMq4hJ1YMam25iwzBQQDwv/KWhfeRaBalD4wUz77eYCB0+GD32Q9k5
         mC+Kv04EZa64/3mCO4ogA+k2F+/nNV9Jk04Xvh1DI2nCoNIS/xnDZrIcXA6AJZEH9lDz
         4FmjEoD3i1BXy8T0+4vWc374cR/OS7/8XSRJ8kKKmRi655/RUjtVmh0xOBcB2gq92u6r
         41+g==
X-Gm-Message-State: AOAM530GzzG3Ux3Y9rQLBEi6enZls+bPBc6HShQhtu9JKHf+rqvaJF4O
        /7nZzXJfaBx6WXMgeiMuxtqAjPrSMVxX6RjcJoc=
X-Google-Smtp-Source: ABdhPJxNriklekJ602Atm93a6YVow9+ldfxhckeO/PSFiQEmjRjcpI3QFhQ7tcLyawr4vpTbsoHLjL4Cb3RfpnD0WC4=
X-Received: by 2002:a05:651c:10f:: with SMTP id a15mr36350290ljb.192.1594336238188;
 Thu, 09 Jul 2020 16:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <CACa7zynY07xp3hhe5SA4wcGxJB6shc9qoos-BOL2CeXPEobzuA@mail.gmail.com>
In-Reply-To: <CACa7zynY07xp3hhe5SA4wcGxJB6shc9qoos-BOL2CeXPEobzuA@mail.gmail.com>
From:   Wei Shuai <cpuwolf@gmail.com>
Date:   Fri, 10 Jul 2020 07:10:26 +0800
Message-ID: <CACa7zynMpa3BOJUW=s_Tj1TwH5txDQOuta5Fph45PYhDOtQQ3g@mail.gmail.com>
Subject: Fwd: Linux General Joystick Max buttons limitation 80
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear Joystick Maintainer,

we found Linux kernel has max joystick buttons up to 80, no more

We are selling a USB joystick device QMCP737C for flight simulator,
which is nothing but a common USB joystick. it has 104 buttons

Product link
https://x-plane.vip/quickmade/qmcp737c/

it works good on Windows, Mac, but not on Linux.
Linux kernel exposes /dev/input/js0 max to 80 buttons, but we have 104 buttons.

I did a lot of google search, but nothing I got. then I have to look
at Kernel source, to find out where this number max 80 comes from

Eventually I found the final limitation

#define BTN_JOYSTICK 0x120

#define BTN_DEAD 0x12f

#define BTN_TRIGGER_HAPPY 0x2c0

#define KEY_MAX 0x2ff

include/uapi/linux/input-event-codes.h

according to function hidinput_configure_usage() in file drivers/hid/hid-input.c

the joystick button mapping is not a continuous space, general speak
the mapping space is from

BTN_JOYSTICK~BTN_DEAD
BTN_TRIGGER_HAPPY~KEY_MAX

and finally I got the max limitation is 80.

My question is why KEY_MAX is 0x2ff?  this number 0x2ff looks like it
does not align with char?integer? the answer is no

so may I ask to expand KEY_MAX to such as 0x4ff? or you need me to
submit patch for it, I am OK

Thank you
