Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE01D29A378
	for <lists+linux-input@lfdr.de>; Tue, 27 Oct 2020 04:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505285AbgJ0D4J (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Oct 2020 23:56:09 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36527 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503837AbgJ0D4J (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Oct 2020 23:56:09 -0400
Received: by mail-pf1-f193.google.com with SMTP id w65so137719pfd.3
        for <linux-input@vger.kernel.org>; Mon, 26 Oct 2020 20:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JL+IDsvdU/UAGQvzYN0dBMuHw062msMzqpVc0R1lC/s=;
        b=mBlaSD8E/JZLe0/fVnIq2ZjfNC+c8g6xXintDWBMwZxs15lvit5goj/ZxcKkXt1lo9
         VniIuXJ1xdlV/X3RVPOHSvTVbLDE0+DbOOKFi7ZvRCV/Z6FNXKztj42NAb2gpnEH8eta
         1Vpv6KageqWAVp+YyfhAE3v0p48pkyplaRBlJfxRASCrie50be6OqsGpjMkH6rYPNnvq
         NQwr/kUahoNS6o/HotaKWhh/grpCGYIhaYxcyYYhgsW6tW8gPgENoofB3cxoTOJhqFIt
         Hd+k1FB2ITBNY/zTAqypUZ6vcuE1+sYausaH00wgyobe7XjqTwWvwxc5v5ZzmWhEQ24H
         n2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JL+IDsvdU/UAGQvzYN0dBMuHw062msMzqpVc0R1lC/s=;
        b=d2WR66ayQs0z1UFcdIXOEtzdrNLXQrTu5mIcQPPABVWhJap1SDs4cZZm830snduqge
         GnhcnVrwBk13nCzkoY75uw4p/CxjZ7gO5Bz6qyD4sfHdRJaG+vLA2cabLYUA0+gLlSm7
         8V1ksFHvOywpjN36mNM9WOGQF0tBcc4T/kZZc3TL5dA/FXy2+O/Yi/7+wQDy07SvOgLr
         duSgPN8FFaM87UMIE5sGrH2skvFqGed+0UO0iOxudOCzRzExriGAHeqKWZi/dr/qP68i
         Q1zHpgVWBW2eWka2TmwDEMkIlEU+3LmRioxZvz3rIiokvyj9IKZiYm1gSNKqBHcqk9WX
         ks5g==
X-Gm-Message-State: AOAM530ySMuHxzkiwLoNbVUm7n+9L2UA2XSGu5FJzeUawer5qf4FW7ec
        Ff8+TO30uRimndAZAA301zU=
X-Google-Smtp-Source: ABdhPJzan8MmRjnV/whoh1wFq5iGVnbigEm90pbJkbK5IqD9apj+I6JxAqQ5GFh4E4tYb8WkwRoBlQ==
X-Received: by 2002:a63:1119:: with SMTP id g25mr176670pgl.385.1603770968236;
        Mon, 26 Oct 2020 20:56:08 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id b14sm273776pfo.71.2020.10.26.20.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 20:56:07 -0700 (PDT)
Date:   Mon, 26 Oct 2020 20:56:05 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org, Marius Iacob <themariusus@gmail.com>
Subject: Re: [PATCH resend] Input: i8042 - Allow insmod to succeed on devices
 without an i8042 controller
Message-ID: <20201027035605.GJ444962@dtor-ws>
References: <20201008112628.3979-1-hdegoede@redhat.com>
 <20201008112628.3979-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201008112628.3979-2-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 08, 2020 at 01:26:28PM +0200, Hans de Goede wrote:
> The i8042 module exports several symbols which may be used by other
> modules.
> 
> Before this commit it would refuse to load (when built as a module itself)
> on systems without an i8042 controller.
> 
> This is a problem specifically for the asus-nb-wmi module. Many Asus
> laptops support the Asus WMI interface. Some of them have an i8042
> controller and need to use i8042_install_filter() to filter some kbd
> events. Other models do not have an i8042 controller (e.g. they use an
> USB attached kbd).
> 
> Before this commit the asus-nb-wmi driver could not be loaded on Asus
> models without an i8042 controller, when the i8042 code was built as
> a module (as Arch Linux does) because the module_init function of the
> i8042 module would fail with -ENODEV and thus the i8042_install_filter
> symbol could not be loaded.
> 
> This commit fixes this by exiting from module_init with a return code
> of 0 if no controller is found.  It also adds a i8042_present bool to
> make the module_exit function a no-op in this case and also adds a
> check for i8042_present to the exported i8042_command function.
> 
> The latter i8042_present check should not really be necessary because
> when builtin that function can already be used on systems without
> an i8042 controller, but better safe then sorry.
> 
> Reported-and-tested-by: Marius Iacob <themariusus@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
