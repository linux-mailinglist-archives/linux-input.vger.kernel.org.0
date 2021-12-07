Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFBD546B397
	for <lists+linux-input@lfdr.de>; Tue,  7 Dec 2021 08:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbhLGHWs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Dec 2021 02:22:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbhLGHWf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Dec 2021 02:22:35 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D7C3C061746
        for <linux-input@vger.kernel.org>; Mon,  6 Dec 2021 23:19:03 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id n8so8806421plf.4
        for <linux-input@vger.kernel.org>; Mon, 06 Dec 2021 23:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qsnj/eKHcGbb/NsVum8X7NKU6SMny9ET5w4QkYYb7vI=;
        b=KedjMfIq9frLGeKf6P+P1DQzpOxO2x7bQWB9UcHqoP63kH8vEK80CYqKoIgcYZCBBT
         icLFvJVYaYrtEnVROl5GVCizd5taj2cRbsk7Kma7wYNwNUkXoiuh0xFsV486oaHtT535
         v4il+YZQWsSu94H1mJVQBQViq5Le27ppbliSdmF5d7qjB0sSr3LqlNMGve6rA3UifY+i
         TOLNVKR6xCRPuRtJIPjjy6aOOORv03Z656GufcGCwitnNONSClIR09KLLE9Sc3TRnIJl
         to/rJ3HVSzblZK6SN0yjcb5/jWo86Df6znnT5IlOJAPIcjXOyGyZdeBmfDPNEPExkQiy
         X0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qsnj/eKHcGbb/NsVum8X7NKU6SMny9ET5w4QkYYb7vI=;
        b=2IKYYx1hMcleGX7FKvBH7aVyP5aWQEjvFPcwSswgTLBATUEnDPBztKWNyRLkZMKb1S
         dE75OguaxaMsJgi7wblt+/EJRdhI65OLxPpT/JdJpZmym2QsvbWG3nqTiSe+GM09Cx1Q
         Da0Rsg25jiWAdc2GTeE1wW78LxK92GbP48Ea62TcAVBbuZ1ZcRjMNGDE3/RbqOrHtf86
         nBBvMhyeGDM/amWyj0GsyNla+LnxaU3zGnuNR8umAxzTiaSQN2ykz/TNE480uTqUBTrs
         1P+x1xujkO37ia+vnFOnO7enrhYm2H8Ac7LAQBmjnyt0oVUB//OO2coVGvzHERwgMGl+
         HyLw==
X-Gm-Message-State: AOAM531/thG2uDlbzZ5gOlnBp5MK8FNpWc7bE77iFtNaSF5ChBctjwTX
        cn1qYw0qk2iPivTodK8A1SY=
X-Google-Smtp-Source: ABdhPJyLYhWuY0WRMybNmluvCvWkQiwFZABXttoYa9LE0NpnKeHC2x6hDJW0wYjL5DqJ+/gk4MWRwA==
X-Received: by 2002:a17:90b:128d:: with SMTP id fw13mr4531730pjb.50.1638861543030;
        Mon, 06 Dec 2021 23:19:03 -0800 (PST)
Received: from google.com ([2620:15c:202:201:25b0:d110:b844:ea00])
        by smtp.gmail.com with ESMTPSA id h5sm15281476pfi.46.2021.12.06.23.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 23:19:01 -0800 (PST)
Date:   Mon, 6 Dec 2021 23:18:59 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: Re: [PATCH regression fix 1/1] Input: goodix - Try not to touch the
 reset-pin on x86/ACPI devices
Message-ID: <Ya8K4zBzwveylJDm@google.com>
References: <20211206091116.44466-1-hdegoede@redhat.com>
 <20211206091116.44466-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206091116.44466-2-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Dec 06, 2021 at 10:11:16AM +0100, Hans de Goede wrote:
> Unless the controller is not responding at boot or after suspend/resume,
> the driver never resets the controller on x86/ACPI platforms. The driver
> still requesting the reset pin at probe() though in case it needs it.
> 
> Until now the driver has always requested the reset pin with GPIOD_IN
> as type. The idea being to put the pin in high-impedance mode to save
> power until the driver actually wants to issue a reset.
> 
> But this means that just requesting the pin can cause issues, since
> requesting it in another mode then GPIOD_ASIS may cause the pinctrl
> driver to touch the pin settings. We have already had issues before
> due to a bug in the pinctrl-cherryview.c driver which has been fixed in
> commit 921daeeca91b ("pinctrl: cherryview: Preserve
> CHV_PADCTRL1_INVRXTX_TXDATA flag on GPIOs").
> 
> And now it turns out that requesting the reset-pin as GPIOD_IN also stops
> the touchscreen from working on the GPD P2 max mini-laptop. The behavior
> of putting the pin in high-impedance mode relies on there being some
> external pull-up to keep it high and there seems to be no pull-up on the
> GPD P2 max, causing things to break.
> 
> This commit fixes this by requesting the reset pin as is when using
> the x86/ACPI code paths to lookup the GPIOs; and by not dropping it
> back into input-mode in case the driver does end up issuing a reset
> for error-recovery.
> 
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=209061
> Fixes: a7d4b171660c ("Input: goodix - add support for getting IRQ + reset GPIOs on Cherry Trail devices")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
