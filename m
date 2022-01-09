Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D32F48884B
	for <lists+linux-input@lfdr.de>; Sun,  9 Jan 2022 08:18:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233041AbiAIHS2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 Jan 2022 02:18:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbiAIHS2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 9 Jan 2022 02:18:28 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE04EC06173F
        for <linux-input@vger.kernel.org>; Sat,  8 Jan 2022 23:18:27 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id p37so8055207pfh.4
        for <linux-input@vger.kernel.org>; Sat, 08 Jan 2022 23:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tiwkXNnGg3ilLgTUUxwnoPWaFVDAckLcbrf1dImlIRc=;
        b=XorkyltR5en8IdfHM0osGYMbFU0ost2YcFkM2yNFTPPnoOFvthzO66pTFMAoAfJfCd
         DyHklBXoJvgFJ/+Ih9jkelCMnZfQP7qv5K95262i2Laid3zhorcIbkanZkrUfXlafMa2
         GSDQatKl8z4rhN0EUcLG0wPNSfL/jsAeLBum/bADwDe9oM/u6sdXKn0hiTQxsMA035q+
         fU7LIqv7YDHJ3ELTRez2vwIsnr/TaxRKfS9G2gpb/OTkto7onv8gyhnGmD0hNDTLPJCj
         +WA1rOuGgNB7Aqsnnd8bBmkj7G6W+6ZcEyO25LoUYh8ysvOkJ0dieon6BTE2sf+VoB+n
         IghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tiwkXNnGg3ilLgTUUxwnoPWaFVDAckLcbrf1dImlIRc=;
        b=t6f0Dq035grKJucb/XNXRzMdeq43/CevfO3tg58g2clB1G8SzBz9c4pvKsh5u7/7em
         IT8DQ9pmOnD0xeM1U0scsOwbkxWl+/nhAzQYkVXNFU9InulvZ5mJUymRgfK8pMZya4Su
         g1jfB1sU+C5xM+g/7MNaHBORLsDlTu213lR9MFI90eLBlAc2YQ3TQJXxiN7hWkZui/bO
         tqODkCxfjPiddXgn9Ma9lqy2WZDIPGmZVPmMlcx7q0bg3Iz6t8XnPfSz++mC3u2qKc+h
         xmOoprxzTOhhX5dwGPv9wdaE70LpxLL6TQvEmKLYr2a+Zo/73e5mdjT61qbIrpVuyST1
         sIhA==
X-Gm-Message-State: AOAM53040PPt053CZ+4P3Jke1TZxqgPB37UCp+v6SMJ5LQNu10CeUgX2
        5aWTYmMW1ExIJaVfDXShhwU=
X-Google-Smtp-Source: ABdhPJxMMLgy88dn9GQLYiw8reanYDf3YVII+ackzQMZvNWYQKcCSvTh+5Tf9j2bQI3mijG7iz/mPw==
X-Received: by 2002:a63:6ece:: with SMTP id j197mr54096486pgc.322.1641712707197;
        Sat, 08 Jan 2022 23:18:27 -0800 (PST)
Received: from google.com ([2620:15c:202:201:1402:d240:ab6c:2258])
        by smtp.gmail.com with ESMTPSA id r13sm2383917pga.29.2022.01.08.23.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 23:18:25 -0800 (PST)
Date:   Sat, 8 Jan 2022 23:18:23 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: axp20x-pek - Revert "always register interrupt
 handlers" change
Message-ID: <YdqMP9ElxsuojxoX@google.com>
References: <20220106111647.66520-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106111647.66520-1-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jan 06, 2022 at 12:16:47PM +0100, Hans de Goede wrote:
> The power button on Cherry Trail systems with an AXP288 PMIC is connected
> to both the power button pin of the PMIC as well as to a power button GPIO
> on the Cherry Trail SoC itself. This leads to double power button event
> reporting which is a problem.
> 
> Since reporting power button presses through the PMIC is not supported on
> all PMICs used on Cherry Trail systems, we want to keep the GPIO
> power button events, so the axp20x-pek code checks for the presence of
> a GPIO power button and in that case does not register its input-device.
> 
> On most systems the GPIO power button also can wake-up the system from
> suspend, so the axp20x-pek driver would also not register its interrupt
> handler. But on some systems there was a bug causing wakeup by the GPIO
> power button handler to not work.
> 
> Commit 9747070c11d6 ("Input: axp20x-pek - always register interrupt
> handlers") was added as a work around for this registering the axp20x-pek
> interrupts, but not the input-device on Cherry Trail systems.
> 
> In the mean time the root-cause of the GPIO power button wakeup events
> not working has been found and fixed by the "pinctrl: cherryview: Do not
> allow the same interrupt line to be used by 2 pins" patch,
> so this is no longer necessary.
> 
> This reverts the workaround going back to only registering the
> interrupt handlers on systems where we also register the input-device.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
