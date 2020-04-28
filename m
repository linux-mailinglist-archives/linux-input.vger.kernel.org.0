Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 104071BB341
	for <lists+linux-input@lfdr.de>; Tue, 28 Apr 2020 03:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbgD1BIr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Apr 2020 21:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726263AbgD1BIr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Apr 2020 21:08:47 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62054C03C1A8
        for <linux-input@vger.kernel.org>; Mon, 27 Apr 2020 18:08:47 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id g2so7681970plo.3
        for <linux-input@vger.kernel.org>; Mon, 27 Apr 2020 18:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OuIIaF70fKE4behMz4Mw0TQcHcJN/m74AEudlBBFSlI=;
        b=B537pzQgMkXIDbTiePEzqjUtP98IPoeq+ziKvsxE5Pf9DsC6fLQnGhEHgJnQrdE/vl
         xJYOucw696goUKZydwDUwHlSQpGI63mP9Hf/tmJxpKgp1RFUiwABD0WVmUlgoCjH54w7
         pqvnA2j6geUHZhXiN7e0lQkppNOLnm56xbU0PxBsSoH296eA0IWmWBPj48n4jkObVx1r
         EiuCGYWYr/KlDmdN2c9KZP7ac6zUipxS/KsdQpMbtWXSK13gQnBDuXOAul8buOU8ix91
         PO06tYE19Bry+OWdWYP24MAH2FwnlxImT338OKzci0QbaN7X9AvZxpxjdfSIiIJW9xCu
         sWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OuIIaF70fKE4behMz4Mw0TQcHcJN/m74AEudlBBFSlI=;
        b=nW1ZjT0D+PJUSGUVfipD+wR1pJIoomdee6yPVW8vdgHqD/XVqP8hv1kaZCjqfXFAfn
         kMA1xEk+jQJAfOLdTDBAKSIAOQspKgcOy1L21+7K6y28LqbZ9AVbn/st3et8y1Z+UQqb
         eWrjzn3zj9MRWi94kFIMYz6ghsVRXYEWE66lfmBPd55lLO4OgCsnmIErp/RkwtIgWQdi
         MA7zzuRjwW6huKaFhQXxUKr4hMBKJlIyzQUmx5Zmmh3x+QqK51FIqUmR02GNfyWYYwoT
         1Oik0OMSxhEfa8vlP7Edo00ieX0GHWu76Yj/63rBecQ4sbNwMry9ihRTE6bk/RMBtgco
         DZPQ==
X-Gm-Message-State: AGi0PuZtc36tlakIEVPJjoJ8AIRI5VsipwNJxIwL1yz/yxO/w8lHhbs1
        LRcypiOJssx43/ljXoX/gkU=
X-Google-Smtp-Source: APiQypJAWVC6HlWWTn3n3pi2hRgVQcE/j22MPNBIV8rNKZLeCUdv5B4HdXKW9HxVkyMIU3Fb1tJ3TA==
X-Received: by 2002:a17:902:b088:: with SMTP id p8mr13968733plr.244.1588036126781;
        Mon, 27 Apr 2020 18:08:46 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id h13sm13900905pfk.86.2020.04.27.18.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 18:08:46 -0700 (PDT)
Date:   Mon, 27 Apr 2020 18:08:44 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Kevin Locke <kevin@kevinlocke.name>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: i8042 - add ThinkPad S230u to i8042 reset list
Message-ID: <20200428010844.GU125362@dtor-ws>
References: <20200424042500.GA107217@kevinolos.locke.internal>
 <94f384b0f75f90f71425d7dce7ac82c59ddb87a8.1587702636.git.kevin@kevinlocke.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94f384b0f75f90f71425d7dce7ac82c59ddb87a8.1587702636.git.kevin@kevinlocke.name>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 23, 2020 at 10:30:36PM -0600, Kevin Locke wrote:
> On the Lenovo ThinkPad Twist S230u (3347-4HU) with BIOS version
> "GDETC1WW (1.81 ) 06/27/2019", the keyboard, Synaptics TouchPad, and
> TrackPoint either do not function or stop functioning a few minutes
> after boot.  This problem has been noted before, perhaps only occurring
> with BIOS 1.57 and later.[1][2][3][4][5]
> 
> Odds of a BIOS fix appear to be low: 1.57 was released over 6 years ago
> and although the [BIOS changelog] notes "Fixed an issue of UEFI
> touchpad/trackpoint/keyboard/touchscreen" in 1.58, it appears to be
> insufficient.
> 
> Setting i8042.reset=1 or adding 33474HU to the reset list avoids the
> issue on my system from either warm or cold boot.
> 
> [1]: https://bugs.launchpad.net/bugs/1210748
> [2]: https://bbs.archlinux.org/viewtopic.php?pid=1360425
> [3]: https://forums.linuxmint.com/viewtopic.php?f=46&t=41200
> [4]: https://forums.linuxmint.com/viewtopic.php?f=49&t=157115
> [5]: https://forums.lenovo.com/topic/findpost/27/1337119
> [BIOS changelog]: https://download.lenovo.com/pccbbs/mobiles/gduj33uc.txt
> 
> Signed-off-by: Kevin Locke <kevin@kevinlocke.name>
> Cc: stable@vger.kernel.org

Applied, thank you.

> ---
>  drivers/input/serio/i8042-x86ia64io.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/input/serio/i8042-x86ia64io.h b/drivers/input/serio/i8042-x86ia64io.h
> index 08e919dbeb5d..7e048b557462 100644
> --- a/drivers/input/serio/i8042-x86ia64io.h
> +++ b/drivers/input/serio/i8042-x86ia64io.h
> @@ -662,6 +662,13 @@ static const struct dmi_system_id __initconst i8042_dmi_reset_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "P65xRP"),
>  		},
>  	},
> +	{
> +		/* Lenovo ThinkPad Twist S230u */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "33474HU"),
> +		},
> +	},
>  	{ }
>  };
>  
> -- 
> 2.26.2
> 

-- 
Dmitry
