Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED1D5B5369
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 18:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbfIQQwt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 12:52:49 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35643 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbfIQQwt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 12:52:49 -0400
Received: by mail-pg1-f196.google.com with SMTP id a24so2336991pgj.2;
        Tue, 17 Sep 2019 09:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=F4mNcaR90fbEud0o28hQFrCgK7lN9DAYPGliFgF36+c=;
        b=UBYdpKyY+kAHd10rc4d/70CMnRHhqTzZUb5e+m6uEiTBY1Ey8EVGLRbNLeSaJsHEbz
         DmbW88HsI74fAXwom4Ocnuoi6crHAp9Uql/ZcI382MhgvFWwi3u7F8c5wDZguV5p+t5A
         8Lpm9A5RCQykNyEu0s0mgF3miHsnHOPyVzupye3dqE8/PRAorKVRBx36chb34YukWH70
         tY871JSb9/pSiopUI+N+jhcIanx8SQMHEwyVLbBuTHp1g5ITE+oDH7GgPdS1pah+Z9D/
         e9njzZb/TKbCihzNOEAaA/NEkig15t9fh962SbyT6Q40MZNDYW1W0Xspg7x/KS/6eePz
         QlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=F4mNcaR90fbEud0o28hQFrCgK7lN9DAYPGliFgF36+c=;
        b=a1hGHy4x9EejyxnL8ruiLbUzrnIjW78W3BMspEy1rFF6EXWviYhTbnwYSF/b/4A8sJ
         DxDvDeSXwuZaCj7THC0sp7X9Xp9TYtNRQfF5ANZSuH+jH5NCekV8YrsfDe2OBOSjZuvz
         mx1ZS6NXyU2OpW6yHlJdvrY3Yk92jsKHmHadXeQqUHeN7WPTvDF92j4HX8FUQMWRbsHn
         5RLxk/cymdkJyak4VmXId0YYhIffwTWYVOx9pUT3yS1UCYeHn6uC5HQIsia984ZJwR9d
         gcyUD4CoBfILHIHx3SOKd9o1iW1R9iArdQ/v5x0fNZafVHDlSCupPaQeeD4zuPWA0n8Y
         B9oQ==
X-Gm-Message-State: APjAAAWVYfc0QhRuGs/EE/gJYCgy5cLo9WYdw6mpxyigMTTDXyPg3o01
        GQEuk1atb0wmnIxHe7DOLaxAxrOH
X-Google-Smtp-Source: APXvYqz4YdNbxbKX7cc6SvfrKaff72QVBlZL3bPSJJUjwlebLV5Lo0tjFA5ghgNBLUJ93iv1ng/dCw==
X-Received: by 2002:a17:90a:9f04:: with SMTP id n4mr5996113pjp.109.1568739168285;
        Tue, 17 Sep 2019 09:52:48 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id d1sm5004884pfc.98.2019.09.17.09.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 09:52:47 -0700 (PDT)
Date:   Tue, 17 Sep 2019 09:52:45 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Marco Felsch <m.felsch@pengutronix.de>, robh+dt@kernel.org,
        bparrot@ti.com, simon.budig@kernelconcepts.de, hdegoede@redhat.com,
        fcooper@ti.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 6/6] Input: edt-ft5x06 - add supply voltage support
Message-ID: <20190917165245.GM237523@dtor-ws>
References: <20190917155808.27818-1-m.felsch@pengutronix.de>
 <20190917155808.27818-7-m.felsch@pengutronix.de>
 <20190917163536.GI2680@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917163536.GI2680@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 17, 2019 at 07:35:36PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 17, 2019 at 05:58:08PM +0200, Marco Felsch wrote:
> > Currently the driver do not care about the regulator which supplies the
> > controller. This can lead into problems since we support (deep-)sleep
> > because the regulator can be turned off before we send the (deep-)sleep
> > command to the controller. Using a own regulator improves the power
> > consumption during sleep even more.
> 
> > +	tsdata->vdd = devm_regulator_get(&client->dev, "vdd");
> > +	if (IS_ERR(tsdata->vdd)) {
> > +		error = PTR_ERR(tsdata->vdd);
> > +		if (error == -EPROBE_DEFER)
> > +			return error;
> 
> Before it worked w/o regulator. You have to make it optional.

No, regulators are funky this way. If there isn't one declared in the
device tree then a dummy is created automatically. Optional regulators
are only to be used when parts of an IC can be powered up separately.

Thanks.

-- 
Dmitry
