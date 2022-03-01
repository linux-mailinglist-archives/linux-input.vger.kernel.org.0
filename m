Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49DBD4C849F
	for <lists+linux-input@lfdr.de>; Tue,  1 Mar 2022 08:04:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbiCAHFY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Mar 2022 02:05:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbiCAHFY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Mar 2022 02:05:24 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 881644B1ED
        for <linux-input@vger.kernel.org>; Mon, 28 Feb 2022 23:04:43 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id h17-20020a17090acf1100b001bc68ecce4aso1282457pju.4
        for <linux-input@vger.kernel.org>; Mon, 28 Feb 2022 23:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Qb+j1LRO8ddo3zhSqcznN1JkovRLiS/pR+mq8fLnnsc=;
        b=cIxXsG6s/YcCLI6+oKiBSjSItn/DDxm9JYQshC91Zn47nwvdNEMIOnR2yx9M6Ym6kT
         oS6/HOXMbCuALZ9ydo/LWEMHq4xc2luxLyCnlfeUCFn9NnBkzOfIHZvyj6qVUBoUfw3L
         ZYSMK3iSLATOf+dzNbSMpIBa+lwpIrRqvINqlRZGbmMbZeCvUysoNpPkclMjQ//lp12+
         B0LOWPQuc49Ra1kuF8u+/UcmdxNMJbkGezF7ReyCZVS0yOTZ2lSawieYbxKyzG21h/bS
         y48dpF3bsH1PYy8Q4kFdGqXYp7Y7jiJKg+dS6jI+k9liRkxEVYQhnsPK7RJA+Jcr23wb
         qQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Qb+j1LRO8ddo3zhSqcznN1JkovRLiS/pR+mq8fLnnsc=;
        b=smqLsV24517vujPfumRpSWUOni8SZ3vI8LFj81nitYbcKDoWL0g2UrInfEH4Wxtp6n
         Aw/p9uyT/JZuP0b2paIQsR9iJNLAy1vkV2FRYMbSjOt13n4U717UX71pk+zsXZVO6yCZ
         AzJOdvTnD/xseH0yweGEUAc06zKk8ynE6GdfwnvGbmWRj2uEils8puu5uxrsdlIXH1tu
         U2+iM7OgKybFpNlgUCNVzfx1jAq/amcgi5EfyuUkAkCzz5T+U3466s5CZhVN39cYMIVt
         p3IojgIgQ3qlyuexdQ+PX7OpLX/J3R7aZ4clqr66BpYMg/Rc3nh5S/bWYcJ/UwW895og
         q+CA==
X-Gm-Message-State: AOAM531d2zU1M9D9vLzNszZAh8nENn5VcVT9bCiJFkf31Ty8s/X32cYE
        cpsMn2+uMd11kqCTbaMn+snKteVXM9Q=
X-Google-Smtp-Source: ABdhPJwwSQDk5G9iDm6fb7mF52o4Ps7XsMmQR+wqhVOc1izFiKU2lDbUJcdjW05K/Ei+M7l3zE6IFA==
X-Received: by 2002:a17:90a:ac14:b0:1bc:2b81:4f5d with SMTP id o20-20020a17090aac1400b001bc2b814f5dmr20392384pjq.207.1646118282931;
        Mon, 28 Feb 2022 23:04:42 -0800 (PST)
Received: from google.com ([2620:15c:202:201:c174:264:5e49:f2cb])
        by smtp.gmail.com with ESMTPSA id 63-20020a630942000000b00372a99c1821sm11723047pgj.21.2022.02.28.23.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 23:04:42 -0800 (PST)
Date:   Mon, 28 Feb 2022 23:04:39 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: goodix - Workaround Cherry Trail devices with a
 bogus ACPI Interrupt() resource
Message-ID: <Yh3Fh5PLPu91CKqn@google.com>
References: <20220228111613.363336-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228111613.363336-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Feb 28, 2022 at 12:16:13PM +0100, Hans de Goede wrote:
> ACPI/x86 devices with a Cherry Trail SoC should have a GpioInt + a regular
> GPIO ACPI resource in their ACPI tables.
> 
> Some CHT devices have a bug, where the also is bogus Interrupt resource
> (likely copied from a previous Bay Trail based generation of the device).
> 
> The i2c-core-acpi code will assign the bogus, non-working, Interrupt
> resource to client->irq. Add a workaround to fix this up.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=2043960
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied (for 5.17), thank you.

-- 
Dmitry
