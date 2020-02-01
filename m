Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 089E214F5C1
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2020 02:38:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbgBABi5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 31 Jan 2020 20:38:57 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38342 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726475AbgBABi4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 31 Jan 2020 20:38:56 -0500
Received: by mail-pl1-f195.google.com with SMTP id t6so3507765plj.5
        for <linux-input@vger.kernel.org>; Fri, 31 Jan 2020 17:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=u5hXQYO8veFz04l0HvaqIjQs4dDvdoqWj8K1Zz+pIaQ=;
        b=tG+hnFdw+zXrZ1kis5J44LiGe7Ocgz+QogB2a0ZMrkr+0t0pHLsOETvHp3u5s/TToB
         FtgSPXWmtz24evrZ5J+jzO+D1N1++j1LqBB6kVwNzRl3MPaNx/Vw9/8CPkXhP8+PZpWz
         TEOvwuKFD1feRNZA5y9H0b8go2XQ0Bvzpyu7B9dshkLev8UcSCyGezLAOnXvkXXCB4ui
         Hk1/CrK3wI+exjKCpb9IKEB+VfL6tohxk7OWFNCWOujL68Svw5LG/I5PoldlmhA+wRY7
         h6xM87gy6UMZ9V8TuzDz+aLdRwxU3YVi1EcUMZcClwydMdXcfn3YZkq3cCM/iD2Yr6rk
         jojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=u5hXQYO8veFz04l0HvaqIjQs4dDvdoqWj8K1Zz+pIaQ=;
        b=KK+MVukHHtdSfKmJq2Os7zGg9gXA2F33HPeeUJjMOIwi4ArZxl4a/I6TX4deG++ReN
         tGsvq8vvn8Qa12U3o1Urf7tBQsRZuSizVqqeFSqCa3kK0yPYo7Hpzd2rJNfkd2Xp7eAP
         MzjdO5cO8b2wpBHBcW5WMxQs1UEPmQa7WDg36Eg+5GruHWpz4/KY3URKffyxxYr2XonF
         BeRriRcru3IO3yFX+RTQWJrFcByYVHVFISQdwAJcUT6N+SlrOChlE8jBER9KXcNmze9i
         C2poncc46sx5auXSxOa338C/kFFX6Z6VoazhfK2E+5IFTRjOLBUJ5VJFEiZUZVtQwsyU
         nDRQ==
X-Gm-Message-State: APjAAAX6o1R2akx5BTTIpVwDeiGe5RDrVxSJKS8UyliqWylbPcPwXiMd
        n06Dd5aCYhNtCIEh4IqODjdZ3GSV
X-Google-Smtp-Source: APXvYqysaUtUb/o+WVb8BvfQvc6Owc0w1hJaRYJhByku6FkwMRxvwMtuL5OYzPZzh7NUkRCqaZ2SAg==
X-Received: by 2002:a17:902:467:: with SMTP id 94mr13345064ple.267.1580521135872;
        Fri, 31 Jan 2020 17:38:55 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id m12sm11487419pfh.37.2020.01.31.17.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 17:38:54 -0800 (PST)
Date:   Fri, 31 Jan 2020 17:38:52 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andrew Duggan <aduggan@synaptics.com>
Cc:     Christopher Heiny <Cheiny@synaptics.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>
Subject: Re: [PATCH] Input: synaptics-rmi4 - switch to reduced reporting mode
Message-ID: <20200201013852.GG184237@dtor-ws>
References: <20200120111628.18376-1-l.stach@pengutronix.de>
 <20200127022448.GC184237@dtor-ws>
 <b2ca3006-281a-c991-4c6c-7ae7ce5cc3f7@synaptics.com>
 <23ecff7a48f801fcc18680fb6cb150e32fc3c858.camel@synaptics.com>
 <a46120cfd113a4d016f37270eb92c4fccd00a2ed.camel@pengutronix.de>
 <f7b19df4972a7293a701b738426fb63738a771a0.camel@synaptics.com>
 <0da4c22b-efb0-fccc-fd99-cdb398e1df8c@synaptics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0da4c22b-efb0-fccc-fd99-cdb398e1df8c@synaptics.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jan 31, 2020 at 10:28:23AM -0800, Andrew Duggan wrote:
> 
> On 1/28/20 9:22 AM, Christopher Heiny wrote:
> > On Tue, 2020-01-28 at 10:41 +0100, Lucas Stach wrote:
> > > CAUTION: Email originated externally, do not click links or open
> > > attachments unless you recognize the sender and know the content is
> > > safe.
> > > 
> > > 
> > > Hi Christopher,
> > > 
> > > On Di, 2020-01-28 at 07:02 +0000, Christopher Heiny wrote:
> > > > On Mon, 2020-01-27 at 11:21 -0800, Andrew Duggan wrote:
> > > > > Hi Dmitry,
> > > > > 
> > > > > On 1/26/20 6:24 PM, Dmitry Torokhov wrote:
> > > > > > On Mon, Jan 20, 2020 at 12:16:28PM +0100, Lucas Stach wrote:
> > > > > > > When the distance thresholds are set the controller must be
> > > > > > > in
> > > > > > > reduced
> > > > > > > reporting mode for them to have any effect on the interrupt
> > > > > > > generation.
> > > > > > > This has a potentially large impact on the number of events
> > > > > > > the
> > > > > > > host
> > > > > > > needs to process.
> > > > > > > 
> > > > > > > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > > > > > > ---
> > > > > > > I'm not sure if we want a separate DT property to allow the
> > > > > > > use
> > > > > > > of
> > > > > > > reduced reporting mode, as this change might lead to problems
> > > > > > > for
> > > > > > > controllers with unreasonably large threshold values. I'm not
> > > > > > > sure if
> > > > > > > any controller with bogus threshold values exist in the wild.
> > > > > > > ---
> > > > > > Andrew, any feedback on this patch?
> > > > > > 
> > > > > > Thanks!
> > > > > The RMI4 spec does say that delta X/Y thresholds are only used in
> > > > > reduced reporting mode, so this patch is needed for the threshold
> > > > > values
> > > > > to have an effect.
> > > > > 
> > > > > Reviewed-by: Andrew Duggan <aduggan@synaptics.com>
> > > > > 
> > > > > Because reduced reporting mode is so dependent on these
> > > > > thresholds,
> > > > > my
> > > > > opinion is that it is better not to add a separate DT property,
> > > > > but
> > > > > to
> > > > > instead control reduced reporting mode through the setting of
> > > > > these
> > > > > thresholds. My guess is that the if reduced reporting is not
> > > > > enabled
> > > > > in
> > > > > the firmware by default, then the thresholds may not be valid.
> > > > > Setting
> > > > > the thresholds to 0 will essentially disable reduced reporting
> > > > > mode.
> > > > > So
> > > > > that would be how a user could disable reduced reporting mode
> > > > > without
> > > > > a
> > > > > separate DT property. Chris, do you have an opinion on this?
> > > > > Anything
> > > > > I
> > > > > overlooked?
> > > > Hi Dmitry, Andrew, Lucas,
> > > > 
> > > > I'm in agreement with Andrew on this.  Having two ways to
> > > > enable/disable reduced reporting (that is, both the DT property and
> > > > the
> > > > thresholds) could lead to confusion and unexpected
> > > > behavior.  Simpler
> > > > is better, in my opinion.
> > > > 
> > > > However, in that case I'm a little concerned about the logic in the
> > > > patch below.  When either of the thresholds are set to non-zero, we
> > > > clear the report mask and then enable the reduced reporting bit.
> > > > Subsequently setting both thresholds to zero will disable reduced
> > > > reporting, but will not enable another report mode.  Unless there
> > > > is
> > > > code elsewhere to catch this case (and if there is, it seems like a
> > > > bad
> > > > idea to be handling this in two different places), it could result
> > > > in
> > > > the touchpad being disabled.
> > > > 
> > > > As a hypothetical instance of this, imagine a user using the
> > > > touchpad
> > > > to manipulate report threshold sliders in a GUI.  Setting both
> > > > sliders
> > > > to zero would disable the touch sensor reporting, potentially
> > > > leaving
> > > > the user with a dead touch sensor and no easy way to recover from
> > > > that.
> > > I can see how this would be a problem, but then I see no interface in
> > > the driver to actually change the threshold values on the fly. They
> > > are
> > > either set by firmware or specified via DT properties. So I don't see
> > > how the threshold values would change on an active device. Anything
> > > i'm
> > > overlooking?
> > Hi Lucas,
> > 
> > You're not overlooking anything.  Mainly it's me being a worry-wart,
> > and assuming that if something can be adjusted, someone will eventually
> > come along and add a sysfs interface to adjust it, and then someone
> > else will create a userspace tool to adjust it, and things will break.
> > 
> > If you guys are OK with Andrew's original evaluation, then you can
> > ignore my worry (which is, as admitted, entirely a hypothetical).
> > 
> > 					Cheers,
> > 						Chris
> 
> Currently, the driver only sets the thresholds in rmi_f11_initialize(). If
> someone were to decide to add another method for setting the thresholds they
> would probably remove the logic from rmi_f11_initialize() and put it in a
> new function so that the code can be called from multiple places. In that
> case, they should also include the code in this patch in the new function. I
> think the comment above the new code makes it clear that setting the
> reporting mode to reduced reporting is needed for the threshold values to be
> used by the firmware. I don't see a way to handle potential future changes
> without adding what may be unnecessary complexity. I reaffirm my review sign
> off.

Applied, thank you everyone.

-- 
Dmitry
