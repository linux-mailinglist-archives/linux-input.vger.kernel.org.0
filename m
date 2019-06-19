Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB49C4AF2E
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2019 02:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbfFSAwi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Jun 2019 20:52:38 -0400
Received: from mail-pl1-f176.google.com ([209.85.214.176]:37949 "EHLO
        mail-pl1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbfFSAwh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Jun 2019 20:52:37 -0400
Received: by mail-pl1-f176.google.com with SMTP id g4so177160plb.5
        for <linux-input@vger.kernel.org>; Tue, 18 Jun 2019 17:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bTUQNOBSU2myDs6bC2yDvP6jo11OXZDmy28UnnuD7I4=;
        b=gEkTJmdHj3yrA7UZ2+HQDol91Rhg+8oy0FC/A4COWObVWRovZqbuh1XUSOoUGULBbw
         /UOrPDArYXRQ4TqY4EtO41p5zgbO6sMoQCn9sz5hKbTTRooC/8uPczk4deDNEXAAAKO2
         j74dpoQqdNsSsXWIgWkZaL6vHlex9bqlQj4NEk2mRiTKFePrg+gnr5MzrsJDB6xtEy3h
         gjthskSaax/FHRemzM8KXxn5/PAy0D3PKmNTrmu0ElbbrH0MZAHb8YIi9Gw0qs65FhLU
         EQ3/HlQSQslCtgulu6JTVS7BuAKZo/Y/tDXN2IisAreiyjohYql+dIFThrydV3VT4+sD
         dROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bTUQNOBSU2myDs6bC2yDvP6jo11OXZDmy28UnnuD7I4=;
        b=kKq+2RQjIBYLDaM0bfaKeL3F2EMzHhrgjgLtyrLiIcWktDKOfGs4T3sdH++e1Dxf+4
         ugtw2JMVXRU+eSUaGMrHBog9H3TItqA9dpjUGGPsOTTSl/xJQKXWyngq/U2EZupbl2s1
         Q+IFLXA4bVmoB3tD1wtdHSOjEcgNcoDfB3TviRG4JJuzH79xbUj94ngGXf/z5V+vZ0V6
         MHzFBAi68aSHsDxEbwUYNfuCw/TJX8YE7AZL7Pp6EsrnurRylwMMBCiu6mAfbrwt3R1Q
         Yb/8yTRtcGTk/+vcczC/IoTzDkRB/hUWQOvS8NOBYw/1Xyy38e29b8GHcU32St3REwT/
         PoFA==
X-Gm-Message-State: APjAAAVoTTBmuU/jyanGBvZ25t/DIlWN4hoSpfTeVxunoTrMi4oElDJ/
        3akBDAnDxhlsVuIkjl8rZro=
X-Google-Smtp-Source: APXvYqyCgq9k1BBEBq/a9tZPIlRMmMEdTMYXmgOqy/XaZ188iY9XpKcGlfSLqypripkgaaq/1vLb7g==
X-Received: by 2002:a17:902:24c:: with SMTP id 70mr115772648plc.2.1560905556969;
        Tue, 18 Jun 2019 17:52:36 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 2sm16566804pff.174.2019.06.18.17.52.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 17:52:36 -0700 (PDT)
Date:   Tue, 18 Jun 2019 17:52:34 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiri Dvorak <jiridvorak@centrum.cz>,
        Anssi Hannula <anssi.hannula@bitwise.fi>
Cc:     linux-input@vger.kernel.org
Subject: Re: PROBLEM: Race between upload and playback in ff-memless
Message-ID: <20190619005234.GE62571@dtor-ws>
References: <20190617224831.7aa9ac53@centrum.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617224831.7aa9ac53@centrum.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiri,

On Mon, Jun 17, 2019 at 10:48:31PM +0200, Jiri Dvorak wrote:
> Hello
> 
> [1.] One line summary of the problem:
> 
> Race between upload and playback in ff-memless
> 
> [2.] Full description of the problem/report:
> 
> If update of already playing force effect is quickly followed by
> effect stop in ff-memless based driver, the hw force might be not
> stopped.
> 
> What I think is going on: When ml_ff_upload processes started effect,
> it will clear the FF_EFFECT_PLAYING bit and schedule timer. If
> ml_ff_playback is called to stop the effect before the timer runs, it
> will see cleared bit and directly clear the FF_EFFECT_STARTED bit
> instead of doing the full abort so the hw force is not updated unless
> there is another effect of the same type.

I wonder if we can't simply leave the FF_EFFECT_PLAYING flag as is when
updating an effect. Although we still may skip over them in
ml_get_combo_effect() is play_at is in the future. Should we immediately
stop updated effects?

Anssi, do you still remember anything about force feedback?

Thanks.

-- 
Dmitry
