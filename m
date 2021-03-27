Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21ABD34B929
	for <lists+linux-input@lfdr.de>; Sat, 27 Mar 2021 20:45:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbhC0To6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 27 Mar 2021 15:44:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbhC0Toz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 27 Mar 2021 15:44:55 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57435C0613B1
        for <linux-input@vger.kernel.org>; Sat, 27 Mar 2021 12:44:54 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id u20so11226883lja.13
        for <linux-input@vger.kernel.org>; Sat, 27 Mar 2021 12:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0yM+xXL4DpBFqP+OauywyjzJwlW9UjCTqUtcFDhx+YI=;
        b=irJZ5z/DKUI1cDXu09Rto95DXN1ZBs6uYLCLz/zgThkP+jKE1ODOlBYPgvb+y/rl3g
         bDRvVQmGakB2cmlw7pixe8wh4BRdzschq6m7Pptyugl52JnBtZyraOOuFvTPdvfQvCUI
         OffAkZbXwSeNyK2NrNDTYeZl1y5devRw22fhXDy3p+a8uemWPo/vu0nMwH9VjNYavloP
         +O7toA2Dj+GfyAsF79iRbzg98+Gl66lCFBeTx/z0a4dnjJCSzFrJuX+NbTXOTHnm0yA7
         r98iBXYXYNoqaM3otUBheU7jlW43Qug9UW69my8CjiSc9ujPZXK90GQ3BwAs9eKGgy5j
         JrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0yM+xXL4DpBFqP+OauywyjzJwlW9UjCTqUtcFDhx+YI=;
        b=lNWV89Lmmb7KBsatADcQC9nmpwv0vK3YW3Uxiy3g5e/rau+Rw6p/fGFOWMJdGAY4aG
         YhXwbUor8OXvw6jQloeYvv3oypQ7oHpax4TGL6BsbBGI4IgkF7RIdCBhOqqyPQlUIVnW
         VyIF4NEOrj5nErbrXuX26Xz5JW+jvRclbcHKiTWGjrKbGk23dUVdZMppmimVqiIZmF9J
         H9Cz1aaMSgNoqlbcsaewLdQsyzH2BP7ZF5iCHp7E1H0sux4AP1eWfuGGOSEo4qTfTgWU
         U57SZo0sMdzIhSM6/d4Zd+rMCrFj3uUM4VgXQcjx0qkbSlQ5w7PLkVBDOmVx4o5HMcBp
         TgSw==
X-Gm-Message-State: AOAM532HyVIGDJt5KnqKq+N95El6+pcwhYYd/oBOtexCS+ADGUQlkP0w
        q+EHZQ2heTJze3ELyt1+neKGT14gwig5K7J21OI=
X-Google-Smtp-Source: ABdhPJyue9pd2iEIs+DaAFu3or8NCDaV+dimlF3IWWiv0Q9tkdYPPNOEQ/v4PlcGZuV3TpLRJzGrm1qZpkep18y0pRQ=
X-Received: by 2002:a2e:8590:: with SMTP id b16mr13057917lji.53.1616874292923;
 Sat, 27 Mar 2021 12:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210316133534.224105-1-festevam@gmail.com> <CAOMZO5A36YbA59v4NmEFjhkcXF5fTDRn1204_U3+X86qfbqB9g@mail.gmail.com>
 <YF+JZsCSY4C+StK5@google.com>
In-Reply-To: <YF+JZsCSY4C+StK5@google.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sat, 27 Mar 2021 16:44:41 -0300
Message-ID: <CAOMZO5B13HCvSKfNh1pUR5PA6x+SKinPxiKNYjQZEUCDy1eq5w@mail.gmail.com>
Subject: Re: [PATCH v2] Input: imx_keypad - convert to a DT-only driver
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Sat, Mar 27, 2021 at 4:37 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Sorry, I am still confused why we need the OF dependency given that the
> driver can be compiled without CONFIG_OF (of_device_id is always
> defined) and, as far as I understand, while entire ARCH_MXC is not
> selecting OF, all real users are converted to OF.
>
> I guess if we really need this OF dependency we can make it:
>
>         depends on (ARCH_MXC && OF) || COMPILE_TEST
>
> Please let me know.

You are correct. There is no need to add the OF dependency.

I have just submitted v3 without it.

Thanks
