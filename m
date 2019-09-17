Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE8DB53FB
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 19:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730953AbfIQRVL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 13:21:11 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45533 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730952AbfIQRVL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 13:21:11 -0400
Received: by mail-pg1-f194.google.com with SMTP id 4so2339105pgm.12;
        Tue, 17 Sep 2019 10:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=83QXS/jWzCV6puVyPIsUpoQjFWVs3nl53RmK7ljrNtE=;
        b=aBmzfLn0HP6wE2AGD6XgV7NLsyDrkZr4Zme+KKbe37Wf5fHnZCYJBm0vPIvXv5+g79
         s+udjP0fI3YVBY+y8FUCd5mHD9Q13cFHZTjTAo5wmUZBPSGdci4yGtn29L5TVWlfN3vc
         TLviF7jq+xa+9h60fVg/n4o/C/gdOwQcuqTiuKY5s0W2UoRp1V/OdcMtC17YOs0BR5Wl
         R3xamDmCmCqS1ykOBl0QzT7eb+ufXz1hPjDEqYTPG9V/cor7MI2i9l+0iQpyQWjQazFv
         Xz2kHmey2SOoeFnnLUovDevpbOEG8tm4LhuLyawsZdjQRg93Sq4PV61JpGuhENUfQCNT
         KPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=83QXS/jWzCV6puVyPIsUpoQjFWVs3nl53RmK7ljrNtE=;
        b=GQu9PT6UPmFQpglUmCTj4HRnvYyt9F84FjU1lwgUyrMl+Yz5BPHgR9OK/+jZ2CII2o
         cp6Y02WcjFImk5tFVGew9zb/RcYeAxgN5PG5RwK0eqEMFNCLU6TjtSOoGqJY35M0R2bk
         BfM1uz8lziUSpsXPDYKzAIkYQ08SOMFfPyFkLbpOOD39ae5aqyieVtpL53J1rniI+dtb
         M5nUqkfZSVYBJWuwgJG7sS7es53HUwk+2W90WDga+orAtLWb927ZGeeloxromAvaIEsY
         5LZ/AmYZyoGUfb9guzul2hKzrBrtXXPCnmBmm8KByBHYpsde1e7TbKAuCfpu4uU+O4aZ
         ZVyA==
X-Gm-Message-State: APjAAAUSTK8pMWBzjNLwvKRkysNJekK2fMf6DDhf36qF0zBMl/Jp1vm5
        JktKw9BU8sq+fk+fAxP39JA=
X-Google-Smtp-Source: APXvYqzpykjdaM6rkPNCXQtojTiURvQ8ehGnSaYjKw5Ps8r09EQECPxUnCOMP6cxeGLXQZK7jwgBrA==
X-Received: by 2002:a62:5cc3:: with SMTP id q186mr5353732pfb.15.1568740869983;
        Tue, 17 Sep 2019 10:21:09 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 197sm9274611pge.39.2019.09.17.10.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 10:21:07 -0700 (PDT)
Date:   Tue, 17 Sep 2019 10:21:05 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Marco Felsch <m.felsch@pengutronix.de>, robh+dt@kernel.org,
        bparrot@ti.com, simon.budig@kernelconcepts.de, hdegoede@redhat.com,
        fcooper@ti.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 6/6] Input: edt-ft5x06 - add supply voltage support
Message-ID: <20190917172105.GP237523@dtor-ws>
References: <20190917155808.27818-1-m.felsch@pengutronix.de>
 <20190917155808.27818-7-m.felsch@pengutronix.de>
 <20190917163536.GI2680@smile.fi.intel.com>
 <20190917165245.GM237523@dtor-ws>
 <20190917171246.GL2680@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917171246.GL2680@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 17, 2019 at 08:12:46PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 17, 2019 at 09:52:45AM -0700, Dmitry Torokhov wrote:
> > On Tue, Sep 17, 2019 at 07:35:36PM +0300, Andy Shevchenko wrote:
> > > On Tue, Sep 17, 2019 at 05:58:08PM +0200, Marco Felsch wrote:
> > > > Currently the driver do not care about the regulator which supplies the
> > > > controller. This can lead into problems since we support (deep-)sleep
> > > > because the regulator can be turned off before we send the (deep-)sleep
> > > > command to the controller. Using a own regulator improves the power
> > > > consumption during sleep even more.
> > > 
> > > > +	tsdata->vdd = devm_regulator_get(&client->dev, "vdd");
> > > > +	if (IS_ERR(tsdata->vdd)) {
> > > > +		error = PTR_ERR(tsdata->vdd);
> > > > +		if (error == -EPROBE_DEFER)
> > > > +			return error;
> > > 
> > > Before it worked w/o regulator. You have to make it optional.
> > 
> > No, regulators are funky this way. If there isn't one declared in the
> > device tree then a dummy is created automatically. Optional regulators
> > are only to be used when parts of an IC can be powered up separately.
> 
> It depends if platform has full constrains or not.

Full constraints is the default behavior. Do we even have platforms that
are not? ACPI and DT are fully-constrained, so that leaves legacy
boards... But there isn't a single one in the tree that uses this
driver.

Thanks.

-- 
Dmitry
