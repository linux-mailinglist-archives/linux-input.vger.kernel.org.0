Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B240407AB9
	for <lists+linux-input@lfdr.de>; Sun, 12 Sep 2021 00:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231605AbhIKW4O (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 11 Sep 2021 18:56:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbhIKW4N (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 11 Sep 2021 18:56:13 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC9BC061574
        for <linux-input@vger.kernel.org>; Sat, 11 Sep 2021 15:55:00 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id s11so5515754pgr.11
        for <linux-input@vger.kernel.org>; Sat, 11 Sep 2021 15:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5utlLGpcvK42VzI0LW/dCGQXTy7jjiED74I2HLdsmAI=;
        b=Qn81t1P8fOkxT8CODr1AqYUiu9sVbcabnHxzJ/PGJlk2VVsfbFpIv+2pqS0gbduei5
         ziOLXm7gGw/W1JKSUQE/TVWxYt6GLvgUpk3RqwjSPvkGd8zbvf4naRSPj26+UmeR3EDt
         rA4YpP6vet+FyjluvhVls4y6PF8PiFvfH9bgIhdN0B57Bw9xTpzwJ1HF2/c4J2bgl5SR
         MB2mbuguPowglWuGA2enYcIDF3W1LK+CLHvbcHtvaqWfWlcSdriE3TPJ1K6ByZtC+0J/
         2KIz3LQQgsP3iD/dPXjMCcwAFnGqcCihGtHGtmHjhAMytUteFXJnJtlqWxU9UPz4BuCf
         AxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5utlLGpcvK42VzI0LW/dCGQXTy7jjiED74I2HLdsmAI=;
        b=qVITdtSPK9WTi8aJb5cNp0wyhjE24YZF7uQEV2wMS/JYFpJfS3M9mhOTwxamM8eBS2
         kZRuHTrMUglSpUTzkQN3XTDqetEr2mZqkdhOpcsOLXJ2+6Bk2C5cHDinBDwllgZBNLHA
         S4shlXAQYq3wyUAkk0xhh21QMpwZ4KsRdNPG28IN7zoqNr5Uu6s0lgDsCElS9/8PRRFn
         2rGEIQzo5d7rBD5zRwcWi2YohWnPZkMtadkVAUJgvrOGYiXfSOdaaEFuIEraoYiRXDM5
         prM7iN6VH6iRjFIkSncVeWRzgrj8onJCCbQ/fQNxCluY+mbKvD05Wi3Daanznp4qtoU1
         3NNA==
X-Gm-Message-State: AOAM532hHON2sgAO4rsbFgF6b2FeZ3FcvtFO7zjdnJ0O3zw2qmu1pJw/
        JHotB5O2UFgC+9GKdRa/v6U=
X-Google-Smtp-Source: ABdhPJy15rEW3Lxs88Fhj7UCeRT4Rav6D2wPXBCIwFngcLzRS7uTTWx8V+DXLoh4l9s04CRCh7CfXQ==
X-Received: by 2002:a62:8281:0:b0:3f6:3b92:3698 with SMTP id w123-20020a628281000000b003f63b923698mr4109811pfd.55.1631400899903;
        Sat, 11 Sep 2021 15:54:59 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:3e87:e680:a2cb:50b3])
        by smtp.gmail.com with ESMTPSA id m12sm2740798pjc.18.2021.09.11.15.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 15:54:58 -0700 (PDT)
Date:   Sat, 11 Sep 2021 15:54:55 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org
Subject: Re: Delaying i8042 probe?
Message-ID: <YT0zv6Rv1vURYTi3@google.com>
References: <s5ho890n1rh.wl-tiwai@suse.de>
 <CAOMZO5C-wFv0LmbHfZQUMMchJAwvxMxTs=eT6oby8O8k4QyoFQ@mail.gmail.com>
 <s5hee9wmy6e.wl-tiwai@suse.de>
 <CAOMZO5CACdcxGWn++f0+zhQaKevH7b5c-Xkv3QLBpwxc2GxizQ@mail.gmail.com>
 <s5hee9vlg8i.wl-tiwai@suse.de>
 <CAOMZO5C+gki7HT-n5D6qj06NbMxo2su2d6X+8AvM9PSmLUZ0jg@mail.gmail.com>
 <CAOMZO5DepuVScmDU7yZGVOVUs1JzHOd4bmu1z3erE2GNpcjZ+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5DepuVScmDU7yZGVOVUs1JzHOd4bmu1z3erE2GNpcjZ+w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Fabio,

On Sat, Sep 11, 2021 at 03:50:25PM -0300, Fabio Estevam wrote:
> On Sat, Sep 11, 2021 at 3:43 PM Fabio Estevam <festevam@gmail.com> wrote:
> >
> > On Sat, Sep 11, 2021 at 4:32 AM Takashi Iwai <tiwai@suse.de> wrote:
> >
> > > OK, I'll update and let the reporter testing it.
> >
> > Sorry, platform_device_alloc() and platform_device_add() were missing
> > in the earlier patch.
> >
> > New patch atached.
> >
> > Dmitry, does this look correct?
> 
> Please consider this one instead.

This is unfortunately is a band-aid. I wonder what other driver pokes
the embedded controller on these devices for it to start responding to
8042 queries...

Does the laptop have the latest BIOS? I wonder what ACPI tables look
like.

Thanks.

-- 
Dmitry
