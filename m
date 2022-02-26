Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2494D4C5511
	for <lists+linux-input@lfdr.de>; Sat, 26 Feb 2022 11:04:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbiBZKFN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 26 Feb 2022 05:05:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbiBZKFN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 26 Feb 2022 05:05:13 -0500
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FBFB1BB738;
        Sat, 26 Feb 2022 02:04:36 -0800 (PST)
Received: from g550jk.localnet (ip-213-127-118-180.ip.prioritytelecom.net [213.127.118.180])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 7EFB6C8605;
        Sat, 26 Feb 2022 10:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1645869873; bh=14M++uyqtpJ2bHvbR6v6//O3tEuusNJMpcS+REEUXqs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=xVzzSlMKNrIxQmivffOp0HDrH69r5jo5kBdfQO3N6uXjNTU/3lLz8E1gQ1/Pihy1r
         ++GwK0syHStoScnp7DOVghgfICns21IPRH4vSkY6ErWDIiML8WfApsyX2rTk1+Koby
         PjTrTFtPW7eLGWADcvuaanq8w8cCVdHwfysoR+AI=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH] Input: pm8941-pwrkey - respect reboot_mode for warm reset
Date:   Sat, 26 Feb 2022 11:04:33 +0100
Message-ID: <8317341.EvYhyI6sBW@g550jk>
In-Reply-To: <20210714094045.GD11342@dragon>
References: <20210629030509.2893-1-shawn.guo@linaro.org> <1824770.6rn2EVs8mz@g550jk> <20210714094045.GD11342@dragon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Shawn,

On Mittwoch, 14. Juli 2021 11:40:46 CET Shawn Guo wrote:
> Hi Luca,
> 
> On Sun, Jul 11, 2021 at 11:57:25AM +0200, Luca Weiss wrote:
> > Hi Shawn,
> > 
> > On Dienstag, 29. Juni 2021 05:05:09 CEST Shawn Guo wrote:
> > > On some devices, e.g. Sony Xperia M4 Aqua, warm reset is used to reboot
> > > device into bootloader and recovery mode.  Instead of always doing hard
> > > reset, add a check on reboot_mode for possible warm reset.
> > > 
> > > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > > ---
> > > 
> > >  drivers/input/misc/pm8941-pwrkey.c | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/input/misc/pm8941-pwrkey.c
> > > b/drivers/input/misc/pm8941-pwrkey.c index cf8104454e74..9b14d6eb1918
> > > 100644
> > > --- a/drivers/input/misc/pm8941-pwrkey.c
> > > +++ b/drivers/input/misc/pm8941-pwrkey.c
> > > @@ -27,6 +27,7 @@
> > > 
> > >  #define PON_PS_HOLD_RST_CTL2		0x5b
> > >  #define  PON_PS_HOLD_ENABLE		BIT(7)
> > >  #define  PON_PS_HOLD_TYPE_MASK		0x0f
> > > 
> > > +#define  PON_PS_HOLD_TYPE_WARM_RESET	1
> > > 
> > >  #define  PON_PS_HOLD_TYPE_SHUTDOWN	4
> > >  #define  PON_PS_HOLD_TYPE_HARD_RESET	7
> > > 
> > > @@ -93,7 +94,10 @@ static int pm8941_reboot_notify(struct notifier_block
> > > *nb, break;
> > > 
> > >  	case SYS_RESTART:
> > > 
> > >  	default:
> > > -		reset_type = PON_PS_HOLD_TYPE_HARD_RESET;
> > > +		if (reboot_mode == REBOOT_WARM)
> > 
> > This doesn't compile with CONFIG_INPUT_PM8941_PWRKEY=m
> > 
> >  ERROR: modpost: "reboot_mode" [drivers/input/misc/pm8941-pwrkey.ko]
> >  undefined!
> Thanks for the report!  I will add a patch to export the symbol.
> 
> > Also just to clarify, this is supposed to trigger when rebooting with
> > LINUX_REBOOT_CMD_RESTART2 and adding an argument that way, right?
> 
> With either of the following two methods, 'reboot_mode' will be turned
> into REBOOT_WARM.
> 
> - Boot kernel with 'reboot=warm' on cmdline
> 
> - Set warm mode via sysfs entry
>   $ echo warm > /sys/kernel/reboot/mode

+CC Sebastian Reichel

Do you have an idea how this situation should look from user space? Just using 
LINUX_REBOOT_CMD_RESTART2 with the param won't work if the reboot mode also 
has to be set to work - but that's also not the case on all boards.

Just LINUX_REBOOT_CMD_RESTART2 works fine on newer qcom SoCs that iirc store it 
in a pmic register that seems to survive a hard reboot.

Would it be a good idea to introduce a new dt property for e.g.
syscon-reboot-mode that makes it switch to warm reboot mode when a reboot mode 
is passed to the kernel? That way user space wouldn't need to care whether a 
particular board needs warm reboot or can just use the default hard reboot.

Regards
Luca

> Shawn




