Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 927503C3B70
	for <lists+linux-input@lfdr.de>; Sun, 11 Jul 2021 12:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230498AbhGKKFz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 11 Jul 2021 06:05:55 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:49418 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229800AbhGKKFz (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 11 Jul 2021 06:05:55 -0400
X-Greylist: delayed 339 seconds by postgrey-1.27 at vger.kernel.org; Sun, 11 Jul 2021 06:05:53 EDT
Received: by mail.z3ntu.xyz (Postfix, from userid 182)
        id 3BC02CA760; Sun, 11 Jul 2021 09:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1625997447; bh=GpWwGWz6u4k4mvdDD2L416E7IIFp/oI3LOwPDDMa5sA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=a3+cPsJ4Qs4lJOs2iIXzpQvjvF9VTCYF7nzXtsy2GTZe0JPlm1jDeIHBjoGHIA0rI
         QcMJ5ZGwF5+cvgTjSx0Qo84gb0p2dzRnWD5Kyyi8zWeEnyaY6YDoTw+lqV2waZGpyC
         rVxIoxWRcWab7cnab5GaKtc99orHCrmacyAyoqj0=
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on arch-vps
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
Received: from g550jk.localnet (ip-213-127-106-58.ip.prioritytelecom.net [213.127.106.58])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id BE702CA75D;
        Sun, 11 Jul 2021 09:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1625997445; bh=GpWwGWz6u4k4mvdDD2L416E7IIFp/oI3LOwPDDMa5sA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=vRwR7OEwSAAmATtmzvsoph2OXWDWR5l/aF4GqJRscgnm3qWIyBI71G0fCdgMkxwQK
         CJJ+ZRGz/hazf7ldz21De0Nzc6IfHTiVjiiGP23aLuMHmhFUzALLqprFMnl/5uV+1e
         CcZSKSugsuCItbYn4bQTyV8zLUMKW8nPh9ZFrS04=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Shawn Guo <shawn.guo@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] Input: pm8941-pwrkey - respect reboot_mode for warm reset
Date:   Sun, 11 Jul 2021 11:57:25 +0200
Message-ID: <1824770.6rn2EVs8mz@g550jk>
In-Reply-To: <20210629030509.2893-1-shawn.guo@linaro.org>
References: <20210629030509.2893-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Shawn,

On Dienstag, 29. Juni 2021 05:05:09 CEST Shawn Guo wrote:
> On some devices, e.g. Sony Xperia M4 Aqua, warm reset is used to reboot
> device into bootloader and recovery mode.  Instead of always doing hard
> reset, add a check on reboot_mode for possible warm reset.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  drivers/input/misc/pm8941-pwrkey.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/misc/pm8941-pwrkey.c
> b/drivers/input/misc/pm8941-pwrkey.c index cf8104454e74..9b14d6eb1918
> 100644
> --- a/drivers/input/misc/pm8941-pwrkey.c
> +++ b/drivers/input/misc/pm8941-pwrkey.c
> @@ -27,6 +27,7 @@
>  #define PON_PS_HOLD_RST_CTL2		0x5b
>  #define  PON_PS_HOLD_ENABLE		BIT(7)
>  #define  PON_PS_HOLD_TYPE_MASK		0x0f
> +#define  PON_PS_HOLD_TYPE_WARM_RESET	1
>  #define  PON_PS_HOLD_TYPE_SHUTDOWN	4
>  #define  PON_PS_HOLD_TYPE_HARD_RESET	7
> 
> @@ -93,7 +94,10 @@ static int pm8941_reboot_notify(struct notifier_block
> *nb, break;
>  	case SYS_RESTART:
>  	default:
> -		reset_type = PON_PS_HOLD_TYPE_HARD_RESET;
> +		if (reboot_mode == REBOOT_WARM)

This doesn't compile with CONFIG_INPUT_PM8941_PWRKEY=m

 ERROR: modpost: "reboot_mode" [drivers/input/misc/pm8941-pwrkey.ko] undefined!

Also just to clarify, this is supposed to trigger when rebooting with 
LINUX_REBOOT_CMD_RESTART2 and adding an argument that way, right?

Regards
Luca

> +			reset_type = PON_PS_HOLD_TYPE_WARM_RESET;
> +		else
> +			reset_type = PON_PS_HOLD_TYPE_HARD_RESET;
>  		break;
>  	}




